package com.saturn.ph.stylesheet;

import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentItem;

public class FV9_52LogistikkonzeptRendering extends BaseRendering {

	private static final long serialVersionUID = -6247052396297504364L;
	
	public static final String[] propNameArray = new String[] { "LogistikStyle",
			"LogistikStatus", "LogistikStatCom", "LogistikStatMab"};
	
	@Override
	public String[] getPropertyName() {
		return propNameArray;
	}

	public FV9_52LogistikkonzeptRendering(TCComponent tccomponent, boolean isCreate,
			TCComponentItem templateItem) throws Exception {
		
		super(tccomponent, isCreate, templateItem);
	}
	
	public FV9_52LogistikkonzeptRendering() throws Exception {
		super();
	}

	public FV9_52LogistikkonzeptRendering(TCComponent tccomponent) throws Exception {
		super(tccomponent);
	}
}
