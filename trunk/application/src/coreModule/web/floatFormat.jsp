<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
	<%
		try{
			Map<String, Object> floatFormat = (Map<String, Object>)session.getAttribute("floatFormat");
			if(floatFormat == null){
				floatFormat = new HashMap<String, Object>(){
					
					public static final long serialVersionUID = -1;
				
					@Override
					public Object get(Object key){
						String value = "";
						DecimalFormat nf=((DecimalFormat)NumberFormat.getInstance());
						nf.applyPattern("#########.00"); 
						if(key!=null&&!"".equals(key)){
						    Float f = Float.parseFloat(key.toString());
						    if(f!=0.0){
						    	value = nf.format(key);
						    }
						}
						return value;
					}
				};			
				
				session.setAttribute("floatFormat", floatFormat);
			}
		} catch(Exception e){}
	%>