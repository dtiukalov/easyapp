package ccioModule.component;

import java.io.File;
import java.io.InputStream;
import java.util.Properties;

import edu.ccut.saturn.component.DefaultComponent;
import edu.ccut.saturn.component.IParameterContext;
// extends DefaultComponent
public class CreatCard extends DefaultComponent{

	public void execute(IParameterContext parameterContext) throws Exception {
		String card = "";
		String c_a_v = (String)parameterContext.getParameterValue(1);
		String c_b_v = (String)parameterContext.getParameterValue(2);
		String c_c_v = (String)parameterContext.getParameterValue(3);
		String c_d_v = (String)parameterContext.getParameterValue(4);
		
		String x_count = (String)parameterContext.getParameterValue(5);
		String p_count = (String)parameterContext.getParameterValue(6);
		
		System.out.println("xxx:"+c_a_v+"-"+c_b_v+"-"+c_c_v+"-"+c_d_v+"-"+x_count+"-"+p_count);
		
		if(c_a_v!=null&&c_b_v!=null&&c_c_v!=null&&c_d_v!=null&&x_count!=null&&p_count!=null
				&&!"".equals(c_a_v)&&!"".equals(c_b_v)&&!"".equals(c_c_v)&&!"".equals(c_d_v)&&!"".equals(x_count)&&!"".equals(p_count)){
			String a=(Integer.parseInt(c_a_v)>> 8)+"-"+((Integer.parseInt(c_a_v)<< 24) >>> 24);
			String b=(Integer.parseInt(c_b_v)>> 8)+"-"+((Integer.parseInt(c_b_v)<< 24) >>> 24);
			String c=(Integer.parseInt(c_c_v)>> 8)+"-"+((Integer.parseInt(c_c_v)<< 24) >>> 24);
			String d=(Integer.parseInt(c_d_v)>> 8)+"-"+((Integer.parseInt(c_d_v)<< 24) >>> 24);
			String x="";
			long t_x=Long.parseLong(x_count)+1;
			x=(t_x>> 32)+"-"+((t_x<< 32) >>> 56)+"-"+((t_x<< 40) >>> 56)+"-"+((t_x<< 48) >>> 56)+"-"+((t_x<< 56) >>> 56);
			String p="";
			int t_p=Integer.parseInt(p_count)+1;
			if(t_p>255){
				t_p=t_p%255;
			}
			p=t_p+"";
			card=a+"-"+b+"-"+c+"-"+d+"-"+x+"-"+p;
			System.out.println("card:"+card);
		}
		
		parameterContext.setParameter(0, card);
		parameterContext.setParameter(5, (Long.parseLong(x_count)+1)+"");
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("".equals(""));
		String s="65535";
		int yz = Integer.parseInt(s);
        System.out.println(yz >>> 8);
        System.out.println((yz << 24) >>> 24);
		
	}

}
