package com.saturn.ph.stylesheet;

import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCComponentItem;

public class FFFRendering extends BaseRendering {

	private static final long serialVersionUID = -6247052396297504364L;
	
	public static final String[] propNameArray = new String[] { "AA",
			"BB" };
	
	@Override
	public String[] getPropertyName() {
		return propNameArray;
	}

	public FFFRendering(TCComponent tccomponent, boolean isCreate,
			TCComponentItem templateItem) throws Exception {
		
		super(tccomponent, isCreate, templateItem);
	}
	
	public FFFRendering() throws Exception {
		super();
	}

	public FFFRendering(TCComponent tccomponent) throws Exception {
		super(tccomponent);
	}
}
