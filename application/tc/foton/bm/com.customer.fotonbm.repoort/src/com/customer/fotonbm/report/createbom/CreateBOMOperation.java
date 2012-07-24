package com.customer.fotonbm.report.createbom;

import java.awt.Frame;

import com.customer.fotonbm.report.utils.ExceptionUtils;
import com.customer.fotonbm.report.utils.PrintLog;
import com.customer.fotonbm.report.utils.tc.ComponentUtils;
import com.teamcenter.rac.aif.AIFDesktop;
import com.teamcenter.rac.aif.AbstractAIFOperation;
import com.teamcenter.rac.aif.kernel.AIFComponentContext;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentBOMLine;
import com.teamcenter.rac.kernel.TCComponentBOMWindow;
import com.teamcenter.rac.kernel.TCComponentBOMWindowType;
import com.teamcenter.rac.kernel.TCComponentFolder;
import com.teamcenter.rac.kernel.TCComponentFolderType;
import com.teamcenter.rac.kernel.TCComponentForm;
import com.teamcenter.rac.kernel.TCComponentFormType;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCComponentItemType;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCProperty;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;

public class CreateBOMOperation extends AbstractAIFOperation{

	private static final String BLANK = ""; 
	private static final String FOLDER_TYPE = "Folder"; 
	private static final String FORM_TYPE = "Form";
	private static final String OBJECT_NAME = "object_name"; 
	private static final String ITEM_ID = "item_id"; 
	
	private TCSession session;
	private String prefix;
	InterfaceAIFComponent template;
	private PrintLog printlog;
	Frame frame;
	InterfaceAIFComponent pasteTargets[];

	public CreateBOMOperation(TCSession session, String prefix,InterfaceAIFComponent template,Frame frame,InterfaceAIFComponent pasteTargets[],PrintLog p) {
		this.session = session;
		this.prefix = prefix;
		this.template = template;
		this.printlog = p;
		this.frame = frame;
		this.pasteTargets = pasteTargets;
	}
	
	@Override
	public void executeOperation() throws Exception {
		printlog.println("开始粘贴");
		this.doPaste();
	}
	
	private void doPaste() {
		try {
			
			TCComponent copyRootComponent = this.getItemCopy(
					(TCComponentItem) template, prefix);

			TCComponentItem pasteComponentItem = (TCComponentItem) copyRootComponent;

			TCComponentBOMWindowType bomWindowType = (TCComponentBOMWindowType) session
					.getTypeComponent("BOMWindow"); //$NON-NLS-1$

			TCComponentBOMWindow pasteBomWindow = bomWindowType.create(null);
			pasteBomWindow.setWindowTopLine(pasteComponentItem,
					pasteComponentItem.getLatestItemRevision(), null, null);
			this.pasteFawbmVehItem(template, copyRootComponent, pasteBomWindow
					.getTopBOMLine(), prefix);

			ComponentUtils.paste(copyRootComponent, this.pasteTargets,
					((AIFDesktop)this.frame));

			pasteBomWindow.save();
			pasteBomWindow.close();
			MessageBox.post("竞品车BOM结构生成成功", "提示", MessageBox.INFORMATION); //$NON-NLS-1$ //$NON-NLS-2$
		
		} catch (Exception e) {
			MessageBox.post(ExceptionUtils.getExMessage(e), "Exeption", //$NON-NLS-1$
					MessageBox.INFORMATION);
		}
	}
	
	/*
	 * 通过递归调用,完成对TCComponentItem, TCComponentForm, TCcomponentFodler的复制
	 */
	private void pasteFawbmVehItem(InterfaceAIFComponent template,
			TCComponent pasteComponent,
			TCComponentBOMLine pasteComponentBOMLine, String prefix)
			throws Exception {

		if (template instanceof TCComponentItem
				&& pasteComponent instanceof TCComponentItem) {

			TCComponentItem tempalteComponentItem = (TCComponentItem) template;
			TCComponentItem pasteComponentItem = (TCComponentItem) pasteComponent;

			pasteFawbmVehItem(tempalteComponentItem.getLatestItemRevision(),
					pasteComponentItem.getLatestItemRevision(),
					pasteComponentBOMLine, prefix);
		} else if (template instanceof TCComponentItemRevision
				&& pasteComponent instanceof TCComponentItemRevision) {

			TCComponentItemRevision tempalteComponentItemRevision = (TCComponentItemRevision) template;
			TCComponentItemRevision pasteComponentItemRevision = (TCComponentItemRevision) pasteComponent;

			TCComponent[] views = ((TCComponent) tempalteComponentItemRevision)
					.getReferenceListProperty("view"); //$NON-NLS-1$
			if (views != null) {
				for (TCComponent view : views) {
					if (view instanceof TCComponentItem) {
						TCComponentItem viewComponentItem = (TCComponentItem) view;

						TCComponentItem copyComponentItem = this.getItemCopy(
								(TCComponentItem) viewComponentItem, prefix);

						TCComponentBOMLine childPasteComponentBOMLine = pasteComponentBOMLine
								.add(copyComponentItem, copyComponentItem
										.getLatestItemRevision(), null, false);

						pasteFawbmVehItem(viewComponentItem, copyComponentItem,
								childPasteComponentBOMLine, prefix);
					}
				}
			}

			for (AIFComponentContext componentContext : tempalteComponentItemRevision
					.getChildren()) {

				InterfaceAIFComponent component = componentContext
						.getComponent();

				TCComponent copyComponent = null;
				if (component instanceof TCComponentForm) {
					String type = component.getType();
					// 不复制item的MasterForm
					if (!type.endsWith("RevisionMaster")) { //$NON-NLS-1$
						copyComponent = this.getFormCopy(
								(TCComponentForm) component, prefix);
					} else { // 如果是ＲｅｖｉｓｉｏｎＭａｓｔｅｒ，改名字
						for (AIFComponentContext pasteComponentContext : pasteComponentItemRevision
								.getChildren()) {

							InterfaceAIFComponent pasteChildComponent = pasteComponentContext
									.getComponent();

							String pasteType = pasteChildComponent.getType();
							if (pasteType.endsWith("RevisionMaster")) { //$NON-NLS-1$
								TCComponentForm tcComponent = (TCComponentForm) pasteChildComponent;
								tcComponent.lock();
								TCProperty name = tcComponent
										.getTCProperty("object_name"); //$NON-NLS-1$
								name.setStringValue(prefix
										+ component.getProperty("object_name")); //$NON-NLS-1$
								tcComponent.setTCProperty(name);
								tcComponent.save();
								tcComponent.unlock();
							}
						}
					}
				} else if (component instanceof TCComponentFolder) {
					copyComponent = this.getFolderCopy(
							(TCComponentFolder) component, prefix);
				}

				if (copyComponent != null) {
					ComponentUtils.paste(copyComponent,
							pasteComponentItemRevision, null);
				}
			}
		}
	}
	
	
	private TCComponentItem getItemCopy(TCComponentItem componentItem,
			String prefix) {
		try {
			String id = componentItem.getProperty(ITEM_ID);
			String type = componentItem.getType();
			String name = componentItem.getProperty(OBJECT_NAME);

			TCComponentItemType componentItemType = (TCComponentItemType) session
					.getTypeComponent(type);

			return componentItemType.create(prefix + "-" + id, "A", type, //$NON-NLS-1$ //$NON-NLS-2$
					prefix + name, BLANK, null);
		} catch (TCException e) {
			e.printStackTrace();
		}

		return null;
	}

	private TCComponent getFormCopy(TCComponentForm componentForm, String prefix) {
		try {
			String type = componentForm.getType();
			String name = componentForm.getProperty(OBJECT_NAME);

			TCComponentFormType componentFormType = (TCComponentFormType) session
					.getTypeComponent(FORM_TYPE);

			return componentFormType.create(prefix + name, BLANK, type);
		} catch (TCException e) {
			e.printStackTrace();
		}

		return null;
	}

	private TCComponent getFolderCopy(TCComponentFolder componentFolder,
			String prefix) {
		try {
			String name = componentFolder.getProperty(OBJECT_NAME);

			TCComponentFolderType componentFolderType = (TCComponentFolderType) this.session
					.getTypeComponent(FOLDER_TYPE);

			return componentFolderType.create(prefix + name, null, FOLDER_TYPE);
		} catch (TCException e) {
			e.printStackTrace();
		}

		return null;
	}
	
}
