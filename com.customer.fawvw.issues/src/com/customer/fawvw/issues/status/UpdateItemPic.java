package com.customer.fawvw.issues.status;

import org.eclipse.swt.graphics.Image;
import org.eclipse.ui.plugin.AbstractUIPlugin;

import com.teamcenter.rac.aif.kernel.AIFComponentContext;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.providers.delegates.DefaultLabelProviderDelegate;

public class UpdateItemPic extends DefaultLabelProviderDelegate
{

	//ItemÇ°µÄÍ¼Æ¬
	public Image getImage(Object arg0) {
		return AbstractUIPlugin.imageDescriptorFromPlugin(
				"com.customer.fawvw.issues", "coins/itemrevision.png").createImage();
	}

	//ItemºóµÄÍ¼Æ¬
	public Image[] getTrailingImages(Object object)  {

		TCComponentItemRevision ir = (TCComponentItemRevision) 
			((AIFComponentContext) object).getComponent(); 
	
		Image image = null;
		try {
			if (!"".equals(ir.getProperty("fv9RGStatus")) //$NON-NLS-1$ //$NON-NLS-2$
					&& ir.getProperty("fv9RGStatus") != null){ //$NON-NLS-1$
				if("ºì".equals(ir.getProperty("fv9RGStatus"))){  //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
					image = AbstractUIPlugin.imageDescriptorFromPlugin(
								"com.customer.fawvw.issues", "coins/redTag.png") //$NON-NLS-1$ //$NON-NLS-2$
								.createImage();
				}
				if("»Æ".equals(ir.getProperty("fv9RGStatus"))){  //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
					image = AbstractUIPlugin.imageDescriptorFromPlugin(
								"com.customer.fawvw.issues", "coins/yellowTag.png") //$NON-NLS-1$ //$NON-NLS-2$
								.createImage();
				}
				if("ÂÌ".equals(ir.getProperty("fv9RGStatus"))){  //$NON-NLS-2$ //$NON-NLS-1$ //$NON-NLS-1$
					image = AbstractUIPlugin.imageDescriptorFromPlugin(
								"com.customer.fawvw.issues", "coins/greenTag.png") //$NON-NLS-1$ //$NON-NLS-2$
								.createImage();
				}
			} else {
				  image = AbstractUIPlugin.imageDescriptorFromPlugin(
							"com.customer.fawvw.issues", "coins/white.gif") //$NON-NLS-1$ //$NON-NLS-2$
							.createImage();
			}
			
		} catch (TCException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return new Image[] { image };
	}
}
