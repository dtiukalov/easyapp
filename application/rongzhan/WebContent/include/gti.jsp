<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table width="980px" border="0" cellpadding="0" cellspacing="0" class="tablebase" bordercolordark="#FFFFFF">
		 <tr align="center">
			<td class="trtitle">
				<strong style="font-size:14px;"> 车型</strong>
			</td>
		   <td class="trtitle">
				<strong style="font-size:14px;">GTI</strong> 
			</td>
		  </tr>
		  <tr align="center" >
							 <td class="tdtitle">
								 型号 
							 </td>
							<td bgcolor="#FFFEEE">GTI 2.0 TSI</td>
		  </tr>
		 <tr align="center" >
							  <td class="tdtitle">
								市场指导价
							 </td>
							<td bgcolor="#FFFEEE">23.58万元</td>
		  </tr>
		  <tr align="center">
							<td class="trtitle" onclick="test(this,'cheshen')">
								<strong style="font-size:12px; color:#a6762c;">技术参数</strong>
							</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
		  </tr>
		 <tr align="center" tabName="cheshen">
							<td class="tdtitle">
								发动机型式
							</td>
							<td bgcolor="#FFFEEE">2.0L直列四缸4气阀TSI电控燃油缸内直接喷射涡轮增压</td>
		  </tr>
		<tr align="center" tabName="cheshen">
							 <td class="tdtitle">
								最大输出功率(Kw(ps)/rpm)
							 </td>
							<td bgcolor="#FFFEEE">147/5100-6000</td>
		  </tr>
		  <tr align="center" tabName="cheshen">
							<td class="tdtitle">
								最大输出扭矩[Nm/rpm]
							 </td>
							<td bgcolor="#FFFEEE">280/1700-5000</td>
		  </tr>
		<tr align="center" tabName="cheshen">
							<td class="tdtitle">
								排放系统
							 </td>
							<td bgcolor="#FFFEEE">中国4号排放标准,带OBD</td>
		  </tr>
		  <tr align="center" tabName="cheshen">
							<td class="tdtitle">
								变速器
							 </td>
							<td bgcolor="#FFFEEE">带运动模式6档手/自动一体DSG®双离合自动变速器</td>
		  </tr>
		   <tr align="center" tabName="cheshen">
							<td class="tdtitle">
								悬架系统(前/后)
							 </td>
							<td bgcolor="#FFFEEE">加强麦弗逊式独立悬架/加强四连杆式独立悬架</td>
					
		  </tr>
		   <tr align="center" tabName="test2">
							<td class="tdtitle">
								制动系统
							 </td>
							<td bgcolor="#FFFEEE">大尺寸前通风制动盘/后实心制动盘</td>
		  </tr>
		  
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								转向系统
							 </td>
							<td bgcolor="#FFFEEE">EPS电动随速助力转向</td>
		  </tr>

		 <tr align="center" tabName="test2">
							<td class="tdtitle">
								长*宽*高(mm)
							 </td>
							<td bgcolor="#FFFEEE">4213*1786*1469</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								轴距(mm)
							 </td>
							<td bgcolor="#FFFEEE">2578</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								轮距前/后(mm)
							 </td>
							<td bgcolor="#FFFEEE">1533/1514</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								整备质量(kg)
							 </td>
							<td bgcolor="#FFFEEE">1460</td>
		  </tr>
		   <tr align="center" tabName="test2">
							<td class="tdtitle">
								行李箱容积(L)
							 </td>
							<td bgcolor="#FFFEEE">350/1305</td>
		  </tr>
			<tr align="center" tabName="test2">
							<td class="tdtitle">
								邮箱容积(L)
							 </td>
							<td bgcolor="#FFFEEE">55</td>
		  </tr>
		  <tr align="center" tabName="test3">
							<td class="tdtitle">
								发动机排量(cc)
							 </td>
							<td bgcolor="#FFFEEE">1984</td>
		  </tr>
		 <tr align="center" tabName="test3">
							<td class="tdtitle">
								等速油耗L/100km[90km/h]
							 </td>
							<td bgcolor="#FFFEEE">6.9</td>
		  </tr>
		  <tr align="center" tabName="test3">
							<td class="tdtitle">
								加速时间0-100km(s)
							 </td>
							<td bgcolor="#FFFEEE">7.1</td>
		  </tr>
		 <tr align="center" tabName="test3">
							<td class="tdtitle">
								最高车速(km/h)
							 </td>
							<td bgcolor="#FFFEEE">235</td>
		  </tr>

		   <tr align="center" tabName="test3">
							<td class="tdtitle">
								综合油耗
							 </td>
							<td bgcolor="#FFFEEE">7.8</td>
		  </tr>
		 <tr align="center">
							<td class="trtitle" onclick="test(this,'test1')">
								<strong style="font-size:12px; color:#a6762c;">外观</strong>
							</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
		  </tr>
		  <tr align="center" tabName="test1">
							<td class="tdtitle">
								动感鲨鱼鳍天线
							 </td>
							<td bgcolor="#FFFEEE">可选</td>
		  </tr>
		 <tr align="center" tabName="test1">
							<td class="tdtitle">
								双层式防夹电动天窗
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>

		  <tr align="center" tabName="test1">
							<td class="tdtitle">
								尾部空气动力学导流板
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test1">
							<td class="tdtitle">
								运动型后扰流板
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test1">
							<td class="tdtitle">
								运动型侧裙边
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test1">
							<td class="tdtitle">
								绿色防紫外线隔热玻璃
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>


		 <tr align="center" tabName="test1">
							<td class="tdtitle">
								前格栅红色装饰条
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  </tr>

		  <tr align="center" tabName="test1">
							<td class="tdtitle">
								熏黑风格尾灯
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test1">
							<td class="tdtitle">
								17寸铝合金轮辋
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test1">
							<td class="tdtitle">
								GTI专用运动型保险杠
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test1">
							<td class="tdtitle">
								双侧运动型镀铬装饰双排气尾管
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test1">
							<td class="tdtitle">
								电动外后视镜集成LED转向灯
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test1">
							<td class="tdtitle">
								蜂巢造型前格栅
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center">
							<td class="trtitle" onclick="test(this,'test2')">
								<strong style="font-size:12px; color:#a6762c;">内饰</strong>
							</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								方向盘高度角度可调
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								后座椅靠背4:6分体可折叠
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								后排中央扶手(有通过式载物功能)
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								阻尼疏缓手套箱开闭功能
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		 <tr align="center" tabName="test2">
							<td class="tdtitle">
								司机侧便利储物盒
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		   <tr align="center" tabName="test2">
							<td class="tdtitle">
								前排高度长度可调中扶手
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		   <tr align="center" tabName="test2">
							<td class="tdtitle">
								仪表和开关照亮度调节
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		   <tr align="center" tabName="test2">
							<td class="tdtitle">
								跑车式双炮筒仪表盘
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		   <tr align="center" tabName="test2">
							<td class="tdtitle">
								金属铝运动风格饰板 
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>

		   <tr align="center" tabName="test2">
							<td class="tdtitle">
								真皮装饰门护板
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		   <tr align="center" tabName="test2">
							<td class="tdtitle">
								真皮手刹车柄护套
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>

		   <tr align="center" tabName="test2">
							<td class="tdtitle">
								前排座椅靠背置物袋
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		   <tr align="center" tabName="test2">
							<td class="tdtitle">
								后排空调出风口
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		   <tr align="center" tabName="test2">
							<td class="tdtitle">
								前排阅读照明灯组
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		   <tr align="center" tabName="test2">
							<td class="tdtitle">
								手套箱照明功能
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		   <tr align="center" tabName="test2">
							<td class="tdtitle">
								自动行李箱照明
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		   <tr align="center" tabName="test2">
							<td class="tdtitle">
								前机舱盖/后掀背门气弹簧支撑
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								后排中置伸缩式双杯架
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								驾驶席座椅电动12方向调节
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								驾驶席座椅电动腰部支撑
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>

		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								三辐真皮多功能方向盘
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								前排点烟器/12V电源、烟灰缸
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								顶置式眼镜盒
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								前排中间储物盒带启瓶器
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								后排照明灯
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								防噪静音前风挡玻璃
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								真皮换挡手柄
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>

		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								前排遮阳板带化妆镜(照明功能)
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								前大灯关闭提醒装置
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test2">
							<td class="tdtitle">
								灰尘花粉过滤器
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		 <tr align="center">
							<td class="trtitle" onclick="test(this,'test3')">
								<strong style="font-size:12px; color:#a6762c;">安全</strong>
							</td>
							<td class="trtitle">&nbsp;&nbsp;</td>
		  </tr>
<tr align="center" tabName="test3">
							<td class="tdtitle">
								驾驶席及前排乘员侧面SRS气囊
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test3">
							<td class="tdtitle">
								驾驶席及前排乘员正面SRS气囊
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		<tr align="center" tabName="test3">
							<td class="tdtitle">
								HHC坡路起车辅助功能
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr><tr align="center" tabName="test3">
							<td class="tdtitle">
								在线智能电子防盗系统
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr><tr align="center" tabName="test3">
							<td class="tdtitle">
								前排安全带未系感知系统
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr><tr align="center" tabName="test3">
							<td class="tdtitle">
								HBA液压制动辅助功能
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr><tr align="center" tabName="test3">
							<td class="tdtitle">
								热成型钢板高强度车身
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr><tr align="center" tabName="test3">
							<td class="tdtitle">
								28米超长激光焊接
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr><tr align="center" tabName="test3">
							<td class="tdtitle">
								前排WOKS防颈部扭伤强化头枕
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test3">
							<td class="tdtitle">
								制动盘自动除水功能
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr><tr align="center" tabName="test3">
							<td class="tdtitle">
								镀铬装饰前雾灯
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr><tr align="center" tabName="test3">
							<td class="tdtitle">
								ABS防抱死制动系统
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test3">
							<td class="tdtitle">
								EBV电子制动力分配装置
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test3">
							<td class="tdtitle">
								EDS电子差速锁系统
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test3">
							<td class="tdtitle">
								ESP电子稳定程序
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test3">
							<td class="tdtitle">
								顶置高位LED刹车灯
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test3">
							<td class="tdtitle">
								前排高度可调预紧式安全带
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test3">
							<td class="tdtitle">
								行车自动落锁
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr><tr align="center" tabName="test3">
							<td class="tdtitle">
								后排儿童安全锁
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr><tr align="center" tabName="test3">
							<td class="tdtitle">
								儿童座椅固定装置ISO-FIX
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		<tr align="center" tabName="test3">
							<td class="tdtitle">
								全车头枕高度可调
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>

		   <tr align="center" tabName="test3">
							<td class="tdtitle">
								双面镀锌钢板12年防锈穿车身
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>

		  <tr align="center" tabName="test3">
							<td class="tdtitle">
								ASR驱动防滑控制系统
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test3">
							<td class="tdtitle">
								全方位模拟可视倒车雷达
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test3">
							<td class="tdtitle">
								自动防眩目内后视镜
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test3">
							<td class="tdtitle">
								车门侧防撞加强梁
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		  <tr align="center" tabName="test3">
							<td class="tdtitle">
								后排3头枕
							 </td>
							<td bgcolor="#FFFEEE">有</td>
		  </tr>
		 
		 		 <tr align="center" >
							<td class="tdtitle">
								<strong style="font-size:12px; color:#a6762c;">备 注</strong>
							</td>
			<td bgcolor="#FFFEEE">详细配置请致电咨询</td>
		  </tr>
</table>