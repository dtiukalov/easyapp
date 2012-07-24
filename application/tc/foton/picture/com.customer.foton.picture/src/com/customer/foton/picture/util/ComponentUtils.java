package com.customer.foton.picture.util;

import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import com.teamcenter.rac.aif.AIFDesktop;
import com.teamcenter.rac.aif.kernel.AIFComponentContext;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.commands.paste.PasteCommand;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentDataset;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCComponentItemType;
import com.teamcenter.rac.kernel.TCComponentQuery;
import com.teamcenter.rac.kernel.TCComponentQueryType;
import com.teamcenter.rac.kernel.TCComponentTcFile;
import com.teamcenter.rac.kernel.TCComponentType;
import com.teamcenter.rac.kernel.TCComponentUser;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.MessageBox;

/**
 * TCComponent工具类
 * 
 * @author LeslieGu
 */
public class ComponentUtils {
	
	public static void paste(TCComponent[] components,
			InterfaceAIFComponent pasteTargetComponent, AIFDesktop desktop) {
		TCComponent[] pasteTargeComponent = { (TCComponent) pasteTargetComponent };
		paste(components,pasteTargeComponent, desktop);
	}
	
	public static Map<String, Object> loadComponentItemRelatedImage1(
			TCComponentItem componentItem, String key) {

		Map<String, Object> relateMap = new HashMap<String, Object>();
		try {
			TCComponentItemRevision itemRevision = componentItem
					.getLatestItemRevision();

			TCComponentType componentType[] = itemRevision.getTypeComponent()
					.getRelationTypes();
			if (componentType != null) {
				for (TCComponentType relateType : componentType) {
					String relateKey = relateType.toString();

					if (relateKey.equals(key)) { //$NON-NLS-1$
						TCComponent component = itemRevision
								.getRelatedComponent(relateKey);
						
						//版本下存在某关系的图片
						if (component != null) {
							if (component instanceof TCComponentDataset) {
								
								TCComponentDataset componentDataset = (TCComponentDataset) component;
								
								relateMap.put("datasetName", componentDataset.getProperty("object_name")); //$NON-NLS-1$ //$NON-NLS-2$
								
								TCComponentTcFile[] componentTcFiles = componentDataset.getTcFiles();
								
								if (componentTcFiles != null && componentTcFiles.length > 0) {
									TCComponentTcFile tcFile = componentTcFiles[0];
								
									
								/*	BufferedImage value = ImageUtil
											.readBufferedImg(tcFile
													.getFmsFile());*/
		
									relateMap.put(relateKey, tcFile);
								}
							}
						} else {
							relateMap = null;
						}
						

					}
				}
			}
		} catch (TCException tcexception) {
			tcexception.printStackTrace();
		}

		return relateMap;
	}

	public static Map<String, BufferedImage> loadComponentItemRelatedImage(
			TCComponentItem componentItem) {

		Map<String, BufferedImage> relateMap = new HashMap<String, BufferedImage>();
		try {
			TCComponentItemRevision itemRevision = componentItem
					.getLatestItemRevision();

			TCComponentType componentType[] = itemRevision.getTypeComponent()
					.getRelationTypes();

			if (componentType != null) {
				for (TCComponentType relateType : componentType) {
					String relateKey = relateType.toString();

					if (relateKey.startsWith("FAWBM")) { //$NON-NLS-1$
						TCComponent component = itemRevision
								.getRelatedComponent(relateKey);

						if (component instanceof TCComponentDataset) {
							TCComponentDataset componentDataset = (TCComponentDataset) component;

							if (componentDataset != null) {
								TCComponentTcFile[] componentTcFiles = componentDataset
										.getTcFiles();

								if (componentTcFiles != null
										&& componentTcFiles.length > 0) {
									TCComponentTcFile tcFile = componentTcFiles[0];

									BufferedImage value = ImageUtil
											.readBufferedImg(tcFile
													.getFmsFile());

									relateMap.put(relateKey, value);
								}
							}
						}
					}
				}
			}
		} catch (TCException tcexception) {
			tcexception.printStackTrace();
		}

		return relateMap;
	}
	
	public static TCComponent[] findTCComponentProject(TCSession session)
	{
		
		try {
			TCComponentQueryType queryType = (TCComponentQueryType) session
					.getTypeComponent("ImanQuery");  //$NON-NLS-1$
			TCComponentQuery query = (TCComponentQuery) queryType
					.find(Messages.getString("ComponentUtils.project"));  //$NON-NLS-1$
	
			return query.execute(new String[] {"ID"}, new String[] {((TCComponentUser)session.getUser()).getUserId()}); //$NON-NLS-1$
		} catch (TCException e) {
			e.printStackTrace();
		}

		return null;
	}

	public static TCComponent[] findTCComponentItemByType(TCSession session,
			String type) {
		try {
			TCComponentQueryType queryType = (TCComponentQueryType) session
					.getTypeComponent(Messages.getString("ComponentUtils.ImanQuery")); //$NON-NLS-1$
			TCComponentQuery query = (TCComponentQuery) queryType
					.find("Item..."); //$NON-NLS-1$

			return query.execute(new String[] {Messages.getString("ComponentUtils.Type")}, new String[] { type }); //$NON-NLS-1$
		} catch (TCException e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 根据Item id来查找TCComponentItem
	 * 
	 * @param session
	 * @param id
	 * @return 如果对应Id不存在Item, 返回null
	 */
	public static TCComponentItem findTCComponentItemById(TCSession session,
			String id) {
		try {
			TCComponentItemType componentItemType = (TCComponentItemType) session
					.getTypeComponent("Item"); //$NON-NLS-1$

			return componentItemType.find(id);
		} catch (TCException e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 组件粘贴功能, 实现把所有components分别粘贴到所有的pasteTargetComponents下
	 * 
	 * @param components
	 * @param pasteTargetComponents
	 * @param desktop
	 */
	public static void paste(TCComponent[] components,
			TCComponent[] pasteTargetComponents, AIFDesktop desktop) {

		try {
			PasteCommand pastecommand = new PasteCommand(components,
					pasteTargetComponents, desktop);

			pastecommand.setFailBackFlag(true);
			pastecommand.executeModal();
		} catch (Exception exception) {
			MessageBox.post(null, exception);
		}
	}

	/**
	 * 组件粘贴功能, 实现把component分别粘贴到pasteTargetComponent下
	 * 
	 * @param component
	 * @param pasteTargetComponent
	 * @param desktop
	 */
	public static void paste(InterfaceAIFComponent component,
			InterfaceAIFComponent pasteTargetComponent, AIFDesktop desktop) {

		TCComponent[] components = { (TCComponent) component };
		TCComponent[] pasteTargeComponent = { (TCComponent) pasteTargetComponent };

		paste(components, pasteTargeComponent, desktop);
	}

	/**
	 * 组件粘贴功能, 实现把component分别粘贴到所有的pasteTargetComponents下
	 * 
	 * @param components
	 * @param pasteTargetComponents
	 * @param desktop
	 */
	public static void paste(InterfaceAIFComponent component,
			InterfaceAIFComponent pasteTargetComponent[], AIFDesktop desktop) {

		TCComponent[] components = { (TCComponent) component };
		TCComponent[] pasteTargeComponents = new TCComponent[pasteTargetComponent.length];

		for (int i = 0; i < pasteTargetComponent.length; ++i) {
			pasteTargeComponents[i] = (TCComponent) pasteTargetComponent[i];
		}

		paste(components, pasteTargeComponents, desktop);
	}
	
	/**
	 * 根据父组件类型查找类型是type的子组件集合
	 * 
	 * @param parentComponent
	 *            父组件
	 * @param type
	 *            子组件类型
	 */
	public static LinkedList<InterfaceAIFComponent> getChildComponents(
			InterfaceAIFComponent parentComponent, String type) {

		LinkedList<InterfaceAIFComponent> queue = new LinkedList<InterfaceAIFComponent>();
		addComponentChildren(queue, parentComponent);
		LinkedList<InterfaceAIFComponent> components = new LinkedList<InterfaceAIFComponent>();

		for (InterfaceAIFComponent component : queue) {
			String componentType = component.getType();
			if (componentType.equals(type)) {
				components.add(component);
			}
		}
		return components;
	}

	/**
	 * 根据组件类型和对应属性的key-value值,查找子组件
	 * 
	 * @param parentComponent
	 *            父组件
	 * @param type
	 *            子组件类型
	 * @param propertyKey
	 *            子组件属性key
	 * @param propertyValue
	 *            子组件属性value
	 * 
	 * @return 不存在返回null
	 */
	public static InterfaceAIFComponent getChildComponent(
			InterfaceAIFComponent parentComponent, String type,
			String propertyKey, String propertyValue) {

		LinkedList<InterfaceAIFComponent> queue = new LinkedList<InterfaceAIFComponent>();
		addComponentChildren(queue, parentComponent);

		while (!queue.isEmpty()) {
			InterfaceAIFComponent component = queue.removeFirst();
			String componentType = component.getType();

			if (componentType.equals(type)) {
				if (propertyKey != null && propertyValue != null) {
					try {
						String name = component.getProperty(propertyKey);
						if (propertyValue.equals(name)) {
							return component;
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else {
					return component;
				}
			}

			addComponentChildren(queue, component);
		}

		return null;
	}
	
	/**
	 * 根据组件类型,查找第一个子组件
	 * 
	 * @param parentComponent
	 *            父组件
	 * @param type
	 *            子组件类型
	 * @param propertyKey
	 *            子组件属性key
	 * @param propertyValue
	 *            子组件属性value
	 * 
	 * @return 不存在返回null
	 */
	public static InterfaceAIFComponent getChildComponentByType(
			InterfaceAIFComponent parentComponent, String type) {

		LinkedList<InterfaceAIFComponent> queue = new LinkedList<InterfaceAIFComponent>();
		addComponentChildren(queue, parentComponent);

		while (!queue.isEmpty()) {
			InterfaceAIFComponent component = queue.removeFirst();
			String componentType = component.getType();

			if (componentType.equals(type)) {
					return component;
			}
			addComponentChildren(queue, component);
		}

		return null;
	}

	/**
	 * 根据组件对应属性的key-value值,查找子组件
	 * 
	 * @param parentComponent
	 *            父组件
	 * @param propertyKey
	 *            子组件属性key
	 * @param propertyValue
	 *            子组件属性value
	 * 
	 * @return 不存在返回null
	 */
	public static InterfaceAIFComponent getChildComponent(
			InterfaceAIFComponent parentComponent, String propertyKey,
			String propertyValue) {
		LinkedList<InterfaceAIFComponent> queue = new LinkedList<InterfaceAIFComponent>();
		addComponentChildren(queue, parentComponent);

		while (!queue.isEmpty()) {
			InterfaceAIFComponent component = queue.removeFirst();

			if (propertyKey != null && propertyValue != null) {
				try {
					String name = component.getProperty(propertyKey);

					if (propertyValue.equals(name)) {
						return component;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			addComponentChildren(queue, component);
		}

		return null;
	}

	private static void addComponentChildren(
			LinkedList<InterfaceAIFComponent> queue,
			InterfaceAIFComponent component) {

		try {
			for (AIFComponentContext componentContext : component.getChildren()) {
				InterfaceAIFComponent childComponent = componentContext
						.getComponent();

				queue.add(childComponent);
			}

			if (component instanceof TCComponentItemRevision) {
				TCComponentItemRevision componentItemRevision = (TCComponentItemRevision) component;
				TCComponent[] views = ((TCComponent) componentItemRevision)
						.getReferenceListProperty("view"); //$NON-NLS-1$
				if (views != null) {
					for (TCComponent view : views) {
						queue.add(view);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
