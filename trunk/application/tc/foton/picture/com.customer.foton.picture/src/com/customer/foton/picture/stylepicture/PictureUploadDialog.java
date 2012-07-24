package com.customer.foton.picture.stylepicture;

import java.io.File;
import java.util.HashMap;

import com.customer.foton.picture.dialog.AbstractFotonStyleDialog;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.util.MessageBox;

public class PictureUploadDialog extends AbstractFotonStyleDialog{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String uploadPicturesPath;
	
	private InterfaceAIFComponent pasteTargets[];
	
	public PictureUploadDialog(PictureUploadCommand command ) {
		super(command);
		this.pasteTargets = command.getTargetArray();
	}
	
	@Override
	public void doInitUI() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean doValidate() {
		this.uploadPicturesPath = super.getSavePathTextField().getText().trim();
		
		if ((new File(this.uploadPicturesPath)).isDirectory()) {
			return true;
		}else {
				MessageBox
				.post(Messages.getString("PictureUploadDialog.chosepath"), "info", MessageBox.INFORMATION);  //$NON-NLS-1$ //$NON-NLS-2$
			return false;
		}
		
	}

	@Override
	public void operation() throws Exception {
		this.uploadPicturesPath = super.getSavePathTextField().getText().trim();
		HashMap<String, Object> parameters = new HashMap<String, Object>();
		
		parameters.put("session", super.getSession());  //$NON-NLS-1$
		parameters.put("pasteTargets", this.pasteTargets);  //$NON-NLS-1$
		parameters.put("desktop", desktop);  //$NON-NLS-1$
		parameters.put("picturePath", this.uploadPicturesPath); //$NON-NLS-1$
		
		StylePictureOperation.execute(parameters);
		//ExcelManager.generatePictures(this.excelTemplatePath, "c:\\test\\");
	}

	@Override
	public String getTitle() {
		return ""; //$NON-NLS-1$
	}

}
