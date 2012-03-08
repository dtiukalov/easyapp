<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<HEAD><TITLE></TITLE>
<%@ include file="/car/includes/header.jsp"%>
<BODY>
<DIV class=content_nt>
<DIV style="WIDTH: 955px" class=sernt_lb><SPAN 
class="ti_0915config_spa mar_top8">
参数展示： <INPUT class=t1126_teys 
onclick=setDiscoveredOrHidden(1) CHECKED type=radio name=show_config>显示全部参数　 
<INPUT class=t1126_teys onclick=setDiscoveredOrHidden(2) type=radio 
name=show_config>隐藏相同参数 &nbsp;&nbsp;<INPUT id=highlight class=t1126_teys CHECKED 
type=checkbox name="">高亮显示不同项 </SPAN>
<DIV class=ti_1126_duia>
<DIV class=top></DIV>
<DIV class=cen><SPAN>车型筛选</SPAN> <EM class=a>名称：</EM> 
<UL class=z>
  <LI><INPUT id=seriseCheckbox_0 class=t1126_teys 
  onclick="chg_checkbox('seriseCheckbox','1','0','一个子车系')" 
  value=1,2,3,4,5,6,7,8,9,10,11,12 CHECKED type=checkbox>2011款奥迪A6L </LI></UL><EM 
class=b>排量：</EM> 
<UL class=x>
  <LI><INPUT id=dislCheckbox_0 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','5','0','一种发动机')" value=1,2,3,4 CHECKED 
  type=checkbox>2.0T </LI>
  <LI><INPUT id=dislCheckbox_1 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','5','1','一种发动机')" value=5,6,7 CHECKED 
  type=checkbox>2.4L </LI>
  <LI><INPUT id=dislCheckbox_2 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','5','2','一种发动机')" value=8 CHECKED 
  type=checkbox>2.7T </LI>
  <LI><INPUT id=dislCheckbox_3 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','5','3','一种发动机')" value=9,10,11 CHECKED 
  type=checkbox>2.8L </LI>
  <LI><INPUT id=dislCheckbox_4 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','5','4','一种发动机')" value=12 CHECKED 
  type=checkbox>3.0T </LI></UL><EM class=c>变速箱：</EM> 
<UL class=y>
  <LI><INPUT id=transtypeCheckbox_0 class=t1126_teys 
  onclick="chg_checkbox('transtypeCheckbox','3','0','一种变速箱')" value=1,2 CHECKED 
  type=checkbox>手动变速箱 </LI>
  <LI><INPUT id=transtypeCheckbox_1 class=t1126_teys 
  onclick="chg_checkbox('transtypeCheckbox','3','1','一种变速箱')" value=11,12 
  CHECKED type=checkbox>自动变速箱 </LI>
  <LI><INPUT id=transtypeCheckbox_2 class=t1126_teys 
  onclick="chg_checkbox('transtypeCheckbox','3','2','一种变速箱')" 
  value=3,4,5,6,7,8,9,10 CHECKED type=checkbox>无极变速箱 </LI></UL></DIV>
<DIV class=bot></DIV></DIV></DIV>
<DIV class=clear></DIV></DIV>
<DIV class="content_nt mar_top8">
<DIV style="POSITION: relative" class=goCarMain>
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" align=center>
  <TBODY>
  <TR>
    <TD vAlign=top>
      <TABLE style="POSITION: relative" id=menu class=t1125_se_tab border=0 
      cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
        <TR>
          <TH 
          style="PADDING-BOTTOM: 0px; BORDER-RIGHT-WIDTH: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 147px !important" src="a6l_files/t1125arr_e.gif" 
            height=1></TH></TR>
        <TR id=info_1>
          <TH 
          style="PADDING-BOTTOM: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 105px; PADDING-TOP: 0px" 
          scope=col><B class=t0709_ba2 onclick=showOrHideMenu(1)></B><STRONG 
            class=t0709_stra>基本参数</STRONG></TH></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=1_min_price 
class=title>厂商指导价：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=1_bname class=title>品牌：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=1_type2 class=title>级别：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=1_m_disl class=title>发动机：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=1_m_transtype 
class=title>变速箱：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=1_m_length_width_height 
            class=title>长×宽×高(mm)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=1_m_frame class=title>车体结构：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=1_syear class=title>上市年份：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=1_m_mspeed 
          class=title>最高车速(km/h)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=1_m_hatime 
          class=title>0-100加速时间(s)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=1_m_comfuel 
            class=title>综合油耗(L/100km)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=1_m_lkmfuel 
            class=title>等速油耗(L/100km)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=1_m_hkmfuel 
            class=title>等速油耗时速(km/h)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=1_m_ypolicy class=title>保修政策：</TD></TR>
        <TR id=info_2>
          <TH 
          style="PADDING-BOTTOM: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 105px; PADDING-TOP: 0px" 
          scope=col><B class=t0709_ba2 onclick=showOrHideMenu(2);></B><STRONG 
            class=t0709_stra>车身参数</STRONG></TH></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=2_m_length 
class=title>车长(mm)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=2_m_width class=title>车宽(mm)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=2_m_height 
class=title>车高(mm)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=2_m_wheelbase 
        class=title>轴距(mm)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=2_m_weight 
class=title>车重(kg)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=2_m_clearance 
            class=title>最小离地间隙(mm)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=2_m_frame2 class=title>车身结构：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=2_m_door class=title>车门数：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=2_m_seat class=title>座位数：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=2_m_oilbox 
        class=title>油箱容积(L)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=2_m_trunk 
        class=title>行李箱容积(L)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=2_m_mtrunk 
          class=title>行李箱最大容积(L)：</TD></TR>
        <TR id=info_3>
          <TH 
          style="PADDING-BOTTOM: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 105px; PADDING-TOP: 0px" 
          scope=col><B class=t0709_ba2 
onclick=showOrHideMenu(3)></B>发动机：</TH></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=3_m_disl2 class=title>排量(L)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=3_m_working class=title>进气形式：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=3_m_mpower 
        class=title>最大功率(kW)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=3_m_mpowersp 
            class=title>最大功率转速(rpm)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=3_m_mtorque 
          class=title>最大扭矩(N·m)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=3_m_mtorsp 
          class=title>最大扭矩转速(rpm)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=3_m_fuel class=title>燃油：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=3_m_fuelno class=title>燃油标号：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=3_m_envstand 
class=title>环保标准：</TD></TR>
        <TR id=info_4>
          <TH 
          style="PADDING-BOTTOM: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 105px; PADDING-TOP: 0px" 
          scope=col><B class=t0709_ba2 onclick=showOrHideMenu(4)></B>变速箱</TH></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=4_m_speed class=title>挡位个数：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=4_m_transtype2 class=title 
            height=14>变速箱类型：</TD></TR>
        <TR id=info_5>
          <TH 
          style="PADDING-BOTTOM: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 105px; PADDING-TOP: 0px" 
          scope=col><B class=t0709_ba2 
        onclick=showOrHideMenu(5);></B>底盘转向</TH></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=5_m_drivetype 
        class=title>驱动方式：</TD></TR>
        <TR height=60>
          <TD style="TEXT-ALIGN: right" id=5_m_fsustype_text 
          class=title>前悬挂类型：</TD></TR>
        <TR height=60>
          <TD style="TEXT-ALIGN: right" id=5_m_bsustype_text 
          class=title>后悬挂类型：</TD></TR>
        <TR id=info_6>
          <TH 
          style="PADDING-BOTTOM: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 105px; PADDING-TOP: 0px" 
          scope=col><B class=t0709_ba2 
onclick=showOrHideMenu(6)></B>车轮制动</TH></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=6_m_fbraketype 
          class=title>前制动器类型：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=6_m_bbraketype 
          class=title>后制动器类型：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=6_m_ftiresize 
        class=title>前轮胎规格：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=6_m_btiresize 
        class=title>后轮胎规格：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=6_m_sparetire class=title>备胎：</TD></TR>
        <TR id=info_7>
          <TH 
          style="PADDING-BOTTOM: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 105px; PADDING-TOP: 0px" 
          scope=col><B class=t0709_ba2 
onclick=showOrHideMenu(7)></B>安全配置</TH></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=7_m_isdairbag 
          class=title>驾驶座安全气囊：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=7_m_isadairbag 
          class=title>副驾驶安全气囊：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=7_m_isfhairbag 
            class=title>前排头部气囊(气帘)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=7_m_isbhairbag 
            class=title>后排头部气囊(气帘)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=7_m_isfsairbag 
        class=title>前排侧气囊：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=7_m_isbsairbag 
        class=title>后排侧气囊：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=7_m_iskairbag 
        class=title>膝部气囊：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=7_m_isseatbeltti 
            class=title>安全带未系提示：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=7_m_iseanti class=title>电子防盗：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=7_m_iscclock 
        class=title>车内中控锁：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=7_m_isrekey class=title>遥控钥匙：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=7_m_isnokeysys 
          class=title>无钥匙启动系统：</TD></TR>
        <TR id=info_8>
          <TH 
          style="PADDING-BOTTOM: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 105px; PADDING-TOP: 0px" 
          scope=col><B class=t0709_ba2 
onclick=showOrHideMenu(8)></B>操控配置</TH></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=8_m_isabs class=title>ABS防抱死：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=8_m_isesp 
          class=title>车身稳定控制(ESP)：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=8_m_isadsus 
        class=title>升降(空气)悬挂：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=8_m_istpmonitor 
          class=title>胎压监测装置：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=8_m_istpruning 
          class=title>零胎压继续行驶：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=8_m_isfsteering 
          class=title>动力随速转向：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=8_m_issteesys 
        class=title>主动转向系统：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=8_m_isuphillassist 
            class=title>自动驻车/上坡辅助：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=8_m_isandstitch 
        class=title>并线辅助：</TD></TR>
        <TR id=info_9>
          <TH 
          style="PADDING-BOTTOM: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 105px; PADDING-TOP: 0px" 
          scope=col><B class=t0709_ba2 
onclick=showOrHideMenu(9)></B>外部配置</TH></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=9_m_iswindow class=title>天窗：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=9_m_isarwindow 
        class=title>全景天窗：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=9_m_isspround 
        class=title>运动版包围：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=9_m_isaluhub 
        class=title>铝合金轮毂：</TD></TR>
        <TR id=info_10>
          <TH 
          style="PADDING-BOTTOM: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 105px; PADDING-TOP: 0px" 
          scope=col><B class=t0709_ba2 
        onclick=showOrHideMenu(10)></B>内部配置</TH></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=10_m_isleasw 
        class=title>真皮方向盘：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=10_m_isswud 
        class=title>方向盘上下调节：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=10_m_isswfb 
        class=title>方向盘前后调节：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=10_m_ismultisw 
          class=title>多功能方向盘：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=10_m_isswshift 
        class=title>方向盘换挡：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=10_m_isascd class=title>定速巡航：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=10_m_isassibc 
        class=title>倒车雷达：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=10_m_isparkvideo 
          class=title>倒车视频影像：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=10_m_ispark 
        class=title>自动泊车入位：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=10_m_ishud 
        class=title>HUD抬头数字显示：</TD></TR>
        <TR id=info_11>
          <TH 
          style="PADDING-BOTTOM: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 105px; PADDING-TOP: 0px" 
          scope=col><B class=t0709_ba2 
        onclick=showOrHideMenu(11)></B>座椅配置</TH></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=11_m_isleaseat 
        class=title>真皮座椅：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=11_m_isseatadj 
          class=title>座椅高低调节：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=11_m_iswaistadj 
          class=title>腰部支撑调节：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=11_m_isfseatadj 
          class=title>座椅电动调节：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=11_m_iseseatmem 
        class=title>座椅记忆：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=11_m_isseathot 
        class=title>座椅加热：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=11_m_isseatknead 
            class=title>座椅按摩/通风：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=11_m_isbseatlay 
            class=title>后排座椅整体放倒：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=11_m_isbseatplay 
            class=title>后排座椅按比例放倒：</TD></TR>
        <TR id=info_12>
          <TH 
          style="PADDING-BOTTOM: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 105px; PADDING-TOP: 0px" 
          scope=col><B class=t0709_ba2 
        onclick=showOrHideMenu(12)></B>多媒体配置</TH></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=12_m_isgps 
        class=title>GPS导航系统：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=12_m_isbluetooth 
            class=title>蓝牙/车载电话：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=12_m_istv class=title>车载电视：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=12_m_iscclcd 
        class=title>中控台彩色大屏：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=12_m_isblcd 
class=title>后排液晶屏：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=12_m_ismp3 class=title>MP3支持：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=12_m_iscd class=title>是否有CD：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=12_m_cdnum class=title>CD碟数：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=12_m_isdvd 
class=title>是否有DVD：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=12_m_dvdnum 
class=title>DVD碟数：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=12_m_is2audio 
            class=title>2-3喇叭扬声器系统：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=12_m_is4audio 
            class=title>4-5喇叭扬声器系统：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=12_m_is6audio 
            class=title>6-7喇叭扬声器系统：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=12_m_is8audio 
            class=title>8喇叭以上扬声器系统：</TD></TR>
        <TR id=info_13>
          <TH 
          style="PADDING-BOTTOM: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 105px; PADDING-TOP: 0px" 
          scope=col><B class=t0709_ba2 
        onclick=showOrHideMenu(13)></B>灯光配置</TH></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=13_m_isxelamp 
        class=title>氙气大灯：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=13_m_isautohlamp 
          class=title>自动头灯：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=13_m_isturnhlamp 
          class=title>随动转向大灯：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=13_m_ishfoglamp 
        class=title>前雾灯：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=13_m_isbfoglamp 
        class=title>后雾灯：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=13_m_islampheiadj 
            class=title>大灯高度可调：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=13_m_islampclset 
          class=title>大灯清洗装置：</TD></TR>
        <TR id=info_14>
          <TH 
          style="PADDING-BOTTOM: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 105px; PADDING-TOP: 0px" 
          scope=col><B class=t0709_ba2 
        onclick=showOrHideMenu(14)></B>玻璃/后视镜</TH></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=14_m_isfewindow 
          class=title>前电动车窗：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=14_m_isbewindow 
          class=title>后电动车窗：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=14_m_isgnhand 
        class=title>防夹手功能：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=14_m_ispreventionuv 
            class=title>防紫外线/隔热玻璃：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=14_m_isermirror 
          class=title>电动后视镜：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=14_m_ishotrmirror 
          class=title>后视镜加热：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=14_m_ismemorymirror 
            class=title>后视镜记忆：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=14_m_iseprmirror 
            class=title>后视镜电动折叠：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=14_m_isrmirrorge 
          class=title>后视镜防眩目：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=14_m_isbsvisor 
          class=title>后风挡遮阳帘：</TD></TR><!--



	<tr><td class="title" style="text-align:right;" id="14_m_ishbsvisor">手动后遮阳帘：</td></tr>



	<tr><td class="title" style="text-align:right;" id="14_m_isebsvisor">电动后遮阳帘：</td></tr>



-->
        <TR>
          <TD style="TEXT-ALIGN: right" id=14_m_isbssvisor 
          class=title>后排侧遮阳帘：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=14_m_issvisordr 
          class=title>遮阳板化妆镜：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=14_m_isinswiper 
        class=title>感应雨刷：</TD></TR>
        <TR id=info_15>
          <TH 
          style="PADDING-BOTTOM: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 105px; PADDING-TOP: 0px" 
          scope=col><B class=t0709_ba2 
        onclick=showOrHideMenu(15)></B>空调/冰箱</TH></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=15_m_isairc class=title>空调：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=15_m_isbsairo 
        class=title>后排出风口：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=15_m_istempdct 
          class=title>温度分区控制：</TD></TR>
        <TR>
          <TD style="TEXT-ALIGN: right" id=15_m_iscaricebox 
          class=title>车载冰箱：</TD></TR></TBODY></TABLE></TD>
    <TD vAlign=top>
      <TABLE style="BORDER-LEFT-WIDTH: 0px" id=Table1 class=t1125_se_tab 
      border=0 cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
        <TR>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a6l_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a6l_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a6l_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a6l_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a6l_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a6l_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a6l_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a6l_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a6l_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a6l_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a6l_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a6l_files/t1125arr_e.gif" 
            height=1></TH></TR>
        <TR id=base_1>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8687 scope=col><B href="http://newcar.xcar.com.cn/m8687/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱基本版 </A><I id=base_1_img_8687></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8688 scope=col><B href="http://newcar.xcar.com.cn/m8688/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱标准版 </A><I id=base_1_img_8688></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8689 scope=col><B href="http://newcar.xcar.com.cn/m8689/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱标准版 </A><I 
            id=base_1_img_8689></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8690 scope=col><B href="http://newcar.xcar.com.cn/m8690/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱舒适版 </A><I 
            id=base_1_img_8690></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8691 scope=col><B href="http://newcar.xcar.com.cn/m8691/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱技术版 </A><I 
            id=base_1_img_8691></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8692 scope=col><B href="http://newcar.xcar.com.cn/m8692/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱舒适版 </A><I 
            id=base_1_img_8692></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8693 scope=col><B href="http://newcar.xcar.com.cn/m8693/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱豪华版 </A><I 
            id=base_1_img_8693></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8694 scope=col><B href="http://newcar.xcar.com.cn/m8694/" 
            target=_blank>2011款奥迪A6L 2.7TDI CVT两驱舒适版 </A><I 
            id=base_1_img_8694></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8695 scope=col><B href="http://newcar.xcar.com.cn/m8695/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱舒适版 </A><I 
            id=base_1_img_8695></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8696 scope=col><B href="http://newcar.xcar.com.cn/m8696/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱豪华版 </A><I 
            id=base_1_img_8696></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8697 scope=col><B href="http://newcar.xcar.com.cn/m8697/" 
            target=_blank>2011款奥迪A6L 2.8FSI 自动四驱豪华版 </A><I 
            id=base_1_img_8697></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8698 scope=col><B href="http://newcar.xcar.com.cn/m8698/" 
            target=_blank>2011款奥迪A6L 3.0TFSI 自动四驱豪华版 </A><I 
            id=base_1_img_8698></I> 
          </TH></TR>
        <TR class=disc>
          <TD id=min_price_8687>35.50万</TD>
          <TD id=min_price_8688>37.75万</TD>
          <TD id=min_price_8689>38.99万</TD>
          <TD id=min_price_8690>41.52万</TD>
          <TD id=min_price_8691>44.10万</TD>
          <TD id=min_price_8692>47.58万</TD>
          <TD id=min_price_8693>54.20万</TD>
          <TD id=min_price_8694>48.88万</TD>
          <TD id=min_price_8695>53.77万</TD>
          <TD id=min_price_8696>62.37万</TD>
          <TD id=min_price_8697>65.30万</TD>
          <TD id=min_price_8698>69.99万</TD></TR>
        <TR class=hidd>
          <TD id=bname_8687><B title=一汽奥迪 
            href="http://newcar.xcar.com.cn/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_8688><B title=一汽奥迪 
            href="http://newcar.xcar.com.cn/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_8689><B title=一汽奥迪 
            href="http://newcar.xcar.com.cn/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_8690><B title=一汽奥迪 
            href="http://newcar.xcar.com.cn/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_8691><B title=一汽奥迪 
            href="http://newcar.xcar.com.cn/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_8692><B title=一汽奥迪 
            href="http://newcar.xcar.com.cn/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_8693><B title=一汽奥迪 
            href="http://newcar.xcar.com.cn/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_8694><B title=一汽奥迪 
            href="http://newcar.xcar.com.cn/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_8695><B title=一汽奥迪 
            href="http://newcar.xcar.com.cn/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_8696><B title=一汽奥迪 
            href="http://newcar.xcar.com.cn/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_8697><B title=一汽奥迪 
            href="http://newcar.xcar.com.cn/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_8698><B title=一汽奥迪 
            href="http://newcar.xcar.com.cn/price/b5/" 
        target=_blank>一汽奥迪</A></TD></TR>
        <TR class=hidd>
          <TD id=type2_8687><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-4-0-0-0-0-0/">中大型车</A></TD>
          <TD id=type2_8688><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-4-0-0-0-0-0/">中大型车</A></TD>
          <TD id=type2_8689><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-4-0-0-0-0-0/">中大型车</A></TD>
          <TD id=type2_8690><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-4-0-0-0-0-0/">中大型车</A></TD>
          <TD id=type2_8691><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-4-0-0-0-0-0/">中大型车</A></TD>
          <TD id=type2_8692><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-4-0-0-0-0-0/">中大型车</A></TD>
          <TD id=type2_8693><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-4-0-0-0-0-0/">中大型车</A></TD>
          <TD id=type2_8694><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-4-0-0-0-0-0/">中大型车</A></TD>
          <TD id=type2_8695><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-4-0-0-0-0-0/">中大型车</A></TD>
          <TD id=type2_8696><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-4-0-0-0-0-0/">中大型车</A></TD>
          <TD id=type2_8697><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-4-0-0-0-0-0/">中大型车</A></TD>
          <TD id=type2_8698><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-4-0-0-0-0-0/">中大型车</A></TD></TR>
        <TR class=disc>
          <TD id=m_disl_8687>2.0L 125kW </TD>
          <TD id=m_disl_8688>2.0L 125kW </TD>
          <TD id=m_disl_8689>2.0L 125kW </TD>
          <TD id=m_disl_8690>2.0L 125kW </TD>
          <TD id=m_disl_8691>2.4L 130kW </TD>
          <TD id=m_disl_8692>2.4L 130kW </TD>
          <TD id=m_disl_8693>2.4L 130kW </TD>
          <TD id=m_disl_8694>2.7L 140kW </TD>
          <TD id=m_disl_8695>2.8L 162kW </TD>
          <TD id=m_disl_8696>2.8L 162kW </TD>
          <TD id=m_disl_8697>2.8L 162kW </TD>
          <TD id=m_disl_8698>3.0L 213kW </TD></TR>
        <TR class=disc>
          <TD id=m_transtype_8687>6挡手动</TD>
          <TD id=m_transtype_8688>6挡手动</TD>
          <TD id=m_transtype_8689>7挡无级变速器</TD>
          <TD id=m_transtype_8690>7挡无级变速器</TD>
          <TD id=m_transtype_8691>7挡无级变速器</TD>
          <TD id=m_transtype_8692>7挡无级变速器</TD>
          <TD id=m_transtype_8693>7挡无级变速器</TD>
          <TD id=m_transtype_8694>7挡无级变速器</TD>
          <TD id=m_transtype_8695>7挡无级变速器</TD>
          <TD id=m_transtype_8696>7挡无级变速器</TD>
          <TD id=m_transtype_8697>6挡自动</TD>
          <TD id=m_transtype_8698>6挡自动</TD></TR>
        <TR class=hidd>
          <TD id=m_length_width_height_8687><!---->5035×1855×1485 <!----></TD>
          <TD id=m_length_width_height_8688><!---->5035×1855×1485 <!----></TD>
          <TD id=m_length_width_height_8689><!---->5035×1855×1485 <!----></TD>
          <TD id=m_length_width_height_8690><!---->5035×1855×1485 <!----></TD>
          <TD id=m_length_width_height_8691><!---->5035×1855×1485 <!----></TD>
          <TD id=m_length_width_height_8692><!---->5035×1855×1485 <!----></TD>
          <TD id=m_length_width_height_8693><!---->5035×1855×1485 <!----></TD>
          <TD id=m_length_width_height_8694><!---->5035×1855×1485 <!----></TD>
          <TD id=m_length_width_height_8695><!---->5035×1855×1485 <!----></TD>
          <TD id=m_length_width_height_8696><!---->5035×1855×1485 <!----></TD>
          <TD id=m_length_width_height_8697><!---->5035×1855×1485 <!----></TD>
          <TD id=m_length_width_height_8698><!---->5035×1855×1485 
<!----></TD></TR>
        <TR class=hidd>
          <TD id=m_frame_8687>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8688>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8689>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8690>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8691>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8692>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8693>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8694>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8695>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8696>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8697>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8698>4门 5座 三厢轿车</TD></TR>
        <TR class=hidd>
          <TD id=syear_8687>2011</TD>
          <TD id=syear_8688>2011</TD>
          <TD id=syear_8689>2011</TD>
          <TD id=syear_8690>2011</TD>
          <TD id=syear_8691>2011</TD>
          <TD id=syear_8692>2011</TD>
          <TD id=syear_8693>2011</TD>
          <TD id=syear_8694>2011</TD>
          <TD id=syear_8695>2011</TD>
          <TD id=syear_8696>2011</TD>
          <TD id=syear_8697>2011</TD>
          <TD id=syear_8698>2011</TD></TR>
        <TR class=disc>
          <TD id=m_mspeed_8687>224</TD>
          <TD id=m_mspeed_8688>224</TD>
          <TD id=m_mspeed_8689>220</TD>
          <TD id=m_mspeed_8690>220</TD>
          <TD id=m_mspeed_8691>222</TD>
          <TD id=m_mspeed_8692>222</TD>
          <TD id=m_mspeed_8693>222</TD>
          <TD id=m_mspeed_8694>222</TD>
          <TD id=m_mspeed_8695>236</TD>
          <TD id=m_mspeed_8696>236</TD>
          <TD id=m_mspeed_8697>236</TD>
          <TD id=m_mspeed_8698>251</TD></TR>
        <TR class=disc>
          <TD id=m_hatime_8687>8.5</TD>
          <TD id=m_hatime_8688>8.5</TD>
          <TD id=m_hatime_8689>8.8</TD>
          <TD id=m_hatime_8690>8.8</TD>
          <TD id=m_hatime_8691>9.3</TD>
          <TD id=m_hatime_8692>9.3</TD>
          <TD id=m_hatime_8693>9.3</TD>
          <TD id=m_hatime_8694>8.8</TD>
          <TD id=m_hatime_8695>7.9</TD>
          <TD id=m_hatime_8696>7.9</TD>
          <TD id=m_hatime_8697>8.6</TD>
          <TD id=m_hatime_8698>6.6</TD></TR>
        <TR class=hidd>
          <TD id=m_comfuel_8687>- </TD>
          <TD id=m_comfuel_8688>- </TD>
          <TD id=m_comfuel_8689>- </TD>
          <TD id=m_comfuel_8690>- </TD>
          <TD id=m_comfuel_8691>- </TD>
          <TD id=m_comfuel_8692>- </TD>
          <TD id=m_comfuel_8693>- </TD>
          <TD id=m_comfuel_8694>- </TD>
          <TD id=m_comfuel_8695>- </TD>
          <TD id=m_comfuel_8696>- </TD>
          <TD id=m_comfuel_8697>- </TD>
          <TD id=m_comfuel_8698>- </TD></TR>
        <TR class=hidd>
          <TD id=m_lkmfuel_8687>- </TD>
          <TD id=m_lkmfuel_8688>- </TD>
          <TD id=m_lkmfuel_8689>- </TD>
          <TD id=m_lkmfuel_8690>- </TD>
          <TD id=m_lkmfuel_8691>- </TD>
          <TD id=m_lkmfuel_8692>- </TD>
          <TD id=m_lkmfuel_8693>- </TD>
          <TD id=m_lkmfuel_8694>- </TD>
          <TD id=m_lkmfuel_8695>- </TD>
          <TD id=m_lkmfuel_8696>- </TD>
          <TD id=m_lkmfuel_8697>- </TD>
          <TD id=m_lkmfuel_8698>- </TD></TR>
        <TR class=hidd>
          <TD id=m_hkmfuel_8687>- </TD>
          <TD id=m_hkmfuel_8688>- </TD>
          <TD id=m_hkmfuel_8689>- </TD>
          <TD id=m_hkmfuel_8690>- </TD>
          <TD id=m_hkmfuel_8691>- </TD>
          <TD id=m_hkmfuel_8692>- </TD>
          <TD id=m_hkmfuel_8693>- </TD>
          <TD id=m_hkmfuel_8694>- </TD>
          <TD id=m_hkmfuel_8695>- </TD>
          <TD id=m_hkmfuel_8696>- </TD>
          <TD id=m_hkmfuel_8697>- </TD>
          <TD id=m_hkmfuel_8698>- </TD></TR>
        <TR class=hidd>
          <TD id=m_ypolicy_8687>2年 </TD>
          <TD id=m_ypolicy_8688>2年 </TD>
          <TD id=m_ypolicy_8689>2年 </TD>
          <TD id=m_ypolicy_8690>2年 </TD>
          <TD id=m_ypolicy_8691>2年 </TD>
          <TD id=m_ypolicy_8692>2年 </TD>
          <TD id=m_ypolicy_8693>2年 </TD>
          <TD id=m_ypolicy_8694>2年 </TD>
          <TD id=m_ypolicy_8695>2年 </TD>
          <TD id=m_ypolicy_8696>2年 </TD>
          <TD id=m_ypolicy_8697>2年 </TD>
          <TD id=m_ypolicy_8698>2年 </TD></TR>
        <TR id=base_2>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8687 scope=col><B href="http://newcar.xcar.com.cn/m8687/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱基本版</A> <I id=base_2_img_8687></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8688 scope=col><B href="http://newcar.xcar.com.cn/m8688/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱标准版</A> <I id=base_2_img_8688></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8689 scope=col><B href="http://newcar.xcar.com.cn/m8689/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱标准版</A> <I 
            id=base_2_img_8689></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8690 scope=col><B href="http://newcar.xcar.com.cn/m8690/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱舒适版</A> <I 
            id=base_2_img_8690></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8691 scope=col><B href="http://newcar.xcar.com.cn/m8691/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱技术版</A> <I 
            id=base_2_img_8691></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8692 scope=col><B href="http://newcar.xcar.com.cn/m8692/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱舒适版</A> <I 
            id=base_2_img_8692></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8693 scope=col><B href="http://newcar.xcar.com.cn/m8693/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱豪华版</A> <I 
            id=base_2_img_8693></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8694 scope=col><B href="http://newcar.xcar.com.cn/m8694/" 
            target=_blank>2011款奥迪A6L 2.7TDI CVT两驱舒适版</A> <I 
            id=base_2_img_8694></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8695 scope=col><B href="http://newcar.xcar.com.cn/m8695/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱舒适版</A> <I 
            id=base_2_img_8695></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8696 scope=col><B href="http://newcar.xcar.com.cn/m8696/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱豪华版</A> <I 
            id=base_2_img_8696></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8697 scope=col><B href="http://newcar.xcar.com.cn/m8697/" 
            target=_blank>2011款奥迪A6L 2.8FSI 自动四驱豪华版</A> <I 
            id=base_2_img_8697></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8698 scope=col><B href="http://newcar.xcar.com.cn/m8698/" 
            target=_blank>2011款奥迪A6L 3.0TFSI 自动四驱豪华版</A> <I 
            id=base_2_img_8698></I> 
          </TH></TR>
        <TR class=hidd>
          <TD id=m_length_8687>5035</TD>
          <TD id=m_length_8688>5035</TD>
          <TD id=m_length_8689>5035</TD>
          <TD id=m_length_8690>5035</TD>
          <TD id=m_length_8691>5035</TD>
          <TD id=m_length_8692>5035</TD>
          <TD id=m_length_8693>5035</TD>
          <TD id=m_length_8694>5035</TD>
          <TD id=m_length_8695>5035</TD>
          <TD id=m_length_8696>5035</TD>
          <TD id=m_length_8697>5035</TD>
          <TD id=m_length_8698>5035</TD></TR>
        <TR class=hidd>
          <TD id=m_width_8687>1855</TD>
          <TD id=m_width_8688>1855</TD>
          <TD id=m_width_8689>1855</TD>
          <TD id=m_width_8690>1855</TD>
          <TD id=m_width_8691>1855</TD>
          <TD id=m_width_8692>1855</TD>
          <TD id=m_width_8693>1855</TD>
          <TD id=m_width_8694>1855</TD>
          <TD id=m_width_8695>1855</TD>
          <TD id=m_width_8696>1855</TD>
          <TD id=m_width_8697>1855</TD>
          <TD id=m_width_8698>1855</TD></TR>
        <TR class=hidd>
          <TD id=m_height_8687>1485</TD>
          <TD id=m_height_8688>1485</TD>
          <TD id=m_height_8689>1485</TD>
          <TD id=m_height_8690>1485</TD>
          <TD id=m_height_8691>1485</TD>
          <TD id=m_height_8692>1485</TD>
          <TD id=m_height_8693>1485</TD>
          <TD id=m_height_8694>1485</TD>
          <TD id=m_height_8695>1485</TD>
          <TD id=m_height_8696>1485</TD>
          <TD id=m_height_8697>1485</TD>
          <TD id=m_height_8698>1485</TD></TR>
        <TR class=hidd>
          <TD id=m_wheelbase_8687>2945</TD>
          <TD id=m_wheelbase_8688>2945</TD>
          <TD id=m_wheelbase_8689>2945</TD>
          <TD id=m_wheelbase_8690>2945</TD>
          <TD id=m_wheelbase_8691>2945</TD>
          <TD id=m_wheelbase_8692>2945</TD>
          <TD id=m_wheelbase_8693>2945</TD>
          <TD id=m_wheelbase_8694>2945</TD>
          <TD id=m_wheelbase_8695>2945</TD>
          <TD id=m_wheelbase_8696>2945</TD>
          <TD id=m_wheelbase_8697>2945</TD>
          <TD id=m_wheelbase_8698>2945</TD></TR>
        <TR class=disc>
          <TD id=m_weight_8687>1715</TD>
          <TD id=m_weight_8688>1715</TD>
          <TD id=m_weight_8689>1750</TD>
          <TD id=m_weight_8690>1750</TD>
          <TD id=m_weight_8691>1755</TD>
          <TD id=m_weight_8692>1755</TD>
          <TD id=m_weight_8693>1755</TD>
          <TD id=m_weight_8694>1870</TD>
          <TD id=m_weight_8695>1765</TD>
          <TD id=m_weight_8696>1765</TD>
          <TD id=m_weight_8697>1860</TD>
          <TD id=m_weight_8698>1900</TD></TR>
        <TR class=hidd>
          <TD id=m_clearance_8687>142</TD>
          <TD id=m_clearance_8688>142</TD>
          <TD id=m_clearance_8689>142</TD>
          <TD id=m_clearance_8690>142</TD>
          <TD id=m_clearance_8691>142</TD>
          <TD id=m_clearance_8692>142</TD>
          <TD id=m_clearance_8693>142</TD>
          <TD id=m_clearance_8694>142</TD>
          <TD id=m_clearance_8695>142</TD>
          <TD id=m_clearance_8696>142</TD>
          <TD id=m_clearance_8697>142</TD>
          <TD id=m_clearance_8698>142</TD></TR>
        <TR class=hidd>
          <TD id=m_frame2_8687>三厢轿车</TD>
          <TD id=m_frame2_8688>三厢轿车</TD>
          <TD id=m_frame2_8689>三厢轿车</TD>
          <TD id=m_frame2_8690>三厢轿车</TD>
          <TD id=m_frame2_8691>三厢轿车</TD>
          <TD id=m_frame2_8692>三厢轿车</TD>
          <TD id=m_frame2_8693>三厢轿车</TD>
          <TD id=m_frame2_8694>三厢轿车</TD>
          <TD id=m_frame2_8695>三厢轿车</TD>
          <TD id=m_frame2_8696>三厢轿车</TD>
          <TD id=m_frame2_8697>三厢轿车</TD>
          <TD id=m_frame2_8698>三厢轿车</TD></TR>
        <TR class=hidd>
          <TD id=m_door_8687>4</TD>
          <TD id=m_door_8688>4</TD>
          <TD id=m_door_8689>4</TD>
          <TD id=m_door_8690>4</TD>
          <TD id=m_door_8691>4</TD>
          <TD id=m_door_8692>4</TD>
          <TD id=m_door_8693>4</TD>
          <TD id=m_door_8694>4</TD>
          <TD id=m_door_8695>4</TD>
          <TD id=m_door_8696>4</TD>
          <TD id=m_door_8697>4</TD>
          <TD id=m_door_8698>4</TD></TR>
        <TR class=hidd>
          <TD id=m_seat_8687>5</TD>
          <TD id=m_seat_8688>5</TD>
          <TD id=m_seat_8689>5</TD>
          <TD id=m_seat_8690>5</TD>
          <TD id=m_seat_8691>5</TD>
          <TD id=m_seat_8692>5</TD>
          <TD id=m_seat_8693>5</TD>
          <TD id=m_seat_8694>5</TD>
          <TD id=m_seat_8695>5</TD>
          <TD id=m_seat_8696>5</TD>
          <TD id=m_seat_8697>5</TD>
          <TD id=m_seat_8698>5</TD></TR>
        <TR class=hidd>
          <TD id=m_oilbox_8687>80.00</TD>
          <TD id=m_oilbox_8688>80.00</TD>
          <TD id=m_oilbox_8689>80.00</TD>
          <TD id=m_oilbox_8690>80.00</TD>
          <TD id=m_oilbox_8691>80.00</TD>
          <TD id=m_oilbox_8692>80.00</TD>
          <TD id=m_oilbox_8693>80.00</TD>
          <TD id=m_oilbox_8694>80.00</TD>
          <TD id=m_oilbox_8695>80.00</TD>
          <TD id=m_oilbox_8696>80.00</TD>
          <TD id=m_oilbox_8697>80.00</TD>
          <TD id=m_oilbox_8698>80.00</TD></TR>
        <TR class=hidd>
          <TD id=m_trunk_8687>501</TD>
          <TD id=m_trunk_8688>501</TD>
          <TD id=m_trunk_8689>501</TD>
          <TD id=m_trunk_8690>501</TD>
          <TD id=m_trunk_8691>501</TD>
          <TD id=m_trunk_8692>501</TD>
          <TD id=m_trunk_8693>501</TD>
          <TD id=m_trunk_8694>501</TD>
          <TD id=m_trunk_8695>501</TD>
          <TD id=m_trunk_8696>501</TD>
          <TD id=m_trunk_8697>501</TD>
          <TD id=m_trunk_8698>501</TD></TR>
        <TR class=hidd>
          <TD id=m_mtrunk_8687>501</TD>
          <TD id=m_mtrunk_8688>501</TD>
          <TD id=m_mtrunk_8689>501</TD>
          <TD id=m_mtrunk_8690>501</TD>
          <TD id=m_mtrunk_8691>501</TD>
          <TD id=m_mtrunk_8692>501</TD>
          <TD id=m_mtrunk_8693>501</TD>
          <TD id=m_mtrunk_8694>501</TD>
          <TD id=m_mtrunk_8695>501</TD>
          <TD id=m_mtrunk_8696>501</TD>
          <TD id=m_mtrunk_8697>501</TD>
          <TD id=m_mtrunk_8698>501</TD></TR>
        <TR id=base_3>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8687 scope=col><B href="http://newcar.xcar.com.cn/m8687/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱基本版 </A><I id=base_3_img_8687></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8688 scope=col><B href="http://newcar.xcar.com.cn/m8688/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱标准版 </A><I id=base_3_img_8688></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8689 scope=col><B href="http://newcar.xcar.com.cn/m8689/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱标准版 </A><I 
            id=base_3_img_8689></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8690 scope=col><B href="http://newcar.xcar.com.cn/m8690/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱舒适版 </A><I 
            id=base_3_img_8690></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8691 scope=col><B href="http://newcar.xcar.com.cn/m8691/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱技术版 </A><I 
            id=base_3_img_8691></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8692 scope=col><B href="http://newcar.xcar.com.cn/m8692/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱舒适版 </A><I 
            id=base_3_img_8692></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8693 scope=col><B href="http://newcar.xcar.com.cn/m8693/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱豪华版 </A><I 
            id=base_3_img_8693></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8694 scope=col><B href="http://newcar.xcar.com.cn/m8694/" 
            target=_blank>2011款奥迪A6L 2.7TDI CVT两驱舒适版 </A><I 
            id=base_3_img_8694></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8695 scope=col><B href="http://newcar.xcar.com.cn/m8695/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱舒适版 </A><I 
            id=base_3_img_8695></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8696 scope=col><B href="http://newcar.xcar.com.cn/m8696/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱豪华版 </A><I 
            id=base_3_img_8696></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8697 scope=col><B href="http://newcar.xcar.com.cn/m8697/" 
            target=_blank>2011款奥迪A6L 2.8FSI 自动四驱豪华版 </A><I 
            id=base_3_img_8697></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8698 scope=col><B href="http://newcar.xcar.com.cn/m8698/" 
            target=_blank>2011款奥迪A6L 3.0TFSI 自动四驱豪华版 </A><I 
            id=base_3_img_8698></I> 
          </TH></TR>
        <TR class=disc>
          <TD id=m_disl2_8687>2.0</TD>
          <TD id=m_disl2_8688>2.0</TD>
          <TD id=m_disl2_8689>2.0</TD>
          <TD id=m_disl2_8690>2.0</TD>
          <TD id=m_disl2_8691>2.4</TD>
          <TD id=m_disl2_8692>2.4</TD>
          <TD id=m_disl2_8693>2.4</TD>
          <TD id=m_disl2_8694>2.7</TD>
          <TD id=m_disl2_8695>2.8</TD>
          <TD id=m_disl2_8696>2.8</TD>
          <TD id=m_disl2_8697>2.8</TD>
          <TD id=m_disl2_8698>3.0</TD></TR>
        <TR class=disc>
          <TD id=m_working_8687>涡轮增压</TD>
          <TD id=m_working_8688>涡轮增压</TD>
          <TD id=m_working_8689>涡轮增压</TD>
          <TD id=m_working_8690>涡轮增压</TD>
          <TD id=m_working_8691>自然吸气</TD>
          <TD id=m_working_8692>自然吸气</TD>
          <TD id=m_working_8693>自然吸气</TD>
          <TD id=m_working_8694>涡轮增压</TD>
          <TD id=m_working_8695>自然吸气</TD>
          <TD id=m_working_8696>自然吸气</TD>
          <TD id=m_working_8697>自然吸气</TD>
          <TD id=m_working_8698>机械增压</TD></TR>
        <TR class=disc>
          <TD id=m_mpower_8687>125</TD>
          <TD id=m_mpower_8688>125</TD>
          <TD id=m_mpower_8689>125</TD>
          <TD id=m_mpower_8690>125</TD>
          <TD id=m_mpower_8691>130</TD>
          <TD id=m_mpower_8692>130</TD>
          <TD id=m_mpower_8693>130</TD>
          <TD id=m_mpower_8694>140</TD>
          <TD id=m_mpower_8695>162</TD>
          <TD id=m_mpower_8696>162</TD>
          <TD id=m_mpower_8697>162</TD>
          <TD id=m_mpower_8698>213</TD></TR>
        <TR class=disc>
          <TD id=m_mpowersp_8687>4300-6000</TD>
          <TD id=m_mpowersp_8688>4300-6000</TD>
          <TD id=m_mpowersp_8689>4300-6000</TD>
          <TD id=m_mpowersp_8690>4300-6000</TD>
          <TD id=m_mpowersp_8691>6000</TD>
          <TD id=m_mpowersp_8692>6000</TD>
          <TD id=m_mpowersp_8693>6000</TD>
          <TD id=m_mpowersp_8694>3500-4400</TD>
          <TD id=m_mpowersp_8695>5750-6800</TD>
          <TD id=m_mpowersp_8696>5750-6800</TD>
          <TD id=m_mpowersp_8697>5750-6800</TD>
          <TD id=m_mpowersp_8698>4850-6800</TD></TR>
        <TR class=disc>
          <TD id=m_mtorque_8687>280</TD>
          <TD id=m_mtorque_8688>280</TD>
          <TD id=m_mtorque_8689>280</TD>
          <TD id=m_mtorque_8690>280</TD>
          <TD id=m_mtorque_8691>230</TD>
          <TD id=m_mtorque_8692>230</TD>
          <TD id=m_mtorque_8693>230</TD>
          <TD id=m_mtorque_8694>380</TD>
          <TD id=m_mtorque_8695>280</TD>
          <TD id=m_mtorque_8696>280</TD>
          <TD id=m_mtorque_8697>280</TD>
          <TD id=m_mtorque_8698>420</TD></TR>
        <TR class=disc>
          <TD id=m_mtorsp_8687>1800-4200</TD>
          <TD id=m_mtorsp_8688>1800-4200</TD>
          <TD id=m_mtorsp_8689>1800-4200</TD>
          <TD id=m_mtorsp_8690>1800-4200</TD>
          <TD id=m_mtorsp_8691>3000-5000</TD>
          <TD id=m_mtorsp_8692>3000-5000</TD>
          <TD id=m_mtorsp_8693>3000-5000</TD>
          <TD id=m_mtorsp_8694>1400-3500</TD>
          <TD id=m_mtorsp_8695>3000-5000</TD>
          <TD id=m_mtorsp_8696>3000-5000</TD>
          <TD id=m_mtorsp_8697>3000-5000</TD>
          <TD id=m_mtorsp_8698>2500-4850</TD></TR>
        <TR class=disc>
          <TD id=m_fuel_8687>汽油</TD>
          <TD id=m_fuel_8688>汽油</TD>
          <TD id=m_fuel_8689>汽油</TD>
          <TD id=m_fuel_8690>汽油</TD>
          <TD id=m_fuel_8691>汽油</TD>
          <TD id=m_fuel_8692>汽油</TD>
          <TD id=m_fuel_8693>汽油</TD>
          <TD id=m_fuel_8694>柴油</TD>
          <TD id=m_fuel_8695>汽油</TD>
          <TD id=m_fuel_8696>汽油</TD>
          <TD id=m_fuel_8697>汽油</TD>
          <TD id=m_fuel_8698>汽油</TD></TR>
        <TR class=disc>
          <TD id=m_fuelno_8687>97</TD>
          <TD id=m_fuelno_8688>97</TD>
          <TD id=m_fuelno_8689>97</TD>
          <TD id=m_fuelno_8690>97</TD>
          <TD id=m_fuelno_8691>97</TD>
          <TD id=m_fuelno_8692>97</TD>
          <TD id=m_fuelno_8693>97</TD>
          <TD id=m_fuelno_8694>其他 </TD>
          <TD id=m_fuelno_8695>97</TD>
          <TD id=m_fuelno_8696>97</TD>
          <TD id=m_fuelno_8697>97</TD>
          <TD id=m_fuelno_8698>97</TD></TR>
        <TR class=hidd>
          <TD id=m_envstand_8687>欧IV </TD>
          <TD id=m_envstand_8688>欧IV </TD>
          <TD id=m_envstand_8689>欧IV </TD>
          <TD id=m_envstand_8690>欧IV </TD>
          <TD id=m_envstand_8691>欧IV </TD>
          <TD id=m_envstand_8692>欧IV </TD>
          <TD id=m_envstand_8693>欧IV </TD>
          <TD id=m_envstand_8694>欧IV </TD>
          <TD id=m_envstand_8695>欧IV </TD>
          <TD id=m_envstand_8696>欧IV </TD>
          <TD id=m_envstand_8697>欧IV </TD>
          <TD id=m_envstand_8698>欧IV </TD></TR>
        <TR id=base_4>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8687 scope=col><B href="http://newcar.xcar.com.cn/m8687/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱基本版 </A><I id=base_4_img_8687></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8688 scope=col><B href="http://newcar.xcar.com.cn/m8688/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱标准版 </A><I id=base_4_img_8688></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8689 scope=col><B href="http://newcar.xcar.com.cn/m8689/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱标准版 </A><I 
            id=base_4_img_8689></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8690 scope=col><B href="http://newcar.xcar.com.cn/m8690/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱舒适版 </A><I 
            id=base_4_img_8690></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8691 scope=col><B href="http://newcar.xcar.com.cn/m8691/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱技术版 </A><I 
            id=base_4_img_8691></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8692 scope=col><B href="http://newcar.xcar.com.cn/m8692/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱舒适版 </A><I 
            id=base_4_img_8692></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8693 scope=col><B href="http://newcar.xcar.com.cn/m8693/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱豪华版 </A><I 
            id=base_4_img_8693></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8694 scope=col><B href="http://newcar.xcar.com.cn/m8694/" 
            target=_blank>2011款奥迪A6L 2.7TDI CVT两驱舒适版 </A><I 
            id=base_4_img_8694></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8695 scope=col><B href="http://newcar.xcar.com.cn/m8695/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱舒适版 </A><I 
            id=base_4_img_8695></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8696 scope=col><B href="http://newcar.xcar.com.cn/m8696/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱豪华版 </A><I 
            id=base_4_img_8696></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8697 scope=col><B href="http://newcar.xcar.com.cn/m8697/" 
            target=_blank>2011款奥迪A6L 2.8FSI 自动四驱豪华版 </A><I 
            id=base_4_img_8697></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8698 scope=col><B href="http://newcar.xcar.com.cn/m8698/" 
            target=_blank>2011款奥迪A6L 3.0TFSI 自动四驱豪华版 </A><I 
            id=base_4_img_8698></I> 
          </TH></TR>
        <TR class=disc>
          <TD id=m_speed_8687>6</TD>
          <TD id=m_speed_8688>6</TD>
          <TD id=m_speed_8689>7</TD>
          <TD id=m_speed_8690>7</TD>
          <TD id=m_speed_8691>7</TD>
          <TD id=m_speed_8692>7</TD>
          <TD id=m_speed_8693>7</TD>
          <TD id=m_speed_8694>7</TD>
          <TD id=m_speed_8695>7</TD>
          <TD id=m_speed_8696>7</TD>
          <TD id=m_speed_8697>6</TD>
          <TD id=m_speed_8698>6</TD></TR>
        <TR class=disc>
          <TD id=m_transtype2_8687>MT</TD>
          <TD id=m_transtype2_8688>MT</TD>
          <TD id=m_transtype2_8689>CVT</TD>
          <TD id=m_transtype2_8690>CVT</TD>
          <TD id=m_transtype2_8691>CVT</TD>
          <TD id=m_transtype2_8692>CVT</TD>
          <TD id=m_transtype2_8693>CVT</TD>
          <TD id=m_transtype2_8694>CVT</TD>
          <TD id=m_transtype2_8695>CVT</TD>
          <TD id=m_transtype2_8696>CVT</TD>
          <TD id=m_transtype2_8697>AT</TD>
          <TD id=m_transtype2_8698>AT</TD></TR>
        <TR id=base_5>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8687 scope=col><B href="http://newcar.xcar.com.cn/m8687/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱基本版 </A><I id=base_5_img_8687></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8688 scope=col><B href="http://newcar.xcar.com.cn/m8688/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱标准版 </A><I id=base_5_img_8688></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8689 scope=col><B href="http://newcar.xcar.com.cn/m8689/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱标准版 </A><I 
            id=base_5_img_8689></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8690 scope=col><B href="http://newcar.xcar.com.cn/m8690/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱舒适版 </A><I 
            id=base_5_img_8690></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8691 scope=col><B href="http://newcar.xcar.com.cn/m8691/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱技术版 </A><I 
            id=base_5_img_8691></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8692 scope=col><B href="http://newcar.xcar.com.cn/m8692/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱舒适版 </A><I 
            id=base_5_img_8692></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8693 scope=col><B href="http://newcar.xcar.com.cn/m8693/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱豪华版 </A><I 
            id=base_5_img_8693></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8694 scope=col><B href="http://newcar.xcar.com.cn/m8694/" 
            target=_blank>2011款奥迪A6L 2.7TDI CVT两驱舒适版 </A><I 
            id=base_5_img_8694></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8695 scope=col><B href="http://newcar.xcar.com.cn/m8695/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱舒适版 </A><I 
            id=base_5_img_8695></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8696 scope=col><B href="http://newcar.xcar.com.cn/m8696/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱豪华版 </A><I 
            id=base_5_img_8696></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8697 scope=col><B href="http://newcar.xcar.com.cn/m8697/" 
            target=_blank>2011款奥迪A6L 2.8FSI 自动四驱豪华版 </A><I 
            id=base_5_img_8697></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8698 scope=col><B href="http://newcar.xcar.com.cn/m8698/" 
            target=_blank>2011款奥迪A6L 3.0TFSI 自动四驱豪华版 </A><I 
            id=base_5_img_8698></I> 
          </TH></TR>
        <TR class=disc>
          <TD id=m_drivetype_8687>前置前驱</TD>
          <TD id=m_drivetype_8688>前置前驱</TD>
          <TD id=m_drivetype_8689>前置前驱</TD>
          <TD id=m_drivetype_8690>前置前驱</TD>
          <TD id=m_drivetype_8691>前置前驱</TD>
          <TD id=m_drivetype_8692>前置前驱</TD>
          <TD id=m_drivetype_8693>前置前驱</TD>
          <TD id=m_drivetype_8694>前置前驱</TD>
          <TD id=m_drivetype_8695>前置前驱</TD>
          <TD id=m_drivetype_8696>前置前驱</TD>
          <TD id=m_drivetype_8697>前置四驱</TD>
          <TD id=m_drivetype_8698>前置四驱</TD></TR>
        <TR class=hidd height=60>
          <TD id=m_fsustype_text_8687>四连杆式独立悬架</TD>
          <TD id=m_fsustype_text_8688>四连杆式独立悬架</TD>
          <TD id=m_fsustype_text_8689>四连杆式独立悬架</TD>
          <TD id=m_fsustype_text_8690>四连杆式独立悬架</TD>
          <TD id=m_fsustype_text_8691>四连杆式独立悬架</TD>
          <TD id=m_fsustype_text_8692>四连杆式独立悬架</TD>
          <TD id=m_fsustype_text_8693>四连杆式独立悬架</TD>
          <TD id=m_fsustype_text_8694>四连杆式独立悬架</TD>
          <TD id=m_fsustype_text_8695>四连杆式独立悬架</TD>
          <TD id=m_fsustype_text_8696>四连杆式独立悬架</TD>
          <TD id=m_fsustype_text_8697>四连杆式独立悬架</TD>
          <TD id=m_fsustype_text_8698>四连杆式独立悬架</TD></TR>
        <TR class=hidd height=60>
          <TD id=m_bsustype_text_8687>梯形连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8688>梯形连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8689>梯形连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8690>梯形连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8691>梯形连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8692>梯形连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8693>梯形连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8694>梯形连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8695>梯形连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8696>梯形连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8697>梯形连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8698>梯形连杆式独立悬架</TD></TR>
        <TR id=base_6>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8687 scope=col><B href="http://newcar.xcar.com.cn/m8687/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱基本版 </A><I id=base_6_img_8687></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8688 scope=col><B href="http://newcar.xcar.com.cn/m8688/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱标准版 </A><I id=base_6_img_8688></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8689 scope=col><B href="http://newcar.xcar.com.cn/m8689/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱标准版 </A><I 
            id=base_6_img_8689></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8690 scope=col><B href="http://newcar.xcar.com.cn/m8690/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱舒适版 </A><I 
            id=base_6_img_8690></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8691 scope=col><B href="http://newcar.xcar.com.cn/m8691/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱技术版 </A><I 
            id=base_6_img_8691></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8692 scope=col><B href="http://newcar.xcar.com.cn/m8692/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱舒适版 </A><I 
            id=base_6_img_8692></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8693 scope=col><B href="http://newcar.xcar.com.cn/m8693/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱豪华版 </A><I 
            id=base_6_img_8693></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8694 scope=col><B href="http://newcar.xcar.com.cn/m8694/" 
            target=_blank>2011款奥迪A6L 2.7TDI CVT两驱舒适版 </A><I 
            id=base_6_img_8694></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8695 scope=col><B href="http://newcar.xcar.com.cn/m8695/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱舒适版 </A><I 
            id=base_6_img_8695></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8696 scope=col><B href="http://newcar.xcar.com.cn/m8696/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱豪华版 </A><I 
            id=base_6_img_8696></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8697 scope=col><B href="http://newcar.xcar.com.cn/m8697/" 
            target=_blank>2011款奥迪A6L 2.8FSI 自动四驱豪华版 </A><I 
            id=base_6_img_8697></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8698 scope=col><B href="http://newcar.xcar.com.cn/m8698/" 
            target=_blank>2011款奥迪A6L 3.0TFSI 自动四驱豪华版 </A><I 
            id=base_6_img_8698></I> 
          </TH></TR>
        <TR class=hidd>
          <TD id=m_fbraketype_8687>通风盘式</TD>
          <TD id=m_fbraketype_8688>通风盘式</TD>
          <TD id=m_fbraketype_8689>通风盘式</TD>
          <TD id=m_fbraketype_8690>通风盘式</TD>
          <TD id=m_fbraketype_8691>通风盘式</TD>
          <TD id=m_fbraketype_8692>通风盘式</TD>
          <TD id=m_fbraketype_8693>通风盘式</TD>
          <TD id=m_fbraketype_8694>通风盘式</TD>
          <TD id=m_fbraketype_8695>通风盘式</TD>
          <TD id=m_fbraketype_8696>通风盘式</TD>
          <TD id=m_fbraketype_8697>通风盘式</TD>
          <TD id=m_fbraketype_8698>通风盘式</TD></TR>
        <TR class=hidd>
          <TD id=m_bbraketype_8687>通风盘式</TD>
          <TD id=m_bbraketype_8688>通风盘式</TD>
          <TD id=m_bbraketype_8689>通风盘式</TD>
          <TD id=m_bbraketype_8690>通风盘式</TD>
          <TD id=m_bbraketype_8691>通风盘式</TD>
          <TD id=m_bbraketype_8692>通风盘式</TD>
          <TD id=m_bbraketype_8693>通风盘式</TD>
          <TD id=m_bbraketype_8694>通风盘式</TD>
          <TD id=m_bbraketype_8695>通风盘式</TD>
          <TD id=m_bbraketype_8696>通风盘式</TD>
          <TD id=m_bbraketype_8697>通风盘式</TD>
          <TD id=m_bbraketype_8698>通风盘式</TD></TR>
        <TR class=disc>
          <TD id=m_ftiresize_8687>225/55 R16</TD>
          <TD id=m_ftiresize_8688>225/55 R16</TD>
          <TD id=m_ftiresize_8689>225/55 R16</TD>
          <TD id=m_ftiresize_8690>225/55 R16</TD>
          <TD id=m_ftiresize_8691>225/50 R17</TD>
          <TD id=m_ftiresize_8692>225/50 R17</TD>
          <TD id=m_ftiresize_8693>225/50 R17</TD>
          <TD id=m_ftiresize_8694>225/50 R17</TD>
          <TD id=m_ftiresize_8695>225/50 R17</TD>
          <TD id=m_ftiresize_8696>225/50 R17</TD>
          <TD id=m_ftiresize_8697>245/45 R17</TD>
          <TD id=m_ftiresize_8698>245/45 R17</TD></TR>
        <TR class=disc>
          <TD id=m_btiresize_8687>225/55 R16</TD>
          <TD id=m_btiresize_8688>225/55 R16</TD>
          <TD id=m_btiresize_8689>225/55 R16</TD>
          <TD id=m_btiresize_8690>225/55 R16</TD>
          <TD id=m_btiresize_8691>225/50 R17</TD>
          <TD id=m_btiresize_8692>225/50 R17</TD>
          <TD id=m_btiresize_8693>225/50 R17</TD>
          <TD id=m_btiresize_8694>225/50 R17</TD>
          <TD id=m_btiresize_8695>225/50 R17</TD>
          <TD id=m_btiresize_8696>225/50 R17</TD>
          <TD id=m_btiresize_8697>245/45 R17</TD>
          <TD id=m_btiresize_8698>245/45 R17</TD></TR>
        <TR class=hidd>
          <TD id=m_sparetire_8687>全尺寸</TD>
          <TD id=m_sparetire_8688>全尺寸</TD>
          <TD id=m_sparetire_8689>全尺寸</TD>
          <TD id=m_sparetire_8690>全尺寸</TD>
          <TD id=m_sparetire_8691>全尺寸</TD>
          <TD id=m_sparetire_8692>全尺寸</TD>
          <TD id=m_sparetire_8693>全尺寸</TD>
          <TD id=m_sparetire_8694>全尺寸</TD>
          <TD id=m_sparetire_8695>全尺寸</TD>
          <TD id=m_sparetire_8696>全尺寸</TD>
          <TD id=m_sparetire_8697>全尺寸</TD>
          <TD id=m_sparetire_8698>全尺寸</TD></TR>
        <TR id=base_7>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8687 scope=col><B href="http://newcar.xcar.com.cn/m8687/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱基本版 </A><I id=base_7_img_8687></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8688 scope=col><B href="http://newcar.xcar.com.cn/m8688/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱标准版 </A><I id=base_7_img_8688></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8689 scope=col><B href="http://newcar.xcar.com.cn/m8689/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱标准版 </A><I 
            id=base_7_img_8689></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8690 scope=col><B href="http://newcar.xcar.com.cn/m8690/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱舒适版 </A><I 
            id=base_7_img_8690></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8691 scope=col><B href="http://newcar.xcar.com.cn/m8691/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱技术版 </A><I 
            id=base_7_img_8691></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8692 scope=col><B href="http://newcar.xcar.com.cn/m8692/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱舒适版 </A><I 
            id=base_7_img_8692></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8693 scope=col><B href="http://newcar.xcar.com.cn/m8693/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱豪华版 </A><I 
            id=base_7_img_8693></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8694 scope=col><B href="http://newcar.xcar.com.cn/m8694/" 
            target=_blank>2011款奥迪A6L 2.7TDI CVT两驱舒适版 </A><I 
            id=base_7_img_8694></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8695 scope=col><B href="http://newcar.xcar.com.cn/m8695/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱舒适版 </A><I 
            id=base_7_img_8695></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8696 scope=col><B href="http://newcar.xcar.com.cn/m8696/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱豪华版 </A><I 
            id=base_7_img_8696></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8697 scope=col><B href="http://newcar.xcar.com.cn/m8697/" 
            target=_blank>2011款奥迪A6L 2.8FSI 自动四驱豪华版 </A><I 
            id=base_7_img_8697></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8698 scope=col><B href="http://newcar.xcar.com.cn/m8698/" 
            target=_blank>2011款奥迪A6L 3.0TFSI 自动四驱豪华版 </A><I 
            id=base_7_img_8698></I> 
          </TH></TR>
        <TR class=hidd>
          <TD id=m_isdairbag_8687>●</TD>
          <TD id=m_isdairbag_8688>●</TD>
          <TD id=m_isdairbag_8689>●</TD>
          <TD id=m_isdairbag_8690>●</TD>
          <TD id=m_isdairbag_8691>●</TD>
          <TD id=m_isdairbag_8692>●</TD>
          <TD id=m_isdairbag_8693>●</TD>
          <TD id=m_isdairbag_8694>●</TD>
          <TD id=m_isdairbag_8695>●</TD>
          <TD id=m_isdairbag_8696>●</TD>
          <TD id=m_isdairbag_8697>●</TD>
          <TD id=m_isdairbag_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isadairbag_8687>●</TD>
          <TD id=m_isadairbag_8688>●</TD>
          <TD id=m_isadairbag_8689>●</TD>
          <TD id=m_isadairbag_8690>●</TD>
          <TD id=m_isadairbag_8691>●</TD>
          <TD id=m_isadairbag_8692>●</TD>
          <TD id=m_isadairbag_8693>●</TD>
          <TD id=m_isadairbag_8694>●</TD>
          <TD id=m_isadairbag_8695>●</TD>
          <TD id=m_isadairbag_8696>●</TD>
          <TD id=m_isadairbag_8697>●</TD>
          <TD id=m_isadairbag_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isfhairbag_8687>●</TD>
          <TD id=m_isfhairbag_8688>●</TD>
          <TD id=m_isfhairbag_8689>●</TD>
          <TD id=m_isfhairbag_8690>●</TD>
          <TD id=m_isfhairbag_8691>●</TD>
          <TD id=m_isfhairbag_8692>●</TD>
          <TD id=m_isfhairbag_8693>●</TD>
          <TD id=m_isfhairbag_8694>●</TD>
          <TD id=m_isfhairbag_8695>●</TD>
          <TD id=m_isfhairbag_8696>●</TD>
          <TD id=m_isfhairbag_8697>●</TD>
          <TD id=m_isfhairbag_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbhairbag_8687>●</TD>
          <TD id=m_isbhairbag_8688>●</TD>
          <TD id=m_isbhairbag_8689>●</TD>
          <TD id=m_isbhairbag_8690>●</TD>
          <TD id=m_isbhairbag_8691>●</TD>
          <TD id=m_isbhairbag_8692>●</TD>
          <TD id=m_isbhairbag_8693>●</TD>
          <TD id=m_isbhairbag_8694>●</TD>
          <TD id=m_isbhairbag_8695>●</TD>
          <TD id=m_isbhairbag_8696>●</TD>
          <TD id=m_isbhairbag_8697>●</TD>
          <TD id=m_isbhairbag_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isfsairbag_8687>●</TD>
          <TD id=m_isfsairbag_8688>●</TD>
          <TD id=m_isfsairbag_8689>●</TD>
          <TD id=m_isfsairbag_8690>●</TD>
          <TD id=m_isfsairbag_8691>●</TD>
          <TD id=m_isfsairbag_8692>●</TD>
          <TD id=m_isfsairbag_8693>●</TD>
          <TD id=m_isfsairbag_8694>●</TD>
          <TD id=m_isfsairbag_8695>●</TD>
          <TD id=m_isfsairbag_8696>●</TD>
          <TD id=m_isfsairbag_8697>●</TD>
          <TD id=m_isfsairbag_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbsairbag_8687>●</TD>
          <TD id=m_isbsairbag_8688>●</TD>
          <TD id=m_isbsairbag_8689>●</TD>
          <TD id=m_isbsairbag_8690>●</TD>
          <TD id=m_isbsairbag_8691>●</TD>
          <TD id=m_isbsairbag_8692>●</TD>
          <TD id=m_isbsairbag_8693>●</TD>
          <TD id=m_isbsairbag_8694>●</TD>
          <TD id=m_isbsairbag_8695>●</TD>
          <TD id=m_isbsairbag_8696>●</TD>
          <TD id=m_isbsairbag_8697>●</TD>
          <TD id=m_isbsairbag_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iskairbag_8687>-</TD>
          <TD id=m_iskairbag_8688>-</TD>
          <TD id=m_iskairbag_8689>-</TD>
          <TD id=m_iskairbag_8690>-</TD>
          <TD id=m_iskairbag_8691>-</TD>
          <TD id=m_iskairbag_8692>-</TD>
          <TD id=m_iskairbag_8693>-</TD>
          <TD id=m_iskairbag_8694>-</TD>
          <TD id=m_iskairbag_8695>-</TD>
          <TD id=m_iskairbag_8696>-</TD>
          <TD id=m_iskairbag_8697>-</TD>
          <TD id=m_iskairbag_8698>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatbeltti_8687>●</TD>
          <TD id=m_isseatbeltti_8688>●</TD>
          <TD id=m_isseatbeltti_8689>●</TD>
          <TD id=m_isseatbeltti_8690>●</TD>
          <TD id=m_isseatbeltti_8691>●</TD>
          <TD id=m_isseatbeltti_8692>●</TD>
          <TD id=m_isseatbeltti_8693>●</TD>
          <TD id=m_isseatbeltti_8694>●</TD>
          <TD id=m_isseatbeltti_8695>●</TD>
          <TD id=m_isseatbeltti_8696>●</TD>
          <TD id=m_isseatbeltti_8697>●</TD>
          <TD id=m_isseatbeltti_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iseanti_8687>●</TD>
          <TD id=m_iseanti_8688>●</TD>
          <TD id=m_iseanti_8689>●</TD>
          <TD id=m_iseanti_8690>●</TD>
          <TD id=m_iseanti_8691>●</TD>
          <TD id=m_iseanti_8692>●</TD>
          <TD id=m_iseanti_8693>●</TD>
          <TD id=m_iseanti_8694>●</TD>
          <TD id=m_iseanti_8695>●</TD>
          <TD id=m_iseanti_8696>●</TD>
          <TD id=m_iseanti_8697>●</TD>
          <TD id=m_iseanti_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscclock_8687>●</TD>
          <TD id=m_iscclock_8688>●</TD>
          <TD id=m_iscclock_8689>●</TD>
          <TD id=m_iscclock_8690>●</TD>
          <TD id=m_iscclock_8691>●</TD>
          <TD id=m_iscclock_8692>●</TD>
          <TD id=m_iscclock_8693>●</TD>
          <TD id=m_iscclock_8694>●</TD>
          <TD id=m_iscclock_8695>●</TD>
          <TD id=m_iscclock_8696>●</TD>
          <TD id=m_iscclock_8697>●</TD>
          <TD id=m_iscclock_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isrekey_8687>●</TD>
          <TD id=m_isrekey_8688>●</TD>
          <TD id=m_isrekey_8689>●</TD>
          <TD id=m_isrekey_8690>●</TD>
          <TD id=m_isrekey_8691>●</TD>
          <TD id=m_isrekey_8692>●</TD>
          <TD id=m_isrekey_8693>●</TD>
          <TD id=m_isrekey_8694>●</TD>
          <TD id=m_isrekey_8695>●</TD>
          <TD id=m_isrekey_8696>●</TD>
          <TD id=m_isrekey_8697>●</TD>
          <TD id=m_isrekey_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_isnokeysys_8687>-</TD>
          <TD id=m_isnokeysys_8688>-</TD>
          <TD id=m_isnokeysys_8689>-</TD>
          <TD id=m_isnokeysys_8690>-</TD>
          <TD id=m_isnokeysys_8691>-</TD>
          <TD id=m_isnokeysys_8692>●</TD>
          <TD id=m_isnokeysys_8693>●</TD>
          <TD id=m_isnokeysys_8694>-</TD>
          <TD id=m_isnokeysys_8695>●</TD>
          <TD id=m_isnokeysys_8696>●</TD>
          <TD id=m_isnokeysys_8697>●</TD>
          <TD id=m_isnokeysys_8698>●</TD></TR>
        <TR id=base_8>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8687 scope=col><B href="http://newcar.xcar.com.cn/m8687/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱基本版 </A><I id=base_8_img_8687></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8688 scope=col><B href="http://newcar.xcar.com.cn/m8688/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱标准版 </A><I id=base_8_img_8688></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8689 scope=col><B href="http://newcar.xcar.com.cn/m8689/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱标准版 </A><I 
            id=base_8_img_8689></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8690 scope=col><B href="http://newcar.xcar.com.cn/m8690/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱舒适版 </A><I 
            id=base_8_img_8690></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8691 scope=col><B href="http://newcar.xcar.com.cn/m8691/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱技术版 </A><I 
            id=base_8_img_8691></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8692 scope=col><B href="http://newcar.xcar.com.cn/m8692/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱舒适版 </A><I 
            id=base_8_img_8692></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8693 scope=col><B href="http://newcar.xcar.com.cn/m8693/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱豪华版 </A><I 
            id=base_8_img_8693></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8694 scope=col><B href="http://newcar.xcar.com.cn/m8694/" 
            target=_blank>2011款奥迪A6L 2.7TDI CVT两驱舒适版 </A><I 
            id=base_8_img_8694></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8695 scope=col><B href="http://newcar.xcar.com.cn/m8695/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱舒适版 </A><I 
            id=base_8_img_8695></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8696 scope=col><B href="http://newcar.xcar.com.cn/m8696/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱豪华版 </A><I 
            id=base_8_img_8696></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8697 scope=col><B href="http://newcar.xcar.com.cn/m8697/" 
            target=_blank>2011款奥迪A6L 2.8FSI 自动四驱豪华版 </A><I 
            id=base_8_img_8697></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8698 scope=col><B href="http://newcar.xcar.com.cn/m8698/" 
            target=_blank>2011款奥迪A6L 3.0TFSI 自动四驱豪华版 </A><I 
            id=base_8_img_8698></I> 
          </TH></TR>
        <TR class=hidd>
          <TD id=m_isabs_8687>●</TD>
          <TD id=m_isabs_8688>●</TD>
          <TD id=m_isabs_8689>●</TD>
          <TD id=m_isabs_8690>●</TD>
          <TD id=m_isabs_8691>●</TD>
          <TD id=m_isabs_8692>●</TD>
          <TD id=m_isabs_8693>●</TD>
          <TD id=m_isabs_8694>●</TD>
          <TD id=m_isabs_8695>●</TD>
          <TD id=m_isabs_8696>●</TD>
          <TD id=m_isabs_8697>●</TD>
          <TD id=m_isabs_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isesp_8687>●</TD>
          <TD id=m_isesp_8688>●</TD>
          <TD id=m_isesp_8689>●</TD>
          <TD id=m_isesp_8690>●</TD>
          <TD id=m_isesp_8691>●</TD>
          <TD id=m_isesp_8692>●</TD>
          <TD id=m_isesp_8693>●</TD>
          <TD id=m_isesp_8694>●</TD>
          <TD id=m_isesp_8695>●</TD>
          <TD id=m_isesp_8696>●</TD>
          <TD id=m_isesp_8697>●</TD>
          <TD id=m_isesp_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_isadsus_8687>-</TD>
          <TD id=m_isadsus_8688>-</TD>
          <TD id=m_isadsus_8689>-</TD>
          <TD id=m_isadsus_8690>-</TD>
          <TD id=m_isadsus_8691>-</TD>
          <TD id=m_isadsus_8692>-</TD>
          <TD id=m_isadsus_8693>-</TD>
          <TD id=m_isadsus_8694>-</TD>
          <TD id=m_isadsus_8695>-</TD>
          <TD id=m_isadsus_8696>-</TD>
          <TD id=m_isadsus_8697>-</TD>
          <TD id=m_isadsus_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_istpmonitor_8687>●</TD>
          <TD id=m_istpmonitor_8688>-</TD>
          <TD id=m_istpmonitor_8689>-</TD>
          <TD id=m_istpmonitor_8690>-</TD>
          <TD id=m_istpmonitor_8691>-</TD>
          <TD id=m_istpmonitor_8692>●</TD>
          <TD id=m_istpmonitor_8693>●</TD>
          <TD id=m_istpmonitor_8694>●</TD>
          <TD id=m_istpmonitor_8695>●</TD>
          <TD id=m_istpmonitor_8696>●</TD>
          <TD id=m_istpmonitor_8697>●</TD>
          <TD id=m_istpmonitor_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_istpruning_8687>-</TD>
          <TD id=m_istpruning_8688>-</TD>
          <TD id=m_istpruning_8689>-</TD>
          <TD id=m_istpruning_8690>-</TD>
          <TD id=m_istpruning_8691>-</TD>
          <TD id=m_istpruning_8692>-</TD>
          <TD id=m_istpruning_8693>-</TD>
          <TD id=m_istpruning_8694>-</TD>
          <TD id=m_istpruning_8695>-</TD>
          <TD id=m_istpruning_8696>-</TD>
          <TD id=m_istpruning_8697>-</TD>
          <TD id=m_istpruning_8698>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isfsteering_8687>●</TD>
          <TD id=m_isfsteering_8688>●</TD>
          <TD id=m_isfsteering_8689>●</TD>
          <TD id=m_isfsteering_8690>●</TD>
          <TD id=m_isfsteering_8691>●</TD>
          <TD id=m_isfsteering_8692>●</TD>
          <TD id=m_isfsteering_8693>●</TD>
          <TD id=m_isfsteering_8694>●</TD>
          <TD id=m_isfsteering_8695>●</TD>
          <TD id=m_isfsteering_8696>●</TD>
          <TD id=m_isfsteering_8697>●</TD>
          <TD id=m_isfsteering_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_issteesys_8687>-</TD>
          <TD id=m_issteesys_8688>-</TD>
          <TD id=m_issteesys_8689>-</TD>
          <TD id=m_issteesys_8690>-</TD>
          <TD id=m_issteesys_8691>-</TD>
          <TD id=m_issteesys_8692>-</TD>
          <TD id=m_issteesys_8693>-</TD>
          <TD id=m_issteesys_8694>-</TD>
          <TD id=m_issteesys_8695>-</TD>
          <TD id=m_issteesys_8696>-</TD>
          <TD id=m_issteesys_8697>-</TD>
          <TD id=m_issteesys_8698>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isuphillassist_8687>●</TD>
          <TD id=m_isuphillassist_8688>●</TD>
          <TD id=m_isuphillassist_8689>●</TD>
          <TD id=m_isuphillassist_8690>●</TD>
          <TD id=m_isuphillassist_8691>●</TD>
          <TD id=m_isuphillassist_8692>●</TD>
          <TD id=m_isuphillassist_8693>●</TD>
          <TD id=m_isuphillassist_8694>●</TD>
          <TD id=m_isuphillassist_8695>●</TD>
          <TD id=m_isuphillassist_8696>●</TD>
          <TD id=m_isuphillassist_8697>●</TD>
          <TD id=m_isuphillassist_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_isandstitch_8687>-</TD>
          <TD id=m_isandstitch_8688>-</TD>
          <TD id=m_isandstitch_8689>-</TD>
          <TD id=m_isandstitch_8690>-</TD>
          <TD id=m_isandstitch_8691>●</TD>
          <TD id=m_isandstitch_8692>●</TD>
          <TD id=m_isandstitch_8693>●</TD>
          <TD id=m_isandstitch_8694>-</TD>
          <TD id=m_isandstitch_8695>●</TD>
          <TD id=m_isandstitch_8696>●</TD>
          <TD id=m_isandstitch_8697>●</TD>
          <TD id=m_isandstitch_8698>●</TD></TR>
        <TR id=base_9>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8687 scope=col><B href="http://newcar.xcar.com.cn/m8687/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱基本版 </A><I id=base_9_img_8687></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8688 scope=col><B href="http://newcar.xcar.com.cn/m8688/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱标准版 </A><I id=base_9_img_8688></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8689 scope=col><B href="http://newcar.xcar.com.cn/m8689/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱标准版 </A><I 
            id=base_9_img_8689></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8690 scope=col><B href="http://newcar.xcar.com.cn/m8690/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱舒适版 </A><I 
            id=base_9_img_8690></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8691 scope=col><B href="http://newcar.xcar.com.cn/m8691/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱技术版 </A><I 
            id=base_9_img_8691></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8692 scope=col><B href="http://newcar.xcar.com.cn/m8692/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱舒适版 </A><I 
            id=base_9_img_8692></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8693 scope=col><B href="http://newcar.xcar.com.cn/m8693/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱豪华版 </A><I 
            id=base_9_img_8693></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8694 scope=col><B href="http://newcar.xcar.com.cn/m8694/" 
            target=_blank>2011款奥迪A6L 2.7TDI CVT两驱舒适版 </A><I 
            id=base_9_img_8694></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8695 scope=col><B href="http://newcar.xcar.com.cn/m8695/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱舒适版 </A><I 
            id=base_9_img_8695></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8696 scope=col><B href="http://newcar.xcar.com.cn/m8696/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱豪华版 </A><I 
            id=base_9_img_8696></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8697 scope=col><B href="http://newcar.xcar.com.cn/m8697/" 
            target=_blank>2011款奥迪A6L 2.8FSI 自动四驱豪华版 </A><I 
            id=base_9_img_8697></I> 
          </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8698 scope=col><B href="http://newcar.xcar.com.cn/m8698/" 
            target=_blank>2011款奥迪A6L 3.0TFSI 自动四驱豪华版 </A><I 
            id=base_9_img_8698></I> 
          </TH></TR>
        <TR class=hidd>
          <TD id=m_iswindow_8687>●</TD>
          <TD id=m_iswindow_8688>●</TD>
          <TD id=m_iswindow_8689>●</TD>
          <TD id=m_iswindow_8690>●</TD>
          <TD id=m_iswindow_8691>●</TD>
          <TD id=m_iswindow_8692>●</TD>
          <TD id=m_iswindow_8693>●</TD>
          <TD id=m_iswindow_8694>●</TD>
          <TD id=m_iswindow_8695>●</TD>
          <TD id=m_iswindow_8696>●</TD>
          <TD id=m_iswindow_8697>●</TD>
          <TD id=m_iswindow_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isarwindow_8687>-</TD>
          <TD id=m_isarwindow_8688>-</TD>
          <TD id=m_isarwindow_8689>-</TD>
          <TD id=m_isarwindow_8690>-</TD>
          <TD id=m_isarwindow_8691>-</TD>
          <TD id=m_isarwindow_8692>-</TD>
          <TD id=m_isarwindow_8693>-</TD>
          <TD id=m_isarwindow_8694>-</TD>
          <TD id=m_isarwindow_8695>-</TD>
          <TD id=m_isarwindow_8696>-</TD>
          <TD id=m_isarwindow_8697>-</TD>
          <TD id=m_isarwindow_8698>-</TD></TR>
        <TR class=disc>
          <TD id=m_isspround_8687>-</TD>
          <TD id=m_isspround_8688>-</TD>
          <TD id=m_isspround_8689>○</TD>
          <TD id=m_isspround_8690>○</TD>
          <TD id=m_isspround_8691>-</TD>
          <TD id=m_isspround_8692>○</TD>
          <TD id=m_isspround_8693>-</TD>
          <TD id=m_isspround_8694>-</TD>
          <TD id=m_isspround_8695>-</TD>
          <TD id=m_isspround_8696>-</TD>
          <TD id=m_isspround_8697>-</TD>
          <TD id=m_isspround_8698>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isaluhub_8687>●</TD>
          <TD id=m_isaluhub_8688>●</TD>
          <TD id=m_isaluhub_8689>●</TD>
          <TD id=m_isaluhub_8690>●</TD>
          <TD id=m_isaluhub_8691>●</TD>
          <TD id=m_isaluhub_8692>●</TD>
          <TD id=m_isaluhub_8693>●</TD>
          <TD id=m_isaluhub_8694>●</TD>
          <TD id=m_isaluhub_8695>●</TD>
          <TD id=m_isaluhub_8696>●</TD>
          <TD id=m_isaluhub_8697>●</TD>
          <TD id=m_isaluhub_8698>●</TD></TR>
        <TR id=base_10>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8687 scope=col><B href="http://newcar.xcar.com.cn/m8687/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱基本版 </A><I 
            id=base_10_img_8687></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8688 scope=col><B href="http://newcar.xcar.com.cn/m8688/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱标准版 </A><I 
            id=base_10_img_8688></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8689 scope=col><B href="http://newcar.xcar.com.cn/m8689/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱标准版 </A><I 
            id=base_10_img_8689></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8690 scope=col><B href="http://newcar.xcar.com.cn/m8690/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱舒适版 </A><I 
            id=base_10_img_8690></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8691 scope=col><B href="http://newcar.xcar.com.cn/m8691/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱技术版 </A><I 
            id=base_10_img_8691></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8692 scope=col><B href="http://newcar.xcar.com.cn/m8692/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱舒适版 </A><I 
            id=base_10_img_8692></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8693 scope=col><B href="http://newcar.xcar.com.cn/m8693/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱豪华版 </A><I 
            id=base_10_img_8693></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8694 scope=col><B href="http://newcar.xcar.com.cn/m8694/" 
            target=_blank>2011款奥迪A6L 2.7TDI CVT两驱舒适版 </A><I 
            id=base_10_img_8694></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8695 scope=col><B href="http://newcar.xcar.com.cn/m8695/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱舒适版 </A><I 
            id=base_10_img_8695></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8696 scope=col><B href="http://newcar.xcar.com.cn/m8696/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱豪华版 </A><I 
            id=base_10_img_8696></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8697 scope=col><B href="http://newcar.xcar.com.cn/m8697/" 
            target=_blank>2011款奥迪A6L 2.8FSI 自动四驱豪华版 </A><I 
            id=base_10_img_8697></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8698 scope=col><B href="http://newcar.xcar.com.cn/m8698/" 
            target=_blank>2011款奥迪A6L 3.0TFSI 自动四驱豪华版 </A><I 
            id=base_10_img_8698></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isleasw_8687>●</TD>
          <TD id=m_isleasw_8688>●</TD>
          <TD id=m_isleasw_8689>●</TD>
          <TD id=m_isleasw_8690>●</TD>
          <TD id=m_isleasw_8691>●</TD>
          <TD id=m_isleasw_8692>●</TD>
          <TD id=m_isleasw_8693>●</TD>
          <TD id=m_isleasw_8694>●</TD>
          <TD id=m_isleasw_8695>●</TD>
          <TD id=m_isleasw_8696>●</TD>
          <TD id=m_isleasw_8697>●</TD>
          <TD id=m_isleasw_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswud_8687>●</TD>
          <TD id=m_isswud_8688>●</TD>
          <TD id=m_isswud_8689>●</TD>
          <TD id=m_isswud_8690>●</TD>
          <TD id=m_isswud_8691>●</TD>
          <TD id=m_isswud_8692>●</TD>
          <TD id=m_isswud_8693>●</TD>
          <TD id=m_isswud_8694>●</TD>
          <TD id=m_isswud_8695>●</TD>
          <TD id=m_isswud_8696>●</TD>
          <TD id=m_isswud_8697>●</TD>
          <TD id=m_isswud_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswfb_8687>●</TD>
          <TD id=m_isswfb_8688>●</TD>
          <TD id=m_isswfb_8689>●</TD>
          <TD id=m_isswfb_8690>●</TD>
          <TD id=m_isswfb_8691>●</TD>
          <TD id=m_isswfb_8692>●</TD>
          <TD id=m_isswfb_8693>●</TD>
          <TD id=m_isswfb_8694>●</TD>
          <TD id=m_isswfb_8695>●</TD>
          <TD id=m_isswfb_8696>●</TD>
          <TD id=m_isswfb_8697>●</TD>
          <TD id=m_isswfb_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_ismultisw_8687>-</TD>
          <TD id=m_ismultisw_8688>●</TD>
          <TD id=m_ismultisw_8689>●</TD>
          <TD id=m_ismultisw_8690>●</TD>
          <TD id=m_ismultisw_8691>●</TD>
          <TD id=m_ismultisw_8692>●</TD>
          <TD id=m_ismultisw_8693>●</TD>
          <TD id=m_ismultisw_8694>●</TD>
          <TD id=m_ismultisw_8695>●</TD>
          <TD id=m_ismultisw_8696>●</TD>
          <TD id=m_ismultisw_8697>●</TD>
          <TD id=m_ismultisw_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_isswshift_8687>-</TD>
          <TD id=m_isswshift_8688>-</TD>
          <TD id=m_isswshift_8689>●</TD>
          <TD id=m_isswshift_8690>●</TD>
          <TD id=m_isswshift_8691>●</TD>
          <TD id=m_isswshift_8692>●</TD>
          <TD id=m_isswshift_8693>●</TD>
          <TD id=m_isswshift_8694>●</TD>
          <TD id=m_isswshift_8695>●</TD>
          <TD id=m_isswshift_8696>●</TD>
          <TD id=m_isswshift_8697>●</TD>
          <TD id=m_isswshift_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_isascd_8687>-</TD>
          <TD id=m_isascd_8688>●</TD>
          <TD id=m_isascd_8689>●</TD>
          <TD id=m_isascd_8690>●</TD>
          <TD id=m_isascd_8691>●</TD>
          <TD id=m_isascd_8692>●</TD>
          <TD id=m_isascd_8693>●</TD>
          <TD id=m_isascd_8694>●</TD>
          <TD id=m_isascd_8695>●</TD>
          <TD id=m_isascd_8696>●</TD>
          <TD id=m_isascd_8697>●</TD>
          <TD id=m_isascd_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_isassibc_8687>-</TD>
          <TD id=m_isassibc_8688>●</TD>
          <TD id=m_isassibc_8689>●</TD>
          <TD id=m_isassibc_8690>●</TD>
          <TD id=m_isassibc_8691>●</TD>
          <TD id=m_isassibc_8692>●</TD>
          <TD id=m_isassibc_8693>●</TD>
          <TD id=m_isassibc_8694>●</TD>
          <TD id=m_isassibc_8695>●</TD>
          <TD id=m_isassibc_8696>●</TD>
          <TD id=m_isassibc_8697>●</TD>
          <TD id=m_isassibc_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_isparkvideo_8687>-</TD>
          <TD id=m_isparkvideo_8688>-</TD>
          <TD id=m_isparkvideo_8689>-</TD>
          <TD id=m_isparkvideo_8690>-</TD>
          <TD id=m_isparkvideo_8691>-</TD>
          <TD id=m_isparkvideo_8692>●</TD>
          <TD id=m_isparkvideo_8693>●</TD>
          <TD id=m_isparkvideo_8694>●</TD>
          <TD id=m_isparkvideo_8695>●</TD>
          <TD id=m_isparkvideo_8696>●</TD>
          <TD id=m_isparkvideo_8697>●</TD>
          <TD id=m_isparkvideo_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ispark_8687>-</TD>
          <TD id=m_ispark_8688>-</TD>
          <TD id=m_ispark_8689>-</TD>
          <TD id=m_ispark_8690>-</TD>
          <TD id=m_ispark_8691>-</TD>
          <TD id=m_ispark_8692>-</TD>
          <TD id=m_ispark_8693>-</TD>
          <TD id=m_ispark_8694>-</TD>
          <TD id=m_ispark_8695>-</TD>
          <TD id=m_ispark_8696>-</TD>
          <TD id=m_ispark_8697>-</TD>
          <TD id=m_ispark_8698>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ishud_8687>-</TD>
          <TD id=m_ishud_8688>-</TD>
          <TD id=m_ishud_8689>-</TD>
          <TD id=m_ishud_8690>-</TD>
          <TD id=m_ishud_8691>-</TD>
          <TD id=m_ishud_8692>-</TD>
          <TD id=m_ishud_8693>-</TD>
          <TD id=m_ishud_8694>-</TD>
          <TD id=m_ishud_8695>-</TD>
          <TD id=m_ishud_8696>-</TD>
          <TD id=m_ishud_8697>-</TD>
          <TD id=m_ishud_8698>-</TD></TR>
        <TR id=base_11>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8687 scope=col><B href="http://newcar.xcar.com.cn/m8687/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱基本版 </A><I 
            id=base_11_img_8687></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8688 scope=col><B href="http://newcar.xcar.com.cn/m8688/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱标准版 </A><I 
            id=base_11_img_8688></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8689 scope=col><B href="http://newcar.xcar.com.cn/m8689/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱标准版 </A><I 
            id=base_11_img_8689></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8690 scope=col><B href="http://newcar.xcar.com.cn/m8690/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱舒适版 </A><I 
            id=base_11_img_8690></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8691 scope=col><B href="http://newcar.xcar.com.cn/m8691/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱技术版 </A><I 
            id=base_11_img_8691></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8692 scope=col><B href="http://newcar.xcar.com.cn/m8692/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱舒适版 </A><I 
            id=base_11_img_8692></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8693 scope=col><B href="http://newcar.xcar.com.cn/m8693/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱豪华版 </A><I 
            id=base_11_img_8693></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8694 scope=col><B href="http://newcar.xcar.com.cn/m8694/" 
            target=_blank>2011款奥迪A6L 2.7TDI CVT两驱舒适版 </A><I 
            id=base_11_img_8694></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8695 scope=col><B href="http://newcar.xcar.com.cn/m8695/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱舒适版 </A><I 
            id=base_11_img_8695></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8696 scope=col><B href="http://newcar.xcar.com.cn/m8696/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱豪华版 </A><I 
            id=base_11_img_8696></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8697 scope=col><B href="http://newcar.xcar.com.cn/m8697/" 
            target=_blank>2011款奥迪A6L 2.8FSI 自动四驱豪华版 </A><I 
            id=base_11_img_8697></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8698 scope=col><B href="http://newcar.xcar.com.cn/m8698/" 
            target=_blank>2011款奥迪A6L 3.0TFSI 自动四驱豪华版 </A><I 
            id=base_11_img_8698></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isleaseat_8687>-</TD>
          <TD id=m_isleaseat_8688>-</TD>
          <TD id=m_isleaseat_8689>-</TD>
          <TD id=m_isleaseat_8690>●</TD>
          <TD id=m_isleaseat_8691>●</TD>
          <TD id=m_isleaseat_8692>●</TD>
          <TD id=m_isleaseat_8693>●</TD>
          <TD id=m_isleaseat_8694>●</TD>
          <TD id=m_isleaseat_8695>●</TD>
          <TD id=m_isleaseat_8696>●</TD>
          <TD id=m_isleaseat_8697>●</TD>
          <TD id=m_isleaseat_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatadj_8687>●</TD>
          <TD id=m_isseatadj_8688>●</TD>
          <TD id=m_isseatadj_8689>●</TD>
          <TD id=m_isseatadj_8690>●</TD>
          <TD id=m_isseatadj_8691>●</TD>
          <TD id=m_isseatadj_8692>●</TD>
          <TD id=m_isseatadj_8693>●</TD>
          <TD id=m_isseatadj_8694>●</TD>
          <TD id=m_isseatadj_8695>●</TD>
          <TD id=m_isseatadj_8696>●</TD>
          <TD id=m_isseatadj_8697>●</TD>
          <TD id=m_isseatadj_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_iswaistadj_8687>-</TD>
          <TD id=m_iswaistadj_8688>●</TD>
          <TD id=m_iswaistadj_8689>●</TD>
          <TD id=m_iswaistadj_8690>●</TD>
          <TD id=m_iswaistadj_8691>●</TD>
          <TD id=m_iswaistadj_8692>●</TD>
          <TD id=m_iswaistadj_8693>●</TD>
          <TD id=m_iswaistadj_8694>●</TD>
          <TD id=m_iswaistadj_8695>●</TD>
          <TD id=m_iswaistadj_8696>●</TD>
          <TD id=m_iswaistadj_8697>●</TD>
          <TD id=m_iswaistadj_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_isfseatadj_8687>-</TD>
          <TD id=m_isfseatadj_8688>●</TD>
          <TD id=m_isfseatadj_8689>●</TD>
          <TD id=m_isfseatadj_8690>●</TD>
          <TD id=m_isfseatadj_8691>●</TD>
          <TD id=m_isfseatadj_8692>●</TD>
          <TD id=m_isfseatadj_8693>●</TD>
          <TD id=m_isfseatadj_8694>●</TD>
          <TD id=m_isfseatadj_8695>●</TD>
          <TD id=m_isfseatadj_8696>●</TD>
          <TD id=m_isfseatadj_8697>●</TD>
          <TD id=m_isfseatadj_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_iseseatmem_8687>-</TD>
          <TD id=m_iseseatmem_8688>-</TD>
          <TD id=m_iseseatmem_8689>-</TD>
          <TD id=m_iseseatmem_8690>-</TD>
          <TD id=m_iseseatmem_8691>-</TD>
          <TD id=m_iseseatmem_8692>-</TD>
          <TD id=m_iseseatmem_8693>●</TD>
          <TD id=m_iseseatmem_8694>-</TD>
          <TD id=m_iseseatmem_8695>-</TD>
          <TD id=m_iseseatmem_8696>●</TD>
          <TD id=m_iseseatmem_8697>●</TD>
          <TD id=m_iseseatmem_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_isseathot_8687>-</TD>
          <TD id=m_isseathot_8688>-</TD>
          <TD id=m_isseathot_8689>-</TD>
          <TD id=m_isseathot_8690>●</TD>
          <TD id=m_isseathot_8691>●</TD>
          <TD id=m_isseathot_8692>●</TD>
          <TD id=m_isseathot_8693>●</TD>
          <TD id=m_isseathot_8694>●</TD>
          <TD id=m_isseathot_8695>●</TD>
          <TD id=m_isseathot_8696>●</TD>
          <TD id=m_isseathot_8697>●</TD>
          <TD id=m_isseathot_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatknead_8687>-</TD>
          <TD id=m_isseatknead_8688>-</TD>
          <TD id=m_isseatknead_8689>-</TD>
          <TD id=m_isseatknead_8690>-</TD>
          <TD id=m_isseatknead_8691>-</TD>
          <TD id=m_isseatknead_8692>-</TD>
          <TD id=m_isseatknead_8693>-</TD>
          <TD id=m_isseatknead_8694>-</TD>
          <TD id=m_isseatknead_8695>-</TD>
          <TD id=m_isseatknead_8696>-</TD>
          <TD id=m_isseatknead_8697>-</TD>
          <TD id=m_isseatknead_8698>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isbseatlay_8687>-</TD>
          <TD id=m_isbseatlay_8688>-</TD>
          <TD id=m_isbseatlay_8689>-</TD>
          <TD id=m_isbseatlay_8690>-</TD>
          <TD id=m_isbseatlay_8691>-</TD>
          <TD id=m_isbseatlay_8692>-</TD>
          <TD id=m_isbseatlay_8693>-</TD>
          <TD id=m_isbseatlay_8694>-</TD>
          <TD id=m_isbseatlay_8695>-</TD>
          <TD id=m_isbseatlay_8696>-</TD>
          <TD id=m_isbseatlay_8697>-</TD>
          <TD id=m_isbseatlay_8698>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isbseatplay_8687>-</TD>
          <TD id=m_isbseatplay_8688>-</TD>
          <TD id=m_isbseatplay_8689>-</TD>
          <TD id=m_isbseatplay_8690>-</TD>
          <TD id=m_isbseatplay_8691>-</TD>
          <TD id=m_isbseatplay_8692>-</TD>
          <TD id=m_isbseatplay_8693>-</TD>
          <TD id=m_isbseatplay_8694>-</TD>
          <TD id=m_isbseatplay_8695>-</TD>
          <TD id=m_isbseatplay_8696>-</TD>
          <TD id=m_isbseatplay_8697>-</TD>
          <TD id=m_isbseatplay_8698>-</TD></TR>
        <TR id=base_12>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8687 scope=col><B href="http://newcar.xcar.com.cn/m8687/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱基本版 </A><I 
            id=base_12_img_8687></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8688 scope=col><B href="http://newcar.xcar.com.cn/m8688/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱标准版 </A><I 
            id=base_12_img_8688></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8689 scope=col><B href="http://newcar.xcar.com.cn/m8689/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱标准版 </A><I 
            id=base_12_img_8689></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8690 scope=col><B href="http://newcar.xcar.com.cn/m8690/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱舒适版 </A><I 
            id=base_12_img_8690></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8691 scope=col><B href="http://newcar.xcar.com.cn/m8691/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱技术版 </A><I 
            id=base_12_img_8691></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8692 scope=col><B href="http://newcar.xcar.com.cn/m8692/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱舒适版 </A><I 
            id=base_12_img_8692></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8693 scope=col><B href="http://newcar.xcar.com.cn/m8693/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱豪华版 </A><I 
            id=base_12_img_8693></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8694 scope=col><B href="http://newcar.xcar.com.cn/m8694/" 
            target=_blank>2011款奥迪A6L 2.7TDI CVT两驱舒适版 </A><I 
            id=base_12_img_8694></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8695 scope=col><B href="http://newcar.xcar.com.cn/m8695/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱舒适版 </A><I 
            id=base_12_img_8695></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8696 scope=col><B href="http://newcar.xcar.com.cn/m8696/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱豪华版 </A><I 
            id=base_12_img_8696></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8697 scope=col><B href="http://newcar.xcar.com.cn/m8697/" 
            target=_blank>2011款奥迪A6L 2.8FSI 自动四驱豪华版 </A><I 
            id=base_12_img_8697></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8698 scope=col><B href="http://newcar.xcar.com.cn/m8698/" 
            target=_blank>2011款奥迪A6L 3.0TFSI 自动四驱豪华版 </A><I 
            id=base_12_img_8698></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isgps_8687>●</TD>
          <TD id=m_isgps_8688>●</TD>
          <TD id=m_isgps_8689>●</TD>
          <TD id=m_isgps_8690>●</TD>
          <TD id=m_isgps_8691>●</TD>
          <TD id=m_isgps_8692>●</TD>
          <TD id=m_isgps_8693>●</TD>
          <TD id=m_isgps_8694>●</TD>
          <TD id=m_isgps_8695>●</TD>
          <TD id=m_isgps_8696>●</TD>
          <TD id=m_isgps_8697>●</TD>
          <TD id=m_isgps_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_isbluetooth_8687>-</TD>
          <TD id=m_isbluetooth_8688>-</TD>
          <TD id=m_isbluetooth_8689>-</TD>
          <TD id=m_isbluetooth_8690>-</TD>
          <TD id=m_isbluetooth_8691>-</TD>
          <TD id=m_isbluetooth_8692>●</TD>
          <TD id=m_isbluetooth_8693>●</TD>
          <TD id=m_isbluetooth_8694>-</TD>
          <TD id=m_isbluetooth_8695>-</TD>
          <TD id=m_isbluetooth_8696>●</TD>
          <TD id=m_isbluetooth_8697>●</TD>
          <TD id=m_isbluetooth_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_istv_8687>-</TD>
          <TD id=m_istv_8688>-</TD>
          <TD id=m_istv_8689>-</TD>
          <TD id=m_istv_8690>-</TD>
          <TD id=m_istv_8691>-</TD>
          <TD id=m_istv_8692>-</TD>
          <TD id=m_istv_8693>●</TD>
          <TD id=m_istv_8694>-</TD>
          <TD id=m_istv_8695>-</TD>
          <TD id=m_istv_8696>●</TD>
          <TD id=m_istv_8697>●</TD>
          <TD id=m_istv_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscclcd_8687>●</TD>
          <TD id=m_iscclcd_8688>●</TD>
          <TD id=m_iscclcd_8689>●</TD>
          <TD id=m_iscclcd_8690>●</TD>
          <TD id=m_iscclcd_8691>●</TD>
          <TD id=m_iscclcd_8692>●</TD>
          <TD id=m_iscclcd_8693>●</TD>
          <TD id=m_iscclcd_8694>●</TD>
          <TD id=m_iscclcd_8695>●</TD>
          <TD id=m_iscclcd_8696>●</TD>
          <TD id=m_iscclcd_8697>●</TD>
          <TD id=m_iscclcd_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isblcd_8687>-</TD>
          <TD id=m_isblcd_8688>-</TD>
          <TD id=m_isblcd_8689>-</TD>
          <TD id=m_isblcd_8690>-</TD>
          <TD id=m_isblcd_8691>-</TD>
          <TD id=m_isblcd_8692>-</TD>
          <TD id=m_isblcd_8693>-</TD>
          <TD id=m_isblcd_8694>-</TD>
          <TD id=m_isblcd_8695>-</TD>
          <TD id=m_isblcd_8696>-</TD>
          <TD id=m_isblcd_8697>-</TD>
          <TD id=m_isblcd_8698>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ismp3_8687>-</TD>
          <TD id=m_ismp3_8688>-</TD>
          <TD id=m_ismp3_8689>-</TD>
          <TD id=m_ismp3_8690>-</TD>
          <TD id=m_ismp3_8691>-</TD>
          <TD id=m_ismp3_8692>-</TD>
          <TD id=m_ismp3_8693>-</TD>
          <TD id=m_ismp3_8694>-</TD>
          <TD id=m_ismp3_8695>-</TD>
          <TD id=m_ismp3_8696>-</TD>
          <TD id=m_ismp3_8697>-</TD>
          <TD id=m_ismp3_8698>-</TD></TR>
        <TR class=hidd>
          <TD id=m_iscd_8687>●</TD>
          <TD id=m_iscd_8688>●</TD>
          <TD id=m_iscd_8689>●</TD>
          <TD id=m_iscd_8690>●</TD>
          <TD id=m_iscd_8691>●</TD>
          <TD id=m_iscd_8692>●</TD>
          <TD id=m_iscd_8693>●</TD>
          <TD id=m_iscd_8694>●</TD>
          <TD id=m_iscd_8695>●</TD>
          <TD id=m_iscd_8696>●</TD>
          <TD id=m_iscd_8697>●</TD>
          <TD id=m_iscd_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_iscd_8687>1 </TD>
          <TD id=m_iscd_8688>1 </TD>
          <TD id=m_iscd_8689>1 </TD>
          <TD id=m_iscd_8690>1 </TD>
          <TD id=m_iscd_8691>6 </TD>
          <TD id=m_iscd_8692>6 </TD>
          <TD id=m_iscd_8693>6 </TD>
          <TD id=m_iscd_8694>6 </TD>
          <TD id=m_iscd_8695>6 </TD>
          <TD id=m_iscd_8696>6 </TD>
          <TD id=m_iscd_8697>6 </TD>
          <TD id=m_iscd_8698>6 </TD></TR>
        <TR class=hidd>
          <TD id=8687>-</TD>
          <TD id=8688>-</TD>
          <TD id=8689>-</TD>
          <TD id=8690>-</TD>
          <TD id=8691>-</TD>
          <TD id=8692>-</TD>
          <TD id=8693>-</TD>
          <TD id=8694>-</TD>
          <TD id=8695>-</TD>
          <TD id=8696>-</TD>
          <TD id=8697>-</TD>
          <TD id=8698>-</TD></TR>
        <TR class=hidd>
          <TD id=8687>- </TD>
          <TD id=8688>- </TD>
          <TD id=8689>- </TD>
          <TD id=8690>- </TD>
          <TD id=8691>- </TD>
          <TD id=8692>- </TD>
          <TD id=8693>- </TD>
          <TD id=8694>- </TD>
          <TD id=8695>- </TD>
          <TD id=8696>- </TD>
          <TD id=8697>- </TD>
          <TD id=8698>- </TD></TR>
        <TR class=hidd>
          <TD id=m_is2audio_8687>-</TD>
          <TD id=m_is2audio_8688>-</TD>
          <TD id=m_is2audio_8689>-</TD>
          <TD id=m_is2audio_8690>-</TD>
          <TD id=m_is2audio_8691>-</TD>
          <TD id=m_is2audio_8692>-</TD>
          <TD id=m_is2audio_8693>-</TD>
          <TD id=m_is2audio_8694>-</TD>
          <TD id=m_is2audio_8695>-</TD>
          <TD id=m_is2audio_8696>-</TD>
          <TD id=m_is2audio_8697>-</TD>
          <TD id=m_is2audio_8698>-</TD></TR>
        <TR class=hidd>
          <TD id=m_is4audio_8687>-</TD>
          <TD id=m_is4audio_8688>-</TD>
          <TD id=m_is4audio_8689>-</TD>
          <TD id=m_is4audio_8690>-</TD>
          <TD id=m_is4audio_8691>-</TD>
          <TD id=m_is4audio_8692>-</TD>
          <TD id=m_is4audio_8693>-</TD>
          <TD id=m_is4audio_8694>-</TD>
          <TD id=m_is4audio_8695>-</TD>
          <TD id=m_is4audio_8696>-</TD>
          <TD id=m_is4audio_8697>-</TD>
          <TD id=m_is4audio_8698>-</TD></TR>
        <TR class=hidd>
          <TD id=m_is6audio_8687>-</TD>
          <TD id=m_is6audio_8688>-</TD>
          <TD id=m_is6audio_8689>-</TD>
          <TD id=m_is6audio_8690>-</TD>
          <TD id=m_is6audio_8691>-</TD>
          <TD id=m_is6audio_8692>-</TD>
          <TD id=m_is6audio_8693>-</TD>
          <TD id=m_is6audio_8694>-</TD>
          <TD id=m_is6audio_8695>-</TD>
          <TD id=m_is6audio_8696>-</TD>
          <TD id=m_is6audio_8697>-</TD>
          <TD id=m_is6audio_8698>-</TD></TR>
        <TR class=hidd>
          <TD id=m_is8audio_8687>●</TD>
          <TD id=m_is8audio_8688>●</TD>
          <TD id=m_is8audio_8689>●</TD>
          <TD id=m_is8audio_8690>●</TD>
          <TD id=m_is8audio_8691>●</TD>
          <TD id=m_is8audio_8692>●</TD>
          <TD id=m_is8audio_8693>●</TD>
          <TD id=m_is8audio_8694>●</TD>
          <TD id=m_is8audio_8695>●</TD>
          <TD id=m_is8audio_8696>●</TD>
          <TD id=m_is8audio_8697>●</TD>
          <TD id=m_is8audio_8698>●</TD></TR>
        <TR id=base_13>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8687 scope=col><B href="http://newcar.xcar.com.cn/m8687/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱基本版 </A><I 
            id=base_13_img_8687></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8688 scope=col><B href="http://newcar.xcar.com.cn/m8688/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱标准版 </A><I 
            id=base_13_img_8688></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8689 scope=col><B href="http://newcar.xcar.com.cn/m8689/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱标准版 </A><I 
            id=base_13_img_8689></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8690 scope=col><B href="http://newcar.xcar.com.cn/m8690/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱舒适版 </A><I 
            id=base_13_img_8690></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8691 scope=col><B href="http://newcar.xcar.com.cn/m8691/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱技术版 </A><I 
            id=base_13_img_8691></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8692 scope=col><B href="http://newcar.xcar.com.cn/m8692/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱舒适版 </A><I 
            id=base_13_img_8692></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8693 scope=col><B href="http://newcar.xcar.com.cn/m8693/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱豪华版 </A><I 
            id=base_13_img_8693></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8694 scope=col><B href="http://newcar.xcar.com.cn/m8694/" 
            target=_blank>2011款奥迪A6L 2.7TDI CVT两驱舒适版 </A><I 
            id=base_13_img_8694></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8695 scope=col><B href="http://newcar.xcar.com.cn/m8695/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱舒适版 </A><I 
            id=base_13_img_8695></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8696 scope=col><B href="http://newcar.xcar.com.cn/m8696/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱豪华版 </A><I 
            id=base_13_img_8696></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8697 scope=col><B href="http://newcar.xcar.com.cn/m8697/" 
            target=_blank>2011款奥迪A6L 2.8FSI 自动四驱豪华版 </A><I 
            id=base_13_img_8697></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8698 scope=col><B href="http://newcar.xcar.com.cn/m8698/" 
            target=_blank>2011款奥迪A6L 3.0TFSI 自动四驱豪华版 </A><I 
            id=base_13_img_8698></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isxelamp_8687>-</TD>
          <TD id=m_isxelamp_8688>●</TD>
          <TD id=m_isxelamp_8689>●</TD>
          <TD id=m_isxelamp_8690>●</TD>
          <TD id=m_isxelamp_8691>●</TD>
          <TD id=m_isxelamp_8692>●</TD>
          <TD id=m_isxelamp_8693>●</TD>
          <TD id=m_isxelamp_8694>●</TD>
          <TD id=m_isxelamp_8695>●</TD>
          <TD id=m_isxelamp_8696>●</TD>
          <TD id=m_isxelamp_8697>●</TD>
          <TD id=m_isxelamp_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isautohlamp_8687>●</TD>
          <TD id=m_isautohlamp_8688>●</TD>
          <TD id=m_isautohlamp_8689>●</TD>
          <TD id=m_isautohlamp_8690>●</TD>
          <TD id=m_isautohlamp_8691>●</TD>
          <TD id=m_isautohlamp_8692>●</TD>
          <TD id=m_isautohlamp_8693>●</TD>
          <TD id=m_isautohlamp_8694>●</TD>
          <TD id=m_isautohlamp_8695>●</TD>
          <TD id=m_isautohlamp_8696>●</TD>
          <TD id=m_isautohlamp_8697>●</TD>
          <TD id=m_isautohlamp_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_isturnhlamp_8687>-</TD>
          <TD id=m_isturnhlamp_8688>-</TD>
          <TD id=m_isturnhlamp_8689>-</TD>
          <TD id=m_isturnhlamp_8690>-</TD>
          <TD id=m_isturnhlamp_8691>-</TD>
          <TD id=m_isturnhlamp_8692>●</TD>
          <TD id=m_isturnhlamp_8693>●</TD>
          <TD id=m_isturnhlamp_8694>●</TD>
          <TD id=m_isturnhlamp_8695>●</TD>
          <TD id=m_isturnhlamp_8696>●</TD>
          <TD id=m_isturnhlamp_8697>●</TD>
          <TD id=m_isturnhlamp_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ishfoglamp_8687>●</TD>
          <TD id=m_ishfoglamp_8688>●</TD>
          <TD id=m_ishfoglamp_8689>●</TD>
          <TD id=m_ishfoglamp_8690>●</TD>
          <TD id=m_ishfoglamp_8691>●</TD>
          <TD id=m_ishfoglamp_8692>●</TD>
          <TD id=m_ishfoglamp_8693>●</TD>
          <TD id=m_ishfoglamp_8694>●</TD>
          <TD id=m_ishfoglamp_8695>●</TD>
          <TD id=m_ishfoglamp_8696>●</TD>
          <TD id=m_ishfoglamp_8697>●</TD>
          <TD id=m_ishfoglamp_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbfoglamp_8687>●</TD>
          <TD id=m_isbfoglamp_8688>●</TD>
          <TD id=m_isbfoglamp_8689>●</TD>
          <TD id=m_isbfoglamp_8690>●</TD>
          <TD id=m_isbfoglamp_8691>●</TD>
          <TD id=m_isbfoglamp_8692>●</TD>
          <TD id=m_isbfoglamp_8693>●</TD>
          <TD id=m_isbfoglamp_8694>●</TD>
          <TD id=m_isbfoglamp_8695>●</TD>
          <TD id=m_isbfoglamp_8696>●</TD>
          <TD id=m_isbfoglamp_8697>●</TD>
          <TD id=m_isbfoglamp_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_islampheiadj_8687>●</TD>
          <TD id=m_islampheiadj_8688>●</TD>
          <TD id=m_islampheiadj_8689>●</TD>
          <TD id=m_islampheiadj_8690>●</TD>
          <TD id=m_islampheiadj_8691>●</TD>
          <TD id=m_islampheiadj_8692>●</TD>
          <TD id=m_islampheiadj_8693>●</TD>
          <TD id=m_islampheiadj_8694>●</TD>
          <TD id=m_islampheiadj_8695>●</TD>
          <TD id=m_islampheiadj_8696>●</TD>
          <TD id=m_islampheiadj_8697>●</TD>
          <TD id=m_islampheiadj_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_islampclset_8687>-</TD>
          <TD id=m_islampclset_8688>●</TD>
          <TD id=m_islampclset_8689>●</TD>
          <TD id=m_islampclset_8690>●</TD>
          <TD id=m_islampclset_8691>●</TD>
          <TD id=m_islampclset_8692>●</TD>
          <TD id=m_islampclset_8693>●</TD>
          <TD id=m_islampclset_8694>●</TD>
          <TD id=m_islampclset_8695>●</TD>
          <TD id=m_islampclset_8696>●</TD>
          <TD id=m_islampclset_8697>●</TD>
          <TD id=m_islampclset_8698>●</TD></TR>
        <TR id=base_14>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8687 scope=col><B href="http://newcar.xcar.com.cn/m8687/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱基本版 </A><I 
            id=base_14_img_8687></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8688 scope=col><B href="http://newcar.xcar.com.cn/m8688/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱标准版 </A><I 
            id=base_14_img_8688></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8689 scope=col><B href="http://newcar.xcar.com.cn/m8689/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱标准版 </A><I 
            id=base_14_img_8689></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8690 scope=col><B href="http://newcar.xcar.com.cn/m8690/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱舒适版 </A><I 
            id=base_14_img_8690></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8691 scope=col><B href="http://newcar.xcar.com.cn/m8691/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱技术版 </A><I 
            id=base_14_img_8691></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8692 scope=col><B href="http://newcar.xcar.com.cn/m8692/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱舒适版 </A><I 
            id=base_14_img_8692></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8693 scope=col><B href="http://newcar.xcar.com.cn/m8693/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱豪华版 </A><I 
            id=base_14_img_8693></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8694 scope=col><B href="http://newcar.xcar.com.cn/m8694/" 
            target=_blank>2011款奥迪A6L 2.7TDI CVT两驱舒适版 </A><I 
            id=base_14_img_8694></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8695 scope=col><B href="http://newcar.xcar.com.cn/m8695/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱舒适版 </A><I 
            id=base_14_img_8695></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8696 scope=col><B href="http://newcar.xcar.com.cn/m8696/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱豪华版 </A><I 
            id=base_14_img_8696></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8697 scope=col><B href="http://newcar.xcar.com.cn/m8697/" 
            target=_blank>2011款奥迪A6L 2.8FSI 自动四驱豪华版 </A><I 
            id=base_14_img_8697></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8698 scope=col><B href="http://newcar.xcar.com.cn/m8698/" 
            target=_blank>2011款奥迪A6L 3.0TFSI 自动四驱豪华版 </A><I 
            id=base_14_img_8698></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isfewindow_8687>●</TD>
          <TD id=m_isfewindow_8688>●</TD>
          <TD id=m_isfewindow_8689>●</TD>
          <TD id=m_isfewindow_8690>●</TD>
          <TD id=m_isfewindow_8691>●</TD>
          <TD id=m_isfewindow_8692>●</TD>
          <TD id=m_isfewindow_8693>●</TD>
          <TD id=m_isfewindow_8694>●</TD>
          <TD id=m_isfewindow_8695>●</TD>
          <TD id=m_isfewindow_8696>●</TD>
          <TD id=m_isfewindow_8697>●</TD>
          <TD id=m_isfewindow_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbewindow_8687>●</TD>
          <TD id=m_isbewindow_8688>●</TD>
          <TD id=m_isbewindow_8689>●</TD>
          <TD id=m_isbewindow_8690>●</TD>
          <TD id=m_isbewindow_8691>●</TD>
          <TD id=m_isbewindow_8692>●</TD>
          <TD id=m_isbewindow_8693>●</TD>
          <TD id=m_isbewindow_8694>●</TD>
          <TD id=m_isbewindow_8695>●</TD>
          <TD id=m_isbewindow_8696>●</TD>
          <TD id=m_isbewindow_8697>●</TD>
          <TD id=m_isbewindow_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isgnhand_8687>●</TD>
          <TD id=m_isgnhand_8688>●</TD>
          <TD id=m_isgnhand_8689>●</TD>
          <TD id=m_isgnhand_8690>●</TD>
          <TD id=m_isgnhand_8691>●</TD>
          <TD id=m_isgnhand_8692>●</TD>
          <TD id=m_isgnhand_8693>●</TD>
          <TD id=m_isgnhand_8694>●</TD>
          <TD id=m_isgnhand_8695>●</TD>
          <TD id=m_isgnhand_8696>●</TD>
          <TD id=m_isgnhand_8697>●</TD>
          <TD id=m_isgnhand_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ispreventionuv_8687>●</TD>
          <TD id=m_ispreventionuv_8688>●</TD>
          <TD id=m_ispreventionuv_8689>●</TD>
          <TD id=m_ispreventionuv_8690>●</TD>
          <TD id=m_ispreventionuv_8691>●</TD>
          <TD id=m_ispreventionuv_8692>●</TD>
          <TD id=m_ispreventionuv_8693>●</TD>
          <TD id=m_ispreventionuv_8694>●</TD>
          <TD id=m_ispreventionuv_8695>●</TD>
          <TD id=m_ispreventionuv_8696>●</TD>
          <TD id=m_ispreventionuv_8697>●</TD>
          <TD id=m_ispreventionuv_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isermirror_8687>●</TD>
          <TD id=m_isermirror_8688>●</TD>
          <TD id=m_isermirror_8689>●</TD>
          <TD id=m_isermirror_8690>●</TD>
          <TD id=m_isermirror_8691>●</TD>
          <TD id=m_isermirror_8692>●</TD>
          <TD id=m_isermirror_8693>●</TD>
          <TD id=m_isermirror_8694>●</TD>
          <TD id=m_isermirror_8695>●</TD>
          <TD id=m_isermirror_8696>●</TD>
          <TD id=m_isermirror_8697>●</TD>
          <TD id=m_isermirror_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ishotrmirror_8687>●</TD>
          <TD id=m_ishotrmirror_8688>●</TD>
          <TD id=m_ishotrmirror_8689>●</TD>
          <TD id=m_ishotrmirror_8690>●</TD>
          <TD id=m_ishotrmirror_8691>●</TD>
          <TD id=m_ishotrmirror_8692>●</TD>
          <TD id=m_ishotrmirror_8693>●</TD>
          <TD id=m_ishotrmirror_8694>●</TD>
          <TD id=m_ishotrmirror_8695>●</TD>
          <TD id=m_ishotrmirror_8696>●</TD>
          <TD id=m_ishotrmirror_8697>●</TD>
          <TD id=m_ishotrmirror_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_ismemorymirror_8687>-</TD>
          <TD id=m_ismemorymirror_8688>-</TD>
          <TD id=m_ismemorymirror_8689>-</TD>
          <TD id=m_ismemorymirror_8690>-</TD>
          <TD id=m_ismemorymirror_8691>-</TD>
          <TD id=m_ismemorymirror_8692>-</TD>
          <TD id=m_ismemorymirror_8693>●</TD>
          <TD id=m_ismemorymirror_8694>-</TD>
          <TD id=m_ismemorymirror_8695>-</TD>
          <TD id=m_ismemorymirror_8696>●</TD>
          <TD id=m_ismemorymirror_8697>●</TD>
          <TD id=m_ismemorymirror_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_iseprmirror_8687>-</TD>
          <TD id=m_iseprmirror_8688>-</TD>
          <TD id=m_iseprmirror_8689>-</TD>
          <TD id=m_iseprmirror_8690>-</TD>
          <TD id=m_iseprmirror_8691>-</TD>
          <TD id=m_iseprmirror_8692>-</TD>
          <TD id=m_iseprmirror_8693>●</TD>
          <TD id=m_iseprmirror_8694>-</TD>
          <TD id=m_iseprmirror_8695>-</TD>
          <TD id=m_iseprmirror_8696>●</TD>
          <TD id=m_iseprmirror_8697>●</TD>
          <TD id=m_iseprmirror_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_isrmirrorge_8687>-</TD>
          <TD id=m_isrmirrorge_8688>-</TD>
          <TD id=m_isrmirrorge_8689>-</TD>
          <TD id=m_isrmirrorge_8690>-</TD>
          <TD id=m_isrmirrorge_8691>-</TD>
          <TD id=m_isrmirrorge_8692>-</TD>
          <TD id=m_isrmirrorge_8693>●</TD>
          <TD id=m_isrmirrorge_8694>-</TD>
          <TD id=m_isrmirrorge_8695>-</TD>
          <TD id=m_isrmirrorge_8696>●</TD>
          <TD id=m_isrmirrorge_8697>●</TD>
          <TD id=m_isrmirrorge_8698>●</TD></TR>
        <TR class=disc>
          <TD id=m_isbsvisor_8687>●</TD>
          <TD id=m_isbsvisor_8688>●</TD>
          <TD id=m_isbsvisor_8689>●</TD>
          <TD id=m_isbsvisor_8690>●</TD>
          <TD id=m_isbsvisor_8691>●</TD>
          <TD id=m_isbsvisor_8692>●</TD>
          <TD id=m_isbsvisor_8693>●</TD>
          <TD id=m_isbsvisor_8694>●</TD>
          <TD id=m_isbsvisor_8695>●</TD>
          <TD id=m_isbsvisor_8696>●</TD>
          <TD id=m_isbsvisor_8697>●</TD>
          <TD id=m_isbsvisor_8698>●</TD></TR><!--	



			<tr class="hidd" >



				



				


					


						<td id="m_ishbsvisor_8687">●</td>



					


						<td id="m_ishbsvisor_8688">●</td>



					


						<td id="m_ishbsvisor_8689">●</td>



					


						<td id="m_ishbsvisor_8690">●</td>



					


						<td id="m_ishbsvisor_8691">●</td>



					


						<td id="m_ishbsvisor_8692">●</td>



					


						<td id="m_ishbsvisor_8693">●</td>



					


						<td id="m_ishbsvisor_8694">●</td>



					


						<td id="m_ishbsvisor_8695">●</td>



					


						<td id="m_ishbsvisor_8696">●</td>



					


						<td id="m_ishbsvisor_8697">●</td>



					


						<td id="m_ishbsvisor_8698">●</td>



					


							</tr>







			<tr class="hidd" >



				



				


					


						<td id="m_isebsvisor_8687"> - </td>



					


						<td id="m_isebsvisor_8688"> - </td>



					


						<td id="m_isebsvisor_8689"> - </td>



					


						<td id="m_isebsvisor_8690"> - </td>



					


						<td id="m_isebsvisor_8691"> - </td>



					


						<td id="m_isebsvisor_8692"> - </td>



					


						<td id="m_isebsvisor_8693"> - </td>



					


						<td id="m_isebsvisor_8694"> - </td>



					


						<td id="m_isebsvisor_8695"> - </td>



					


						<td id="m_isebsvisor_8696"> - </td>



					


						<td id="m_isebsvisor_8697"> - </td>



					


						<td id="m_isebsvisor_8698"> - </td>



					


							</tr>



-->
        <TR class=hidd>
          <TD id=m_isbssvisor_8687>●</TD>
          <TD id=m_isbssvisor_8688>●</TD>
          <TD id=m_isbssvisor_8689>●</TD>
          <TD id=m_isbssvisor_8690>●</TD>
          <TD id=m_isbssvisor_8691>●</TD>
          <TD id=m_isbssvisor_8692>●</TD>
          <TD id=m_isbssvisor_8693>●</TD>
          <TD id=m_isbssvisor_8694>●</TD>
          <TD id=m_isbssvisor_8695>●</TD>
          <TD id=m_isbssvisor_8696>●</TD>
          <TD id=m_isbssvisor_8697>●</TD>
          <TD id=m_isbssvisor_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_issvisordr_8687>●</TD>
          <TD id=m_issvisordr_8688>●</TD>
          <TD id=m_issvisordr_8689>●</TD>
          <TD id=m_issvisordr_8690>●</TD>
          <TD id=m_issvisordr_8691>●</TD>
          <TD id=m_issvisordr_8692>●</TD>
          <TD id=m_issvisordr_8693>●</TD>
          <TD id=m_issvisordr_8694>●</TD>
          <TD id=m_issvisordr_8695>●</TD>
          <TD id=m_issvisordr_8696>●</TD>
          <TD id=m_issvisordr_8697>●</TD>
          <TD id=m_issvisordr_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isinswiper_8687>●</TD>
          <TD id=m_isinswiper_8688>●</TD>
          <TD id=m_isinswiper_8689>●</TD>
          <TD id=m_isinswiper_8690>●</TD>
          <TD id=m_isinswiper_8691>●</TD>
          <TD id=m_isinswiper_8692>●</TD>
          <TD id=m_isinswiper_8693>●</TD>
          <TD id=m_isinswiper_8694>●</TD>
          <TD id=m_isinswiper_8695>●</TD>
          <TD id=m_isinswiper_8696>●</TD>
          <TD id=m_isinswiper_8697>●</TD>
          <TD id=m_isinswiper_8698>●</TD></TR>
        <TR id=base_15>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8687 scope=col><B href="http://newcar.xcar.com.cn/m8687/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱基本版 </A><I 
            id=base_15_img_8687></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8688 scope=col><B href="http://newcar.xcar.com.cn/m8688/" 
            target=_blank>2011款奥迪A6L 2.0T 手动两驱标准版 </A><I 
            id=base_15_img_8688></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8689 scope=col><B href="http://newcar.xcar.com.cn/m8689/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱标准版 </A><I 
            id=base_15_img_8689></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8690 scope=col><B href="http://newcar.xcar.com.cn/m8690/" 
            target=_blank>2011款奥迪A6L 2.0T CVT两驱舒适版 </A><I 
            id=base_15_img_8690></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8691 scope=col><B href="http://newcar.xcar.com.cn/m8691/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱技术版 </A><I 
            id=base_15_img_8691></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8692 scope=col><B href="http://newcar.xcar.com.cn/m8692/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱舒适版 </A><I 
            id=base_15_img_8692></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8693 scope=col><B href="http://newcar.xcar.com.cn/m8693/" 
            target=_blank>2011款奥迪A6L 2.4L CVT两驱豪华版 </A><I 
            id=base_15_img_8693></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8694 scope=col><B href="http://newcar.xcar.com.cn/m8694/" 
            target=_blank>2011款奥迪A6L 2.7TDI CVT两驱舒适版 </A><I 
            id=base_15_img_8694></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8695 scope=col><B href="http://newcar.xcar.com.cn/m8695/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱舒适版 </A><I 
            id=base_15_img_8695></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8696 scope=col><B href="http://newcar.xcar.com.cn/m8696/" 
            target=_blank>2011款奥迪A6L 2.8FSI CVT两驱豪华版 </A><I 
            id=base_15_img_8696></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8697 scope=col><B href="http://newcar.xcar.com.cn/m8697/" 
            target=_blank>2011款奥迪A6L 2.8FSI 自动四驱豪华版 </A><I 
            id=base_15_img_8697></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8698 scope=col><B href="http://newcar.xcar.com.cn/m8698/" 
            target=_blank>2011款奥迪A6L 3.0TFSI 自动四驱豪华版 </A><I 
            id=base_15_img_8698></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isairc_8687>●</TD>
          <TD id=m_isairc_8688>●</TD>
          <TD id=m_isairc_8689>●</TD>
          <TD id=m_isairc_8690>●</TD>
          <TD id=m_isairc_8691>●</TD>
          <TD id=m_isairc_8692>●</TD>
          <TD id=m_isairc_8693>●</TD>
          <TD id=m_isairc_8694>●</TD>
          <TD id=m_isairc_8695>●</TD>
          <TD id=m_isairc_8696>●</TD>
          <TD id=m_isairc_8697>●</TD>
          <TD id=m_isairc_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbsairo_8687>●</TD>
          <TD id=m_isbsairo_8688>●</TD>
          <TD id=m_isbsairo_8689>●</TD>
          <TD id=m_isbsairo_8690>●</TD>
          <TD id=m_isbsairo_8691>●</TD>
          <TD id=m_isbsairo_8692>●</TD>
          <TD id=m_isbsairo_8693>●</TD>
          <TD id=m_isbsairo_8694>●</TD>
          <TD id=m_isbsairo_8695>●</TD>
          <TD id=m_isbsairo_8696>●</TD>
          <TD id=m_isbsairo_8697>●</TD>
          <TD id=m_isbsairo_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_istempdct_8687>●</TD>
          <TD id=m_istempdct_8688>●</TD>
          <TD id=m_istempdct_8689>●</TD>
          <TD id=m_istempdct_8690>●</TD>
          <TD id=m_istempdct_8691>●</TD>
          <TD id=m_istempdct_8692>●</TD>
          <TD id=m_istempdct_8693>●</TD>
          <TD id=m_istempdct_8694>●</TD>
          <TD id=m_istempdct_8695>●</TD>
          <TD id=m_istempdct_8696>●</TD>
          <TD id=m_istempdct_8697>●</TD>
          <TD id=m_istempdct_8698>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscaricebox_8687>-</TD>
          <TD id=m_iscaricebox_8688>-</TD>
          <TD id=m_iscaricebox_8689>-</TD>
          <TD id=m_iscaricebox_8690>-</TD>
          <TD id=m_iscaricebox_8691>-</TD>
          <TD id=m_iscaricebox_8692>-</TD>
          <TD id=m_iscaricebox_8693>-</TD>
          <TD id=m_iscaricebox_8694>-</TD>
          <TD id=m_iscaricebox_8695>-</TD>
          <TD id=m_iscaricebox_8696>-</TD>
          <TD id=m_iscaricebox_8697>-</TD>
          <TD 
id=m_iscaricebox_8698>-</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
<DIV class=clear></DIV></DIV>
<SCRIPT type=text/javascript src="a6l_files/analytics.htm"></SCRIPT>
<!--登陆js-->
<SCRIPT src="a6l_files/new_login2011_newcar.htm"></SCRIPT>

<SCRIPT language=JavaScript type=text/javascript>

function showhidden(id,i){

		var select_obj=document.getElementsByTagName("SELECT");

		if(i==1){

			document.getElementById(id).style.display="block";

		}else{

			document.getElementById(id).style.display="none";

		}

}



function loaddaohang(){

	var dh = document.getElementById("daohang");

	if(dh){

		if(dh.src=="http://www.xcar.com.cn/bbs/header/daohangindex.php"){



		}else{

		dh.src = "http://www.xcar.com.cn/bbs/header/daohangindex.php";	

		}

	}

	showhidden('listmenu_menu','1');

}

function loaddaohang_cs(){

	var dh = document.getElementById("daohang_cs");

	if(dh){

		if(dh.src=="http://newcar.xcar.com.cn/inc_htm/all_cheshi_list.htm"){



		}else{

		dh.src = "http://newcar.xcar.com.cn/inc_htm/all_cheshi_list.htm";	

		}

	}

	showhidden('listmenu_menu_cs','1');

}

</SCRIPT>
<!--登陆js--><!--尾文件结束--><!--纠错弹出层代码开始-->
<DIV style="DISPLAY: none" id=div_light class=t0401_popw>
<DIV class=t0401_popi>
<P class=t0401_sjjc_p><B onclick=div_light.Close(); 
href="javascript:void(0)"></A>数据纠错</P>
<DIV class=t0401_popc>
<UL class=t0401_ulpop>
  <LI>选择问题所在车型 </LI>
  <LI><SELECT id=mid class=t0401_tpsel onchange=getmid(this.value) name=mid> 
    <OPTION selected value=8687>2011款奥迪A6L 2.0T 手动两驱基本版</OPTION> <OPTION 
    value=8688>2011款奥迪A6L 2.0T 手动两驱标准版</OPTION> <OPTION value=8689>2011款奥迪A6L 
    2.0T CVT两驱标准版</OPTION> <OPTION value=8690>2011款奥迪A6L 2.0T CVT两驱舒适版</OPTION> 
    <OPTION value=8691>2011款奥迪A6L 2.4L CVT两驱技术版</OPTION> <OPTION 
    value=8692>2011款奥迪A6L 2.4L CVT两驱舒适版</OPTION> <OPTION value=8693>2011款奥迪A6L 
    2.4L CVT两驱豪华版</OPTION> <OPTION value=8694>2011款奥迪A6L 2.7TDI 
    CVT两驱舒适版</OPTION> <OPTION value=8695>2011款奥迪A6L 2.8FSI CVT两驱舒适版</OPTION> 
    <OPTION value=8696>2011款奥迪A6L 2.8FSI CVT两驱豪华版</OPTION> <OPTION 
    value=8697>2011款奥迪A6L 2.8FSI 自动四驱豪华版</OPTION> <OPTION value=8698>2011款奥迪A6L 
    3.0TFSI 自动四驱豪华版</OPTION></SELECT> </LI>
  <LI style="MARGIN-TOP: 12px">选择问题所在参数类别 </LI>
  <LI><SPAN id=xml1><SELECT id=Ddlei1 class=t0401_tpsel 
  onchange=getDdlei2(this.value) name=Ddlei1> <OPTION selected 
    value="">-请选择参数大类-</OPTION> <OPTION value=1>基本参数</OPTION> <OPTION 
    value=2>车身参数</OPTION> <OPTION value=3>发动机</OPTION> <OPTION 
    value=4>变速箱</OPTION> <OPTION value=5>底盘转向</OPTION> <OPTION 
    value=6>车轮制动</OPTION> <OPTION value=7>安全配置</OPTION> <OPTION 
    value=8>操控配置</OPTION> <OPTION value=9>外部配置</OPTION> <OPTION 
    value=10>内部配置</OPTION> <OPTION value=11>座椅配置</OPTION> <OPTION 
    value=12>多媒体配置</OPTION> <OPTION value=13>灯光配置</OPTION> <OPTION 
    value=14>玻璃/后视镜</OPTION> <OPTION value=15>空调/冰箱</OPTION> <OPTION 
    value=16>其他</OPTION></SELECT> </SPAN></LI>
  <LI><SPAN id=xml2><SELECT id=Ddlei2 class=t0401_tpsel 
  onchange=getthisvalue(this.value) name=Ddlei2></SELECT> </SPAN><SPAN 
  id=ddlei2_ts></SPAN></LI>
  <LI style="MARGIN-TOP: 6px" id=show_type></LI>
  <LI>我的建议： </LI>
  <LI><TEXTAREA id=message class=t0401_tptext onchange=chg_message(this.value); name=message></TEXTAREA><SPAN 
  id=message_ts></SPAN> </LI>
  <LI><INPUT class=t0401_tpbtn onclick=update_sel(); value=提交 type=button name=""> 
<INPUT class=t0401_tpbtn_b onclick=div_light.Close(); value=关闭 type=button name=""> 
  </LI></UL></DIV></DIV></DIV>
<DIV style="DISPLAY: none" id=div_ok class=t0401_popw>
<DIV class=t0401_popi>
<P class=t0401_sjjc_p><B onclick=div_ok.Close(); 
href="javascript:void(0)"></A>数据纠错</P>
<DIV id=check_ok>
<UL class=t0401_ulpop_b>
  <LI>提交成功，<BR>感谢您对爱卡汽车网的大力支持！
  <LI><INPUT class=t0401_tpbtn_b onclick=div_ok.Close(); value=关闭 type=button name=""></LI></UL></DIV></DIV></DIV><!--纠错弹出层代码结束-->
<SCRIPT language=JavaScript>



var div_light;



var div_ok;



/* 数据纠错图标需要一直显示



$("#Table1 tr[id] th").hover(



  function () {



    var edit_img_id = $(this).find("i").attr("id");



    if(edit_img_id){



    	$("#"+edit_img_id).show();



    }



  },



  function () {



    var edit_img_id = $(this).find("i").attr("id");



    if(edit_img_id){



    	$("#"+edit_img_id).show();



    }



  }



); */







$(document).ready(function(){



	$("#Table1 tr[id] th img").css("cursor","pointer").click(function(){



		var modid = $(this).parent().parent().attr("id").replace('mod_','');



		var baseid = $(this).parent().parent().parent().attr("id").replace('base_','');







		$("#mid option[value='"+modid+"']").attr("selected","selected");



		$("#Ddlei1 option[value='"+baseid+"']").attr("selected","selected");



		$("#show_type").hide();



		//$("#div_ok").hide();



		//$("#div_light").show();



		div_ok.Close();



		div_light.Show();



		getDdlei2(baseid);



		return false;



	});



	$("#jiucuo_01").css("cursor","pointer").click(function(){



		var modid = $("#Table1 tr[id] th img").parent().parent().attr("id").replace('mod_','');



		var baseid = "";







		$("#mid option[value='"+modid+"']").attr("selected","selected");



		$("#Ddlei1 option[value='"+baseid+"']").attr("selected","selected");



		$("#show_type").hide();



		//$("#div_ok").hide();



		//$("#div_light").show();



		div_ok.Close();



		div_light.Show();



		getDdlei2(baseid);



		return false;



	});



	//用于处理说明宽度



	var s= "var st = Math.max(";



	$("td[tag='m_other']").each(function(){



		s+=jQuery.trim($(this).html()).length;



		s+=",";



	})



	s+="-1);"



	eval(s);



	if(-1!=st){



		b = Math.ceil(st/8);



		$("#16_m_other").css("height",b*22+1);



	}	

	$($("#Table1 a")).click(function(){
		open($(this).attr('href'));						 
	})
	$("#Table1 tr[class]").toggle(function(){



		var index = $("#Table1 tr[class]").index(this)+1;



		$("#menu").find("tr").each(function(i){



			if($(this).attr("id"))index++;



			if(i==index){$(this).find("td").addClass("bgSelect");return false;}



		})



		$(this).find("td").addClass("bgSelect");



	},function(){



		var index = $("#Table1 tr[class]").index(this)+1;



		$("#menu").find("tr").each(function(i){



			if($(this).attr("id"))index++;



			if(i==index){$(this).find("td").removeClass("bgSelect");return false;}



		})



		$(this).find("td").removeClass("bgSelect");



	});



	div_light = new LightBox("div_light");



	div_light.Center = true;



	div_ok = new LightBox("div_ok");



	div_ok.Center = true;



});



function getDdlei2(baseid){



	if(baseid){



		$("#Ddlei2").empty();



		var option = "<option value='' selected>-请选择参数小类-</option>";



		$(".title[id^="+baseid+"_]").each(function(){



			var v = $(this).attr("id").replace(baseid+'_','');



			var n = $(this).html().replace('：','');



			option += "<option value='"+v+"'>"+n+"</option>";



		});



		$(option).appendTo($("#Ddlei2"));



	}else{



		$("#Ddlei2").empty();



		$("<option value='' selected>-请选择参数小类-</option>").appendTo($("#Ddlei2"));



	//	$("#ddlei2_ts").html("<i>请选择参数</i>");



	}



	$("#show_type").html("当前值为：<em></em> ").hide();



}



function getthisvalue(Ddlei2){



	if(Ddlei2){



		var m = $("#mid").val();



		var v = $("#"+Ddlei2+"_"+m).html();



		if(v){



			$("#show_type").html("当前值为：<em>"+v+"&nbsp;<i>（我认为有错）</i></em> ").show();



		}else{



			$("#show_type").html("当前值为：<i>暂无数据</i>").show();



		}		



		err_ddlei2 = "<i></i>";



	}else{



		$("#show_type").html("当前值为：<em>"+v+"&nbsp;<i>（我认为有错）</i></em> ").hide();



		err_ddlei2 = "<i>请选择参数</i>";



	}



	$("#ddlei2_ts").html(err_ddlei2);



}







function getmid(mid)



{



	var Ddlei2 = $("#Ddlei2").val();



	if(Ddlei2){



		var v = $("#"+Ddlei2+"_"+mid).html();



		if(v){



			$("#show_type").html("当前值为：<em>"+v+"&nbsp;<i>（我认为有错）</i></em> ").show();



		}else{



			$("#show_type").html("当前值为：<i>暂无数据</i>").show();



		}		



	}else{



		$("#show_type").html("当前值为：<em>"+v+"&nbsp;<i>（我认为有错）</i></em> ").hide();



	}



}







function update_sel(){



	var mid = $("#mid").val();



	var Ddlei2 = $("#Ddlei2").val();



	var message = $("#message").val();



	var type_v = $("#"+Ddlei2+"_"+mid).html();



	if(Ddlei2 =='' || message ==''){



		if(Ddlei2 ==''){



			$("#ddlei2_ts").html("<i>请选择参数</i>");



		}



		if(message ==''){



			$("#message_ts").html("<i>请输入您的建议</i>");



		}



		return false;



	}



	$.get("/ps_correction.php",'mid='+mid+'&ddlei2='+Ddlei2+'&message='+encodeURIComponent(message)+'&type_v='+encodeURIComponent(type_v)+'&t='+new Date().getTime(),



		function(msg){



			 if(msg == "true"){



				msg_show="<ul class='t0401_ulpop_b'><li>提交成功，<br>感谢您对爱卡汽车网的大力支持！</li><li><input name='' type='button' class='t0401_tpbtn_b' value='关闭' onclick='div_ok.Close();'/></li></ul>";



			 }else{



				msg_show="<ul class='t0401_ulpop_b'><li>提交失败，<br>请重新提交！</li><li><input name='' type='button' class='t0401_tpbtn_b' value='关闭' onclick='div_ok.Close();'/></li></ul>";



			 }



			 $("#check_ok").html(msg_show);



			 $("#message").val('');



			 //$("#div_light").hide();



			 div_light.Close();



			 div_ok.Show();



			 //$("#div_ok").show();



	});



}







function chg_message(message)



{



	if(message ==''){



		err_message = "<i>请输入您的建议</i>";



	}else{



		err_message = "<i></i>";



	}



	$("#message_ts").html(err_message);



	return false;



}







//zhj2010.11.11	对复选框最后一个判断



function chg_checkbox(test,maxnum,key,msg)



{



	var checkboxid = test + "_" + key;		//默认的id值



	



	if($("#" + checkboxid).attr("checked") == false)



	{



		for(a=0; a<maxnum; a++)



		{



			if($("#" + test + "_" + a).attr("checked") == true)



			{



			//	alert(a + "勾选");	有勾选项，跳出



				getstuynp(checkboxid);



				return false;



			}



		}



		alert("至少选择" + msg);



		$("#" + checkboxid).attr("checked",true);



		return false;



	}



	else



	{



		getstuynp(checkboxid);



	}



}



function getstuynp(checkboxid)



{



	stuYNP(checkboxid);



}



</SCRIPT>

<SCRIPT language=javascript>

	var pbid = parseInt(document.getElementById('pbid').value);

	var p_serid = parseInt(document.getElementById('p_serid').value);

	init_pbrand_newcar();

	if(pbid > 0){

		document.getElementById('fctbox').value = pbid;

		search_pserid_newcar();

		document.getElementById('brbox').value = p_serid;

	}

</SCRIPT>

<SCRIPT language=JavaScript type=text/javascript>

	<!--

	function show(id,num,box,btn){

	    for(var i=1;i<num;i++){

	        if(i == parseInt(id)){

	            document.getElementById(box+id).style.display = "block";

	            document.getElementById(btn+id).className = "active";

	        }else{

	            document.getElementById(box+i).style.display = "none";

	            document.getElementById(btn+i).className = "";

	        }

	    }

	} 

	//-->

</SCRIPT>

<SCRIPT type=text/javascript>

	//显示或隐藏菜单

	function showOrHideMenu(id,flag)

	{

		var info_obj = $("#info_"+id);

		var next_b_obj = info_obj.find("th b").eq(0);

		if("undefined"== typeof flag){

			var h_flag = next_b_obj.attr("class")=="t0709_ba2"?true:false;

		}else{

			var h_flag = flag;

		}

		var name_config_status = $("input[name='show_config']").eq(0).attr("checked");

		var baseCache = new Array();

		$("#base_"+id).nextAll("tr").each(function(i){

			if($(this).attr("id")!=""){

				return false;

			}



			if(false==h_flag){

				if($(this).attr("class")=="hidd"){

					true==name_config_status?$(this).show():baseCache.push(i);

				}else{

					$(this).show();

				}

			}else{

				$(this).hide();

			}

		});

	

		info_obj.nextAll("tr").each(function(i){

			if($(this).attr("id")!=""){

				return false;

			}



			if(false==h_flag){

				if(false==name_config_status){

					for (j in baseCache){

						if(i==baseCache[j]){

							return true;

						}

					}

					$(this).show();

				}else{

					$(this).show();

				}

			}else{

				$(this).hide();

			}

		})

	

		if(true==h_flag){

			next_b_obj.removeClass("t0709_ba2").addClass("t0709_ba1");

		}else{

			next_b_obj.removeClass("t0709_ba1").addClass("t0709_ba2");

		}

	}

	

	var MTCache = new Array();

	function setDiscoveredOrHidden(flag)

	{

		var hide_flag = 1==flag?false:true;

		var oMenu = $("#menu");

		var oTable = $("#Table1");

		if(MTCache.length>0){

			if(false==hide_flag)

			{

				for(var z=0;z<=16;z++)

				{

					showOrHideMenu(z,false);		

				}

				return;

			}else{

				oMenu.find("tr").each(function(i){

				for (j in MTCache)

				{

					if(MTCache[j]==i){

						false==hide_flag?$(this).show():$(this).hide();

						break;

					}

				}

				});

				oTable.find("tr").each(function(i){

					for (j in MTCache){

						if(MTCache[j]==i){

							false==hide_flag?$(this).show():$(this).hide();

							break;

						}

					}

				});

			}

		}else{

			oTable.find("tr").each(function(i){

				if($(this).attr("class")=="hidd"){

					$(this).hide();

					MTCache.push(i);

				}

			})

	

			oMenu.find("tr").each(function(i){

				for (j in MTCache){

					if(MTCache[j]==i){

						$(this).hide();

						break;

					}

				}

			});

		}

	}



	

		var isIE6 = -1!=navigator.userAgent.indexOf("MSIE 6.0");

		window.setInterval(function(){

		var offset = $(document).scrollLeft();

	

		if(isIE6){

			var move_x = 0;

		}else{

			var move_x = (parseInt(document.body.clientWidth)-955)/2;

		}

	

		if(offset>move_x){

			offset = offset-move_x;

		}else{

			offset="0px";

		}

		$("#menu").css("left",offset);

	 },10);

		

	$("#highlight").click(function(){

		highlight();

	});

	

	$(document).ready(highlight());

	

	

	function highlight()

	{

		var oTable = $("#Table1");

		var is_check = $("#highlight").attr("checked");



		oTable.find("tr").each(function(i){

			if($(this).attr("class")=="disc")

			{

				if(is_check){

					$(this).find('td').addClass('bgSelect');

					$("#menu tr:nth-child("+(i+1)+")").find("td").addClass("bgSelect");

				}else{

					$(this).find('td').removeClass('bgSelect');

					$("#menu tr:nth-child("+(i+1)+")").find("td").removeClass("bgSelect");

				}

			}else{

				$(this).find('td').removeClass('bgSelect');

				$("#menu tr:nth-child("+(i+1)+")").find("td").removeClass("bgSelect");

			}

		})	

	}

	</SCRIPT>

<SCRIPT language=JavaScript type=text/javascript 
src="a6l_files/news_forall.js"></SCRIPT>

<SCRIPT type=text/javascript src="a6l_files/dw.js"></SCRIPT>

<SCRIPT>

DW.pageParams = {

  siteid: 115

};

DW.clear();

</SCRIPT>

<SCRIPT type=text/javascript> 

  var _gaq = _gaq || [];

  _gaq.push(['_setAccount', 'UA-20279465-3']);

  _gaq.push(['_setDomainName', '.xcar.com.cn']);

  _gaq.push(['_trackPageview']);

 

  (function() {

    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;

    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';

    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

  })();

</SCRIPT>

<SCRIPT type=text/javascript> 

var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");

document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F53eb54d089f7b5dd4ae2927686b183e0' type='text/javascript'%3E%3C/script%3E"));

</SCRIPT>
</BODY></HTML>
