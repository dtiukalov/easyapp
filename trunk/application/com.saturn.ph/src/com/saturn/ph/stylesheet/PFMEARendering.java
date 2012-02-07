package com.saturn.ph.stylesheet;

import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentItem;

public class PFMEARendering extends BaseRendering {

	private static final long serialVersionUID = -6247052396297504364L;
	
	public static final String[] propNameArray = new String[] { "AA",
			"BB" };
	
	@Override
	public String[] getPropertyName() {
		return propNameArray;
	}

	public PFMEARendering(TCComponent tccomponent, boolean isCreate,
			TCComponentItem templateItem) throws Exception {
		
		super(tccomponent, isCreate, templateItem);
	}
	
	public PFMEARendering() throws Exception {
		super();
	}

	public PFMEARendering(TCComponent tccomponent) throws Exception {
		super(tccomponent);
	}
}
