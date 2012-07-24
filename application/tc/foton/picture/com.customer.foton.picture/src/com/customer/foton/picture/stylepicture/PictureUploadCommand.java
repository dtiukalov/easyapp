package com.customer.foton.picture.stylepicture;

import com.customer.foton.picture.commands.AbstractFotonStyleCommand;
import com.teamcenter.rac.aif.AbstractAIFApplication;
import com.teamcenter.rac.common.AbstractTCCommandDialog;

public class PictureUploadCommand extends AbstractFotonStyleCommand {
	public PictureUploadCommand(AbstractAIFApplication abstractaifapplication) {
		super(abstractaifapplication);
	}

	@Override
	public AbstractTCCommandDialog getCommandDialog() {
		// TODO Auto-generated method stub
		return new PictureUploadDialog(this);
	}
}
