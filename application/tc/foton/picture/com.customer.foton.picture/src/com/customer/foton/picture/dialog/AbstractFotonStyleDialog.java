package com.customer.foton.picture.dialog;

import java.awt.Cursor;
import java.awt.Graphics;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.io.File;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.IStatus;
import org.eclipse.core.runtime.Status;
import org.eclipse.core.runtime.jobs.Job;

import com.customer.foton.picture.util.PictureUploadUtil;
import com.customer.foton.picture.util.LogUtil;
import com.customer.foton.picture.commands.AbstractFotonStyleCommand;
import com.teamcenter.rac.aif.InterfaceAIFOperationListener;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.common.AbstractTCCommandDialog;
import com.teamcenter.rac.common.TCConstants;
import com.teamcenter.rac.kernel.TCSession;
import com.teamcenter.rac.util.FilterDocument;
import com.teamcenter.rac.util.HorizontalLayout;
import com.teamcenter.rac.util.MessageBox;
import com.teamcenter.rac.util.Painter;
import com.teamcenter.rac.util.PropertyLayout;
import com.teamcenter.rac.util.Registry;
import com.teamcenter.rac.util.VerticalLayout;

public abstract class AbstractFotonStyleDialog extends AbstractTCCommandDialog
		implements InterfaceAIFOperationListener, PropertyChangeListener {

	private JPanel inputPanel2;

	private JPanel leftPanel;

	private JLabel savePathLabel;

	private JTextField savePathTextField;

	private JButton savePathButton;

	// private JCheckBox openOnCreateCheckBox;

	private JButton stopButton;

	private TCSession session;

	private Registry registry;

	/**
	 * 对于定义其他的swing组件,对话框作的额外初始化操作
	 */
	public abstract void doInitUI();

	/**
	 * 生成对应业务的Excel
	 * 
	 * @throws Exception
	 */
	public abstract void operation() throws Exception;

	/**
	 * 获得对话框的名称
	 */
	public abstract String getTitle();

	/**
	 * 验证用户输入信息有效性
	 * 
	 * @return 返回true时执行生成Excel操作
	 */
	public abstract boolean doValidate();

	/**
	 * 公用的swing组件,完成对话框初始化操作
	 */

	private InterfaceAIFComponent[] targets;

	public AbstractFotonStyleDialog(AbstractFotonStyleCommand command) {
		super(command.getFrame(), command);
		this.session = command.getSession();
		this.targets = command.getTargetArray();
		this.registry = Registry.getRegistry(AbstractFotonStyleDialog.class);
		initUI();
	}

	public void initUI() {
		super.initUI();
		stopTimer();
		setTitle(this.getTitle());
		inputPanel2 = new JPanel(new PropertyLayout());
		dialogIcon.setIcon(registry.getImageIcon("newDataset.ICON")); //$NON-NLS-1$

		/* 保存位置 */
		savePathLabel = new JLabel(Messages.getString("AbstractFotonStyleDialog.uploadPath")); //$NON-NLS-1$
		savePathTextField = createTextField("", 20, TCConstants //$NON-NLS-1$
				.getDefaultMaxNameSize(session), true);
		savePathTextField.setEditable(false);
		savePathButton = new JButton(Messages.getString("AbstractFotonStyleDialog.view")); //$NON-NLS-1$

		savePathButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) {
				JFileChooser jChooser = new JFileChooser();
				// 设置默认的打开目录,如果不设的话按照window的默认目录(我的文档)
				jChooser.setCurrentDirectory(new File("c:/")); //$NON-NLS-1$
				// 设置打开文件类型,此处设置成只能选择文件夹
				jChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
				// 打开一个对话框
				int index = jChooser.showDialog(null, Messages.getString("AbstractFotonStyleDialog.open")); //$NON-NLS-1$
				if (index == JFileChooser.APPROVE_OPTION) {
					// 把获取到的文件的绝对路径显示在文本编辑框中
					savePathTextField.setText(jChooser.getSelectedFile()
							.getAbsolutePath());
				}
			}
		});

		stopButton = new JButton(registry.getString("stop")); //$NON-NLS-1$
		stopButton.setVisible(false);
		stopButton.setMnemonic(registry.getString("stop.MNEMONIC").charAt(0)); //$NON-NLS-1$
		stopButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent actionevent) {
				stopPressed();
			}
		});
		
		inputPanel2.add("1.1.right.top.preferred.preferred", savePathLabel); //$NON-NLS-1$
		inputPanel2.add(
				"1.2.center.center.preferred.preferred", savePathTextField); //$NON-NLS-1$
		inputPanel2.add("1.3.right.top.preferred.preferred", savePathButton); //$NON-NLS-1$

		buttonPanel.add(stopButton);
		leftPanel = new JPanel(new VerticalLayout());
		// leftPanel.add("bottom.nobind.right", openOnCreateCheckBox);
		// //$NON-NLS-1$
		leftPanel.add("bottom.nobind.center", inputPanel2); //$NON-NLS-1$
		mainPanel.setLayout(new HorizontalLayout());
		mainPanel.add("unbound.bind.left.top", leftPanel); //$NON-NLS-1$
		this.applyButton.setVisible(false);
		doInitUI();
		pack();
		centerToScreen(1.0D, 0.25D);
		startTimer();

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.teamcenter.rac.common.AbstractTCCommandDialog#showCloseButton()
	 */

	@Override
	public boolean showCloseButton() {
		return false;
	}

	@Override
	/* 点击确定和应用触发的事件 */
	public void startCommandOperation() {
	//	savePathButton.setEnabled(false);
	//	this.okButton.setEnabled(false);
	//	this.cancelButton.setEnabled(false);
		Job job = new Job(Messages.getString("AbstractFotonStyleDialog.uploading")) { //$NON-NLS-1$
			protected IStatus run(IProgressMonitor monitor) {
				try {
					if (doValidate()) {								
						operation();									
						MessageBox.post(Messages.getString("AbstractFotonStyleDialog.over") + LogUtil.loggerPath, getTitle(), //$NON-NLS-1$
								MessageBox.INFORMATION);
						if (okOrApply == 0) {
							disposeDialog();
							PictureUploadUtil.deleteFile(PictureUploadUtil.SP_PATH);
						}
					}
				} catch (Exception e) {
					MessageBox.post(e.getMessage(),// "程序执行失败"
							"error", MessageBox.ERROR); //$NON-NLS-1$
				}
				return Status.OK_STATUS;
			}
		};
		job.schedule();
	}

	public void propertyChange(PropertyChangeEvent evt) {
		String s = evt.getPropertyName();
		if (s.equals("Tc Stop Operation")) { //$NON-NLS-1$
			Thread thread = new Thread() {

				public void run() {
					stopButton.setEnabled(true);
					stopButton.doClick();
				}

			};
			thread.start();
		}
	}

	/* 验证 */
	public boolean isPerformable() {
		return true;
	}

	/* 取消按钮 */
	public void stopPressed() {
		Registry registry = Registry.getRegistry(this);

		stopButton.setText(registry.getString("aborting")); //$NON-NLS-1$
		stopButton.setEnabled(false);
		setCursor(Cursor.getPredefinedCursor(3));

		setCursor(Cursor.getPredefinedCursor(0));

		MessageBox.post(parentFrame, registry.getString("aborted"), registry //$NON-NLS-1$
				.getString("aborted.TITLE"), MessageBox.INFORMATION); //$NON-NLS-1$

		fireStopOperation();
		disposeDialog();
	}

	/* 关闭窗体的对话框 */
	public void windowClosingPressed() {
		if (stopButton.isVisible()) {
			stopButton.doClick();
		} else {
			cancelButton.doClick();
		}
	}

	/* 验证的对话框 */
	public JTextField createTextField(String s, int i, int j, boolean flag) {
		int k = i;
		if (k <= 0) {
			k = 10;
		}
		String s1 = s;
		if (s1 == null) {
			s1 = ""; //$NON-NLS-1$
		}

		FilterDocument filterdocument = new FilterDocument(j, TCSession
				.getServerEncodingName(session));

		if (flag) {
			return new JTextField(filterdocument, s1, k) {
				private static final long serialVersionUID = -1096092937246723413L;

				public void paint(Graphics g) {
					super.paint(g);
					Painter.paintIsRequired(this, g);
				}
			};
		} else {
			return new JTextField(filterdocument, s1, k);
		}
	}

	public TCSession getSession() {
		return session;
	}

	public JTextField getSavePathTextField() {
		return savePathTextField;
	}

	public JPanel getLeftPanel() {
		return leftPanel;
	}

	/*
	 * public boolean getOpenOnCreateFlag() { return
	 * openOnCreateCheckBox.isSelected(); }
	 */
}
