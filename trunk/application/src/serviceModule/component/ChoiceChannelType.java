package serviceModule.component;

import java.sql.Date;
import java.util.ArrayList;
import java.util.*;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;
import edu.ccut.saturn.component.SaturnData;

public class ChoiceChannelType extends DefaultComponent {
	@Override
	public void execute(IParameterContext parameterContext) throws Exception {
		SaturnData carlist = (SaturnData)parameterContext.getParameterValue(0);
		ArrayList<SaturnData> servicelist = (ArrayList<SaturnData>)parameterContext.getParameterValue(1);
	    String carlevel = null;
	     
	    carlevel = (String)carlist.get("carcardlevel");
	    if( carlevel != null){
	    	if("101003".equals(carlevel)|| "101004".equals(carlevel)|| "101006".equals(carlevel)){
	    		carlevel = "101002";
	    	}else if("101002".equals(carlevel)){
	    		int a =	servicelist.size();
		    	if(a > 2){
		    		int maxk = 0;
		    		int mink = 0;
			    	
		    		for(int i=0;i<servicelist.size();i++){
		    			int nextkvalue = 0;
	    				SaturnData servlist = (SaturnData)servicelist.get(i);
	    				nextkvalue =  Integer.parseInt(servlist.get("servkilometer").toString());
	    				if( nextkvalue > maxk){
	    					maxk = nextkvalue;
	    				}
	    				if(i == 0){
	    					mink = nextkvalue;
	    				}
	    				if(i < 0 ){
	    					if(mink > nextkvalue){
	    						mink = nextkvalue;
	    					}
	    				}
	    			}
		    		
		    		float endv = (maxk - mink)/10000 +1;
		    		if(a>endv){
		    			carlevel = "101001";
		    		}
		    	}
	    	}else if("101005".equals(carlevel)){
	    		if(servicelist != null){
	    			int a =	servicelist.size();
	    			String selldate = carlist.get("carselldate").toString();
	    			Calendar ca = Calendar.getInstance();  
	    			String ctime =  selldate.substring(1,6);
	    			String ntime = ca.toString().substring(1,6);
	    			int bt = Integer.parseInt(ctime);
	    			int nt = Integer.parseInt(ntime);
	    			if(a>3 && nt>bt+6){
	    				carlevel = "101001";
	    			}

	    		}
	    	}
	    	
	    }
	    parameterContext.setParameter(2, carlevel);
	}
}