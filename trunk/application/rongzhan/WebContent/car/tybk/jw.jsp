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
  onclick="chg_checkbox('seriseCheckbox','3','0','一个子车系')" value=1,2,3,4,5,6 
  CHECKED type=checkbox>2012款君威</LI>
  <LI><INPUT id=seriseCheckbox_1 class=t1126_teys 
  onclick="chg_checkbox('seriseCheckbox','3','1','一个子车系')" value=7,8,9 CHECKED 
  type=checkbox>2011款君威</LI>
  <LI><INPUT id=seriseCheckbox_2 class=t1126_teys 
  onclick="chg_checkbox('seriseCheckbox','3','2','一个子车系')" value=10,11,12,13,14 
  CHECKED type=checkbox>2010款君威</LI></UL><EM class=b>排量：</EM> 
<UL class=x>
  <LI><INPUT id=dislCheckbox_0 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','3','0','一种发动机')" value=1,10 CHECKED 
  type=checkbox>1.6T</LI>
  <LI><INPUT id=dislCheckbox_1 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','3','1','一种发动机')" value=2,3,4,11,12,13,14 
  CHECKED type=checkbox>2.0T</LI>
  <LI><INPUT id=dislCheckbox_2 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','3','2','一种发动机')" value=5,6,7,8,9 CHECKED 
  type=checkbox>2.4L</LI></UL><EM class=c>变速箱：</EM> 
<UL class=y>
  <LI><INPUT id=transtypeCheckbox_0 class=t1126_teys 
  onclick="chg_checkbox('transtypeCheckbox','2','0','一种变速箱')" value=1,10 CHECKED 
  type=checkbox>手动变速箱</LI>
  <LI><INPUT id=transtypeCheckbox_1 class=t1126_teys 
  onclick="chg_checkbox('transtypeCheckbox','2','1','一种变速箱')" 
  value=2,3,4,5,6,7,8,9,11,12,13,14 CHECKED type=checkbox>自动变速箱</LI></UL></DIV>
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
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; BORDER-RIGHT: 0px; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 156px !important" 
            src="【君威】君威%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/t1125arr_e.gif" 
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
      <TABLE style="BORDER-LEFT: 0px" id=Table1 class=t1125_se_tab border=0 
      cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
        <TR>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【君威】君威%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【君威】君威%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【君威】君威%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【君威】君威%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【君威】君威%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【君威】君威%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【君威】君威%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【君威】君威%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【君威】君威%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【君威】君威%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【君威】君威%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【君威】君威%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【君威】君威%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【君威】君威%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH></TR>
        <TR id=base_1>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10884 scope=col><B href="#/m10884/" 
            target=_blank>2012款君威 1.6T 精英运动版 </A><I id=base_1_img_10884></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10885 scope=col><B href="#/m10885/" 
            target=_blank>2012款君威 2.0L 舒适版 </A><I id=base_1_img_10885></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10886 scope=col><B href="#/m10886/" 
            target=_blank>2012款君威 2.0L 豪华版 </A><I id=base_1_img_10886></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10889 scope=col><B href="#/m10889/" 
            target=_blank>2012款君威 2.0T 豪华运动版 </A><I id=base_1_img_10889></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10887 scope=col><B href="#/m10887/" 
            target=_blank>2012款君威 2.4L SIDI精英版 </A><I id=base_1_img_10887></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10888 scope=col><B href="#/m10888/" 
            target=_blank>2012款君威 2.4L SIDI旗舰版 </A><I id=base_1_img_10888></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8769 scope=col><B href="#/m8769/" 
            target=_blank>2011款君威 2.4L SIDI舒适版(停产) </A><I 
            id=base_1_img_8769></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8770 scope=col><B href="#/m8770/" 
            target=_blank>2011款君威 2.4L SIDI精英版(停产) </A><I 
            id=base_1_img_8770></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8771 scope=col><B href="#/m8771/" 
            target=_blank>2011款君威 2.4L SIDI旗舰版(停产) </A><I 
            id=base_1_img_8771></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6934 scope=col><B href="#/m6934/" 
            target=_blank>2010款君威 1.6T 精英运动版(停产) </A><I id=base_1_img_6934></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9216 scope=col><B href="#/m9216/" 
            target=_blank>2010款君威 2.0L 舒适版(停产) </A><I id=base_1_img_9216></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6935 scope=col><B href="#/m6935/" 
            target=_blank>2010款君威 2.0L 世博版(停产) </A><I id=base_1_img_6935></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6938 scope=col><B href="#/m6938/" 
            target=_blank>2010款君威 2.0T 豪华运动版(停产) </A><I id=base_1_img_6938></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6939 scope=col><B href="#/m6939/" 
            target=_blank>2010款君威 2.0T 旗舰运动版(停产) </A><I id=base_1_img_6939></I> </TH></TR>
        <TR class=disc>
          <TD id=min_price_10884>20.69万</TD>
          <TD id=min_price_10885>18.59万</TD>
          <TD id=min_price_10886>20.39万</TD>
          <TD id=min_price_10889>25.99万</TD>
          <TD id=min_price_10887>23.09万</TD>
          <TD id=min_price_10888>25.59万</TD>
          <TD id=min_price_8769>20.59万</TD>
          <TD id=min_price_8770>23.09万</TD>
          <TD id=min_price_8771>25.09万</TD>
          <TD id=min_price_6934>20.69万</TD>
          <TD id=min_price_9216>18.49万</TD>
          <TD id=min_price_6935>20.39万</TD>
          <TD id=min_price_6938>25.89万</TD>
          <TD id=min_price_6939>26.99万</TD></TR>
        <TR class=hidd>
          <TD id=bname_10884><B title=上海通用别克 
            href="#/price/b3/" 
          target=_blank>上海通用别克</A></TD>
          <TD id=bname_10885><B title=上海通用别克 
            href="#/price/b3/" 
          target=_blank>上海通用别克</A></TD>
          <TD id=bname_10886><B title=上海通用别克 
            href="#/price/b3/" 
          target=_blank>上海通用别克</A></TD>
          <TD id=bname_10889><B title=上海通用别克 
            href="#/price/b3/" 
          target=_blank>上海通用别克</A></TD>
          <TD id=bname_10887><B title=上海通用别克 
            href="#/price/b3/" 
          target=_blank>上海通用别克</A></TD>
          <TD id=bname_10888><B title=上海通用别克 
            href="#/price/b3/" 
          target=_blank>上海通用别克</A></TD>
          <TD id=bname_8769><B title=上海通用别克 
            href="#/price/b3/" 
          target=_blank>上海通用别克</A></TD>
          <TD id=bname_8770><B title=上海通用别克 
            href="#/price/b3/" 
          target=_blank>上海通用别克</A></TD>
          <TD id=bname_8771><B title=上海通用别克 
            href="#/price/b3/" 
          target=_blank>上海通用别克</A></TD>
          <TD id=bname_6934><B title=上海通用别克 
            href="#/price/b3/" 
          target=_blank>上海通用别克</A></TD>
          <TD id=bname_9216><B title=上海通用别克 
            href="#/price/b3/" 
          target=_blank>上海通用别克</A></TD>
          <TD id=bname_6935><B title=上海通用别克 
            href="#/price/b3/" 
          target=_blank>上海通用别克</A></TD>
          <TD id=bname_6938><B title=上海通用别克 
            href="#/price/b3/" 
          target=_blank>上海通用别克</A></TD>
          <TD id=bname_6939><B title=上海通用别克 
            href="#/price/b3/" 
          target=_blank>上海通用别克</A></TD></TR>
        <TR class=hidd>
          <TD id=type2_10884><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10885><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10886><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10889><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10887><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10888><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_8769><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_8770><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_8771><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_6934><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_9216><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_6935><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_6938><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_6939><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD></TR>
        <TR class=disc>
          <TD id=m_disl_10884>1.6L 132kW </TD>
          <TD id=m_disl_10885>2.0L 108kW </TD>
          <TD id=m_disl_10886>2.0L 108kW </TD>
          <TD id=m_disl_10889>2.0L 162kW </TD>
          <TD id=m_disl_10887>2.4L 137kW </TD>
          <TD id=m_disl_10888>2.4L 137kW </TD>
          <TD id=m_disl_8769>2.4L 137kW </TD>
          <TD id=m_disl_8770>2.4L 137kW </TD>
          <TD id=m_disl_8771>2.4L 137kW </TD>
          <TD id=m_disl_6934>1.6L 132kW </TD>
          <TD id=m_disl_9216>2.0L 108kW </TD>
          <TD id=m_disl_6935>2.0L 108kW </TD>
          <TD id=m_disl_6938>2.0L 162kW </TD>
          <TD id=m_disl_6939>2.0L 162kW </TD></TR>
        <TR class=disc>
          <TD id=m_transtype_10884>6挡手动</TD>
          <TD id=m_transtype_10885>6挡自动</TD>
          <TD id=m_transtype_10886>6挡自动</TD>
          <TD id=m_transtype_10889>6挡自动</TD>
          <TD id=m_transtype_10887>6挡自动</TD>
          <TD id=m_transtype_10888>6挡自动</TD>
          <TD id=m_transtype_8769>6挡自动</TD>
          <TD id=m_transtype_8770>6挡自动</TD>
          <TD id=m_transtype_8771>6挡自动</TD>
          <TD id=m_transtype_6934>6挡手动</TD>
          <TD id=m_transtype_9216>6挡自动</TD>
          <TD id=m_transtype_6935>6挡自动</TD>
          <TD id=m_transtype_6938>6挡自动</TD>
          <TD id=m_transtype_6939>6挡自动</TD></TR>
        <TR class=hidd>
          <TD id=m_length_width_height_10884><!---->4830×1856×1484 <!----></TD>
          <TD id=m_length_width_height_10885><!---->4830×1856×1484 <!----></TD>
          <TD id=m_length_width_height_10886><!---->4830×1856×1484 <!----></TD>
          <TD id=m_length_width_height_10889><!---->4830×1856×1484 <!----></TD>
          <TD id=m_length_width_height_10887><!---->4830×1856×1484 <!----></TD>
          <TD id=m_length_width_height_10888><!---->4830×1856×1484 <!----></TD>
          <TD id=m_length_width_height_8769><!---->4830×1856×1484 <!----></TD>
          <TD id=m_length_width_height_8770><!---->4830×1856×1484 <!----></TD>
          <TD id=m_length_width_height_8771><!---->4830×1856×1484 <!----></TD>
          <TD id=m_length_width_height_6934><!---->4830×1856×1484 <!----></TD>
          <TD id=m_length_width_height_9216><!---->4830×1856×1484 <!----></TD>
          <TD id=m_length_width_height_6935><!---->4830×1856×1484 <!----></TD>
          <TD id=m_length_width_height_6938><!---->4830×1856×1484 <!----></TD>
          <TD id=m_length_width_height_6939><!---->4830×1856×1484 
<!----></TD></TR>
        <TR class=hidd>
          <TD id=m_frame_10884>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10885>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10886>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10889>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10887>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10888>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8769>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8770>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8771>4门 5座 三厢轿车</TD>
          <TD id=m_frame_6934>4门 5座 三厢轿车</TD>
          <TD id=m_frame_9216>4门 5座 三厢轿车</TD>
          <TD id=m_frame_6935>4门 5座 三厢轿车</TD>
          <TD id=m_frame_6938>4门 5座 三厢轿车</TD>
          <TD id=m_frame_6939>4门 5座 三厢轿车</TD></TR>
        <TR class=disc>
          <TD id=syear_10884>2012</TD>
          <TD id=syear_10885>2012</TD>
          <TD id=syear_10886>2012</TD>
          <TD id=syear_10889>2012</TD>
          <TD id=syear_10887>2012</TD>
          <TD id=syear_10888>2012</TD>
          <TD id=syear_8769>2011</TD>
          <TD id=syear_8770>2011</TD>
          <TD id=syear_8771>2011</TD>
          <TD id=syear_6934>2010</TD>
          <TD id=syear_9216>2010</TD>
          <TD id=syear_6935>2010</TD>
          <TD id=syear_6938>2010</TD>
          <TD id=syear_6939>2010</TD></TR>
        <TR class=disc>
          <TD id=m_mspeed_10884>210</TD>
          <TD id=m_mspeed_10885>197</TD>
          <TD id=m_mspeed_10886>197</TD>
          <TD id=m_mspeed_10889>232</TD>
          <TD id=m_mspeed_10887>210</TD>
          <TD id=m_mspeed_10888>210</TD>
          <TD id=m_mspeed_8769>210</TD>
          <TD id=m_mspeed_8770>210</TD>
          <TD id=m_mspeed_8771>210</TD>
          <TD id=m_mspeed_6934>215</TD>
          <TD id=m_mspeed_9216>197</TD>
          <TD id=m_mspeed_6935>197</TD>
          <TD id=m_mspeed_6938>232</TD>
          <TD id=m_mspeed_6939>232</TD></TR>
        <TR class=disc>
          <TD id=m_hatime_10884>9.5</TD>
          <TD id=m_hatime_10885>11.7</TD>
          <TD id=m_hatime_10886>11.7</TD>
          <TD id=m_hatime_10889>7.3</TD>
          <TD id=m_hatime_10887>9.5</TD>
          <TD id=m_hatime_10888>9.5</TD>
          <TD id=m_hatime_8769>9.5</TD>
          <TD id=m_hatime_8770>9.5</TD>
          <TD id=m_hatime_8771>9.5</TD>
          <TD id=m_hatime_6934>9.2</TD>
          <TD id=m_hatime_9216>11.4</TD>
          <TD id=m_hatime_6935>11.4</TD>
          <TD id=m_hatime_6938>7.7</TD>
          <TD id=m_hatime_6939>7.7</TD></TR>
        <TR class=disc>
          <TD id=m_comfuel_10884>- </TD>
          <TD id=m_comfuel_10885>- </TD>
          <TD id=m_comfuel_10886>- </TD>
          <TD id=m_comfuel_10889>- </TD>
          <TD id=m_comfuel_10887>- </TD>
          <TD id=m_comfuel_10888>- </TD>
          <TD id=m_comfuel_8769>8.8</TD>
          <TD id=m_comfuel_8770>8.8</TD>
          <TD id=m_comfuel_8771>8.8</TD>
          <TD id=m_comfuel_6934>7.9</TD>
          <TD id=m_comfuel_9216>- </TD>
          <TD id=m_comfuel_6935>8.8</TD>
          <TD id=m_comfuel_6938>9.6</TD>
          <TD id=m_comfuel_6939>9.6</TD></TR>
        <TR class=disc>
          <TD id=m_lkmfuel_10884>- </TD>
          <TD id=m_lkmfuel_10885>- </TD>
          <TD id=m_lkmfuel_10886>- </TD>
          <TD id=m_lkmfuel_10889>- </TD>
          <TD id=m_lkmfuel_10887>- </TD>
          <TD id=m_lkmfuel_10888>- </TD>
          <TD id=m_lkmfuel_8769>- </TD>
          <TD id=m_lkmfuel_8770>- </TD>
          <TD id=m_lkmfuel_8771>- </TD>
          <TD id=m_lkmfuel_6934>6.4</TD>
          <TD id=m_lkmfuel_9216>5.6</TD>
          <TD id=m_lkmfuel_6935>5.6</TD>
          <TD id=m_lkmfuel_6938>6.6</TD>
          <TD id=m_lkmfuel_6939>6.6</TD></TR>
        <TR class=disc>
          <TD id=m_hkmfuel_10884>- </TD>
          <TD id=m_hkmfuel_10885>- </TD>
          <TD id=m_hkmfuel_10886>- </TD>
          <TD id=m_hkmfuel_10889>- </TD>
          <TD id=m_hkmfuel_10887>- </TD>
          <TD id=m_hkmfuel_10888>- </TD>
          <TD id=m_hkmfuel_8769>- </TD>
          <TD id=m_hkmfuel_8770>- </TD>
          <TD id=m_hkmfuel_8771>- </TD>
          <TD id=m_hkmfuel_6934>90</TD>
          <TD id=m_hkmfuel_9216>90</TD>
          <TD id=m_hkmfuel_6935>90</TD>
          <TD id=m_hkmfuel_6938>90</TD>
          <TD id=m_hkmfuel_6939>90</TD></TR>
        <TR class=hidd>
          <TD id=m_ypolicy_10884>2年6万公里 </TD>
          <TD id=m_ypolicy_10885>2年6万公里 </TD>
          <TD id=m_ypolicy_10886>2年6万公里 </TD>
          <TD id=m_ypolicy_10889>2年6万公里 </TD>
          <TD id=m_ypolicy_10887>2年6万公里 </TD>
          <TD id=m_ypolicy_10888>2年6万公里 </TD>
          <TD id=m_ypolicy_8769>2年6万公里 </TD>
          <TD id=m_ypolicy_8770>2年6万公里 </TD>
          <TD id=m_ypolicy_8771>2年6万公里 </TD>
          <TD id=m_ypolicy_6934>2年6万公里 </TD>
          <TD id=m_ypolicy_9216>2年6万公里 </TD>
          <TD id=m_ypolicy_6935>2年6万公里 </TD>
          <TD id=m_ypolicy_6938>2年6万公里 </TD>
          <TD id=m_ypolicy_6939>2年6万公里 </TD></TR>
        <TR id=base_2>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10884 scope=col><B href="#/m10884/" 
            target=_blank>2012款君威 1.6T 精英运动版</A> <I id=base_2_img_10884></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10885 scope=col><B href="#/m10885/" 
            target=_blank>2012款君威 2.0L 舒适版</A> <I id=base_2_img_10885></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10886 scope=col><B href="#/m10886/" 
            target=_blank>2012款君威 2.0L 豪华版</A> <I id=base_2_img_10886></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10889 scope=col><B href="#/m10889/" 
            target=_blank>2012款君威 2.0T 豪华运动版</A> <I id=base_2_img_10889></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10887 scope=col><B href="#/m10887/" 
            target=_blank>2012款君威 2.4L SIDI精英版</A> <I id=base_2_img_10887></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10888 scope=col><B href="#/m10888/" 
            target=_blank>2012款君威 2.4L SIDI旗舰版</A> <I id=base_2_img_10888></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8769 scope=col><B href="#/m8769/" 
            target=_blank>2011款君威 2.4L SIDI舒适版(停产)</A> <I 
            id=base_2_img_8769></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8770 scope=col><B href="#/m8770/" 
            target=_blank>2011款君威 2.4L SIDI精英版(停产)</A> <I 
            id=base_2_img_8770></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8771 scope=col><B href="#/m8771/" 
            target=_blank>2011款君威 2.4L SIDI旗舰版(停产)</A> <I 
            id=base_2_img_8771></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6934 scope=col><B href="#/m6934/" 
            target=_blank>2010款君威 1.6T 精英运动版(停产)</A> <I id=base_2_img_6934></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9216 scope=col><B href="#/m9216/" 
            target=_blank>2010款君威 2.0L 舒适版(停产)</A> <I id=base_2_img_9216></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6935 scope=col><B href="#/m6935/" 
            target=_blank>2010款君威 2.0L 世博版(停产)</A> <I id=base_2_img_6935></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6938 scope=col><B href="#/m6938/" 
            target=_blank>2010款君威 2.0T 豪华运动版(停产)</A> <I id=base_2_img_6938></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6939 scope=col><B href="#/m6939/" 
            target=_blank>2010款君威 2.0T 旗舰运动版(停产)</A> <I id=base_2_img_6939></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_length_10884>4830</TD>
          <TD id=m_length_10885>4830</TD>
          <TD id=m_length_10886>4830</TD>
          <TD id=m_length_10889>4830</TD>
          <TD id=m_length_10887>4830</TD>
          <TD id=m_length_10888>4830</TD>
          <TD id=m_length_8769>4830</TD>
          <TD id=m_length_8770>4830</TD>
          <TD id=m_length_8771>4830</TD>
          <TD id=m_length_6934>4830</TD>
          <TD id=m_length_9216>4830</TD>
          <TD id=m_length_6935>4830</TD>
          <TD id=m_length_6938>4830</TD>
          <TD id=m_length_6939>4830</TD></TR>
        <TR class=hidd>
          <TD id=m_width_10884>1856</TD>
          <TD id=m_width_10885>1856</TD>
          <TD id=m_width_10886>1856</TD>
          <TD id=m_width_10889>1856</TD>
          <TD id=m_width_10887>1856</TD>
          <TD id=m_width_10888>1856</TD>
          <TD id=m_width_8769>1856</TD>
          <TD id=m_width_8770>1856</TD>
          <TD id=m_width_8771>1856</TD>
          <TD id=m_width_6934>1856</TD>
          <TD id=m_width_9216>1856</TD>
          <TD id=m_width_6935>1856</TD>
          <TD id=m_width_6938>1856</TD>
          <TD id=m_width_6939>1856</TD></TR>
        <TR class=hidd>
          <TD id=m_height_10884>1484</TD>
          <TD id=m_height_10885>1484</TD>
          <TD id=m_height_10886>1484</TD>
          <TD id=m_height_10889>1484</TD>
          <TD id=m_height_10887>1484</TD>
          <TD id=m_height_10888>1484</TD>
          <TD id=m_height_8769>1484</TD>
          <TD id=m_height_8770>1484</TD>
          <TD id=m_height_8771>1484</TD>
          <TD id=m_height_6934>1484</TD>
          <TD id=m_height_9216>1484</TD>
          <TD id=m_height_6935>1484</TD>
          <TD id=m_height_6938>1484</TD>
          <TD id=m_height_6939>1484</TD></TR>
        <TR class=hidd>
          <TD id=m_wheelbase_10884>2737</TD>
          <TD id=m_wheelbase_10885>2737</TD>
          <TD id=m_wheelbase_10886>2737</TD>
          <TD id=m_wheelbase_10889>2737</TD>
          <TD id=m_wheelbase_10887>2737</TD>
          <TD id=m_wheelbase_10888>2737</TD>
          <TD id=m_wheelbase_8769>2737</TD>
          <TD id=m_wheelbase_8770>2737</TD>
          <TD id=m_wheelbase_8771>2737</TD>
          <TD id=m_wheelbase_6934>2737</TD>
          <TD id=m_wheelbase_9216>2737</TD>
          <TD id=m_wheelbase_6935>2737</TD>
          <TD id=m_wheelbase_6938>2737</TD>
          <TD id=m_wheelbase_6939>2737</TD></TR>
        <TR class=disc>
          <TD id=m_weight_10884>1545</TD>
          <TD id=m_weight_10885>1585</TD>
          <TD id=m_weight_10886>1585</TD>
          <TD id=m_weight_10889>1650</TD>
          <TD id=m_weight_10887>1590</TD>
          <TD id=m_weight_10888>1615</TD>
          <TD id=m_weight_8769>1590</TD>
          <TD id=m_weight_8770>1590</TD>
          <TD id=m_weight_8771>1590</TD>
          <TD id=m_weight_6934>1545</TD>
          <TD id=m_weight_9216>1555</TD>
          <TD id=m_weight_6935>1555</TD>
          <TD id=m_weight_6938>1650</TD>
          <TD id=m_weight_6939>1650</TD></TR>
        <TR class=hidd>
          <TD id=m_clearance_10884>160</TD>
          <TD id=m_clearance_10885>160</TD>
          <TD id=m_clearance_10886>160</TD>
          <TD id=m_clearance_10889>160</TD>
          <TD id=m_clearance_10887>160</TD>
          <TD id=m_clearance_10888>160</TD>
          <TD id=m_clearance_8769>160</TD>
          <TD id=m_clearance_8770>160</TD>
          <TD id=m_clearance_8771>160</TD>
          <TD id=m_clearance_6934>160</TD>
          <TD id=m_clearance_9216>160</TD>
          <TD id=m_clearance_6935>160</TD>
          <TD id=m_clearance_6938>160</TD>
          <TD id=m_clearance_6939>160</TD></TR>
        <TR class=hidd>
          <TD id=m_frame2_10884>三厢轿车</TD>
          <TD id=m_frame2_10885>三厢轿车</TD>
          <TD id=m_frame2_10886>三厢轿车</TD>
          <TD id=m_frame2_10889>三厢轿车</TD>
          <TD id=m_frame2_10887>三厢轿车</TD>
          <TD id=m_frame2_10888>三厢轿车</TD>
          <TD id=m_frame2_8769>三厢轿车</TD>
          <TD id=m_frame2_8770>三厢轿车</TD>
          <TD id=m_frame2_8771>三厢轿车</TD>
          <TD id=m_frame2_6934>三厢轿车</TD>
          <TD id=m_frame2_9216>三厢轿车</TD>
          <TD id=m_frame2_6935>三厢轿车</TD>
          <TD id=m_frame2_6938>三厢轿车</TD>
          <TD id=m_frame2_6939>三厢轿车</TD></TR>
        <TR class=hidd>
          <TD id=m_door_10884>4</TD>
          <TD id=m_door_10885>4</TD>
          <TD id=m_door_10886>4</TD>
          <TD id=m_door_10889>4</TD>
          <TD id=m_door_10887>4</TD>
          <TD id=m_door_10888>4</TD>
          <TD id=m_door_8769>4</TD>
          <TD id=m_door_8770>4</TD>
          <TD id=m_door_8771>4</TD>
          <TD id=m_door_6934>4</TD>
          <TD id=m_door_9216>4</TD>
          <TD id=m_door_6935>4</TD>
          <TD id=m_door_6938>4</TD>
          <TD id=m_door_6939>4</TD></TR>
        <TR class=hidd>
          <TD id=m_seat_10884>5</TD>
          <TD id=m_seat_10885>5</TD>
          <TD id=m_seat_10886>5</TD>
          <TD id=m_seat_10889>5</TD>
          <TD id=m_seat_10887>5</TD>
          <TD id=m_seat_10888>5</TD>
          <TD id=m_seat_8769>5</TD>
          <TD id=m_seat_8770>5</TD>
          <TD id=m_seat_8771>5</TD>
          <TD id=m_seat_6934>5</TD>
          <TD id=m_seat_9216>5</TD>
          <TD id=m_seat_6935>5</TD>
          <TD id=m_seat_6938>5</TD>
          <TD id=m_seat_6939>5</TD></TR>
        <TR class=hidd>
          <TD id=m_oilbox_10884>70.00</TD>
          <TD id=m_oilbox_10885>70.00</TD>
          <TD id=m_oilbox_10886>70.00</TD>
          <TD id=m_oilbox_10889>70.00</TD>
          <TD id=m_oilbox_10887>70.00</TD>
          <TD id=m_oilbox_10888>70.00</TD>
          <TD id=m_oilbox_8769>70.00</TD>
          <TD id=m_oilbox_8770>70.00</TD>
          <TD id=m_oilbox_8771>70.00</TD>
          <TD id=m_oilbox_6934>70.00</TD>
          <TD id=m_oilbox_9216>70.00</TD>
          <TD id=m_oilbox_6935>70.00</TD>
          <TD id=m_oilbox_6938>70.00</TD>
          <TD id=m_oilbox_6939>70.00</TD></TR>
        <TR class=hidd>
          <TD id=m_trunk_10884>500</TD>
          <TD id=m_trunk_10885>500</TD>
          <TD id=m_trunk_10886>500</TD>
          <TD id=m_trunk_10889>500</TD>
          <TD id=m_trunk_10887>500</TD>
          <TD id=m_trunk_10888>500</TD>
          <TD id=m_trunk_8769>500</TD>
          <TD id=m_trunk_8770>500</TD>
          <TD id=m_trunk_8771>500</TD>
          <TD id=m_trunk_6934>500</TD>
          <TD id=m_trunk_9216>500</TD>
          <TD id=m_trunk_6935>500</TD>
          <TD id=m_trunk_6938>500</TD>
          <TD id=m_trunk_6939>500</TD></TR>
        <TR class=disc>
          <TD id=m_mtrunk_10884>- </TD>
          <TD id=m_mtrunk_10885>- </TD>
          <TD id=m_mtrunk_10886>- </TD>
          <TD id=m_mtrunk_10889>- </TD>
          <TD id=m_mtrunk_10887>- </TD>
          <TD id=m_mtrunk_10888>- </TD>
          <TD id=m_mtrunk_8769>500</TD>
          <TD id=m_mtrunk_8770>500</TD>
          <TD id=m_mtrunk_8771>500</TD>
          <TD id=m_mtrunk_6934>- </TD>
          <TD id=m_mtrunk_9216>- </TD>
          <TD id=m_mtrunk_6935>- </TD>
          <TD id=m_mtrunk_6938>- </TD>
          <TD id=m_mtrunk_6939>- </TD></TR>
        <TR id=base_3>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10884 scope=col><B href="#/m10884/" 
            target=_blank>2012款君威 1.6T 精英运动版 </A><I id=base_3_img_10884></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10885 scope=col><B href="#/m10885/" 
            target=_blank>2012款君威 2.0L 舒适版 </A><I id=base_3_img_10885></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10886 scope=col><B href="#/m10886/" 
            target=_blank>2012款君威 2.0L 豪华版 </A><I id=base_3_img_10886></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10889 scope=col><B href="#/m10889/" 
            target=_blank>2012款君威 2.0T 豪华运动版 </A><I id=base_3_img_10889></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10887 scope=col><B href="#/m10887/" 
            target=_blank>2012款君威 2.4L SIDI精英版 </A><I id=base_3_img_10887></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10888 scope=col><B href="#/m10888/" 
            target=_blank>2012款君威 2.4L SIDI旗舰版 </A><I id=base_3_img_10888></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8769 scope=col><B href="#/m8769/" 
            target=_blank>2011款君威 2.4L SIDI舒适版(停产) </A><I 
            id=base_3_img_8769></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8770 scope=col><B href="#/m8770/" 
            target=_blank>2011款君威 2.4L SIDI精英版(停产) </A><I 
            id=base_3_img_8770></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8771 scope=col><B href="#/m8771/" 
            target=_blank>2011款君威 2.4L SIDI旗舰版(停产) </A><I 
            id=base_3_img_8771></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6934 scope=col><B href="#/m6934/" 
            target=_blank>2010款君威 1.6T 精英运动版(停产) </A><I id=base_3_img_6934></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9216 scope=col><B href="#/m9216/" 
            target=_blank>2010款君威 2.0L 舒适版(停产) </A><I id=base_3_img_9216></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6935 scope=col><B href="#/m6935/" 
            target=_blank>2010款君威 2.0L 世博版(停产) </A><I id=base_3_img_6935></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6938 scope=col><B href="#/m6938/" 
            target=_blank>2010款君威 2.0T 豪华运动版(停产) </A><I id=base_3_img_6938></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6939 scope=col><B href="#/m6939/" 
            target=_blank>2010款君威 2.0T 旗舰运动版(停产) </A><I id=base_3_img_6939></I> </TH></TR>
        <TR class=disc>
          <TD id=m_disl2_10884>1.6</TD>
          <TD id=m_disl2_10885>2.0</TD>
          <TD id=m_disl2_10886>2.0</TD>
          <TD id=m_disl2_10889>2.0</TD>
          <TD id=m_disl2_10887>2.4</TD>
          <TD id=m_disl2_10888>2.4</TD>
          <TD id=m_disl2_8769>2.4</TD>
          <TD id=m_disl2_8770>2.4</TD>
          <TD id=m_disl2_8771>2.4</TD>
          <TD id=m_disl2_6934>1.6</TD>
          <TD id=m_disl2_9216>2.0</TD>
          <TD id=m_disl2_6935>2.0</TD>
          <TD id=m_disl2_6938>2.0</TD>
          <TD id=m_disl2_6939>2.0</TD></TR>
        <TR class=disc>
          <TD id=m_working_10884>涡轮增压</TD>
          <TD id=m_working_10885>自然吸气</TD>
          <TD id=m_working_10886>自然吸气</TD>
          <TD id=m_working_10889>涡轮增压</TD>
          <TD id=m_working_10887>自然吸气</TD>
          <TD id=m_working_10888>自然吸气</TD>
          <TD id=m_working_8769>自然吸气</TD>
          <TD id=m_working_8770>自然吸气</TD>
          <TD id=m_working_8771>自然吸气</TD>
          <TD id=m_working_6934>涡轮增压</TD>
          <TD id=m_working_9216>自然吸气</TD>
          <TD id=m_working_6935>自然吸气</TD>
          <TD id=m_working_6938>涡轮增压</TD>
          <TD id=m_working_6939>涡轮增压</TD></TR>
        <TR class=disc>
          <TD id=m_mpower_10884>132</TD>
          <TD id=m_mpower_10885>108</TD>
          <TD id=m_mpower_10886>108</TD>
          <TD id=m_mpower_10889>162</TD>
          <TD id=m_mpower_10887>137</TD>
          <TD id=m_mpower_10888>137</TD>
          <TD id=m_mpower_8769>137</TD>
          <TD id=m_mpower_8770>137</TD>
          <TD id=m_mpower_8771>137</TD>
          <TD id=m_mpower_6934>132</TD>
          <TD id=m_mpower_9216>108</TD>
          <TD id=m_mpower_6935>108</TD>
          <TD id=m_mpower_6938>162</TD>
          <TD id=m_mpower_6939>162</TD></TR>
        <TR class=disc>
          <TD id=m_mpowersp_10884>5800</TD>
          <TD id=m_mpowersp_10885>6200</TD>
          <TD id=m_mpowersp_10886>6200</TD>
          <TD id=m_mpowersp_10889>5300</TD>
          <TD id=m_mpowersp_10887>6200</TD>
          <TD id=m_mpowersp_10888>6200</TD>
          <TD id=m_mpowersp_8769>6200</TD>
          <TD id=m_mpowersp_8770>6200</TD>
          <TD id=m_mpowersp_8771>6200</TD>
          <TD id=m_mpowersp_6934>5800</TD>
          <TD id=m_mpowersp_9216>6200</TD>
          <TD id=m_mpowersp_6935>6200</TD>
          <TD id=m_mpowersp_6938>5300</TD>
          <TD id=m_mpowersp_6939>5300</TD></TR>
        <TR class=disc>
          <TD id=m_mtorque_10884>230</TD>
          <TD id=m_mtorque_10885>190</TD>
          <TD id=m_mtorque_10886>190</TD>
          <TD id=m_mtorque_10889>350</TD>
          <TD id=m_mtorque_10887>240</TD>
          <TD id=m_mtorque_10888>240</TD>
          <TD id=m_mtorque_8769>240</TD>
          <TD id=m_mtorque_8770>240</TD>
          <TD id=m_mtorque_8771>240</TD>
          <TD id=m_mtorque_6934>230</TD>
          <TD id=m_mtorque_9216>190</TD>
          <TD id=m_mtorque_6935>190</TD>
          <TD id=m_mtorque_6938>350</TD>
          <TD id=m_mtorque_6939>350</TD></TR>
        <TR class=disc>
          <TD id=m_mtorsp_10884>2200-5400</TD>
          <TD id=m_mtorsp_10885>4600</TD>
          <TD id=m_mtorsp_10886>4600</TD>
          <TD id=m_mtorsp_10889>2000-4000</TD>
          <TD id=m_mtorsp_10887>4800</TD>
          <TD id=m_mtorsp_10888>4800</TD>
          <TD id=m_mtorsp_8769>4800</TD>
          <TD id=m_mtorsp_8770>4800</TD>
          <TD id=m_mtorsp_8771>4800</TD>
          <TD id=m_mtorsp_6934>2200-5400</TD>
          <TD id=m_mtorsp_9216>4600</TD>
          <TD id=m_mtorsp_6935>4600</TD>
          <TD id=m_mtorsp_6938>2000-4000</TD>
          <TD id=m_mtorsp_6939>2000-4000</TD></TR>
        <TR class=hidd>
          <TD id=m_fuel_10884>汽油</TD>
          <TD id=m_fuel_10885>汽油</TD>
          <TD id=m_fuel_10886>汽油</TD>
          <TD id=m_fuel_10889>汽油</TD>
          <TD id=m_fuel_10887>汽油</TD>
          <TD id=m_fuel_10888>汽油</TD>
          <TD id=m_fuel_8769>汽油</TD>
          <TD id=m_fuel_8770>汽油</TD>
          <TD id=m_fuel_8771>汽油</TD>
          <TD id=m_fuel_6934>汽油</TD>
          <TD id=m_fuel_9216>汽油</TD>
          <TD id=m_fuel_6935>汽油</TD>
          <TD id=m_fuel_6938>汽油</TD>
          <TD id=m_fuel_6939>汽油</TD></TR>
        <TR class=hidd>
          <TD id=m_fuelno_10884>93</TD>
          <TD id=m_fuelno_10885>93</TD>
          <TD id=m_fuelno_10886>93</TD>
          <TD id=m_fuelno_10889>93</TD>
          <TD id=m_fuelno_10887>93</TD>
          <TD id=m_fuelno_10888>93</TD>
          <TD id=m_fuelno_8769>93</TD>
          <TD id=m_fuelno_8770>93</TD>
          <TD id=m_fuelno_8771>93</TD>
          <TD id=m_fuelno_6934>93</TD>
          <TD id=m_fuelno_9216>93</TD>
          <TD id=m_fuelno_6935>93</TD>
          <TD id=m_fuelno_6938>93</TD>
          <TD id=m_fuelno_6939>93</TD></TR>
        <TR class=hidd>
          <TD id=m_envstand_10884>国IV </TD>
          <TD id=m_envstand_10885>国IV </TD>
          <TD id=m_envstand_10886>国IV </TD>
          <TD id=m_envstand_10889>国IV </TD>
          <TD id=m_envstand_10887>国IV </TD>
          <TD id=m_envstand_10888>国IV </TD>
          <TD id=m_envstand_8769>国IV </TD>
          <TD id=m_envstand_8770>国IV </TD>
          <TD id=m_envstand_8771>国IV </TD>
          <TD id=m_envstand_6934>国IV </TD>
          <TD id=m_envstand_9216>国IV </TD>
          <TD id=m_envstand_6935>国IV </TD>
          <TD id=m_envstand_6938>国IV </TD>
          <TD id=m_envstand_6939>国IV </TD></TR>
        <TR id=base_4>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10884 scope=col><B href="#/m10884/" 
            target=_blank>2012款君威 1.6T 精英运动版 </A><I id=base_4_img_10884></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10885 scope=col><B href="#/m10885/" 
            target=_blank>2012款君威 2.0L 舒适版 </A><I id=base_4_img_10885></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10886 scope=col><B href="#/m10886/" 
            target=_blank>2012款君威 2.0L 豪华版 </A><I id=base_4_img_10886></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10889 scope=col><B href="#/m10889/" 
            target=_blank>2012款君威 2.0T 豪华运动版 </A><I id=base_4_img_10889></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10887 scope=col><B href="#/m10887/" 
            target=_blank>2012款君威 2.4L SIDI精英版 </A><I id=base_4_img_10887></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10888 scope=col><B href="#/m10888/" 
            target=_blank>2012款君威 2.4L SIDI旗舰版 </A><I id=base_4_img_10888></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8769 scope=col><B href="#/m8769/" 
            target=_blank>2011款君威 2.4L SIDI舒适版(停产) </A><I 
            id=base_4_img_8769></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8770 scope=col><B href="#/m8770/" 
            target=_blank>2011款君威 2.4L SIDI精英版(停产) </A><I 
            id=base_4_img_8770></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8771 scope=col><B href="#/m8771/" 
            target=_blank>2011款君威 2.4L SIDI旗舰版(停产) </A><I 
            id=base_4_img_8771></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6934 scope=col><B href="#/m6934/" 
            target=_blank>2010款君威 1.6T 精英运动版(停产) </A><I id=base_4_img_6934></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9216 scope=col><B href="#/m9216/" 
            target=_blank>2010款君威 2.0L 舒适版(停产) </A><I id=base_4_img_9216></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6935 scope=col><B href="#/m6935/" 
            target=_blank>2010款君威 2.0L 世博版(停产) </A><I id=base_4_img_6935></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6938 scope=col><B href="#/m6938/" 
            target=_blank>2010款君威 2.0T 豪华运动版(停产) </A><I id=base_4_img_6938></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6939 scope=col><B href="#/m6939/" 
            target=_blank>2010款君威 2.0T 旗舰运动版(停产) </A><I id=base_4_img_6939></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_speed_10884>6</TD>
          <TD id=m_speed_10885>6</TD>
          <TD id=m_speed_10886>6</TD>
          <TD id=m_speed_10889>6</TD>
          <TD id=m_speed_10887>6</TD>
          <TD id=m_speed_10888>6</TD>
          <TD id=m_speed_8769>6</TD>
          <TD id=m_speed_8770>6</TD>
          <TD id=m_speed_8771>6</TD>
          <TD id=m_speed_6934>6</TD>
          <TD id=m_speed_9216>6</TD>
          <TD id=m_speed_6935>6</TD>
          <TD id=m_speed_6938>6</TD>
          <TD id=m_speed_6939>6</TD></TR>
        <TR class=disc>
          <TD id=m_transtype2_10884>MT</TD>
          <TD id=m_transtype2_10885>AT</TD>
          <TD id=m_transtype2_10886>AT</TD>
          <TD id=m_transtype2_10889>AT</TD>
          <TD id=m_transtype2_10887>AT</TD>
          <TD id=m_transtype2_10888>AT</TD>
          <TD id=m_transtype2_8769>AT</TD>
          <TD id=m_transtype2_8770>AT</TD>
          <TD id=m_transtype2_8771>AT</TD>
          <TD id=m_transtype2_6934>MT</TD>
          <TD id=m_transtype2_9216>AT</TD>
          <TD id=m_transtype2_6935>AT</TD>
          <TD id=m_transtype2_6938>AT</TD>
          <TD id=m_transtype2_6939>AT</TD></TR>
        <TR id=base_5>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10884 scope=col><B href="#/m10884/" 
            target=_blank>2012款君威 1.6T 精英运动版 </A><I id=base_5_img_10884></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10885 scope=col><B href="#/m10885/" 
            target=_blank>2012款君威 2.0L 舒适版 </A><I id=base_5_img_10885></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10886 scope=col><B href="#/m10886/" 
            target=_blank>2012款君威 2.0L 豪华版 </A><I id=base_5_img_10886></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10889 scope=col><B href="#/m10889/" 
            target=_blank>2012款君威 2.0T 豪华运动版 </A><I id=base_5_img_10889></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10887 scope=col><B href="#/m10887/" 
            target=_blank>2012款君威 2.4L SIDI精英版 </A><I id=base_5_img_10887></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10888 scope=col><B href="#/m10888/" 
            target=_blank>2012款君威 2.4L SIDI旗舰版 </A><I id=base_5_img_10888></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8769 scope=col><B href="#/m8769/" 
            target=_blank>2011款君威 2.4L SIDI舒适版(停产) </A><I 
            id=base_5_img_8769></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8770 scope=col><B href="#/m8770/" 
            target=_blank>2011款君威 2.4L SIDI精英版(停产) </A><I 
            id=base_5_img_8770></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8771 scope=col><B href="#/m8771/" 
            target=_blank>2011款君威 2.4L SIDI旗舰版(停产) </A><I 
            id=base_5_img_8771></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6934 scope=col><B href="#/m6934/" 
            target=_blank>2010款君威 1.6T 精英运动版(停产) </A><I id=base_5_img_6934></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9216 scope=col><B href="#/m9216/" 
            target=_blank>2010款君威 2.0L 舒适版(停产) </A><I id=base_5_img_9216></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6935 scope=col><B href="#/m6935/" 
            target=_blank>2010款君威 2.0L 世博版(停产) </A><I id=base_5_img_6935></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6938 scope=col><B href="#/m6938/" 
            target=_blank>2010款君威 2.0T 豪华运动版(停产) </A><I id=base_5_img_6938></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6939 scope=col><B href="#/m6939/" 
            target=_blank>2010款君威 2.0T 旗舰运动版(停产) </A><I id=base_5_img_6939></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_drivetype_10884>前置前驱</TD>
          <TD id=m_drivetype_10885>前置前驱</TD>
          <TD id=m_drivetype_10886>前置前驱</TD>
          <TD id=m_drivetype_10889>前置前驱</TD>
          <TD id=m_drivetype_10887>前置前驱</TD>
          <TD id=m_drivetype_10888>前置前驱</TD>
          <TD id=m_drivetype_8769>前置前驱</TD>
          <TD id=m_drivetype_8770>前置前驱</TD>
          <TD id=m_drivetype_8771>前置前驱</TD>
          <TD id=m_drivetype_6934>前置前驱</TD>
          <TD id=m_drivetype_9216>前置前驱</TD>
          <TD id=m_drivetype_6935>前置前驱</TD>
          <TD id=m_drivetype_6938>前置前驱</TD>
          <TD id=m_drivetype_6939>前置前驱</TD></TR>
        <TR class=hidd height=60>
          <TD id=m_fsustype_text_10884>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_10885>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_10886>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_10889>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_10887>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_10888>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_8769>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_8770>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_8771>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_6934>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_9216>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_6935>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_6938>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_6939>麦弗逊式独立悬架</TD></TR>
        <TR class=hidd height=60>
          <TD id=m_bsustype_text_10884>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_10885>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_10886>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_10889>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_10887>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_10888>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8769>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8770>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8771>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_6934>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_9216>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_6935>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_6938>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_6939>多连杆式独立悬架</TD></TR>
        <TR id=base_6>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10884 scope=col><B href="#/m10884/" 
            target=_blank>2012款君威 1.6T 精英运动版 </A><I id=base_6_img_10884></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10885 scope=col><B href="#/m10885/" 
            target=_blank>2012款君威 2.0L 舒适版 </A><I id=base_6_img_10885></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10886 scope=col><B href="#/m10886/" 
            target=_blank>2012款君威 2.0L 豪华版 </A><I id=base_6_img_10886></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10889 scope=col><B href="#/m10889/" 
            target=_blank>2012款君威 2.0T 豪华运动版 </A><I id=base_6_img_10889></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10887 scope=col><B href="#/m10887/" 
            target=_blank>2012款君威 2.4L SIDI精英版 </A><I id=base_6_img_10887></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10888 scope=col><B href="#/m10888/" 
            target=_blank>2012款君威 2.4L SIDI旗舰版 </A><I id=base_6_img_10888></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8769 scope=col><B href="#/m8769/" 
            target=_blank>2011款君威 2.4L SIDI舒适版(停产) </A><I 
            id=base_6_img_8769></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8770 scope=col><B href="#/m8770/" 
            target=_blank>2011款君威 2.4L SIDI精英版(停产) </A><I 
            id=base_6_img_8770></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8771 scope=col><B href="#/m8771/" 
            target=_blank>2011款君威 2.4L SIDI旗舰版(停产) </A><I 
            id=base_6_img_8771></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6934 scope=col><B href="#/m6934/" 
            target=_blank>2010款君威 1.6T 精英运动版(停产) </A><I id=base_6_img_6934></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9216 scope=col><B href="#/m9216/" 
            target=_blank>2010款君威 2.0L 舒适版(停产) </A><I id=base_6_img_9216></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6935 scope=col><B href="#/m6935/" 
            target=_blank>2010款君威 2.0L 世博版(停产) </A><I id=base_6_img_6935></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6938 scope=col><B href="#/m6938/" 
            target=_blank>2010款君威 2.0T 豪华运动版(停产) </A><I id=base_6_img_6938></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6939 scope=col><B href="#/m6939/" 
            target=_blank>2010款君威 2.0T 旗舰运动版(停产) </A><I id=base_6_img_6939></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_fbraketype_10884>通风盘式</TD>
          <TD id=m_fbraketype_10885>通风盘式</TD>
          <TD id=m_fbraketype_10886>通风盘式</TD>
          <TD id=m_fbraketype_10889>通风盘式</TD>
          <TD id=m_fbraketype_10887>通风盘式</TD>
          <TD id=m_fbraketype_10888>通风盘式</TD>
          <TD id=m_fbraketype_8769>通风盘式</TD>
          <TD id=m_fbraketype_8770>通风盘式</TD>
          <TD id=m_fbraketype_8771>通风盘式</TD>
          <TD id=m_fbraketype_6934>通风盘式</TD>
          <TD id=m_fbraketype_9216>通风盘式</TD>
          <TD id=m_fbraketype_6935>通风盘式</TD>
          <TD id=m_fbraketype_6938>通风盘式</TD>
          <TD id=m_fbraketype_6939>通风盘式</TD></TR>
        <TR class=disc>
          <TD id=m_bbraketype_10884>通风盘式</TD>
          <TD id=m_bbraketype_10885>盘式</TD>
          <TD id=m_bbraketype_10886>盘式</TD>
          <TD id=m_bbraketype_10889>通风盘式</TD>
          <TD id=m_bbraketype_10887>盘式</TD>
          <TD id=m_bbraketype_10888>盘式</TD>
          <TD id=m_bbraketype_8769>盘式</TD>
          <TD id=m_bbraketype_8770>盘式</TD>
          <TD id=m_bbraketype_8771>盘式</TD>
          <TD id=m_bbraketype_6934>通风盘式</TD>
          <TD id=m_bbraketype_9216>盘式</TD>
          <TD id=m_bbraketype_6935>盘式</TD>
          <TD id=m_bbraketype_6938>通风盘式</TD>
          <TD id=m_bbraketype_6939>通风盘式</TD></TR>
        <TR class=disc>
          <TD id=m_ftiresize_10884>225/55 R17</TD>
          <TD id=m_ftiresize_10885>225/55 R17</TD>
          <TD id=m_ftiresize_10886>225/55 R17</TD>
          <TD id=m_ftiresize_10889>245/45 R18</TD>
          <TD id=m_ftiresize_10887>245/45 R18</TD>
          <TD id=m_ftiresize_10888>245/45 R18</TD>
          <TD id=m_ftiresize_8769>225/55 R17</TD>
          <TD id=m_ftiresize_8770>245/45 R18</TD>
          <TD id=m_ftiresize_8771>245/45 R18</TD>
          <TD id=m_ftiresize_6934>225/55 R17</TD>
          <TD id=m_ftiresize_9216>225/55 R17</TD>
          <TD id=m_ftiresize_6935>225/55 R17</TD>
          <TD id=m_ftiresize_6938>245/45 R18</TD>
          <TD id=m_ftiresize_6939>245/45 R18</TD></TR>
        <TR class=disc>
          <TD id=m_btiresize_10884>225/55 R17</TD>
          <TD id=m_btiresize_10885>225/55 R17</TD>
          <TD id=m_btiresize_10886>225/55 R17</TD>
          <TD id=m_btiresize_10889>245/45 R18</TD>
          <TD id=m_btiresize_10887>245/45 R18</TD>
          <TD id=m_btiresize_10888>245/45 R18</TD>
          <TD id=m_btiresize_8769>225/55 R17</TD>
          <TD id=m_btiresize_8770>245/45 R18</TD>
          <TD id=m_btiresize_8771>245/45 R18</TD>
          <TD id=m_btiresize_6934>225/55 R17</TD>
          <TD id=m_btiresize_9216>225/55 R17</TD>
          <TD id=m_btiresize_6935>225/55 R17</TD>
          <TD id=m_btiresize_6938>245/45 R18</TD>
          <TD id=m_btiresize_6939>245/45 R18</TD></TR>
        <TR class=hidd>
          <TD id=m_sparetire_10884>非全尺寸</TD>
          <TD id=m_sparetire_10885>非全尺寸</TD>
          <TD id=m_sparetire_10886>非全尺寸</TD>
          <TD id=m_sparetire_10889>非全尺寸</TD>
          <TD id=m_sparetire_10887>非全尺寸</TD>
          <TD id=m_sparetire_10888>非全尺寸</TD>
          <TD id=m_sparetire_8769>非全尺寸</TD>
          <TD id=m_sparetire_8770>非全尺寸</TD>
          <TD id=m_sparetire_8771>非全尺寸</TD>
          <TD id=m_sparetire_6934>非全尺寸</TD>
          <TD id=m_sparetire_9216>非全尺寸</TD>
          <TD id=m_sparetire_6935>非全尺寸</TD>
          <TD id=m_sparetire_6938>非全尺寸</TD>
          <TD id=m_sparetire_6939>非全尺寸</TD></TR>
        <TR id=base_7>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10884 scope=col><B href="#/m10884/" 
            target=_blank>2012款君威 1.6T 精英运动版 </A><I id=base_7_img_10884></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10885 scope=col><B href="#/m10885/" 
            target=_blank>2012款君威 2.0L 舒适版 </A><I id=base_7_img_10885></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10886 scope=col><B href="#/m10886/" 
            target=_blank>2012款君威 2.0L 豪华版 </A><I id=base_7_img_10886></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10889 scope=col><B href="#/m10889/" 
            target=_blank>2012款君威 2.0T 豪华运动版 </A><I id=base_7_img_10889></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10887 scope=col><B href="#/m10887/" 
            target=_blank>2012款君威 2.4L SIDI精英版 </A><I id=base_7_img_10887></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10888 scope=col><B href="#/m10888/" 
            target=_blank>2012款君威 2.4L SIDI旗舰版 </A><I id=base_7_img_10888></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8769 scope=col><B href="#/m8769/" 
            target=_blank>2011款君威 2.4L SIDI舒适版(停产) </A><I 
            id=base_7_img_8769></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8770 scope=col><B href="#/m8770/" 
            target=_blank>2011款君威 2.4L SIDI精英版(停产) </A><I 
            id=base_7_img_8770></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8771 scope=col><B href="#/m8771/" 
            target=_blank>2011款君威 2.4L SIDI旗舰版(停产) </A><I 
            id=base_7_img_8771></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6934 scope=col><B href="#/m6934/" 
            target=_blank>2010款君威 1.6T 精英运动版(停产) </A><I id=base_7_img_6934></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9216 scope=col><B href="#/m9216/" 
            target=_blank>2010款君威 2.0L 舒适版(停产) </A><I id=base_7_img_9216></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6935 scope=col><B href="#/m6935/" 
            target=_blank>2010款君威 2.0L 世博版(停产) </A><I id=base_7_img_6935></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6938 scope=col><B href="#/m6938/" 
            target=_blank>2010款君威 2.0T 豪华运动版(停产) </A><I id=base_7_img_6938></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6939 scope=col><B href="#/m6939/" 
            target=_blank>2010款君威 2.0T 旗舰运动版(停产) </A><I id=base_7_img_6939></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isdairbag_10884>●</TD>
          <TD id=m_isdairbag_10885>●</TD>
          <TD id=m_isdairbag_10886>●</TD>
          <TD id=m_isdairbag_10889>●</TD>
          <TD id=m_isdairbag_10887>●</TD>
          <TD id=m_isdairbag_10888>●</TD>
          <TD id=m_isdairbag_8769>●</TD>
          <TD id=m_isdairbag_8770>●</TD>
          <TD id=m_isdairbag_8771>●</TD>
          <TD id=m_isdairbag_6934>●</TD>
          <TD id=m_isdairbag_9216>●</TD>
          <TD id=m_isdairbag_6935>●</TD>
          <TD id=m_isdairbag_6938>●</TD>
          <TD id=m_isdairbag_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isadairbag_10884>●</TD>
          <TD id=m_isadairbag_10885>●</TD>
          <TD id=m_isadairbag_10886>●</TD>
          <TD id=m_isadairbag_10889>●</TD>
          <TD id=m_isadairbag_10887>●</TD>
          <TD id=m_isadairbag_10888>●</TD>
          <TD id=m_isadairbag_8769>●</TD>
          <TD id=m_isadairbag_8770>●</TD>
          <TD id=m_isadairbag_8771>●</TD>
          <TD id=m_isadairbag_6934>●</TD>
          <TD id=m_isadairbag_9216>●</TD>
          <TD id=m_isadairbag_6935>●</TD>
          <TD id=m_isadairbag_6938>●</TD>
          <TD id=m_isadairbag_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_isfhairbag_10884>-</TD>
          <TD id=m_isfhairbag_10885>-</TD>
          <TD id=m_isfhairbag_10886>●</TD>
          <TD id=m_isfhairbag_10889>●</TD>
          <TD id=m_isfhairbag_10887>●</TD>
          <TD id=m_isfhairbag_10888>●</TD>
          <TD id=m_isfhairbag_8769>-</TD>
          <TD id=m_isfhairbag_8770>●</TD>
          <TD id=m_isfhairbag_8771>●</TD>
          <TD id=m_isfhairbag_6934>-</TD>
          <TD id=m_isfhairbag_9216>-</TD>
          <TD id=m_isfhairbag_6935>●</TD>
          <TD id=m_isfhairbag_6938>●</TD>
          <TD id=m_isfhairbag_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_isbhairbag_10884>-</TD>
          <TD id=m_isbhairbag_10885>-</TD>
          <TD id=m_isbhairbag_10886>●</TD>
          <TD id=m_isbhairbag_10889>●</TD>
          <TD id=m_isbhairbag_10887>●</TD>
          <TD id=m_isbhairbag_10888>●</TD>
          <TD id=m_isbhairbag_8769>-</TD>
          <TD id=m_isbhairbag_8770>●</TD>
          <TD id=m_isbhairbag_8771>●</TD>
          <TD id=m_isbhairbag_6934>-</TD>
          <TD id=m_isbhairbag_9216>-</TD>
          <TD id=m_isbhairbag_6935>●</TD>
          <TD id=m_isbhairbag_6938>●</TD>
          <TD id=m_isbhairbag_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isfsairbag_10884>●</TD>
          <TD id=m_isfsairbag_10885>●</TD>
          <TD id=m_isfsairbag_10886>●</TD>
          <TD id=m_isfsairbag_10889>●</TD>
          <TD id=m_isfsairbag_10887>●</TD>
          <TD id=m_isfsairbag_10888>●</TD>
          <TD id=m_isfsairbag_8769>●</TD>
          <TD id=m_isfsairbag_8770>●</TD>
          <TD id=m_isfsairbag_8771>●</TD>
          <TD id=m_isfsairbag_6934>●</TD>
          <TD id=m_isfsairbag_9216>●</TD>
          <TD id=m_isfsairbag_6935>●</TD>
          <TD id=m_isfsairbag_6938>●</TD>
          <TD id=m_isfsairbag_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbsairbag_10884>-</TD>
          <TD id=m_isbsairbag_10885>-</TD>
          <TD id=m_isbsairbag_10886>-</TD>
          <TD id=m_isbsairbag_10889>-</TD>
          <TD id=m_isbsairbag_10887>-</TD>
          <TD id=m_isbsairbag_10888>-</TD>
          <TD id=m_isbsairbag_8769>-</TD>
          <TD id=m_isbsairbag_8770>-</TD>
          <TD id=m_isbsairbag_8771>-</TD>
          <TD id=m_isbsairbag_6934>-</TD>
          <TD id=m_isbsairbag_9216>-</TD>
          <TD id=m_isbsairbag_6935>-</TD>
          <TD id=m_isbsairbag_6938>-</TD>
          <TD id=m_isbsairbag_6939>-</TD></TR>
        <TR class=hidd>
          <TD id=m_iskairbag_10884>-</TD>
          <TD id=m_iskairbag_10885>-</TD>
          <TD id=m_iskairbag_10886>-</TD>
          <TD id=m_iskairbag_10889>-</TD>
          <TD id=m_iskairbag_10887>-</TD>
          <TD id=m_iskairbag_10888>-</TD>
          <TD id=m_iskairbag_8769>-</TD>
          <TD id=m_iskairbag_8770>-</TD>
          <TD id=m_iskairbag_8771>-</TD>
          <TD id=m_iskairbag_6934>-</TD>
          <TD id=m_iskairbag_9216>-</TD>
          <TD id=m_iskairbag_6935>-</TD>
          <TD id=m_iskairbag_6938>-</TD>
          <TD id=m_iskairbag_6939>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatbeltti_10884>●</TD>
          <TD id=m_isseatbeltti_10885>●</TD>
          <TD id=m_isseatbeltti_10886>●</TD>
          <TD id=m_isseatbeltti_10889>●</TD>
          <TD id=m_isseatbeltti_10887>●</TD>
          <TD id=m_isseatbeltti_10888>●</TD>
          <TD id=m_isseatbeltti_8769>●</TD>
          <TD id=m_isseatbeltti_8770>●</TD>
          <TD id=m_isseatbeltti_8771>●</TD>
          <TD id=m_isseatbeltti_6934>●</TD>
          <TD id=m_isseatbeltti_9216>●</TD>
          <TD id=m_isseatbeltti_6935>●</TD>
          <TD id=m_isseatbeltti_6938>●</TD>
          <TD id=m_isseatbeltti_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iseanti_10884>●</TD>
          <TD id=m_iseanti_10885>●</TD>
          <TD id=m_iseanti_10886>●</TD>
          <TD id=m_iseanti_10889>●</TD>
          <TD id=m_iseanti_10887>●</TD>
          <TD id=m_iseanti_10888>●</TD>
          <TD id=m_iseanti_8769>●</TD>
          <TD id=m_iseanti_8770>●</TD>
          <TD id=m_iseanti_8771>●</TD>
          <TD id=m_iseanti_6934>●</TD>
          <TD id=m_iseanti_9216>●</TD>
          <TD id=m_iseanti_6935>●</TD>
          <TD id=m_iseanti_6938>●</TD>
          <TD id=m_iseanti_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscclock_10884>●</TD>
          <TD id=m_iscclock_10885>●</TD>
          <TD id=m_iscclock_10886>●</TD>
          <TD id=m_iscclock_10889>●</TD>
          <TD id=m_iscclock_10887>●</TD>
          <TD id=m_iscclock_10888>●</TD>
          <TD id=m_iscclock_8769>●</TD>
          <TD id=m_iscclock_8770>●</TD>
          <TD id=m_iscclock_8771>●</TD>
          <TD id=m_iscclock_6934>●</TD>
          <TD id=m_iscclock_9216>●</TD>
          <TD id=m_iscclock_6935>●</TD>
          <TD id=m_iscclock_6938>●</TD>
          <TD id=m_iscclock_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isrekey_10884>●</TD>
          <TD id=m_isrekey_10885>●</TD>
          <TD id=m_isrekey_10886>●</TD>
          <TD id=m_isrekey_10889>●</TD>
          <TD id=m_isrekey_10887>●</TD>
          <TD id=m_isrekey_10888>●</TD>
          <TD id=m_isrekey_8769>●</TD>
          <TD id=m_isrekey_8770>●</TD>
          <TD id=m_isrekey_8771>●</TD>
          <TD id=m_isrekey_6934>●</TD>
          <TD id=m_isrekey_9216>●</TD>
          <TD id=m_isrekey_6935>●</TD>
          <TD id=m_isrekey_6938>●</TD>
          <TD id=m_isrekey_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_isnokeysys_10884>-</TD>
          <TD id=m_isnokeysys_10885>-</TD>
          <TD id=m_isnokeysys_10886>●</TD>
          <TD id=m_isnokeysys_10889>●</TD>
          <TD id=m_isnokeysys_10887>●</TD>
          <TD id=m_isnokeysys_10888>●</TD>
          <TD id=m_isnokeysys_8769>-</TD>
          <TD id=m_isnokeysys_8770>-</TD>
          <TD id=m_isnokeysys_8771>●</TD>
          <TD id=m_isnokeysys_6934>-</TD>
          <TD id=m_isnokeysys_9216>-</TD>
          <TD id=m_isnokeysys_6935>-</TD>
          <TD id=m_isnokeysys_6938>-</TD>
          <TD id=m_isnokeysys_6939>●</TD></TR>
        <TR id=base_8>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10884 scope=col><B href="#/m10884/" 
            target=_blank>2012款君威 1.6T 精英运动版 </A><I id=base_8_img_10884></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10885 scope=col><B href="#/m10885/" 
            target=_blank>2012款君威 2.0L 舒适版 </A><I id=base_8_img_10885></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10886 scope=col><B href="#/m10886/" 
            target=_blank>2012款君威 2.0L 豪华版 </A><I id=base_8_img_10886></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10889 scope=col><B href="#/m10889/" 
            target=_blank>2012款君威 2.0T 豪华运动版 </A><I id=base_8_img_10889></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10887 scope=col><B href="#/m10887/" 
            target=_blank>2012款君威 2.4L SIDI精英版 </A><I id=base_8_img_10887></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10888 scope=col><B href="#/m10888/" 
            target=_blank>2012款君威 2.4L SIDI旗舰版 </A><I id=base_8_img_10888></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8769 scope=col><B href="#/m8769/" 
            target=_blank>2011款君威 2.4L SIDI舒适版(停产) </A><I 
            id=base_8_img_8769></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8770 scope=col><B href="#/m8770/" 
            target=_blank>2011款君威 2.4L SIDI精英版(停产) </A><I 
            id=base_8_img_8770></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8771 scope=col><B href="#/m8771/" 
            target=_blank>2011款君威 2.4L SIDI旗舰版(停产) </A><I 
            id=base_8_img_8771></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6934 scope=col><B href="#/m6934/" 
            target=_blank>2010款君威 1.6T 精英运动版(停产) </A><I id=base_8_img_6934></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9216 scope=col><B href="#/m9216/" 
            target=_blank>2010款君威 2.0L 舒适版(停产) </A><I id=base_8_img_9216></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6935 scope=col><B href="#/m6935/" 
            target=_blank>2010款君威 2.0L 世博版(停产) </A><I id=base_8_img_6935></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6938 scope=col><B href="#/m6938/" 
            target=_blank>2010款君威 2.0T 豪华运动版(停产) </A><I id=base_8_img_6938></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6939 scope=col><B href="#/m6939/" 
            target=_blank>2010款君威 2.0T 旗舰运动版(停产) </A><I id=base_8_img_6939></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isabs_10884>●</TD>
          <TD id=m_isabs_10885>●</TD>
          <TD id=m_isabs_10886>●</TD>
          <TD id=m_isabs_10889>●</TD>
          <TD id=m_isabs_10887>●</TD>
          <TD id=m_isabs_10888>●</TD>
          <TD id=m_isabs_8769>●</TD>
          <TD id=m_isabs_8770>●</TD>
          <TD id=m_isabs_8771>●</TD>
          <TD id=m_isabs_6934>●</TD>
          <TD id=m_isabs_9216>●</TD>
          <TD id=m_isabs_6935>●</TD>
          <TD id=m_isabs_6938>●</TD>
          <TD id=m_isabs_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isesp_10884>●</TD>
          <TD id=m_isesp_10885>●</TD>
          <TD id=m_isesp_10886>●</TD>
          <TD id=m_isesp_10889>●</TD>
          <TD id=m_isesp_10887>●</TD>
          <TD id=m_isesp_10888>●</TD>
          <TD id=m_isesp_8769>●</TD>
          <TD id=m_isesp_8770>●</TD>
          <TD id=m_isesp_8771>●</TD>
          <TD id=m_isesp_6934>●</TD>
          <TD id=m_isesp_9216>●</TD>
          <TD id=m_isesp_6935>●</TD>
          <TD id=m_isesp_6938>●</TD>
          <TD id=m_isesp_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_isadsus_10884>- </TD>
          <TD id=m_isadsus_10885>- </TD>
          <TD id=m_isadsus_10886>- </TD>
          <TD id=m_isadsus_10889>- </TD>
          <TD id=m_isadsus_10887>- </TD>
          <TD id=m_isadsus_10888>- </TD>
          <TD id=m_isadsus_8769>-</TD>
          <TD id=m_isadsus_8770>-</TD>
          <TD id=m_isadsus_8771>-</TD>
          <TD id=m_isadsus_6934>-</TD>
          <TD id=m_isadsus_9216>-</TD>
          <TD id=m_isadsus_6935>-</TD>
          <TD id=m_isadsus_6938>-</TD>
          <TD id=m_isadsus_6939>-</TD></TR>
        <TR class=hidd>
          <TD id=m_istpmonitor_10884>●</TD>
          <TD id=m_istpmonitor_10885>●</TD>
          <TD id=m_istpmonitor_10886>●</TD>
          <TD id=m_istpmonitor_10889>●</TD>
          <TD id=m_istpmonitor_10887>●</TD>
          <TD id=m_istpmonitor_10888>●</TD>
          <TD id=m_istpmonitor_8769>●</TD>
          <TD id=m_istpmonitor_8770>●</TD>
          <TD id=m_istpmonitor_8771>●</TD>
          <TD id=m_istpmonitor_6934>●</TD>
          <TD id=m_istpmonitor_9216>●</TD>
          <TD id=m_istpmonitor_6935>●</TD>
          <TD id=m_istpmonitor_6938>●</TD>
          <TD id=m_istpmonitor_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_istpruning_10884>-</TD>
          <TD id=m_istpruning_10885>-</TD>
          <TD id=m_istpruning_10886>-</TD>
          <TD id=m_istpruning_10889>-</TD>
          <TD id=m_istpruning_10887>-</TD>
          <TD id=m_istpruning_10888>-</TD>
          <TD id=m_istpruning_8769>-</TD>
          <TD id=m_istpruning_8770>-</TD>
          <TD id=m_istpruning_8771>-</TD>
          <TD id=m_istpruning_6934>-</TD>
          <TD id=m_istpruning_9216>-</TD>
          <TD id=m_istpruning_6935>-</TD>
          <TD id=m_istpruning_6938>-</TD>
          <TD id=m_istpruning_6939>-</TD></TR>
        <TR class=disc>
          <TD id=m_isfsteering_10884>●</TD>
          <TD id=m_isfsteering_10885>●</TD>
          <TD id=m_isfsteering_10886>●</TD>
          <TD id=m_isfsteering_10889>- </TD>
          <TD id=m_isfsteering_10887>●</TD>
          <TD id=m_isfsteering_10888>●</TD>
          <TD id=m_isfsteering_8769>- </TD>
          <TD id=m_isfsteering_8770>- </TD>
          <TD id=m_isfsteering_8771>- </TD>
          <TD id=m_isfsteering_6934>- </TD>
          <TD id=m_isfsteering_9216>- </TD>
          <TD id=m_isfsteering_6935>- </TD>
          <TD id=m_isfsteering_6938>- </TD>
          <TD id=m_isfsteering_6939>- </TD></TR>
        <TR class=hidd>
          <TD id=m_issteesys_10884>-</TD>
          <TD id=m_issteesys_10885>-</TD>
          <TD id=m_issteesys_10886>-</TD>
          <TD id=m_issteesys_10889>-</TD>
          <TD id=m_issteesys_10887>-</TD>
          <TD id=m_issteesys_10888>-</TD>
          <TD id=m_issteesys_8769>-</TD>
          <TD id=m_issteesys_8770>-</TD>
          <TD id=m_issteesys_8771>-</TD>
          <TD id=m_issteesys_6934>-</TD>
          <TD id=m_issteesys_9216>-</TD>
          <TD id=m_issteesys_6935>-</TD>
          <TD id=m_issteesys_6938>-</TD>
          <TD id=m_issteesys_6939>-</TD></TR>
        <TR class=disc>
          <TD id=m_isuphillassist_10884>-</TD>
          <TD id=m_isuphillassist_10885>-</TD>
          <TD id=m_isuphillassist_10886>-</TD>
          <TD id=m_isuphillassist_10889>-</TD>
          <TD id=m_isuphillassist_10887>-</TD>
          <TD id=m_isuphillassist_10888>●</TD>
          <TD id=m_isuphillassist_8769>-</TD>
          <TD id=m_isuphillassist_8770>-</TD>
          <TD id=m_isuphillassist_8771>●</TD>
          <TD id=m_isuphillassist_6934>-</TD>
          <TD id=m_isuphillassist_9216>-</TD>
          <TD id=m_isuphillassist_6935>-</TD>
          <TD id=m_isuphillassist_6938>-</TD>
          <TD id=m_isuphillassist_6939>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isandstitch_10884>-</TD>
          <TD id=m_isandstitch_10885>-</TD>
          <TD id=m_isandstitch_10886>-</TD>
          <TD id=m_isandstitch_10889>-</TD>
          <TD id=m_isandstitch_10887>-</TD>
          <TD id=m_isandstitch_10888>-</TD>
          <TD id=m_isandstitch_8769>-</TD>
          <TD id=m_isandstitch_8770>-</TD>
          <TD id=m_isandstitch_8771>-</TD>
          <TD id=m_isandstitch_6934>-</TD>
          <TD id=m_isandstitch_9216>-</TD>
          <TD id=m_isandstitch_6935>-</TD>
          <TD id=m_isandstitch_6938>-</TD>
          <TD id=m_isandstitch_6939>-</TD></TR>
        <TR id=base_9>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10884 scope=col><B href="#/m10884/" 
            target=_blank>2012款君威 1.6T 精英运动版 </A><I id=base_9_img_10884></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10885 scope=col><B href="#/m10885/" 
            target=_blank>2012款君威 2.0L 舒适版 </A><I id=base_9_img_10885></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10886 scope=col><B href="#/m10886/" 
            target=_blank>2012款君威 2.0L 豪华版 </A><I id=base_9_img_10886></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10889 scope=col><B href="#/m10889/" 
            target=_blank>2012款君威 2.0T 豪华运动版 </A><I id=base_9_img_10889></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10887 scope=col><B href="#/m10887/" 
            target=_blank>2012款君威 2.4L SIDI精英版 </A><I id=base_9_img_10887></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10888 scope=col><B href="#/m10888/" 
            target=_blank>2012款君威 2.4L SIDI旗舰版 </A><I id=base_9_img_10888></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8769 scope=col><B href="#/m8769/" 
            target=_blank>2011款君威 2.4L SIDI舒适版(停产) </A><I 
            id=base_9_img_8769></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8770 scope=col><B href="#/m8770/" 
            target=_blank>2011款君威 2.4L SIDI精英版(停产) </A><I 
            id=base_9_img_8770></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8771 scope=col><B href="#/m8771/" 
            target=_blank>2011款君威 2.4L SIDI旗舰版(停产) </A><I 
            id=base_9_img_8771></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6934 scope=col><B href="#/m6934/" 
            target=_blank>2010款君威 1.6T 精英运动版(停产) </A><I id=base_9_img_6934></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9216 scope=col><B href="#/m9216/" 
            target=_blank>2010款君威 2.0L 舒适版(停产) </A><I id=base_9_img_9216></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6935 scope=col><B href="#/m6935/" 
            target=_blank>2010款君威 2.0L 世博版(停产) </A><I id=base_9_img_6935></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6938 scope=col><B href="#/m6938/" 
            target=_blank>2010款君威 2.0T 豪华运动版(停产) </A><I id=base_9_img_6938></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6939 scope=col><B href="#/m6939/" 
            target=_blank>2010款君威 2.0T 旗舰运动版(停产) </A><I id=base_9_img_6939></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_iswindow_10884>●</TD>
          <TD id=m_iswindow_10885>●</TD>
          <TD id=m_iswindow_10886>●</TD>
          <TD id=m_iswindow_10889>●</TD>
          <TD id=m_iswindow_10887>●</TD>
          <TD id=m_iswindow_10888>●</TD>
          <TD id=m_iswindow_8769>●</TD>
          <TD id=m_iswindow_8770>●</TD>
          <TD id=m_iswindow_8771>●</TD>
          <TD id=m_iswindow_6934>●</TD>
          <TD id=m_iswindow_9216>●</TD>
          <TD id=m_iswindow_6935>●</TD>
          <TD id=m_iswindow_6938>●</TD>
          <TD id=m_iswindow_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isarwindow_10884>-</TD>
          <TD id=m_isarwindow_10885>-</TD>
          <TD id=m_isarwindow_10886>-</TD>
          <TD id=m_isarwindow_10889>-</TD>
          <TD id=m_isarwindow_10887>-</TD>
          <TD id=m_isarwindow_10888>-</TD>
          <TD id=m_isarwindow_8769>-</TD>
          <TD id=m_isarwindow_8770>-</TD>
          <TD id=m_isarwindow_8771>-</TD>
          <TD id=m_isarwindow_6934>-</TD>
          <TD id=m_isarwindow_9216>-</TD>
          <TD id=m_isarwindow_6935>-</TD>
          <TD id=m_isarwindow_6938>-</TD>
          <TD id=m_isarwindow_6939>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isspround_10884>-</TD>
          <TD id=m_isspround_10885>-</TD>
          <TD id=m_isspround_10886>-</TD>
          <TD id=m_isspround_10889>-</TD>
          <TD id=m_isspround_10887>-</TD>
          <TD id=m_isspround_10888>-</TD>
          <TD id=m_isspround_8769>-</TD>
          <TD id=m_isspround_8770>-</TD>
          <TD id=m_isspround_8771>-</TD>
          <TD id=m_isspround_6934>-</TD>
          <TD id=m_isspround_9216>-</TD>
          <TD id=m_isspround_6935>-</TD>
          <TD id=m_isspround_6938>-</TD>
          <TD id=m_isspround_6939>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isaluhub_10884>●</TD>
          <TD id=m_isaluhub_10885>●</TD>
          <TD id=m_isaluhub_10886>●</TD>
          <TD id=m_isaluhub_10889>●</TD>
          <TD id=m_isaluhub_10887>●</TD>
          <TD id=m_isaluhub_10888>●</TD>
          <TD id=m_isaluhub_8769>●</TD>
          <TD id=m_isaluhub_8770>●</TD>
          <TD id=m_isaluhub_8771>●</TD>
          <TD id=m_isaluhub_6934>●</TD>
          <TD id=m_isaluhub_9216>●</TD>
          <TD id=m_isaluhub_6935>●</TD>
          <TD id=m_isaluhub_6938>●</TD>
          <TD id=m_isaluhub_6939>●</TD></TR>
        <TR id=base_10>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10884 scope=col><B href="#/m10884/" 
            target=_blank>2012款君威 1.6T 精英运动版 </A><I id=base_10_img_10884></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10885 scope=col><B href="#/m10885/" 
            target=_blank>2012款君威 2.0L 舒适版 </A><I id=base_10_img_10885></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10886 scope=col><B href="#/m10886/" 
            target=_blank>2012款君威 2.0L 豪华版 </A><I id=base_10_img_10886></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10889 scope=col><B href="#/m10889/" 
            target=_blank>2012款君威 2.0T 豪华运动版 </A><I id=base_10_img_10889></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10887 scope=col><B href="#/m10887/" 
            target=_blank>2012款君威 2.4L SIDI精英版 </A><I id=base_10_img_10887></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10888 scope=col><B href="#/m10888/" 
            target=_blank>2012款君威 2.4L SIDI旗舰版 </A><I id=base_10_img_10888></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8769 scope=col><B href="#/m8769/" 
            target=_blank>2011款君威 2.4L SIDI舒适版(停产) </A><I 
            id=base_10_img_8769></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8770 scope=col><B href="#/m8770/" 
            target=_blank>2011款君威 2.4L SIDI精英版(停产) </A><I 
            id=base_10_img_8770></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8771 scope=col><B href="#/m8771/" 
            target=_blank>2011款君威 2.4L SIDI旗舰版(停产) </A><I 
            id=base_10_img_8771></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6934 scope=col><B href="#/m6934/" 
            target=_blank>2010款君威 1.6T 精英运动版(停产) </A><I id=base_10_img_6934></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9216 scope=col><B href="#/m9216/" 
            target=_blank>2010款君威 2.0L 舒适版(停产) </A><I id=base_10_img_9216></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6935 scope=col><B href="#/m6935/" 
            target=_blank>2010款君威 2.0L 世博版(停产) </A><I id=base_10_img_6935></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6938 scope=col><B href="#/m6938/" 
            target=_blank>2010款君威 2.0T 豪华运动版(停产) </A><I id=base_10_img_6938></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6939 scope=col><B href="#/m6939/" 
            target=_blank>2010款君威 2.0T 旗舰运动版(停产) </A><I id=base_10_img_6939></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isleasw_10884>●</TD>
          <TD id=m_isleasw_10885>-</TD>
          <TD id=m_isleasw_10886>●</TD>
          <TD id=m_isleasw_10889>●</TD>
          <TD id=m_isleasw_10887>●</TD>
          <TD id=m_isleasw_10888>●</TD>
          <TD id=m_isleasw_8769>●</TD>
          <TD id=m_isleasw_8770>●</TD>
          <TD id=m_isleasw_8771>●</TD>
          <TD id=m_isleasw_6934>●</TD>
          <TD id=m_isleasw_9216>-</TD>
          <TD id=m_isleasw_6935>●</TD>
          <TD id=m_isleasw_6938>●</TD>
          <TD id=m_isleasw_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswud_10884>●</TD>
          <TD id=m_isswud_10885>●</TD>
          <TD id=m_isswud_10886>●</TD>
          <TD id=m_isswud_10889>●</TD>
          <TD id=m_isswud_10887>●</TD>
          <TD id=m_isswud_10888>●</TD>
          <TD id=m_isswud_8769>●</TD>
          <TD id=m_isswud_8770>●</TD>
          <TD id=m_isswud_8771>●</TD>
          <TD id=m_isswud_6934>●</TD>
          <TD id=m_isswud_9216>●</TD>
          <TD id=m_isswud_6935>●</TD>
          <TD id=m_isswud_6938>●</TD>
          <TD id=m_isswud_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswfb_10884>●</TD>
          <TD id=m_isswfb_10885>●</TD>
          <TD id=m_isswfb_10886>●</TD>
          <TD id=m_isswfb_10889>●</TD>
          <TD id=m_isswfb_10887>●</TD>
          <TD id=m_isswfb_10888>●</TD>
          <TD id=m_isswfb_8769>●</TD>
          <TD id=m_isswfb_8770>●</TD>
          <TD id=m_isswfb_8771>●</TD>
          <TD id=m_isswfb_6934>●</TD>
          <TD id=m_isswfb_9216>●</TD>
          <TD id=m_isswfb_6935>●</TD>
          <TD id=m_isswfb_6938>●</TD>
          <TD id=m_isswfb_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_ismultisw_10884>●</TD>
          <TD id=m_ismultisw_10885>-</TD>
          <TD id=m_ismultisw_10886>●</TD>
          <TD id=m_ismultisw_10889>●</TD>
          <TD id=m_ismultisw_10887>●</TD>
          <TD id=m_ismultisw_10888>●</TD>
          <TD id=m_ismultisw_8769>●</TD>
          <TD id=m_ismultisw_8770>●</TD>
          <TD id=m_ismultisw_8771>●</TD>
          <TD id=m_ismultisw_6934>●</TD>
          <TD id=m_ismultisw_9216>-</TD>
          <TD id=m_ismultisw_6935>●</TD>
          <TD id=m_ismultisw_6938>●</TD>
          <TD id=m_ismultisw_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswshift_10884>-</TD>
          <TD id=m_isswshift_10885>-</TD>
          <TD id=m_isswshift_10886>-</TD>
          <TD id=m_isswshift_10889>-</TD>
          <TD id=m_isswshift_10887>-</TD>
          <TD id=m_isswshift_10888>-</TD>
          <TD id=m_isswshift_8769>-</TD>
          <TD id=m_isswshift_8770>-</TD>
          <TD id=m_isswshift_8771>-</TD>
          <TD id=m_isswshift_6934>-</TD>
          <TD id=m_isswshift_9216>-</TD>
          <TD id=m_isswshift_6935>-</TD>
          <TD id=m_isswshift_6938>-</TD>
          <TD id=m_isswshift_6939>-</TD></TR>
        <TR class=disc>
          <TD id=m_isascd_10884>●</TD>
          <TD id=m_isascd_10885>-</TD>
          <TD id=m_isascd_10886>●</TD>
          <TD id=m_isascd_10889>●</TD>
          <TD id=m_isascd_10887>●</TD>
          <TD id=m_isascd_10888>●</TD>
          <TD id=m_isascd_8769>●</TD>
          <TD id=m_isascd_8770>●</TD>
          <TD id=m_isascd_8771>●</TD>
          <TD id=m_isascd_6934>●</TD>
          <TD id=m_isascd_9216>-</TD>
          <TD id=m_isascd_6935>●</TD>
          <TD id=m_isascd_6938>●</TD>
          <TD id=m_isascd_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isassibc_10884>●</TD>
          <TD id=m_isassibc_10885>●</TD>
          <TD id=m_isassibc_10886>●</TD>
          <TD id=m_isassibc_10889>●</TD>
          <TD id=m_isassibc_10887>●</TD>
          <TD id=m_isassibc_10888>●</TD>
          <TD id=m_isassibc_8769>●</TD>
          <TD id=m_isassibc_8770>●</TD>
          <TD id=m_isassibc_8771>●</TD>
          <TD id=m_isassibc_6934>●</TD>
          <TD id=m_isassibc_9216>●</TD>
          <TD id=m_isassibc_6935>●</TD>
          <TD id=m_isassibc_6938>●</TD>
          <TD id=m_isassibc_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_isparkvideo_10884>-</TD>
          <TD id=m_isparkvideo_10885>-</TD>
          <TD id=m_isparkvideo_10886>-</TD>
          <TD id=m_isparkvideo_10889>●</TD>
          <TD id=m_isparkvideo_10887>-</TD>
          <TD id=m_isparkvideo_10888>●</TD>
          <TD id=m_isparkvideo_8769>-</TD>
          <TD id=m_isparkvideo_8770>-</TD>
          <TD id=m_isparkvideo_8771>-</TD>
          <TD id=m_isparkvideo_6934>-</TD>
          <TD id=m_isparkvideo_9216>-</TD>
          <TD id=m_isparkvideo_6935>-</TD>
          <TD id=m_isparkvideo_6938>-</TD>
          <TD id=m_isparkvideo_6939>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ispark_10884>-</TD>
          <TD id=m_ispark_10885>-</TD>
          <TD id=m_ispark_10886>-</TD>
          <TD id=m_ispark_10889>-</TD>
          <TD id=m_ispark_10887>-</TD>
          <TD id=m_ispark_10888>-</TD>
          <TD id=m_ispark_8769>-</TD>
          <TD id=m_ispark_8770>-</TD>
          <TD id=m_ispark_8771>-</TD>
          <TD id=m_ispark_6934>-</TD>
          <TD id=m_ispark_9216>-</TD>
          <TD id=m_ispark_6935>-</TD>
          <TD id=m_ispark_6938>-</TD>
          <TD id=m_ispark_6939>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ishud_10884>-</TD>
          <TD id=m_ishud_10885>-</TD>
          <TD id=m_ishud_10886>-</TD>
          <TD id=m_ishud_10889>-</TD>
          <TD id=m_ishud_10887>-</TD>
          <TD id=m_ishud_10888>-</TD>
          <TD id=m_ishud_8769>-</TD>
          <TD id=m_ishud_8770>-</TD>
          <TD id=m_ishud_8771>-</TD>
          <TD id=m_ishud_6934>-</TD>
          <TD id=m_ishud_9216>-</TD>
          <TD id=m_ishud_6935>-</TD>
          <TD id=m_ishud_6938>-</TD>
          <TD id=m_ishud_6939>-</TD></TR>
        <TR id=base_11>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10884 scope=col><B href="#/m10884/" 
            target=_blank>2012款君威 1.6T 精英运动版 </A><I id=base_11_img_10884></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10885 scope=col><B href="#/m10885/" 
            target=_blank>2012款君威 2.0L 舒适版 </A><I id=base_11_img_10885></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10886 scope=col><B href="#/m10886/" 
            target=_blank>2012款君威 2.0L 豪华版 </A><I id=base_11_img_10886></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10889 scope=col><B href="#/m10889/" 
            target=_blank>2012款君威 2.0T 豪华运动版 </A><I id=base_11_img_10889></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10887 scope=col><B href="#/m10887/" 
            target=_blank>2012款君威 2.4L SIDI精英版 </A><I id=base_11_img_10887></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10888 scope=col><B href="#/m10888/" 
            target=_blank>2012款君威 2.4L SIDI旗舰版 </A><I id=base_11_img_10888></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8769 scope=col><B href="#/m8769/" 
            target=_blank>2011款君威 2.4L SIDI舒适版(停产) </A><I 
            id=base_11_img_8769></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8770 scope=col><B href="#/m8770/" 
            target=_blank>2011款君威 2.4L SIDI精英版(停产) </A><I 
            id=base_11_img_8770></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8771 scope=col><B href="#/m8771/" 
            target=_blank>2011款君威 2.4L SIDI旗舰版(停产) </A><I 
            id=base_11_img_8771></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6934 scope=col><B href="#/m6934/" 
            target=_blank>2010款君威 1.6T 精英运动版(停产) </A><I id=base_11_img_6934></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9216 scope=col><B href="#/m9216/" 
            target=_blank>2010款君威 2.0L 舒适版(停产) </A><I id=base_11_img_9216></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6935 scope=col><B href="#/m6935/" 
            target=_blank>2010款君威 2.0L 世博版(停产) </A><I id=base_11_img_6935></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6938 scope=col><B href="#/m6938/" 
            target=_blank>2010款君威 2.0T 豪华运动版(停产) </A><I id=base_11_img_6938></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6939 scope=col><B href="#/m6939/" 
            target=_blank>2010款君威 2.0T 旗舰运动版(停产) </A><I id=base_11_img_6939></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isleaseat_10884>-</TD>
          <TD id=m_isleaseat_10885>-</TD>
          <TD id=m_isleaseat_10886>●</TD>
          <TD id=m_isleaseat_10889>●</TD>
          <TD id=m_isleaseat_10887>●</TD>
          <TD id=m_isleaseat_10888>●</TD>
          <TD id=m_isleaseat_8769>-</TD>
          <TD id=m_isleaseat_8770>●</TD>
          <TD id=m_isleaseat_8771>●</TD>
          <TD id=m_isleaseat_6934>-</TD>
          <TD id=m_isleaseat_9216>-</TD>
          <TD id=m_isleaseat_6935>●</TD>
          <TD id=m_isleaseat_6938>●</TD>
          <TD id=m_isleaseat_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatadj_10884>●</TD>
          <TD id=m_isseatadj_10885>●</TD>
          <TD id=m_isseatadj_10886>●</TD>
          <TD id=m_isseatadj_10889>●</TD>
          <TD id=m_isseatadj_10887>●</TD>
          <TD id=m_isseatadj_10888>●</TD>
          <TD id=m_isseatadj_8769>●</TD>
          <TD id=m_isseatadj_8770>●</TD>
          <TD id=m_isseatadj_8771>●</TD>
          <TD id=m_isseatadj_6934>●</TD>
          <TD id=m_isseatadj_9216>●</TD>
          <TD id=m_isseatadj_6935>●</TD>
          <TD id=m_isseatadj_6938>●</TD>
          <TD id=m_isseatadj_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_iswaistadj_10884>-</TD>
          <TD id=m_iswaistadj_10885>-</TD>
          <TD id=m_iswaistadj_10886>●</TD>
          <TD id=m_iswaistadj_10889>-</TD>
          <TD id=m_iswaistadj_10887>●</TD>
          <TD id=m_iswaistadj_10888>●</TD>
          <TD id=m_iswaistadj_8769>-</TD>
          <TD id=m_iswaistadj_8770>●</TD>
          <TD id=m_iswaistadj_8771>●</TD>
          <TD id=m_iswaistadj_6934>-</TD>
          <TD id=m_iswaistadj_9216>-</TD>
          <TD id=m_iswaistadj_6935>●</TD>
          <TD id=m_iswaistadj_6938>-</TD>
          <TD id=m_iswaistadj_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_isfseatadj_10884>●</TD>
          <TD id=m_isfseatadj_10885>●</TD>
          <TD id=m_isfseatadj_10886>●</TD>
          <TD id=m_isfseatadj_10889>●</TD>
          <TD id=m_isfseatadj_10887>●</TD>
          <TD id=m_isfseatadj_10888>●</TD>
          <TD id=m_isfseatadj_8769>-</TD>
          <TD id=m_isfseatadj_8770>●</TD>
          <TD id=m_isfseatadj_8771>●</TD>
          <TD id=m_isfseatadj_6934>-</TD>
          <TD id=m_isfseatadj_9216>-</TD>
          <TD id=m_isfseatadj_6935>●</TD>
          <TD id=m_isfseatadj_6938>●</TD>
          <TD id=m_isfseatadj_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_iseseatmem_10884>-</TD>
          <TD id=m_iseseatmem_10885>-</TD>
          <TD id=m_iseseatmem_10886>-</TD>
          <TD id=m_iseseatmem_10889>-</TD>
          <TD id=m_iseseatmem_10887>-</TD>
          <TD id=m_iseseatmem_10888>●</TD>
          <TD id=m_iseseatmem_8769>-</TD>
          <TD id=m_iseseatmem_8770>-</TD>
          <TD id=m_iseseatmem_8771>●</TD>
          <TD id=m_iseseatmem_6934>-</TD>
          <TD id=m_iseseatmem_9216>-</TD>
          <TD id=m_iseseatmem_6935>-</TD>
          <TD id=m_iseseatmem_6938>-</TD>
          <TD id=m_iseseatmem_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_isseathot_10884>-</TD>
          <TD id=m_isseathot_10885>-</TD>
          <TD id=m_isseathot_10886>●</TD>
          <TD id=m_isseathot_10889>●</TD>
          <TD id=m_isseathot_10887>●</TD>
          <TD id=m_isseathot_10888>●</TD>
          <TD id=m_isseathot_8769>-</TD>
          <TD id=m_isseathot_8770>●</TD>
          <TD id=m_isseathot_8771>●</TD>
          <TD id=m_isseathot_6934>-</TD>
          <TD id=m_isseathot_9216>-</TD>
          <TD id=m_isseathot_6935>●</TD>
          <TD id=m_isseathot_6938>●</TD>
          <TD id=m_isseathot_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_isseatknead_10884>-</TD>
          <TD id=m_isseatknead_10885>-</TD>
          <TD id=m_isseatknead_10886>-</TD>
          <TD id=m_isseatknead_10889>-</TD>
          <TD id=m_isseatknead_10887>-</TD>
          <TD id=m_isseatknead_10888>●</TD>
          <TD id=m_isseatknead_8769>-</TD>
          <TD id=m_isseatknead_8770>-</TD>
          <TD id=m_isseatknead_8771>●</TD>
          <TD id=m_isseatknead_6934>-</TD>
          <TD id=m_isseatknead_9216>-</TD>
          <TD id=m_isseatknead_6935>-</TD>
          <TD id=m_isseatknead_6938>-</TD>
          <TD id=m_isseatknead_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbseatlay_10884>-</TD>
          <TD id=m_isbseatlay_10885>-</TD>
          <TD id=m_isbseatlay_10886>-</TD>
          <TD id=m_isbseatlay_10889>-</TD>
          <TD id=m_isbseatlay_10887>-</TD>
          <TD id=m_isbseatlay_10888>-</TD>
          <TD id=m_isbseatlay_8769>-</TD>
          <TD id=m_isbseatlay_8770>-</TD>
          <TD id=m_isbseatlay_8771>-</TD>
          <TD id=m_isbseatlay_6934>-</TD>
          <TD id=m_isbseatlay_9216>-</TD>
          <TD id=m_isbseatlay_6935>-</TD>
          <TD id=m_isbseatlay_6938>-</TD>
          <TD id=m_isbseatlay_6939>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isbseatplay_10884>●</TD>
          <TD id=m_isbseatplay_10885>●</TD>
          <TD id=m_isbseatplay_10886>●</TD>
          <TD id=m_isbseatplay_10889>●</TD>
          <TD id=m_isbseatplay_10887>●</TD>
          <TD id=m_isbseatplay_10888>●</TD>
          <TD id=m_isbseatplay_8769>●</TD>
          <TD id=m_isbseatplay_8770>●</TD>
          <TD id=m_isbseatplay_8771>●</TD>
          <TD id=m_isbseatplay_6934>●</TD>
          <TD id=m_isbseatplay_9216>●</TD>
          <TD id=m_isbseatplay_6935>●</TD>
          <TD id=m_isbseatplay_6938>●</TD>
          <TD id=m_isbseatplay_6939>●</TD></TR>
        <TR id=base_12>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10884 scope=col><B href="#/m10884/" 
            target=_blank>2012款君威 1.6T 精英运动版 </A><I id=base_12_img_10884></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10885 scope=col><B href="#/m10885/" 
            target=_blank>2012款君威 2.0L 舒适版 </A><I id=base_12_img_10885></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10886 scope=col><B href="#/m10886/" 
            target=_blank>2012款君威 2.0L 豪华版 </A><I id=base_12_img_10886></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10889 scope=col><B href="#/m10889/" 
            target=_blank>2012款君威 2.0T 豪华运动版 </A><I id=base_12_img_10889></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10887 scope=col><B href="#/m10887/" 
            target=_blank>2012款君威 2.4L SIDI精英版 </A><I id=base_12_img_10887></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10888 scope=col><B href="#/m10888/" 
            target=_blank>2012款君威 2.4L SIDI旗舰版 </A><I id=base_12_img_10888></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8769 scope=col><B href="#/m8769/" 
            target=_blank>2011款君威 2.4L SIDI舒适版(停产) </A><I 
            id=base_12_img_8769></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8770 scope=col><B href="#/m8770/" 
            target=_blank>2011款君威 2.4L SIDI精英版(停产) </A><I 
            id=base_12_img_8770></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8771 scope=col><B href="#/m8771/" 
            target=_blank>2011款君威 2.4L SIDI旗舰版(停产) </A><I 
            id=base_12_img_8771></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6934 scope=col><B href="#/m6934/" 
            target=_blank>2010款君威 1.6T 精英运动版(停产) </A><I id=base_12_img_6934></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9216 scope=col><B href="#/m9216/" 
            target=_blank>2010款君威 2.0L 舒适版(停产) </A><I id=base_12_img_9216></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6935 scope=col><B href="#/m6935/" 
            target=_blank>2010款君威 2.0L 世博版(停产) </A><I id=base_12_img_6935></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6938 scope=col><B href="#/m6938/" 
            target=_blank>2010款君威 2.0T 豪华运动版(停产) </A><I id=base_12_img_6938></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6939 scope=col><B href="#/m6939/" 
            target=_blank>2010款君威 2.0T 旗舰运动版(停产) </A><I id=base_12_img_6939></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isgps_10884>-</TD>
          <TD id=m_isgps_10885>-</TD>
          <TD id=m_isgps_10886>-</TD>
          <TD id=m_isgps_10889>●</TD>
          <TD id=m_isgps_10887>-</TD>
          <TD id=m_isgps_10888>●</TD>
          <TD id=m_isgps_8769>-</TD>
          <TD id=m_isgps_8770>●</TD>
          <TD id=m_isgps_8771>●</TD>
          <TD id=m_isgps_6934>-</TD>
          <TD id=m_isgps_9216>-</TD>
          <TD id=m_isgps_6935>-</TD>
          <TD id=m_isgps_6938>●</TD>
          <TD id=m_isgps_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_isbluetooth_10884>●</TD>
          <TD id=m_isbluetooth_10885>-</TD>
          <TD id=m_isbluetooth_10886>●</TD>
          <TD id=m_isbluetooth_10889>●</TD>
          <TD id=m_isbluetooth_10887>●</TD>
          <TD id=m_isbluetooth_10888>●</TD>
          <TD id=m_isbluetooth_8769>-</TD>
          <TD id=m_isbluetooth_8770>●</TD>
          <TD id=m_isbluetooth_8771>●</TD>
          <TD id=m_isbluetooth_6934>●</TD>
          <TD id=m_isbluetooth_9216>-</TD>
          <TD id=m_isbluetooth_6935>●</TD>
          <TD id=m_isbluetooth_6938>●</TD>
          <TD id=m_isbluetooth_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_istv_10884>-</TD>
          <TD id=m_istv_10885>-</TD>
          <TD id=m_istv_10886>-</TD>
          <TD id=m_istv_10889>-</TD>
          <TD id=m_istv_10887>-</TD>
          <TD id=m_istv_10888>-</TD>
          <TD id=m_istv_8769>-</TD>
          <TD id=m_istv_8770>-</TD>
          <TD id=m_istv_8771>-</TD>
          <TD id=m_istv_6934>-</TD>
          <TD id=m_istv_9216>-</TD>
          <TD id=m_istv_6935>-</TD>
          <TD id=m_istv_6938>-</TD>
          <TD id=m_istv_6939>-</TD></TR>
        <TR class=disc>
          <TD id=m_iscclcd_10884>-</TD>
          <TD id=m_iscclcd_10885>-</TD>
          <TD id=m_iscclcd_10886>-</TD>
          <TD id=m_iscclcd_10889>●</TD>
          <TD id=m_iscclcd_10887>-</TD>
          <TD id=m_iscclcd_10888>●</TD>
          <TD id=m_iscclcd_8769>-</TD>
          <TD id=m_iscclcd_8770>●</TD>
          <TD id=m_iscclcd_8771>●</TD>
          <TD id=m_iscclcd_6934>-</TD>
          <TD id=m_iscclcd_9216>-</TD>
          <TD id=m_iscclcd_6935>-</TD>
          <TD id=m_iscclcd_6938>●</TD>
          <TD id=m_iscclcd_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isblcd_10884>-</TD>
          <TD id=m_isblcd_10885>-</TD>
          <TD id=m_isblcd_10886>-</TD>
          <TD id=m_isblcd_10889>-</TD>
          <TD id=m_isblcd_10887>-</TD>
          <TD id=m_isblcd_10888>-</TD>
          <TD id=m_isblcd_8769>-</TD>
          <TD id=m_isblcd_8770>-</TD>
          <TD id=m_isblcd_8771>-</TD>
          <TD id=m_isblcd_6934>-</TD>
          <TD id=m_isblcd_9216>-</TD>
          <TD id=m_isblcd_6935>-</TD>
          <TD id=m_isblcd_6938>-</TD>
          <TD id=m_isblcd_6939>-</TD></TR>
        <TR class=disc>
          <TD id=m_ismp3_10884>-</TD>
          <TD id=m_ismp3_10885>-</TD>
          <TD id=m_ismp3_10886>-</TD>
          <TD id=m_ismp3_10889>●</TD>
          <TD id=m_ismp3_10887>-</TD>
          <TD id=m_ismp3_10888>●</TD>
          <TD id=m_ismp3_8769>●</TD>
          <TD id=m_ismp3_8770>●</TD>
          <TD id=m_ismp3_8771>●</TD>
          <TD id=m_ismp3_6934>●</TD>
          <TD id=m_ismp3_9216>●</TD>
          <TD id=m_ismp3_6935>●</TD>
          <TD id=m_ismp3_6938>●</TD>
          <TD id=m_ismp3_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_iscd_10884>●</TD>
          <TD id=m_iscd_10885>●</TD>
          <TD id=m_iscd_10886>●</TD>
          <TD id=m_iscd_10889>●</TD>
          <TD id=m_iscd_10887>●</TD>
          <TD id=m_iscd_10888>-</TD>
          <TD id=m_iscd_8769>●</TD>
          <TD id=m_iscd_8770>-</TD>
          <TD id=m_iscd_8771>-</TD>
          <TD id=m_iscd_6934>●</TD>
          <TD id=m_iscd_9216>●</TD>
          <TD id=m_iscd_6935>●</TD>
          <TD id=m_iscd_6938>-</TD>
          <TD id=m_iscd_6939>-</TD></TR>
        <TR class=disc>
          <TD id=m_iscd_10884>1 </TD>
          <TD id=m_iscd_10885>1 </TD>
          <TD id=m_iscd_10886>1 </TD>
          <TD id=m_iscd_10889>1 </TD>
          <TD id=m_iscd_10887>1 </TD>
          <TD id=m_iscd_10888>- </TD>
          <TD id=m_iscd_8769>6 </TD>
          <TD id=m_iscd_8770>- </TD>
          <TD id=m_iscd_8771>- </TD>
          <TD id=m_iscd_6934>6 </TD>
          <TD id=m_iscd_9216>1 </TD>
          <TD id=m_iscd_6935>6 </TD>
          <TD id=m_iscd_6938>- </TD>
          <TD id=m_iscd_6939>- </TD></TR>
        <TR class=disc>
          <TD id=10884>-</TD>
          <TD id=10885>-</TD>
          <TD id=10886>-</TD>
          <TD id=10889>-</TD>
          <TD id=10887>-</TD>
          <TD id=10888>●</TD>
          <TD id=8769>-</TD>
          <TD id=8770>●</TD>
          <TD id=8771>●</TD>
          <TD id=6934>-</TD>
          <TD id=9216>-</TD>
          <TD id=6935>-</TD>
          <TD id=6938>●</TD>
          <TD id=6939>●</TD></TR>
        <TR class=disc>
          <TD id=10884>- </TD>
          <TD id=10885>- </TD>
          <TD id=10886>- </TD>
          <TD id=10889>- </TD>
          <TD id=10887>- </TD>
          <TD id=10888>1 </TD>
          <TD id=8769>- </TD>
          <TD id=8770>1 </TD>
          <TD id=8771>1 </TD>
          <TD id=6934>- </TD>
          <TD id=9216>- </TD>
          <TD id=6935>- </TD>
          <TD id=6938>1 </TD>
          <TD id=6939>1 </TD></TR>
        <TR class=hidd>
          <TD id=m_is2audio_10884>-</TD>
          <TD id=m_is2audio_10885>-</TD>
          <TD id=m_is2audio_10886>-</TD>
          <TD id=m_is2audio_10889>-</TD>
          <TD id=m_is2audio_10887>-</TD>
          <TD id=m_is2audio_10888>-</TD>
          <TD id=m_is2audio_8769>-</TD>
          <TD id=m_is2audio_8770>-</TD>
          <TD id=m_is2audio_8771>-</TD>
          <TD id=m_is2audio_6934>-</TD>
          <TD id=m_is2audio_9216>-</TD>
          <TD id=m_is2audio_6935>-</TD>
          <TD id=m_is2audio_6938>-</TD>
          <TD id=m_is2audio_6939>-</TD></TR>
        <TR class=hidd>
          <TD id=m_is4audio_10884>-</TD>
          <TD id=m_is4audio_10885>-</TD>
          <TD id=m_is4audio_10886>-</TD>
          <TD id=m_is4audio_10889>-</TD>
          <TD id=m_is4audio_10887>-</TD>
          <TD id=m_is4audio_10888>-</TD>
          <TD id=m_is4audio_8769>-</TD>
          <TD id=m_is4audio_8770>-</TD>
          <TD id=m_is4audio_8771>-</TD>
          <TD id=m_is4audio_6934>-</TD>
          <TD id=m_is4audio_9216>-</TD>
          <TD id=m_is4audio_6935>-</TD>
          <TD id=m_is4audio_6938>-</TD>
          <TD id=m_is4audio_6939>-</TD></TR>
        <TR class=disc>
          <TD id=m_is6audio_10884>●</TD>
          <TD id=m_is6audio_10885>●</TD>
          <TD id=m_is6audio_10886>●</TD>
          <TD id=m_is6audio_10889>●</TD>
          <TD id=m_is6audio_10887>●</TD>
          <TD id=m_is6audio_10888>-</TD>
          <TD id=m_is6audio_8769>●</TD>
          <TD id=m_is6audio_8770>●</TD>
          <TD id=m_is6audio_8771>-</TD>
          <TD id=m_is6audio_6934>●</TD>
          <TD id=m_is6audio_9216>●</TD>
          <TD id=m_is6audio_6935>●</TD>
          <TD id=m_is6audio_6938>●</TD>
          <TD id=m_is6audio_6939>-</TD></TR>
        <TR class=disc>
          <TD id=m_is8audio_10884>-</TD>
          <TD id=m_is8audio_10885>-</TD>
          <TD id=m_is8audio_10886>-</TD>
          <TD id=m_is8audio_10889>-</TD>
          <TD id=m_is8audio_10887>-</TD>
          <TD id=m_is8audio_10888>●</TD>
          <TD id=m_is8audio_8769>-</TD>
          <TD id=m_is8audio_8770>-</TD>
          <TD id=m_is8audio_8771>●</TD>
          <TD id=m_is8audio_6934>-</TD>
          <TD id=m_is8audio_9216>-</TD>
          <TD id=m_is8audio_6935>-</TD>
          <TD id=m_is8audio_6938>-</TD>
          <TD id=m_is8audio_6939>●</TD></TR>
        <TR id=base_13>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10884 scope=col><B href="#/m10884/" 
            target=_blank>2012款君威 1.6T 精英运动版 </A><I id=base_13_img_10884></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10885 scope=col><B href="#/m10885/" 
            target=_blank>2012款君威 2.0L 舒适版 </A><I id=base_13_img_10885></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10886 scope=col><B href="#/m10886/" 
            target=_blank>2012款君威 2.0L 豪华版 </A><I id=base_13_img_10886></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10889 scope=col><B href="#/m10889/" 
            target=_blank>2012款君威 2.0T 豪华运动版 </A><I id=base_13_img_10889></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10887 scope=col><B href="#/m10887/" 
            target=_blank>2012款君威 2.4L SIDI精英版 </A><I id=base_13_img_10887></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10888 scope=col><B href="#/m10888/" 
            target=_blank>2012款君威 2.4L SIDI旗舰版 </A><I id=base_13_img_10888></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8769 scope=col><B href="#/m8769/" 
            target=_blank>2011款君威 2.4L SIDI舒适版(停产) </A><I 
            id=base_13_img_8769></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8770 scope=col><B href="#/m8770/" 
            target=_blank>2011款君威 2.4L SIDI精英版(停产) </A><I 
            id=base_13_img_8770></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8771 scope=col><B href="#/m8771/" 
            target=_blank>2011款君威 2.4L SIDI旗舰版(停产) </A><I 
            id=base_13_img_8771></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6934 scope=col><B href="#/m6934/" 
            target=_blank>2010款君威 1.6T 精英运动版(停产) </A><I id=base_13_img_6934></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9216 scope=col><B href="#/m9216/" 
            target=_blank>2010款君威 2.0L 舒适版(停产) </A><I id=base_13_img_9216></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6935 scope=col><B href="#/m6935/" 
            target=_blank>2010款君威 2.0L 世博版(停产) </A><I id=base_13_img_6935></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6938 scope=col><B href="#/m6938/" 
            target=_blank>2010款君威 2.0T 豪华运动版(停产) </A><I id=base_13_img_6938></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6939 scope=col><B href="#/m6939/" 
            target=_blank>2010款君威 2.0T 旗舰运动版(停产) </A><I id=base_13_img_6939></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isxelamp_10884>-</TD>
          <TD id=m_isxelamp_10885>-</TD>
          <TD id=m_isxelamp_10886>-</TD>
          <TD id=m_isxelamp_10889>●</TD>
          <TD id=m_isxelamp_10887>-</TD>
          <TD id=m_isxelamp_10888>●</TD>
          <TD id=m_isxelamp_8769>-</TD>
          <TD id=m_isxelamp_8770>-</TD>
          <TD id=m_isxelamp_8771>●</TD>
          <TD id=m_isxelamp_6934>-</TD>
          <TD id=m_isxelamp_9216>-</TD>
          <TD id=m_isxelamp_6935>-</TD>
          <TD id=m_isxelamp_6938>●</TD>
          <TD id=m_isxelamp_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isautohlamp_10884>●</TD>
          <TD id=m_isautohlamp_10885>●</TD>
          <TD id=m_isautohlamp_10886>●</TD>
          <TD id=m_isautohlamp_10889>●</TD>
          <TD id=m_isautohlamp_10887>●</TD>
          <TD id=m_isautohlamp_10888>●</TD>
          <TD id=m_isautohlamp_8769>●</TD>
          <TD id=m_isautohlamp_8770>●</TD>
          <TD id=m_isautohlamp_8771>●</TD>
          <TD id=m_isautohlamp_6934>●</TD>
          <TD id=m_isautohlamp_9216>●</TD>
          <TD id=m_isautohlamp_6935>●</TD>
          <TD id=m_isautohlamp_6938>●</TD>
          <TD id=m_isautohlamp_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_isturnhlamp_10884>-</TD>
          <TD id=m_isturnhlamp_10885>-</TD>
          <TD id=m_isturnhlamp_10886>-</TD>
          <TD id=m_isturnhlamp_10889>-</TD>
          <TD id=m_isturnhlamp_10887>-</TD>
          <TD id=m_isturnhlamp_10888>-</TD>
          <TD id=m_isturnhlamp_8769>-</TD>
          <TD id=m_isturnhlamp_8770>-</TD>
          <TD id=m_isturnhlamp_8771>●</TD>
          <TD id=m_isturnhlamp_6934>-</TD>
          <TD id=m_isturnhlamp_9216>-</TD>
          <TD id=m_isturnhlamp_6935>-</TD>
          <TD id=m_isturnhlamp_6938>●</TD>
          <TD id=m_isturnhlamp_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ishfoglamp_10884>●</TD>
          <TD id=m_ishfoglamp_10885>●</TD>
          <TD id=m_ishfoglamp_10886>●</TD>
          <TD id=m_ishfoglamp_10889>●</TD>
          <TD id=m_ishfoglamp_10887>●</TD>
          <TD id=m_ishfoglamp_10888>●</TD>
          <TD id=m_ishfoglamp_8769>●</TD>
          <TD id=m_ishfoglamp_8770>●</TD>
          <TD id=m_ishfoglamp_8771>●</TD>
          <TD id=m_ishfoglamp_6934>●</TD>
          <TD id=m_ishfoglamp_9216>●</TD>
          <TD id=m_ishfoglamp_6935>●</TD>
          <TD id=m_ishfoglamp_6938>●</TD>
          <TD id=m_ishfoglamp_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbfoglamp_10884>●</TD>
          <TD id=m_isbfoglamp_10885>●</TD>
          <TD id=m_isbfoglamp_10886>●</TD>
          <TD id=m_isbfoglamp_10889>●</TD>
          <TD id=m_isbfoglamp_10887>●</TD>
          <TD id=m_isbfoglamp_10888>●</TD>
          <TD id=m_isbfoglamp_8769>●</TD>
          <TD id=m_isbfoglamp_8770>●</TD>
          <TD id=m_isbfoglamp_8771>●</TD>
          <TD id=m_isbfoglamp_6934>●</TD>
          <TD id=m_isbfoglamp_9216>●</TD>
          <TD id=m_isbfoglamp_6935>●</TD>
          <TD id=m_isbfoglamp_6938>●</TD>
          <TD id=m_isbfoglamp_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_islampheiadj_10884>-</TD>
          <TD id=m_islampheiadj_10885>-</TD>
          <TD id=m_islampheiadj_10886>-</TD>
          <TD id=m_islampheiadj_10889>●</TD>
          <TD id=m_islampheiadj_10887>-</TD>
          <TD id=m_islampheiadj_10888>●</TD>
          <TD id=m_islampheiadj_8769>-</TD>
          <TD id=m_islampheiadj_8770>-</TD>
          <TD id=m_islampheiadj_8771>●</TD>
          <TD id=m_islampheiadj_6934>-</TD>
          <TD id=m_islampheiadj_9216>-</TD>
          <TD id=m_islampheiadj_6935>-</TD>
          <TD id=m_islampheiadj_6938>●</TD>
          <TD id=m_islampheiadj_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_islampclset_10884>-</TD>
          <TD id=m_islampclset_10885>-</TD>
          <TD id=m_islampclset_10886>-</TD>
          <TD id=m_islampclset_10889>●</TD>
          <TD id=m_islampclset_10887>-</TD>
          <TD id=m_islampclset_10888>●</TD>
          <TD id=m_islampclset_8769>-</TD>
          <TD id=m_islampclset_8770>-</TD>
          <TD id=m_islampclset_8771>●</TD>
          <TD id=m_islampclset_6934>-</TD>
          <TD id=m_islampclset_9216>-</TD>
          <TD id=m_islampclset_6935>-</TD>
          <TD id=m_islampclset_6938>●</TD>
          <TD id=m_islampclset_6939>●</TD></TR>
        <TR id=base_14>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10884 scope=col><B href="#/m10884/" 
            target=_blank>2012款君威 1.6T 精英运动版 </A><I id=base_14_img_10884></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10885 scope=col><B href="#/m10885/" 
            target=_blank>2012款君威 2.0L 舒适版 </A><I id=base_14_img_10885></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10886 scope=col><B href="#/m10886/" 
            target=_blank>2012款君威 2.0L 豪华版 </A><I id=base_14_img_10886></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10889 scope=col><B href="#/m10889/" 
            target=_blank>2012款君威 2.0T 豪华运动版 </A><I id=base_14_img_10889></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10887 scope=col><B href="#/m10887/" 
            target=_blank>2012款君威 2.4L SIDI精英版 </A><I id=base_14_img_10887></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10888 scope=col><B href="#/m10888/" 
            target=_blank>2012款君威 2.4L SIDI旗舰版 </A><I id=base_14_img_10888></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8769 scope=col><B href="#/m8769/" 
            target=_blank>2011款君威 2.4L SIDI舒适版(停产) </A><I 
            id=base_14_img_8769></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8770 scope=col><B href="#/m8770/" 
            target=_blank>2011款君威 2.4L SIDI精英版(停产) </A><I 
            id=base_14_img_8770></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8771 scope=col><B href="#/m8771/" 
            target=_blank>2011款君威 2.4L SIDI旗舰版(停产) </A><I 
            id=base_14_img_8771></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6934 scope=col><B href="#/m6934/" 
            target=_blank>2010款君威 1.6T 精英运动版(停产) </A><I id=base_14_img_6934></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9216 scope=col><B href="#/m9216/" 
            target=_blank>2010款君威 2.0L 舒适版(停产) </A><I id=base_14_img_9216></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6935 scope=col><B href="#/m6935/" 
            target=_blank>2010款君威 2.0L 世博版(停产) </A><I id=base_14_img_6935></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6938 scope=col><B href="#/m6938/" 
            target=_blank>2010款君威 2.0T 豪华运动版(停产) </A><I id=base_14_img_6938></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6939 scope=col><B href="#/m6939/" 
            target=_blank>2010款君威 2.0T 旗舰运动版(停产) </A><I id=base_14_img_6939></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isfewindow_10884>●</TD>
          <TD id=m_isfewindow_10885>●</TD>
          <TD id=m_isfewindow_10886>●</TD>
          <TD id=m_isfewindow_10889>●</TD>
          <TD id=m_isfewindow_10887>●</TD>
          <TD id=m_isfewindow_10888>●</TD>
          <TD id=m_isfewindow_8769>●</TD>
          <TD id=m_isfewindow_8770>●</TD>
          <TD id=m_isfewindow_8771>●</TD>
          <TD id=m_isfewindow_6934>●</TD>
          <TD id=m_isfewindow_9216>●</TD>
          <TD id=m_isfewindow_6935>●</TD>
          <TD id=m_isfewindow_6938>●</TD>
          <TD id=m_isfewindow_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbewindow_10884>●</TD>
          <TD id=m_isbewindow_10885>●</TD>
          <TD id=m_isbewindow_10886>●</TD>
          <TD id=m_isbewindow_10889>●</TD>
          <TD id=m_isbewindow_10887>●</TD>
          <TD id=m_isbewindow_10888>●</TD>
          <TD id=m_isbewindow_8769>●</TD>
          <TD id=m_isbewindow_8770>●</TD>
          <TD id=m_isbewindow_8771>●</TD>
          <TD id=m_isbewindow_6934>●</TD>
          <TD id=m_isbewindow_9216>●</TD>
          <TD id=m_isbewindow_6935>●</TD>
          <TD id=m_isbewindow_6938>●</TD>
          <TD id=m_isbewindow_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isgnhand_10884>●</TD>
          <TD id=m_isgnhand_10885>●</TD>
          <TD id=m_isgnhand_10886>●</TD>
          <TD id=m_isgnhand_10889>●</TD>
          <TD id=m_isgnhand_10887>●</TD>
          <TD id=m_isgnhand_10888>●</TD>
          <TD id=m_isgnhand_8769>●</TD>
          <TD id=m_isgnhand_8770>●</TD>
          <TD id=m_isgnhand_8771>●</TD>
          <TD id=m_isgnhand_6934>●</TD>
          <TD id=m_isgnhand_9216>●</TD>
          <TD id=m_isgnhand_6935>●</TD>
          <TD id=m_isgnhand_6938>●</TD>
          <TD id=m_isgnhand_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ispreventionuv_10884>-</TD>
          <TD id=m_ispreventionuv_10885>-</TD>
          <TD id=m_ispreventionuv_10886>-</TD>
          <TD id=m_ispreventionuv_10889>-</TD>
          <TD id=m_ispreventionuv_10887>-</TD>
          <TD id=m_ispreventionuv_10888>-</TD>
          <TD id=m_ispreventionuv_8769>-</TD>
          <TD id=m_ispreventionuv_8770>-</TD>
          <TD id=m_ispreventionuv_8771>-</TD>
          <TD id=m_ispreventionuv_6934>-</TD>
          <TD id=m_ispreventionuv_9216>-</TD>
          <TD id=m_ispreventionuv_6935>-</TD>
          <TD id=m_ispreventionuv_6938>-</TD>
          <TD id=m_ispreventionuv_6939>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isermirror_10884>●</TD>
          <TD id=m_isermirror_10885>●</TD>
          <TD id=m_isermirror_10886>●</TD>
          <TD id=m_isermirror_10889>●</TD>
          <TD id=m_isermirror_10887>●</TD>
          <TD id=m_isermirror_10888>●</TD>
          <TD id=m_isermirror_8769>●</TD>
          <TD id=m_isermirror_8770>●</TD>
          <TD id=m_isermirror_8771>●</TD>
          <TD id=m_isermirror_6934>●</TD>
          <TD id=m_isermirror_9216>●</TD>
          <TD id=m_isermirror_6935>●</TD>
          <TD id=m_isermirror_6938>●</TD>
          <TD id=m_isermirror_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ishotrmirror_10884>●</TD>
          <TD id=m_ishotrmirror_10885>●</TD>
          <TD id=m_ishotrmirror_10886>●</TD>
          <TD id=m_ishotrmirror_10889>●</TD>
          <TD id=m_ishotrmirror_10887>●</TD>
          <TD id=m_ishotrmirror_10888>●</TD>
          <TD id=m_ishotrmirror_8769>●</TD>
          <TD id=m_ishotrmirror_8770>●</TD>
          <TD id=m_ishotrmirror_8771>●</TD>
          <TD id=m_ishotrmirror_6934>●</TD>
          <TD id=m_ishotrmirror_9216>●</TD>
          <TD id=m_ishotrmirror_6935>●</TD>
          <TD id=m_ishotrmirror_6938>●</TD>
          <TD id=m_ishotrmirror_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_ismemorymirror_10884>-</TD>
          <TD id=m_ismemorymirror_10885>-</TD>
          <TD id=m_ismemorymirror_10886>-</TD>
          <TD id=m_ismemorymirror_10889>-</TD>
          <TD id=m_ismemorymirror_10887>-</TD>
          <TD id=m_ismemorymirror_10888>●</TD>
          <TD id=m_ismemorymirror_8769>-</TD>
          <TD id=m_ismemorymirror_8770>-</TD>
          <TD id=m_ismemorymirror_8771>●</TD>
          <TD id=m_ismemorymirror_6934>-</TD>
          <TD id=m_ismemorymirror_9216>-</TD>
          <TD id=m_ismemorymirror_6935>-</TD>
          <TD id=m_ismemorymirror_6938>-</TD>
          <TD id=m_ismemorymirror_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_iseprmirror_10884>-</TD>
          <TD id=m_iseprmirror_10885>-</TD>
          <TD id=m_iseprmirror_10886>-</TD>
          <TD id=m_iseprmirror_10889>-</TD>
          <TD id=m_iseprmirror_10887>-</TD>
          <TD id=m_iseprmirror_10888>●</TD>
          <TD id=m_iseprmirror_8769>-</TD>
          <TD id=m_iseprmirror_8770>-</TD>
          <TD id=m_iseprmirror_8771>●</TD>
          <TD id=m_iseprmirror_6934>-</TD>
          <TD id=m_iseprmirror_9216>-</TD>
          <TD id=m_iseprmirror_6935>-</TD>
          <TD id=m_iseprmirror_6938>-</TD>
          <TD id=m_iseprmirror_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_isrmirrorge_10884>-</TD>
          <TD id=m_isrmirrorge_10885>-</TD>
          <TD id=m_isrmirrorge_10886>-</TD>
          <TD id=m_isrmirrorge_10889>-</TD>
          <TD id=m_isrmirrorge_10887>-</TD>
          <TD id=m_isrmirrorge_10888>●</TD>
          <TD id=m_isrmirrorge_8769>-</TD>
          <TD id=m_isrmirrorge_8770>-</TD>
          <TD id=m_isrmirrorge_8771>●</TD>
          <TD id=m_isrmirrorge_6934>-</TD>
          <TD id=m_isrmirrorge_9216>-</TD>
          <TD id=m_isrmirrorge_6935>-</TD>
          <TD id=m_isrmirrorge_6938>-</TD>
          <TD id=m_isrmirrorge_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_isbsvisor_10884>- </TD>
          <TD id=m_isbsvisor_10885>- </TD>
          <TD id=m_isbsvisor_10886>- </TD>
          <TD id=m_isbsvisor_10889>- </TD>
          <TD id=m_isbsvisor_10887>- </TD>
          <TD id=m_isbsvisor_10888>- </TD>
          <TD id=m_isbsvisor_8769>- </TD>
          <TD id=m_isbsvisor_8770>- </TD>
          <TD id=m_isbsvisor_8771>- </TD>
          <TD id=m_isbsvisor_6934>- </TD>
          <TD id=m_isbsvisor_9216>- </TD>
          <TD id=m_isbsvisor_6935>- </TD>
          <TD id=m_isbsvisor_6938>- </TD>
          <TD id=m_isbsvisor_6939>- </TD></TR><!--	



			<tr class="hidd" >



				



				


					


						<td id="m_ishbsvisor_10884">-</td>



					


						<td id="m_ishbsvisor_10885">-</td>



					


						<td id="m_ishbsvisor_10886">-</td>



					


						<td id="m_ishbsvisor_10889">-</td>



					


						<td id="m_ishbsvisor_10887">-</td>



					


						<td id="m_ishbsvisor_10888">-</td>



					


						<td id="m_ishbsvisor_8769">-</td>



					


						<td id="m_ishbsvisor_8770">-</td>



					


						<td id="m_ishbsvisor_8771">-</td>



					


						<td id="m_ishbsvisor_6934">-</td>



					


						<td id="m_ishbsvisor_9216">-</td>



					


						<td id="m_ishbsvisor_6935">-</td>



					


						<td id="m_ishbsvisor_6938">-</td>



					


						<td id="m_ishbsvisor_6939">-</td>



					


							</tr>







			<tr class="hidd" >



				



				


					


						<td id="m_isebsvisor_10884"> - </td>



					


						<td id="m_isebsvisor_10885"> - </td>



					


						<td id="m_isebsvisor_10886"> - </td>



					


						<td id="m_isebsvisor_10889"> - </td>



					


						<td id="m_isebsvisor_10887"> - </td>



					


						<td id="m_isebsvisor_10888"> - </td>



					


						<td id="m_isebsvisor_8769"> - </td>



					


						<td id="m_isebsvisor_8770"> - </td>



					


						<td id="m_isebsvisor_8771"> - </td>



					


						<td id="m_isebsvisor_6934"> - </td>



					


						<td id="m_isebsvisor_9216"> - </td>



					


						<td id="m_isebsvisor_6935"> - </td>



					


						<td id="m_isebsvisor_6938"> - </td>



					


						<td id="m_isebsvisor_6939"> - </td>



					


							</tr>



-->
        <TR class=hidd>
          <TD id=m_isbssvisor_10884>-</TD>
          <TD id=m_isbssvisor_10885>-</TD>
          <TD id=m_isbssvisor_10886>-</TD>
          <TD id=m_isbssvisor_10889>-</TD>
          <TD id=m_isbssvisor_10887>-</TD>
          <TD id=m_isbssvisor_10888>-</TD>
          <TD id=m_isbssvisor_8769>-</TD>
          <TD id=m_isbssvisor_8770>-</TD>
          <TD id=m_isbssvisor_8771>-</TD>
          <TD id=m_isbssvisor_6934>-</TD>
          <TD id=m_isbssvisor_9216>-</TD>
          <TD id=m_isbssvisor_6935>-</TD>
          <TD id=m_isbssvisor_6938>-</TD>
          <TD id=m_isbssvisor_6939>-</TD></TR>
        <TR class=hidd>
          <TD id=m_issvisordr_10884>●</TD>
          <TD id=m_issvisordr_10885>●</TD>
          <TD id=m_issvisordr_10886>●</TD>
          <TD id=m_issvisordr_10889>●</TD>
          <TD id=m_issvisordr_10887>●</TD>
          <TD id=m_issvisordr_10888>●</TD>
          <TD id=m_issvisordr_8769>●</TD>
          <TD id=m_issvisordr_8770>●</TD>
          <TD id=m_issvisordr_8771>●</TD>
          <TD id=m_issvisordr_6934>●</TD>
          <TD id=m_issvisordr_9216>●</TD>
          <TD id=m_issvisordr_6935>●</TD>
          <TD id=m_issvisordr_6938>●</TD>
          <TD id=m_issvisordr_6939>●</TD></TR>
        <TR class=disc>
          <TD id=m_isinswiper_10884>-</TD>
          <TD id=m_isinswiper_10885>-</TD>
          <TD id=m_isinswiper_10886>-</TD>
          <TD id=m_isinswiper_10889>●</TD>
          <TD id=m_isinswiper_10887>-</TD>
          <TD id=m_isinswiper_10888>●</TD>
          <TD id=m_isinswiper_8769>-</TD>
          <TD id=m_isinswiper_8770>-</TD>
          <TD id=m_isinswiper_8771>●</TD>
          <TD id=m_isinswiper_6934>-</TD>
          <TD id=m_isinswiper_9216>-</TD>
          <TD id=m_isinswiper_6935>-</TD>
          <TD id=m_isinswiper_6938>●</TD>
          <TD id=m_isinswiper_6939>●</TD></TR>
        <TR id=base_15>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10884 scope=col><B href="#/m10884/" 
            target=_blank>2012款君威 1.6T 精英运动版 </A><I id=base_15_img_10884></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10885 scope=col><B href="#/m10885/" 
            target=_blank>2012款君威 2.0L 舒适版 </A><I id=base_15_img_10885></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10886 scope=col><B href="#/m10886/" 
            target=_blank>2012款君威 2.0L 豪华版 </A><I id=base_15_img_10886></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10889 scope=col><B href="#/m10889/" 
            target=_blank>2012款君威 2.0T 豪华运动版 </A><I id=base_15_img_10889></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10887 scope=col><B href="#/m10887/" 
            target=_blank>2012款君威 2.4L SIDI精英版 </A><I id=base_15_img_10887></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10888 scope=col><B href="#/m10888/" 
            target=_blank>2012款君威 2.4L SIDI旗舰版 </A><I id=base_15_img_10888></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8769 scope=col><B href="#/m8769/" 
            target=_blank>2011款君威 2.4L SIDI舒适版(停产) </A><I 
            id=base_15_img_8769></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8770 scope=col><B href="#/m8770/" 
            target=_blank>2011款君威 2.4L SIDI精英版(停产) </A><I 
            id=base_15_img_8770></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8771 scope=col><B href="#/m8771/" 
            target=_blank>2011款君威 2.4L SIDI旗舰版(停产) </A><I 
            id=base_15_img_8771></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6934 scope=col><B href="#/m6934/" 
            target=_blank>2010款君威 1.6T 精英运动版(停产) </A><I id=base_15_img_6934></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9216 scope=col><B href="#/m9216/" 
            target=_blank>2010款君威 2.0L 舒适版(停产) </A><I id=base_15_img_9216></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6935 scope=col><B href="#/m6935/" 
            target=_blank>2010款君威 2.0L 世博版(停产) </A><I id=base_15_img_6935></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6938 scope=col><B href="#/m6938/" 
            target=_blank>2010款君威 2.0T 豪华运动版(停产) </A><I id=base_15_img_6938></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_6939 scope=col><B href="#/m6939/" 
            target=_blank>2010款君威 2.0T 旗舰运动版(停产) </A><I id=base_15_img_6939></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isairc_10884>●</TD>
          <TD id=m_isairc_10885>●</TD>
          <TD id=m_isairc_10886>●</TD>
          <TD id=m_isairc_10889>●</TD>
          <TD id=m_isairc_10887>●</TD>
          <TD id=m_isairc_10888>●</TD>
          <TD id=m_isairc_8769>●</TD>
          <TD id=m_isairc_8770>●</TD>
          <TD id=m_isairc_8771>●</TD>
          <TD id=m_isairc_6934>●</TD>
          <TD id=m_isairc_9216>●</TD>
          <TD id=m_isairc_6935>●</TD>
          <TD id=m_isairc_6938>●</TD>
          <TD id=m_isairc_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbsairo_10884>●</TD>
          <TD id=m_isbsairo_10885>●</TD>
          <TD id=m_isbsairo_10886>●</TD>
          <TD id=m_isbsairo_10889>●</TD>
          <TD id=m_isbsairo_10887>●</TD>
          <TD id=m_isbsairo_10888>●</TD>
          <TD id=m_isbsairo_8769>●</TD>
          <TD id=m_isbsairo_8770>●</TD>
          <TD id=m_isbsairo_8771>●</TD>
          <TD id=m_isbsairo_6934>●</TD>
          <TD id=m_isbsairo_9216>●</TD>
          <TD id=m_isbsairo_6935>●</TD>
          <TD id=m_isbsairo_6938>●</TD>
          <TD id=m_isbsairo_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_istempdct_10884>●</TD>
          <TD id=m_istempdct_10885>●</TD>
          <TD id=m_istempdct_10886>●</TD>
          <TD id=m_istempdct_10889>●</TD>
          <TD id=m_istempdct_10887>●</TD>
          <TD id=m_istempdct_10888>●</TD>
          <TD id=m_istempdct_8769>●</TD>
          <TD id=m_istempdct_8770>●</TD>
          <TD id=m_istempdct_8771>●</TD>
          <TD id=m_istempdct_6934>●</TD>
          <TD id=m_istempdct_9216>●</TD>
          <TD id=m_istempdct_6935>●</TD>
          <TD id=m_istempdct_6938>●</TD>
          <TD id=m_istempdct_6939>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscaricebox_10884>-</TD>
          <TD id=m_iscaricebox_10885>-</TD>
          <TD id=m_iscaricebox_10886>-</TD>
          <TD id=m_iscaricebox_10889>-</TD>
          <TD id=m_iscaricebox_10887>-</TD>
          <TD id=m_iscaricebox_10888>-</TD>
          <TD id=m_iscaricebox_8769>-</TD>
          <TD id=m_iscaricebox_8770>-</TD>
          <TD id=m_iscaricebox_8771>-</TD>
          <TD id=m_iscaricebox_6934>-</TD>
          <TD id=m_iscaricebox_9216>-</TD>
          <TD id=m_iscaricebox_6935>-</TD>
          <TD id=m_iscaricebox_6938>-</TD>
          <TD 
id=m_iscaricebox_6939>-</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
<DIV class=clear></DIV></DIV>
<SCRIPT type=text/javascript 
src="【君威】君威%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/analytics.htm"></SCRIPT>
<!--登陆js-->
<SCRIPT 
src="【君威】君威%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/new_login2011_newcar.htm"></SCRIPT>

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

		if(dh.src=="#/inc_htm/all_cheshi_list.htm"){



		}else{

		dh.src = "#/inc_htm/all_cheshi_list.htm";	

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
  <LI>选择问题所在车型</LI>
  <LI><SELECT id=mid class=t0401_tpsel onchange=getmid(this.value) name=mid> 
    <OPTION selected value=10884>2012款君威 1.6T 精英运动版</OPTION> <OPTION 
    value=10885>2012款君威 2.0L 舒适版</OPTION> <OPTION value=10886>2012款君威 2.0L 
    豪华版</OPTION> <OPTION value=10889>2012款君威 2.0T 豪华运动版</OPTION> <OPTION 
    value=10887>2012款君威 2.4L SIDI精英版</OPTION> <OPTION value=10888>2012款君威 2.4L 
    SIDI旗舰版</OPTION> <OPTION value=8769>2011款君威 2.4L SIDI舒适版</OPTION> <OPTION 
    value=8770>2011款君威 2.4L SIDI精英版</OPTION> <OPTION value=8771>2011款君威 2.4L 
    SIDI旗舰版</OPTION> <OPTION value=6934>2010款君威 1.6T 精英运动版</OPTION> <OPTION 
    value=9216>2010款君威 2.0L 舒适版</OPTION> <OPTION value=6935>2010款君威 2.0L 
    世博版</OPTION> <OPTION value=6938>2010款君威 2.0T 豪华运动版</OPTION> <OPTION 
    value=6939>2010款君威 2.0T 旗舰运动版</OPTION></SELECT></LI>
  <LI style="MARGIN-TOP: 12px">选择问题所在参数类别</LI>
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
  <LI>我的建议：</LI>
  <LI><TEXTAREA id=message class=t0401_tptext onchange=chg_message(this.value); name=message></TEXTAREA><SPAN 
  id=message_ts></SPAN></LI>
  <LI><INPUT class=t0401_tpbtn onclick=update_sel(); value=提交 type=button name=""> 
<INPUT class=t0401_tpbtn_b onclick=div_light.Close(); value=关闭 type=button name=""></LI></UL></DIV></DIV></DIV>
<DIV style="DISPLAY: none" id=div_ok class=t0401_popw>
<DIV class=t0401_popi>
<P class=t0401_sjjc_p><B onclick=div_ok.Close(); 
href="javascript:void(0)"></A>数据纠错</P>
<DIV id=check_ok>
<UL class=t0401_ulpop_b>
  <LI>提交成功，<BR>感谢您对爱卡汽车网的大力支持！</LI>
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
src="【君威】君威%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/news_forall.js"></SCRIPT>

<SCRIPT type=text/javascript 
src="【君威】君威%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/dw.js"></SCRIPT>

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
