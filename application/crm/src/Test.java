import java.lang.reflect.Array;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;

import carModule.component.InLevelLog;

public class Test {
	public String getSelldate(String selldate){
		String y="";
		String m="";
		String d="";
		try {
			String[] s=selldate.split(" ");
			String[] ss=s[0].split("-");
			y=ss[0];
			if(Integer.parseInt(ss[1])<10){
				m="-0"+Integer.parseInt(ss[1]);
			}else{
				m="-"+Integer.parseInt(ss[1]);
			}
			if(Integer.parseInt(ss[2])<10){
				d="-0"+Integer.parseInt(ss[2]);
			}else{
				d="-"+Integer.parseInt(ss[2]);
			}
			return y+m+d;
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}
	public static String addDay(String date, int number) {      
		      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");      
		      
		      Calendar cd = Calendar.getInstance();      
		       try {
				cd.setTime(sdf.parse(date));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}      
		       cd.add(Calendar.DATE, number);      
		       return sdf.format(cd.getTime());      
		
	}
	/**  
	56.     * 日期相减运算  
	57.     * 方法一  
	58.     */  
	 public static long getQuot(String time1, String time2) throws ParseException{   
	       long quot = 0;   
	        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");   
	        Date date1 = ft.parse( time1 );   
	       Date date2 = ft.parse( time2 );   
	        quot = date1.getTime() - date2.getTime();   
	        quot = quot / 1000 / 60 / 60 / 24 / 30;   
	       return quot;   
	 }   
	public static void main(String[] args){
		//Test il= new Test();
		//System.out.println(il.getSelldate(null));
		//System.out.println(addDay("2011-03-01", 6));
		/*
		try {
			System.out.println(getQuot("2011-04-30", "2011-03-01"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		/*
		String mint=null;
		
		if((mint="11")!=null && mint.equals("11")){
			System.out.println("aa");
		}else{
			System.out.println("bb");
		}
		*/
		//System.out.println("2001-01-01".substring(0,10));
		//String ss="Ro1234";
		//System.out.println(ss.replace("R0", "RO").toUpperCase());
		/*String[] ss={"a","b","c"};
		Object ssz = ss;
		
		String[] aa=(String[])ssz;
		for(int i=0;i<aa.length;i++){
			System.out.println(aa[i]);
		}*/
		/*Object[][] srcs = {   
				    {1514l, "Capri_Anderson_02.jpg", "righthosting"},   
				    {1525l, "Capri_Anderson_13.jpg", "righthosting"},   
				    {15680l, "Prinzzess_Sahara_12.jpg", "righthosting"}   
				};   
				  
	    for(int i=0;i<srcs.length;i++){   
	        Object[] d = srcs[i]; 
	        for(int j=0;j<d.length;j++){
	        	System.out.println(srcs[i][j]);
	        }
	        //Long id = (Long) d[0];   
	        //String name = (String) d[1];   
	        //String prefix = (String) d[2];   
	    }   */
		//System.out.println(Arrays.toString("0000000a".split("")));
		
		System.out.println("2012-09-1100:00:00.0".startsWith("2012-09-11"));
	}
	/*
	public static void main(String[] args) {
		DecimalFormat formater = new DecimalFormat("#.##");

		double f = 3123116.526;
		System.out.println(f);
		System.out.println(f + "");
		System.out.println(formater.format(f));
	}
	*/
}
