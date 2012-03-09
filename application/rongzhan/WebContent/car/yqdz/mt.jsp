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
  onclick="chg_checkbox('seriseCheckbox','1','0','一个子车系')" value=1,2,3,4,5,6,7,8 
  CHECKED type=checkbox>2012款迈腾</LI></UL><EM class=b>排量：</EM> 
<UL class=x>
  <LI><INPUT id=dislCheckbox_0 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','4','0','一种发动机')" value=1,2 CHECKED 
  type=checkbox>1.4T</LI>
  <LI><INPUT id=dislCheckbox_1 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','4','1','一种发动机')" value=3,4,5 CHECKED 
  type=checkbox>1.8T</LI>
  <LI><INPUT id=dislCheckbox_2 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','4','2','一种发动机')" value=6,7 CHECKED 
  type=checkbox>2.0T</LI>
  <LI><INPUT id=dislCheckbox_3 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','4','3','一种发动机')" value=8 CHECKED 
  type=checkbox>3.0L</LI></UL><EM class=c>变速箱：</EM> 
<UL class=y>
  <LI><INPUT id=transtypeCheckbox_0 class=gm_cfradio 
  onclick="chg_checkbox('transtypeCheckbox','1','0','一种变速箱')" 
  value=1,2,3,4,5,6,7,8 CHECKED type=checkbox>双离合变速箱</LI></UL></DIV>
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
            src="【迈腾】迈腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
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
          <TD style="TEXT-ALIGN: right; HEIGHT: 100px; OVERFLOW: hidden" 
          id=3_m_envstand class=title>环保标准：</TD></TR>
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
            src="【迈腾】迈腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【迈腾】迈腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【迈腾】迈腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【迈腾】迈腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【迈腾】迈腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【迈腾】迈腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【迈腾】迈腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【迈腾】迈腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH></TR>
        <TR id=base_1>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9784 scope=col><B href="#/m9784/" 
            target=_blank>2012款迈腾 1.4T 舒适版 </A><I id=base_1_img_9784></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9786 scope=col><B href="#/m9786/" 
            target=_blank>2012款迈腾 1.4T 豪华版 </A><I id=base_1_img_9786></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9382 scope=col><B href="#/m9382/" 
            target=_blank>2012款迈腾 1.8T 舒适版 </A><I id=base_1_img_9382></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9383 scope=col><B href="#/m9383/" 
            target=_blank>2012款迈腾 1.8T 豪华版 </A><I id=base_1_img_9383></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9384 scope=col><B href="#/m9384/" 
            target=_blank>2012款迈腾 1.8T 尊贵版 </A><I id=base_1_img_9384></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9385 scope=col><B href="#/m9385/" 
            target=_blank>2012款迈腾 2.0T 尊贵版 </A><I id=base_1_img_9385></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9386 scope=col><B href="#/m9386/" 
            target=_blank>2012款迈腾 2.0T 至尊版 </A><I id=base_1_img_9386></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9785 scope=col><B href="#/m9785/" 
            target=_blank>2012款迈腾 3.0L 旗舰版 </A><I id=base_1_img_9785></I> </TH></TR>
        <TR class=disc>
          <TD id=min_price_9784>19.98万</TD>
          <TD id=min_price_9786>21.28万</TD>
          <TD id=min_price_9382>20.98万</TD>
          <TD id=min_price_9383>23.28万</TD>
          <TD id=min_price_9384>25.18万</TD>
          <TD id=min_price_9385>26.68万</TD>
          <TD id=min_price_9386>29.18万</TD>
          <TD id=min_price_9785>33.48万</TD></TR>
        <TR class=hidd>
          <TD id=bname_9784><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_9786><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_9382><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_9383><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_9384><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_9385><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_9386><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_9785><B title=一汽-大众 
            href="#/price/b2/" 
        target=_blank>一汽-大众</A></TD></TR>
        <TR class=hidd>
          <TD id=type2_9784><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_9786><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_9382><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_9383><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_9384><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_9385><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_9386><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_9785><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD></TR>
        <TR class=disc>
          <TD id=m_disl_9784>1.4L 96kW </TD>
          <TD id=m_disl_9786>1.4L 96kW </TD>
          <TD id=m_disl_9382>1.8L 118kW </TD>
          <TD id=m_disl_9383>1.8L 118kW </TD>
          <TD id=m_disl_9384>1.8L 118kW </TD>
          <TD id=m_disl_9385>2.0L 147kW </TD>
          <TD id=m_disl_9386>2.0L 147kW </TD>
          <TD id=m_disl_9785>3.0L 184kW </TD></TR>
        <TR class=disc>
          <TD id=m_transtype_9784>7挡双离合变速箱</TD>
          <TD id=m_transtype_9786>7挡双离合变速箱</TD>
          <TD id=m_transtype_9382>7挡双离合变速箱</TD>
          <TD id=m_transtype_9383>7挡双离合变速箱</TD>
          <TD id=m_transtype_9384>7挡双离合变速箱</TD>
          <TD id=m_transtype_9385>6挡双离合变速箱</TD>
          <TD id=m_transtype_9386>6挡双离合变速箱</TD>
          <TD id=m_transtype_9785>6挡双离合变速箱</TD></TR>
        <TR class=hidd>
          <TD id=m_length_width_height_9784><!---->4865×1820×1475 <!----></TD>
          <TD id=m_length_width_height_9786><!---->4865×1820×1475 <!----></TD>
          <TD id=m_length_width_height_9382><!---->4865×1820×1475 <!----></TD>
          <TD id=m_length_width_height_9383><!---->4865×1820×1475 <!----></TD>
          <TD id=m_length_width_height_9384><!---->4865×1820×1475 <!----></TD>
          <TD id=m_length_width_height_9385><!---->4865×1820×1475 <!----></TD>
          <TD id=m_length_width_height_9386><!---->4865×1820×1475 <!----></TD>
          <TD id=m_length_width_height_9785><!---->4865×1820×1475 
<!----></TD></TR>
        <TR class=hidd>
          <TD id=m_frame_9784>4门 5座 三厢轿车</TD>
          <TD id=m_frame_9786>4门 5座 三厢轿车</TD>
          <TD id=m_frame_9382>4门 5座 三厢轿车</TD>
          <TD id=m_frame_9383>4门 5座 三厢轿车</TD>
          <TD id=m_frame_9384>4门 5座 三厢轿车</TD>
          <TD id=m_frame_9385>4门 5座 三厢轿车</TD>
          <TD id=m_frame_9386>4门 5座 三厢轿车</TD>
          <TD id=m_frame_9785>4门 5座 三厢轿车</TD></TR>
        <TR class=hidd>
          <TD id=syear_9784>2011</TD>
          <TD id=syear_9786>2011</TD>
          <TD id=syear_9382>2011</TD>
          <TD id=syear_9383>2011</TD>
          <TD id=syear_9384>2011</TD>
          <TD id=syear_9385>2011</TD>
          <TD id=syear_9386>2011</TD>
          <TD id=syear_9785>2011</TD></TR>
        <TR class=disc>
          <TD id=m_mspeed_9784>200</TD>
          <TD id=m_mspeed_9786>200</TD>
          <TD id=m_mspeed_9382>215</TD>
          <TD id=m_mspeed_9383>215</TD>
          <TD id=m_mspeed_9384>215</TD>
          <TD id=m_mspeed_9385>230</TD>
          <TD id=m_mspeed_9386>230</TD>
          <TD id=m_mspeed_9785>240</TD></TR>
        <TR class=disc>
          <TD id=m_hatime_9784>10.3</TD>
          <TD id=m_hatime_9786>10.3</TD>
          <TD id=m_hatime_9382>8.9</TD>
          <TD id=m_hatime_9383>8.9</TD>
          <TD id=m_hatime_9384>8.9</TD>
          <TD id=m_hatime_9385>8</TD>
          <TD id=m_hatime_9386>8</TD>
          <TD id=m_hatime_9785>7.5</TD></TR>
        <TR class=hidd>
          <TD id=m_comfuel_9784>- </TD>
          <TD id=m_comfuel_9786>- </TD>
          <TD id=m_comfuel_9382>- </TD>
          <TD id=m_comfuel_9383>- </TD>
          <TD id=m_comfuel_9384>- </TD>
          <TD id=m_comfuel_9385>- </TD>
          <TD id=m_comfuel_9386>- </TD>
          <TD id=m_comfuel_9785>- </TD></TR>
        <TR class=disc>
          <TD id=m_lkmfuel_9784>- </TD>
          <TD id=m_lkmfuel_9786>- </TD>
          <TD id=m_lkmfuel_9382>- </TD>
          <TD id=m_lkmfuel_9383>- </TD>
          <TD id=m_lkmfuel_9384>- </TD>
          <TD id=m_lkmfuel_9385>- </TD>
          <TD id=m_lkmfuel_9386>- </TD>
          <TD id=m_lkmfuel_9785>- </TD></TR>
        <TR class=disc>
          <TD id=m_hkmfuel_9784>- </TD>
          <TD id=m_hkmfuel_9786>- </TD>
          <TD id=m_hkmfuel_9382>- </TD>
          <TD id=m_hkmfuel_9383>- </TD>
          <TD id=m_hkmfuel_9384>- </TD>
          <TD id=m_hkmfuel_9385>- </TD>
          <TD id=m_hkmfuel_9386>- </TD>
          <TD id=m_hkmfuel_9785>- </TD></TR>
        <TR class=hidd>
          <TD id=m_ypolicy_9784>2年6万公里 </TD>
          <TD id=m_ypolicy_9786>2年6万公里 </TD>
          <TD id=m_ypolicy_9382>2年6万公里 </TD>
          <TD id=m_ypolicy_9383>2年6万公里 </TD>
          <TD id=m_ypolicy_9384>2年6万公里 </TD>
          <TD id=m_ypolicy_9385>2年6万公里 </TD>
          <TD id=m_ypolicy_9386>2年6万公里 </TD>
          <TD id=m_ypolicy_9785>2年6万公里 </TD></TR>
        <TR id=base_2>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9784 scope=col><B href="#/m9784/" 
            target=_blank>2012款迈腾 1.4T 舒适版</A> <I id=base_2_img_9784></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9786 scope=col><B href="#/m9786/" 
            target=_blank>2012款迈腾 1.4T 豪华版</A> <I id=base_2_img_9786></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9382 scope=col><B href="#/m9382/" 
            target=_blank>2012款迈腾 1.8T 舒适版</A> <I id=base_2_img_9382></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9383 scope=col><B href="#/m9383/" 
            target=_blank>2012款迈腾 1.8T 豪华版</A> <I id=base_2_img_9383></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9384 scope=col><B href="#/m9384/" 
            target=_blank>2012款迈腾 1.8T 尊贵版</A> <I id=base_2_img_9384></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9385 scope=col><B href="#/m9385/" 
            target=_blank>2012款迈腾 2.0T 尊贵版</A> <I id=base_2_img_9385></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9386 scope=col><B href="#/m9386/" 
            target=_blank>2012款迈腾 2.0T 至尊版</A> <I id=base_2_img_9386></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9785 scope=col><B href="#/m9785/" 
            target=_blank>2012款迈腾 3.0L 旗舰版</A> <I id=base_2_img_9785></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_length_9784>4865</TD>
          <TD id=m_length_9786>4865</TD>
          <TD id=m_length_9382>4865</TD>
          <TD id=m_length_9383>4865</TD>
          <TD id=m_length_9384>4865</TD>
          <TD id=m_length_9385>4865</TD>
          <TD id=m_length_9386>4865</TD>
          <TD id=m_length_9785>4865</TD></TR>
        <TR class=hidd>
          <TD id=m_width_9784>1820</TD>
          <TD id=m_width_9786>1820</TD>
          <TD id=m_width_9382>1820</TD>
          <TD id=m_width_9383>1820</TD>
          <TD id=m_width_9384>1820</TD>
          <TD id=m_width_9385>1820</TD>
          <TD id=m_width_9386>1820</TD>
          <TD id=m_width_9785>1820</TD></TR>
        <TR class=hidd>
          <TD id=m_height_9784>1475</TD>
          <TD id=m_height_9786>1475</TD>
          <TD id=m_height_9382>1475</TD>
          <TD id=m_height_9383>1475</TD>
          <TD id=m_height_9384>1475</TD>
          <TD id=m_height_9385>1475</TD>
          <TD id=m_height_9386>1475</TD>
          <TD id=m_height_9785>1475</TD></TR>
        <TR class=hidd>
          <TD id=m_wheelbase_9784>2812</TD>
          <TD id=m_wheelbase_9786>2812</TD>
          <TD id=m_wheelbase_9382>2812</TD>
          <TD id=m_wheelbase_9383>2812</TD>
          <TD id=m_wheelbase_9384>2812</TD>
          <TD id=m_wheelbase_9385>2812</TD>
          <TD id=m_wheelbase_9386>2812</TD>
          <TD id=m_wheelbase_9785>2812</TD></TR>
        <TR class=disc>
          <TD id=m_weight_9784>1470</TD>
          <TD id=m_weight_9786>1470</TD>
          <TD id=m_weight_9382>1545</TD>
          <TD id=m_weight_9383>1545</TD>
          <TD id=m_weight_9384>1545</TD>
          <TD id=m_weight_9385>1550</TD>
          <TD id=m_weight_9386>1550</TD>
          <TD id=m_weight_9785>1630</TD></TR>
        <TR class=hidd>
          <TD id=m_clearance_9784>- </TD>
          <TD id=m_clearance_9786>- </TD>
          <TD id=m_clearance_9382>- </TD>
          <TD id=m_clearance_9383>- </TD>
          <TD id=m_clearance_9384>- </TD>
          <TD id=m_clearance_9385>- </TD>
          <TD id=m_clearance_9386>- </TD>
          <TD id=m_clearance_9785>- </TD></TR>
        <TR class=hidd>
          <TD id=m_frame2_9784>三厢轿车</TD>
          <TD id=m_frame2_9786>三厢轿车</TD>
          <TD id=m_frame2_9382>三厢轿车</TD>
          <TD id=m_frame2_9383>三厢轿车</TD>
          <TD id=m_frame2_9384>三厢轿车</TD>
          <TD id=m_frame2_9385>三厢轿车</TD>
          <TD id=m_frame2_9386>三厢轿车</TD>
          <TD id=m_frame2_9785>三厢轿车</TD></TR>
        <TR class=hidd>
          <TD id=m_door_9784>4</TD>
          <TD id=m_door_9786>4</TD>
          <TD id=m_door_9382>4</TD>
          <TD id=m_door_9383>4</TD>
          <TD id=m_door_9384>4</TD>
          <TD id=m_door_9385>4</TD>
          <TD id=m_door_9386>4</TD>
          <TD id=m_door_9785>4</TD></TR>
        <TR class=hidd>
          <TD id=m_seat_9784>5</TD>
          <TD id=m_seat_9786>5</TD>
          <TD id=m_seat_9382>5</TD>
          <TD id=m_seat_9383>5</TD>
          <TD id=m_seat_9384>5</TD>
          <TD id=m_seat_9385>5</TD>
          <TD id=m_seat_9386>5</TD>
          <TD id=m_seat_9785>5</TD></TR>
        <TR class=hidd>
          <TD id=m_oilbox_9784>70.00</TD>
          <TD id=m_oilbox_9786>70.00</TD>
          <TD id=m_oilbox_9382>70.00</TD>
          <TD id=m_oilbox_9383>70.00</TD>
          <TD id=m_oilbox_9384>70.00</TD>
          <TD id=m_oilbox_9385>70.00</TD>
          <TD id=m_oilbox_9386>70.00</TD>
          <TD id=m_oilbox_9785>70.00</TD></TR>
        <TR class=hidd>
          <TD id=m_trunk_9784>565</TD>
          <TD id=m_trunk_9786>565</TD>
          <TD id=m_trunk_9382>565</TD>
          <TD id=m_trunk_9383>565</TD>
          <TD id=m_trunk_9384>565</TD>
          <TD id=m_trunk_9385>565</TD>
          <TD id=m_trunk_9386>565</TD>
          <TD id=m_trunk_9785>565</TD></TR>
        <TR class=hidd>
          <TD id=m_mtrunk_9784>565</TD>
          <TD id=m_mtrunk_9786>565</TD>
          <TD id=m_mtrunk_9382>565</TD>
          <TD id=m_mtrunk_9383>565</TD>
          <TD id=m_mtrunk_9384>565</TD>
          <TD id=m_mtrunk_9385>565</TD>
          <TD id=m_mtrunk_9386>565</TD>
          <TD id=m_mtrunk_9785>565</TD></TR>
        <TR id=base_3>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9784 scope=col><B href="#/m9784/" 
            target=_blank>2012款迈腾 1.4T 舒适版 </A><I id=base_3_img_9784></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9786 scope=col><B href="#/m9786/" 
            target=_blank>2012款迈腾 1.4T 豪华版 </A><I id=base_3_img_9786></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9382 scope=col><B href="#/m9382/" 
            target=_blank>2012款迈腾 1.8T 舒适版 </A><I id=base_3_img_9382></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9383 scope=col><B href="#/m9383/" 
            target=_blank>2012款迈腾 1.8T 豪华版 </A><I id=base_3_img_9383></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9384 scope=col><B href="#/m9384/" 
            target=_blank>2012款迈腾 1.8T 尊贵版 </A><I id=base_3_img_9384></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9385 scope=col><B href="#/m9385/" 
            target=_blank>2012款迈腾 2.0T 尊贵版 </A><I id=base_3_img_9385></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9386 scope=col><B href="#/m9386/" 
            target=_blank>2012款迈腾 2.0T 至尊版 </A><I id=base_3_img_9386></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9785 scope=col><B href="#/m9785/" 
            target=_blank>2012款迈腾 3.0L 旗舰版 </A><I id=base_3_img_9785></I> </TH></TR>
        <TR class=disc>
          <TD id=m_disl2_9784>1.4</TD>
          <TD id=m_disl2_9786>1.4</TD>
          <TD id=m_disl2_9382>1.8</TD>
          <TD id=m_disl2_9383>1.8</TD>
          <TD id=m_disl2_9384>1.8</TD>
          <TD id=m_disl2_9385>2.0</TD>
          <TD id=m_disl2_9386>2.0</TD>
          <TD id=m_disl2_9785>3.0</TD></TR>
        <TR class=disc>
          <TD id=m_working_9784>涡轮增压</TD>
          <TD id=m_working_9786>涡轮增压</TD>
          <TD id=m_working_9382>涡轮增压</TD>
          <TD id=m_working_9383>涡轮增压</TD>
          <TD id=m_working_9384>涡轮增压</TD>
          <TD id=m_working_9385>涡轮增压</TD>
          <TD id=m_working_9386>涡轮增压</TD>
          <TD id=m_working_9785>自然吸气</TD></TR>
        <TR class=disc>
          <TD id=m_mpower_9784>96</TD>
          <TD id=m_mpower_9786>96</TD>
          <TD id=m_mpower_9382>118</TD>
          <TD id=m_mpower_9383>118</TD>
          <TD id=m_mpower_9384>118</TD>
          <TD id=m_mpower_9385>147</TD>
          <TD id=m_mpower_9386>147</TD>
          <TD id=m_mpower_9785>184</TD></TR>
        <TR class=disc>
          <TD id=m_mpowersp_9784>5000</TD>
          <TD id=m_mpowersp_9786>5000</TD>
          <TD id=m_mpowersp_9382>5000-6200</TD>
          <TD id=m_mpowersp_9383>5000-6200</TD>
          <TD id=m_mpowersp_9384>5000-6200</TD>
          <TD id=m_mpowersp_9385>5100-6000</TD>
          <TD id=m_mpowersp_9386>5100-6000</TD>
          <TD id=m_mpowersp_9785>6300</TD></TR>
        <TR class=disc>
          <TD id=m_mtorque_9784>220</TD>
          <TD id=m_mtorque_9786>220</TD>
          <TD id=m_mtorque_9382>250</TD>
          <TD id=m_mtorque_9383>250</TD>
          <TD id=m_mtorque_9384>250</TD>
          <TD id=m_mtorque_9385>280</TD>
          <TD id=m_mtorque_9386>280</TD>
          <TD id=m_mtorque_9785>310</TD></TR>
        <TR class=disc>
          <TD id=m_mtorsp_9784>1750-3500</TD>
          <TD id=m_mtorsp_9786>1750-3500</TD>
          <TD id=m_mtorsp_9382>1500-4500</TD>
          <TD id=m_mtorsp_9383>1500-4500</TD>
          <TD id=m_mtorsp_9384>1500-4500</TD>
          <TD id=m_mtorsp_9385>1700-5000</TD>
          <TD id=m_mtorsp_9386>1700-5000</TD>
          <TD id=m_mtorsp_9785>3300</TD></TR>
        <TR class=hidd>
          <TD id=m_fuel_9784>汽油</TD>
          <TD id=m_fuel_9786>汽油</TD>
          <TD id=m_fuel_9382>汽油</TD>
          <TD id=m_fuel_9383>汽油</TD>
          <TD id=m_fuel_9384>汽油</TD>
          <TD id=m_fuel_9385>汽油</TD>
          <TD id=m_fuel_9386>汽油</TD>
          <TD id=m_fuel_9785>汽油</TD></TR>
        <TR class=disc>
          <TD id=m_fuelno_9784>93</TD>
          <TD id=m_fuelno_9786>93</TD>
          <TD id=m_fuelno_9382>93</TD>
          <TD id=m_fuelno_9383>93</TD>
          <TD id=m_fuelno_9384>93</TD>
          <TD id=m_fuelno_9385>97</TD>
          <TD id=m_fuelno_9386>97</TD>
          <TD id=m_fuelno_9785>97</TD></TR>
        <TR class=hidd>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_9784>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_9786>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_9382>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_9383>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_9384>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_9385>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_9386>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_9785>国IV+OBD </TD></TR>
        <TR id=base_4>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9784 scope=col><B href="#/m9784/" 
            target=_blank>2012款迈腾 1.4T 舒适版 </A><I id=base_4_img_9784></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9786 scope=col><B href="#/m9786/" 
            target=_blank>2012款迈腾 1.4T 豪华版 </A><I id=base_4_img_9786></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9382 scope=col><B href="#/m9382/" 
            target=_blank>2012款迈腾 1.8T 舒适版 </A><I id=base_4_img_9382></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9383 scope=col><B href="#/m9383/" 
            target=_blank>2012款迈腾 1.8T 豪华版 </A><I id=base_4_img_9383></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9384 scope=col><B href="#/m9384/" 
            target=_blank>2012款迈腾 1.8T 尊贵版 </A><I id=base_4_img_9384></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9385 scope=col><B href="#/m9385/" 
            target=_blank>2012款迈腾 2.0T 尊贵版 </A><I id=base_4_img_9385></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9386 scope=col><B href="#/m9386/" 
            target=_blank>2012款迈腾 2.0T 至尊版 </A><I id=base_4_img_9386></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9785 scope=col><B href="#/m9785/" 
            target=_blank>2012款迈腾 3.0L 旗舰版 </A><I id=base_4_img_9785></I> </TH></TR>
        <TR class=disc>
          <TD id=m_speed_9784>7</TD>
          <TD id=m_speed_9786>7</TD>
          <TD id=m_speed_9382>7</TD>
          <TD id=m_speed_9383>7</TD>
          <TD id=m_speed_9384>7</TD>
          <TD id=m_speed_9385>6</TD>
          <TD id=m_speed_9386>6</TD>
          <TD id=m_speed_9785>6</TD></TR>
        <TR class=hidd>
          <TD id=m_transtype2_9784>双离合变速箱</TD>
          <TD id=m_transtype2_9786>双离合变速箱</TD>
          <TD id=m_transtype2_9382>双离合变速箱</TD>
          <TD id=m_transtype2_9383>双离合变速箱</TD>
          <TD id=m_transtype2_9384>双离合变速箱</TD>
          <TD id=m_transtype2_9385>双离合变速箱</TD>
          <TD id=m_transtype2_9386>双离合变速箱</TD>
          <TD id=m_transtype2_9785>双离合变速箱</TD></TR>
        <TR id=base_5>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9784 scope=col><B href="#/m9784/" 
            target=_blank>2012款迈腾 1.4T 舒适版 </A><I id=base_5_img_9784></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9786 scope=col><B href="#/m9786/" 
            target=_blank>2012款迈腾 1.4T 豪华版 </A><I id=base_5_img_9786></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9382 scope=col><B href="#/m9382/" 
            target=_blank>2012款迈腾 1.8T 舒适版 </A><I id=base_5_img_9382></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9383 scope=col><B href="#/m9383/" 
            target=_blank>2012款迈腾 1.8T 豪华版 </A><I id=base_5_img_9383></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9384 scope=col><B href="#/m9384/" 
            target=_blank>2012款迈腾 1.8T 尊贵版 </A><I id=base_5_img_9384></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9385 scope=col><B href="#/m9385/" 
            target=_blank>2012款迈腾 2.0T 尊贵版 </A><I id=base_5_img_9385></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9386 scope=col><B href="#/m9386/" 
            target=_blank>2012款迈腾 2.0T 至尊版 </A><I id=base_5_img_9386></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9785 scope=col><B href="#/m9785/" 
            target=_blank>2012款迈腾 3.0L 旗舰版 </A><I id=base_5_img_9785></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_drivetype_9784>前置前驱</TD>
          <TD id=m_drivetype_9786>前置前驱</TD>
          <TD id=m_drivetype_9382>前置前驱</TD>
          <TD id=m_drivetype_9383>前置前驱</TD>
          <TD id=m_drivetype_9384>前置前驱</TD>
          <TD id=m_drivetype_9385>前置前驱</TD>
          <TD id=m_drivetype_9386>前置前驱</TD>
          <TD id=m_drivetype_9785>前置前驱</TD></TR>
        <TR class=hidd height=60>
          <TD id=m_fsustype_text_9784>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_9786>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_9382>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_9383>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_9384>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_9385>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_9386>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_9785>麦弗逊式独立悬架</TD></TR>
        <TR class=hidd height=60>
          <TD id=m_bsustype_text_9784>多连杆独立悬架</TD>
          <TD id=m_bsustype_text_9786>多连杆独立悬架</TD>
          <TD id=m_bsustype_text_9382>多连杆独立悬架</TD>
          <TD id=m_bsustype_text_9383>多连杆独立悬架</TD>
          <TD id=m_bsustype_text_9384>多连杆独立悬架</TD>
          <TD id=m_bsustype_text_9385>多连杆独立悬架</TD>
          <TD id=m_bsustype_text_9386>多连杆独立悬架</TD>
          <TD id=m_bsustype_text_9785>多连杆独立悬架</TD></TR>
        <TR id=base_6>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9784 scope=col><B href="#/m9784/" 
            target=_blank>2012款迈腾 1.4T 舒适版 </A><I id=base_6_img_9784></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9786 scope=col><B href="#/m9786/" 
            target=_blank>2012款迈腾 1.4T 豪华版 </A><I id=base_6_img_9786></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9382 scope=col><B href="#/m9382/" 
            target=_blank>2012款迈腾 1.8T 舒适版 </A><I id=base_6_img_9382></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9383 scope=col><B href="#/m9383/" 
            target=_blank>2012款迈腾 1.8T 豪华版 </A><I id=base_6_img_9383></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9384 scope=col><B href="#/m9384/" 
            target=_blank>2012款迈腾 1.8T 尊贵版 </A><I id=base_6_img_9384></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9385 scope=col><B href="#/m9385/" 
            target=_blank>2012款迈腾 2.0T 尊贵版 </A><I id=base_6_img_9385></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9386 scope=col><B href="#/m9386/" 
            target=_blank>2012款迈腾 2.0T 至尊版 </A><I id=base_6_img_9386></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9785 scope=col><B href="#/m9785/" 
            target=_blank>2012款迈腾 3.0L 旗舰版 </A><I id=base_6_img_9785></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_fbraketype_9784>通风盘式</TD>
          <TD id=m_fbraketype_9786>通风盘式</TD>
          <TD id=m_fbraketype_9382>通风盘式</TD>
          <TD id=m_fbraketype_9383>通风盘式</TD>
          <TD id=m_fbraketype_9384>通风盘式</TD>
          <TD id=m_fbraketype_9385>通风盘式</TD>
          <TD id=m_fbraketype_9386>通风盘式</TD>
          <TD id=m_fbraketype_9785>通风盘式</TD></TR>
        <TR class=hidd>
          <TD id=m_bbraketype_9784>盘式</TD>
          <TD id=m_bbraketype_9786>盘式</TD>
          <TD id=m_bbraketype_9382>盘式</TD>
          <TD id=m_bbraketype_9383>盘式</TD>
          <TD id=m_bbraketype_9384>盘式</TD>
          <TD id=m_bbraketype_9385>盘式</TD>
          <TD id=m_bbraketype_9386>盘式</TD>
          <TD id=m_bbraketype_9785>盘式</TD></TR>
        <TR class=disc>
          <TD id=m_ftiresize_9784>215/55 R16</TD>
          <TD id=m_ftiresize_9786>215/55 R16</TD>
          <TD id=m_ftiresize_9382>215/55 R16</TD>
          <TD id=m_ftiresize_9383>215/55 R16</TD>
          <TD id=m_ftiresize_9384>235/45 R17</TD>
          <TD id=m_ftiresize_9385>235/45 R17</TD>
          <TD id=m_ftiresize_9386>235/45 R17</TD>
          <TD id=m_ftiresize_9785>235/45 R17</TD></TR>
        <TR class=disc>
          <TD id=m_btiresize_9784>215/55 R16</TD>
          <TD id=m_btiresize_9786>215/55 R16</TD>
          <TD id=m_btiresize_9382>215/55 R16</TD>
          <TD id=m_btiresize_9383>215/55 R16</TD>
          <TD id=m_btiresize_9384>235/45 R17</TD>
          <TD id=m_btiresize_9385>235/45 R17</TD>
          <TD id=m_btiresize_9386>235/45 R17</TD>
          <TD id=m_btiresize_9785>235/45 R17</TD></TR>
        <TR class=hidd>
          <TD id=m_sparetire_9784>非全尺寸</TD>
          <TD id=m_sparetire_9786>非全尺寸</TD>
          <TD id=m_sparetire_9382>非全尺寸</TD>
          <TD id=m_sparetire_9383>非全尺寸</TD>
          <TD id=m_sparetire_9384>非全尺寸</TD>
          <TD id=m_sparetire_9385>非全尺寸</TD>
          <TD id=m_sparetire_9386>非全尺寸</TD>
          <TD id=m_sparetire_9785>非全尺寸</TD></TR>
        <TR id=base_7>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9784 scope=col><B href="#/m9784/" 
            target=_blank>2012款迈腾 1.4T 舒适版 </A><I id=base_7_img_9784></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9786 scope=col><B href="#/m9786/" 
            target=_blank>2012款迈腾 1.4T 豪华版 </A><I id=base_7_img_9786></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9382 scope=col><B href="#/m9382/" 
            target=_blank>2012款迈腾 1.8T 舒适版 </A><I id=base_7_img_9382></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9383 scope=col><B href="#/m9383/" 
            target=_blank>2012款迈腾 1.8T 豪华版 </A><I id=base_7_img_9383></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9384 scope=col><B href="#/m9384/" 
            target=_blank>2012款迈腾 1.8T 尊贵版 </A><I id=base_7_img_9384></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9385 scope=col><B href="#/m9385/" 
            target=_blank>2012款迈腾 2.0T 尊贵版 </A><I id=base_7_img_9385></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9386 scope=col><B href="#/m9386/" 
            target=_blank>2012款迈腾 2.0T 至尊版 </A><I id=base_7_img_9386></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9785 scope=col><B href="#/m9785/" 
            target=_blank>2012款迈腾 3.0L 旗舰版 </A><I id=base_7_img_9785></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isdairbag_9784>●</TD>
          <TD id=m_isdairbag_9786>●</TD>
          <TD id=m_isdairbag_9382>●</TD>
          <TD id=m_isdairbag_9383>●</TD>
          <TD id=m_isdairbag_9384>●</TD>
          <TD id=m_isdairbag_9385>●</TD>
          <TD id=m_isdairbag_9386>●</TD>
          <TD id=m_isdairbag_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isadairbag_9784>●</TD>
          <TD id=m_isadairbag_9786>●</TD>
          <TD id=m_isadairbag_9382>●</TD>
          <TD id=m_isadairbag_9383>●</TD>
          <TD id=m_isadairbag_9384>●</TD>
          <TD id=m_isadairbag_9385>●</TD>
          <TD id=m_isadairbag_9386>●</TD>
          <TD id=m_isadairbag_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_isfhairbag_9784>-</TD>
          <TD id=m_isfhairbag_9786>-</TD>
          <TD id=m_isfhairbag_9382>-</TD>
          <TD id=m_isfhairbag_9383>-</TD>
          <TD id=m_isfhairbag_9384>●</TD>
          <TD id=m_isfhairbag_9385>●</TD>
          <TD id=m_isfhairbag_9386>●</TD>
          <TD id=m_isfhairbag_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_isbhairbag_9784>-</TD>
          <TD id=m_isbhairbag_9786>-</TD>
          <TD id=m_isbhairbag_9382>-</TD>
          <TD id=m_isbhairbag_9383>-</TD>
          <TD id=m_isbhairbag_9384>●</TD>
          <TD id=m_isbhairbag_9385>●</TD>
          <TD id=m_isbhairbag_9386>●</TD>
          <TD id=m_isbhairbag_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isfsairbag_9784>●</TD>
          <TD id=m_isfsairbag_9786>●</TD>
          <TD id=m_isfsairbag_9382>●</TD>
          <TD id=m_isfsairbag_9383>●</TD>
          <TD id=m_isfsairbag_9384>●</TD>
          <TD id=m_isfsairbag_9385>●</TD>
          <TD id=m_isfsairbag_9386>●</TD>
          <TD id=m_isfsairbag_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_isbsairbag_9784>-</TD>
          <TD id=m_isbsairbag_9786>-</TD>
          <TD id=m_isbsairbag_9382>-</TD>
          <TD id=m_isbsairbag_9383>-</TD>
          <TD id=m_isbsairbag_9384>-</TD>
          <TD id=m_isbsairbag_9385>-</TD>
          <TD id=m_isbsairbag_9386>●</TD>
          <TD id=m_isbsairbag_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iskairbag_9784>-</TD>
          <TD id=m_iskairbag_9786>-</TD>
          <TD id=m_iskairbag_9382>-</TD>
          <TD id=m_iskairbag_9383>-</TD>
          <TD id=m_iskairbag_9384>-</TD>
          <TD id=m_iskairbag_9385>-</TD>
          <TD id=m_iskairbag_9386>-</TD>
          <TD id=m_iskairbag_9785>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatbeltti_9784>●</TD>
          <TD id=m_isseatbeltti_9786>●</TD>
          <TD id=m_isseatbeltti_9382>●</TD>
          <TD id=m_isseatbeltti_9383>●</TD>
          <TD id=m_isseatbeltti_9384>●</TD>
          <TD id=m_isseatbeltti_9385>●</TD>
          <TD id=m_isseatbeltti_9386>●</TD>
          <TD id=m_isseatbeltti_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iseanti_9784>●</TD>
          <TD id=m_iseanti_9786>●</TD>
          <TD id=m_iseanti_9382>●</TD>
          <TD id=m_iseanti_9383>●</TD>
          <TD id=m_iseanti_9384>●</TD>
          <TD id=m_iseanti_9385>●</TD>
          <TD id=m_iseanti_9386>●</TD>
          <TD id=m_iseanti_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscclock_9784>●</TD>
          <TD id=m_iscclock_9786>●</TD>
          <TD id=m_iscclock_9382>●</TD>
          <TD id=m_iscclock_9383>●</TD>
          <TD id=m_iscclock_9384>●</TD>
          <TD id=m_iscclock_9385>●</TD>
          <TD id=m_iscclock_9386>●</TD>
          <TD id=m_iscclock_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isrekey_9784>●</TD>
          <TD id=m_isrekey_9786>●</TD>
          <TD id=m_isrekey_9382>●</TD>
          <TD id=m_isrekey_9383>●</TD>
          <TD id=m_isrekey_9384>●</TD>
          <TD id=m_isrekey_9385>●</TD>
          <TD id=m_isrekey_9386>●</TD>
          <TD id=m_isrekey_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_isnokeysys_9784>-</TD>
          <TD id=m_isnokeysys_9786>-</TD>
          <TD id=m_isnokeysys_9382>-</TD>
          <TD id=m_isnokeysys_9383>-</TD>
          <TD id=m_isnokeysys_9384>●</TD>
          <TD id=m_isnokeysys_9385>●</TD>
          <TD id=m_isnokeysys_9386>●</TD>
          <TD id=m_isnokeysys_9785>●</TD></TR>
        <TR id=base_8>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9784 scope=col><B href="#/m9784/" 
            target=_blank>2012款迈腾 1.4T 舒适版 </A><I id=base_8_img_9784></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9786 scope=col><B href="#/m9786/" 
            target=_blank>2012款迈腾 1.4T 豪华版 </A><I id=base_8_img_9786></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9382 scope=col><B href="#/m9382/" 
            target=_blank>2012款迈腾 1.8T 舒适版 </A><I id=base_8_img_9382></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9383 scope=col><B href="#/m9383/" 
            target=_blank>2012款迈腾 1.8T 豪华版 </A><I id=base_8_img_9383></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9384 scope=col><B href="#/m9384/" 
            target=_blank>2012款迈腾 1.8T 尊贵版 </A><I id=base_8_img_9384></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9385 scope=col><B href="#/m9385/" 
            target=_blank>2012款迈腾 2.0T 尊贵版 </A><I id=base_8_img_9385></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9386 scope=col><B href="#/m9386/" 
            target=_blank>2012款迈腾 2.0T 至尊版 </A><I id=base_8_img_9386></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9785 scope=col><B href="#/m9785/" 
            target=_blank>2012款迈腾 3.0L 旗舰版 </A><I id=base_8_img_9785></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isabs_9784>●</TD>
          <TD id=m_isabs_9786>●</TD>
          <TD id=m_isabs_9382>●</TD>
          <TD id=m_isabs_9383>●</TD>
          <TD id=m_isabs_9384>●</TD>
          <TD id=m_isabs_9385>●</TD>
          <TD id=m_isabs_9386>●</TD>
          <TD id=m_isabs_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isesp_9784>●</TD>
          <TD id=m_isesp_9786>●</TD>
          <TD id=m_isesp_9382>●</TD>
          <TD id=m_isesp_9383>●</TD>
          <TD id=m_isesp_9384>●</TD>
          <TD id=m_isesp_9385>●</TD>
          <TD id=m_isesp_9386>●</TD>
          <TD id=m_isesp_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_isadsus_9784>-</TD>
          <TD id=m_isadsus_9786>-</TD>
          <TD id=m_isadsus_9382>-</TD>
          <TD id=m_isadsus_9383>-</TD>
          <TD id=m_isadsus_9384>-</TD>
          <TD id=m_isadsus_9385>-</TD>
          <TD id=m_isadsus_9386>-</TD>
          <TD id=m_isadsus_9785>- </TD></TR>
        <TR class=hidd>
          <TD id=m_istpmonitor_9784>-</TD>
          <TD id=m_istpmonitor_9786>-</TD>
          <TD id=m_istpmonitor_9382>-</TD>
          <TD id=m_istpmonitor_9383>-</TD>
          <TD id=m_istpmonitor_9384>-</TD>
          <TD id=m_istpmonitor_9385>-</TD>
          <TD id=m_istpmonitor_9386>-</TD>
          <TD id=m_istpmonitor_9785>-</TD></TR>
        <TR class=hidd>
          <TD id=m_istpruning_9784>-</TD>
          <TD id=m_istpruning_9786>-</TD>
          <TD id=m_istpruning_9382>-</TD>
          <TD id=m_istpruning_9383>-</TD>
          <TD id=m_istpruning_9384>-</TD>
          <TD id=m_istpruning_9385>-</TD>
          <TD id=m_istpruning_9386>-</TD>
          <TD id=m_istpruning_9785>-</TD></TR>
        <TR class=disc>
          <TD id=m_isfsteering_9784>●</TD>
          <TD id=m_isfsteering_9786>●</TD>
          <TD id=m_isfsteering_9382>●</TD>
          <TD id=m_isfsteering_9383>●</TD>
          <TD id=m_isfsteering_9384>●</TD>
          <TD id=m_isfsteering_9385>●</TD>
          <TD id=m_isfsteering_9386>●</TD>
          <TD id=m_isfsteering_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_issteesys_9784>-</TD>
          <TD id=m_issteesys_9786>-</TD>
          <TD id=m_issteesys_9382>-</TD>
          <TD id=m_issteesys_9383>-</TD>
          <TD id=m_issteesys_9384>-</TD>
          <TD id=m_issteesys_9385>-</TD>
          <TD id=m_issteesys_9386>-</TD>
          <TD id=m_issteesys_9785>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isuphillassist_9784>●</TD>
          <TD id=m_isuphillassist_9786>●</TD>
          <TD id=m_isuphillassist_9382>●</TD>
          <TD id=m_isuphillassist_9383>●</TD>
          <TD id=m_isuphillassist_9384>●</TD>
          <TD id=m_isuphillassist_9385>●</TD>
          <TD id=m_isuphillassist_9386>●</TD>
          <TD id=m_isuphillassist_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isandstitch_9784>-</TD>
          <TD id=m_isandstitch_9786>-</TD>
          <TD id=m_isandstitch_9382>-</TD>
          <TD id=m_isandstitch_9383>-</TD>
          <TD id=m_isandstitch_9384>-</TD>
          <TD id=m_isandstitch_9385>-</TD>
          <TD id=m_isandstitch_9386>-</TD>
          <TD id=m_isandstitch_9785>-</TD></TR>
        <TR id=base_9>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9784 scope=col><B href="#/m9784/" 
            target=_blank>2012款迈腾 1.4T 舒适版 </A><I id=base_9_img_9784></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9786 scope=col><B href="#/m9786/" 
            target=_blank>2012款迈腾 1.4T 豪华版 </A><I id=base_9_img_9786></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9382 scope=col><B href="#/m9382/" 
            target=_blank>2012款迈腾 1.8T 舒适版 </A><I id=base_9_img_9382></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9383 scope=col><B href="#/m9383/" 
            target=_blank>2012款迈腾 1.8T 豪华版 </A><I id=base_9_img_9383></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9384 scope=col><B href="#/m9384/" 
            target=_blank>2012款迈腾 1.8T 尊贵版 </A><I id=base_9_img_9384></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9385 scope=col><B href="#/m9385/" 
            target=_blank>2012款迈腾 2.0T 尊贵版 </A><I id=base_9_img_9385></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9386 scope=col><B href="#/m9386/" 
            target=_blank>2012款迈腾 2.0T 至尊版 </A><I id=base_9_img_9386></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9785 scope=col><B href="#/m9785/" 
            target=_blank>2012款迈腾 3.0L 旗舰版 </A><I id=base_9_img_9785></I> </TH></TR>
        <TR class=disc>
          <TD id=m_iswindow_9784>-</TD>
          <TD id=m_iswindow_9786>●</TD>
          <TD id=m_iswindow_9382>-</TD>
          <TD id=m_iswindow_9383>●</TD>
          <TD id=m_iswindow_9384>●</TD>
          <TD id=m_iswindow_9385>●</TD>
          <TD id=m_iswindow_9386>●</TD>
          <TD id=m_iswindow_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isarwindow_9784>-</TD>
          <TD id=m_isarwindow_9786>-</TD>
          <TD id=m_isarwindow_9382>-</TD>
          <TD id=m_isarwindow_9383>-</TD>
          <TD id=m_isarwindow_9384>-</TD>
          <TD id=m_isarwindow_9385>-</TD>
          <TD id=m_isarwindow_9386>-</TD>
          <TD id=m_isarwindow_9785>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isspround_9784>-</TD>
          <TD id=m_isspround_9786>-</TD>
          <TD id=m_isspround_9382>-</TD>
          <TD id=m_isspround_9383>-</TD>
          <TD id=m_isspround_9384>-</TD>
          <TD id=m_isspround_9385>-</TD>
          <TD id=m_isspround_9386>-</TD>
          <TD id=m_isspround_9785>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isaluhub_9784>●</TD>
          <TD id=m_isaluhub_9786>●</TD>
          <TD id=m_isaluhub_9382>●</TD>
          <TD id=m_isaluhub_9383>●</TD>
          <TD id=m_isaluhub_9384>●</TD>
          <TD id=m_isaluhub_9385>●</TD>
          <TD id=m_isaluhub_9386>●</TD>
          <TD id=m_isaluhub_9785>●</TD></TR>
        <TR id=base_10>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9784 scope=col><B href="#/m9784/" 
            target=_blank>2012款迈腾 1.4T 舒适版 </A><I id=base_10_img_9784></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9786 scope=col><B href="#/m9786/" 
            target=_blank>2012款迈腾 1.4T 豪华版 </A><I id=base_10_img_9786></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9382 scope=col><B href="#/m9382/" 
            target=_blank>2012款迈腾 1.8T 舒适版 </A><I id=base_10_img_9382></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9383 scope=col><B href="#/m9383/" 
            target=_blank>2012款迈腾 1.8T 豪华版 </A><I id=base_10_img_9383></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9384 scope=col><B href="#/m9384/" 
            target=_blank>2012款迈腾 1.8T 尊贵版 </A><I id=base_10_img_9384></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9385 scope=col><B href="#/m9385/" 
            target=_blank>2012款迈腾 2.0T 尊贵版 </A><I id=base_10_img_9385></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9386 scope=col><B href="#/m9386/" 
            target=_blank>2012款迈腾 2.0T 至尊版 </A><I id=base_10_img_9386></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9785 scope=col><B href="#/m9785/" 
            target=_blank>2012款迈腾 3.0L 旗舰版 </A><I id=base_10_img_9785></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isleasw_9784>●</TD>
          <TD id=m_isleasw_9786>●</TD>
          <TD id=m_isleasw_9382>●</TD>
          <TD id=m_isleasw_9383>●</TD>
          <TD id=m_isleasw_9384>●</TD>
          <TD id=m_isleasw_9385>●</TD>
          <TD id=m_isleasw_9386>●</TD>
          <TD id=m_isleasw_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswud_9784>●</TD>
          <TD id=m_isswud_9786>●</TD>
          <TD id=m_isswud_9382>●</TD>
          <TD id=m_isswud_9383>●</TD>
          <TD id=m_isswud_9384>●</TD>
          <TD id=m_isswud_9385>●</TD>
          <TD id=m_isswud_9386>●</TD>
          <TD id=m_isswud_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswfb_9784>●</TD>
          <TD id=m_isswfb_9786>●</TD>
          <TD id=m_isswfb_9382>●</TD>
          <TD id=m_isswfb_9383>●</TD>
          <TD id=m_isswfb_9384>●</TD>
          <TD id=m_isswfb_9385>●</TD>
          <TD id=m_isswfb_9386>●</TD>
          <TD id=m_isswfb_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_ismultisw_9784>-</TD>
          <TD id=m_ismultisw_9786>●</TD>
          <TD id=m_ismultisw_9382>-</TD>
          <TD id=m_ismultisw_9383>●</TD>
          <TD id=m_ismultisw_9384>●</TD>
          <TD id=m_ismultisw_9385>●</TD>
          <TD id=m_ismultisw_9386>●</TD>
          <TD id=m_ismultisw_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswshift_9784>-</TD>
          <TD id=m_isswshift_9786>-</TD>
          <TD id=m_isswshift_9382>-</TD>
          <TD id=m_isswshift_9383>-</TD>
          <TD id=m_isswshift_9384>-</TD>
          <TD id=m_isswshift_9385>-</TD>
          <TD id=m_isswshift_9386>-</TD>
          <TD id=m_isswshift_9785>-</TD></TR>
        <TR class=disc>
          <TD id=m_isascd_9784>-</TD>
          <TD id=m_isascd_9786>●</TD>
          <TD id=m_isascd_9382>-</TD>
          <TD id=m_isascd_9383>●</TD>
          <TD id=m_isascd_9384>●</TD>
          <TD id=m_isascd_9385>●</TD>
          <TD id=m_isascd_9386>●</TD>
          <TD id=m_isascd_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isassibc_9784>●</TD>
          <TD id=m_isassibc_9786>●</TD>
          <TD id=m_isassibc_9382>●</TD>
          <TD id=m_isassibc_9383>●</TD>
          <TD id=m_isassibc_9384>●</TD>
          <TD id=m_isassibc_9385>●</TD>
          <TD id=m_isassibc_9386>●</TD>
          <TD id=m_isassibc_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_isparkvideo_9784>-</TD>
          <TD id=m_isparkvideo_9786>-</TD>
          <TD id=m_isparkvideo_9382>-</TD>
          <TD id=m_isparkvideo_9383>-</TD>
          <TD id=m_isparkvideo_9384>○</TD>
          <TD id=m_isparkvideo_9385>○</TD>
          <TD id=m_isparkvideo_9386>○</TD>
          <TD id=m_isparkvideo_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_ispark_9784>-</TD>
          <TD id=m_ispark_9786>-</TD>
          <TD id=m_ispark_9382>-</TD>
          <TD id=m_ispark_9383>-</TD>
          <TD id=m_ispark_9384>-</TD>
          <TD id=m_ispark_9385>-</TD>
          <TD id=m_ispark_9386>●</TD>
          <TD id=m_ispark_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ishud_9784>-</TD>
          <TD id=m_ishud_9786>-</TD>
          <TD id=m_ishud_9382>-</TD>
          <TD id=m_ishud_9383>-</TD>
          <TD id=m_ishud_9384>-</TD>
          <TD id=m_ishud_9385>-</TD>
          <TD id=m_ishud_9386>-</TD>
          <TD id=m_ishud_9785>-</TD></TR>
        <TR id=base_11>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9784 scope=col><B href="#/m9784/" 
            target=_blank>2012款迈腾 1.4T 舒适版 </A><I id=base_11_img_9784></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9786 scope=col><B href="#/m9786/" 
            target=_blank>2012款迈腾 1.4T 豪华版 </A><I id=base_11_img_9786></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9382 scope=col><B href="#/m9382/" 
            target=_blank>2012款迈腾 1.8T 舒适版 </A><I id=base_11_img_9382></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9383 scope=col><B href="#/m9383/" 
            target=_blank>2012款迈腾 1.8T 豪华版 </A><I id=base_11_img_9383></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9384 scope=col><B href="#/m9384/" 
            target=_blank>2012款迈腾 1.8T 尊贵版 </A><I id=base_11_img_9384></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9385 scope=col><B href="#/m9385/" 
            target=_blank>2012款迈腾 2.0T 尊贵版 </A><I id=base_11_img_9385></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9386 scope=col><B href="#/m9386/" 
            target=_blank>2012款迈腾 2.0T 至尊版 </A><I id=base_11_img_9386></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9785 scope=col><B href="#/m9785/" 
            target=_blank>2012款迈腾 3.0L 旗舰版 </A><I id=base_11_img_9785></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isleaseat_9784>●</TD>
          <TD id=m_isleaseat_9786>●</TD>
          <TD id=m_isleaseat_9382>●</TD>
          <TD id=m_isleaseat_9383>●</TD>
          <TD id=m_isleaseat_9384>●</TD>
          <TD id=m_isleaseat_9385>●</TD>
          <TD id=m_isleaseat_9386>●</TD>
          <TD id=m_isleaseat_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatadj_9784>●</TD>
          <TD id=m_isseatadj_9786>●</TD>
          <TD id=m_isseatadj_9382>●</TD>
          <TD id=m_isseatadj_9383>●</TD>
          <TD id=m_isseatadj_9384>●</TD>
          <TD id=m_isseatadj_9385>●</TD>
          <TD id=m_isseatadj_9386>●</TD>
          <TD id=m_isseatadj_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iswaistadj_9784>●</TD>
          <TD id=m_iswaistadj_9786>●</TD>
          <TD id=m_iswaistadj_9382>●</TD>
          <TD id=m_iswaistadj_9383>●</TD>
          <TD id=m_iswaistadj_9384>●</TD>
          <TD id=m_iswaistadj_9385>●</TD>
          <TD id=m_iswaistadj_9386>●</TD>
          <TD id=m_iswaistadj_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_isfseatadj_9784>-</TD>
          <TD id=m_isfseatadj_9786>●</TD>
          <TD id=m_isfseatadj_9382>-</TD>
          <TD id=m_isfseatadj_9383>●</TD>
          <TD id=m_isfseatadj_9384>●</TD>
          <TD id=m_isfseatadj_9385>●</TD>
          <TD id=m_isfseatadj_9386>●</TD>
          <TD id=m_isfseatadj_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_iseseatmem_9784>-</TD>
          <TD id=m_iseseatmem_9786>-</TD>
          <TD id=m_iseseatmem_9382>-</TD>
          <TD id=m_iseseatmem_9383>-</TD>
          <TD id=m_iseseatmem_9384>●</TD>
          <TD id=m_iseseatmem_9385>●</TD>
          <TD id=m_iseseatmem_9386>●</TD>
          <TD id=m_iseseatmem_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_isseathot_9784>-</TD>
          <TD id=m_isseathot_9786>-</TD>
          <TD id=m_isseathot_9382>-</TD>
          <TD id=m_isseathot_9383>●</TD>
          <TD id=m_isseathot_9384>●</TD>
          <TD id=m_isseathot_9385>●</TD>
          <TD id=m_isseathot_9386>●</TD>
          <TD id=m_isseathot_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatknead_9784>-</TD>
          <TD id=m_isseatknead_9786>-</TD>
          <TD id=m_isseatknead_9382>-</TD>
          <TD id=m_isseatknead_9383>-</TD>
          <TD id=m_isseatknead_9384>-</TD>
          <TD id=m_isseatknead_9385>-</TD>
          <TD id=m_isseatknead_9386>-</TD>
          <TD id=m_isseatknead_9785>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isbseatlay_9784>-</TD>
          <TD id=m_isbseatlay_9786>-</TD>
          <TD id=m_isbseatlay_9382>-</TD>
          <TD id=m_isbseatlay_9383>-</TD>
          <TD id=m_isbseatlay_9384>-</TD>
          <TD id=m_isbseatlay_9385>-</TD>
          <TD id=m_isbseatlay_9386>-</TD>
          <TD id=m_isbseatlay_9785>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isbseatplay_9784>●</TD>
          <TD id=m_isbseatplay_9786>●</TD>
          <TD id=m_isbseatplay_9382>●</TD>
          <TD id=m_isbseatplay_9383>●</TD>
          <TD id=m_isbseatplay_9384>●</TD>
          <TD id=m_isbseatplay_9385>●</TD>
          <TD id=m_isbseatplay_9386>●</TD>
          <TD id=m_isbseatplay_9785>●</TD></TR>
        <TR id=base_12>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9784 scope=col><B href="#/m9784/" 
            target=_blank>2012款迈腾 1.4T 舒适版 </A><I id=base_12_img_9784></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9786 scope=col><B href="#/m9786/" 
            target=_blank>2012款迈腾 1.4T 豪华版 </A><I id=base_12_img_9786></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9382 scope=col><B href="#/m9382/" 
            target=_blank>2012款迈腾 1.8T 舒适版 </A><I id=base_12_img_9382></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9383 scope=col><B href="#/m9383/" 
            target=_blank>2012款迈腾 1.8T 豪华版 </A><I id=base_12_img_9383></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9384 scope=col><B href="#/m9384/" 
            target=_blank>2012款迈腾 1.8T 尊贵版 </A><I id=base_12_img_9384></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9385 scope=col><B href="#/m9385/" 
            target=_blank>2012款迈腾 2.0T 尊贵版 </A><I id=base_12_img_9385></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9386 scope=col><B href="#/m9386/" 
            target=_blank>2012款迈腾 2.0T 至尊版 </A><I id=base_12_img_9386></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9785 scope=col><B href="#/m9785/" 
            target=_blank>2012款迈腾 3.0L 旗舰版 </A><I id=base_12_img_9785></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isgps_9784>-</TD>
          <TD id=m_isgps_9786>-</TD>
          <TD id=m_isgps_9382>-</TD>
          <TD id=m_isgps_9383>-</TD>
          <TD id=m_isgps_9384>○</TD>
          <TD id=m_isgps_9385>○</TD>
          <TD id=m_isgps_9386>●</TD>
          <TD id=m_isgps_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_isbluetooth_9784>-</TD>
          <TD id=m_isbluetooth_9786>-</TD>
          <TD id=m_isbluetooth_9382>-</TD>
          <TD id=m_isbluetooth_9383>-</TD>
          <TD id=m_isbluetooth_9384>○</TD>
          <TD id=m_isbluetooth_9385>○</TD>
          <TD id=m_isbluetooth_9386>●</TD>
          <TD id=m_isbluetooth_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_istv_9784>-</TD>
          <TD id=m_istv_9786>-</TD>
          <TD id=m_istv_9382>-</TD>
          <TD id=m_istv_9383>-</TD>
          <TD id=m_istv_9384>-</TD>
          <TD id=m_istv_9385>-</TD>
          <TD id=m_istv_9386>-</TD>
          <TD id=m_istv_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_iscclcd_9784>-</TD>
          <TD id=m_iscclcd_9786>-</TD>
          <TD id=m_iscclcd_9382>-</TD>
          <TD id=m_iscclcd_9383>-</TD>
          <TD id=m_iscclcd_9384>○</TD>
          <TD id=m_iscclcd_9385>●</TD>
          <TD id=m_iscclcd_9386>●</TD>
          <TD id=m_iscclcd_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_isblcd_9784>-</TD>
          <TD id=m_isblcd_9786>-</TD>
          <TD id=m_isblcd_9382>-</TD>
          <TD id=m_isblcd_9383>-</TD>
          <TD id=m_isblcd_9384>-</TD>
          <TD id=m_isblcd_9385>-</TD>
          <TD id=m_isblcd_9386>-</TD>
          <TD id=m_isblcd_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ismp3_9784>●</TD>
          <TD id=m_ismp3_9786>●</TD>
          <TD id=m_ismp3_9382>●</TD>
          <TD id=m_ismp3_9383>●</TD>
          <TD id=m_ismp3_9384>●</TD>
          <TD id=m_ismp3_9385>●</TD>
          <TD id=m_ismp3_9386>●</TD>
          <TD id=m_ismp3_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_iscd_9784>●</TD>
          <TD id=m_iscd_9786>●</TD>
          <TD id=m_iscd_9382>●</TD>
          <TD id=m_iscd_9383>●</TD>
          <TD id=m_iscd_9384>●</TD>
          <TD id=m_iscd_9385>●</TD>
          <TD id=m_iscd_9386>-</TD>
          <TD id=m_iscd_9785>-</TD></TR>
        <TR class=disc>
          <TD id=m_iscd_9784>1 </TD>
          <TD id=m_iscd_9786>1 </TD>
          <TD id=m_iscd_9382>1 </TD>
          <TD id=m_iscd_9383>1 </TD>
          <TD id=m_iscd_9384>6 </TD>
          <TD id=m_iscd_9385>6 </TD>
          <TD id=m_iscd_9386>- </TD>
          <TD id=m_iscd_9785>- </TD></TR>
        <TR class=disc>
          <TD id=9784>-</TD>
          <TD id=9786>-</TD>
          <TD id=9382>-</TD>
          <TD id=9383>-</TD>
          <TD id=9384>- </TD>
          <TD id=9385>- </TD>
          <TD id=9386>●</TD>
          <TD id=9785>●</TD></TR>
        <TR class=disc>
          <TD id=9784>- </TD>
          <TD id=9786>- </TD>
          <TD id=9382>- </TD>
          <TD id=9383>- </TD>
          <TD id=9384>- </TD>
          <TD id=9385>- </TD>
          <TD id=9386>1 </TD>
          <TD id=9785>1 </TD></TR>
        <TR class=hidd>
          <TD id=m_is2audio_9784>-</TD>
          <TD id=m_is2audio_9786>-</TD>
          <TD id=m_is2audio_9382>-</TD>
          <TD id=m_is2audio_9383>-</TD>
          <TD id=m_is2audio_9384>-</TD>
          <TD id=m_is2audio_9385>-</TD>
          <TD id=m_is2audio_9386>-</TD>
          <TD id=m_is2audio_9785>-</TD></TR>
        <TR class=hidd>
          <TD id=m_is4audio_9784>-</TD>
          <TD id=m_is4audio_9786>-</TD>
          <TD id=m_is4audio_9382>-</TD>
          <TD id=m_is4audio_9383>-</TD>
          <TD id=m_is4audio_9384>-</TD>
          <TD id=m_is4audio_9385>-</TD>
          <TD id=m_is4audio_9386>-</TD>
          <TD id=m_is4audio_9785>-</TD></TR>
        <TR class=hidd>
          <TD id=m_is6audio_9784>-</TD>
          <TD id=m_is6audio_9786>-</TD>
          <TD id=m_is6audio_9382>-</TD>
          <TD id=m_is6audio_9383>-</TD>
          <TD id=m_is6audio_9384>-</TD>
          <TD id=m_is6audio_9385>-</TD>
          <TD id=m_is6audio_9386>-</TD>
          <TD id=m_is6audio_9785>-</TD></TR>
        <TR class=hidd>
          <TD id=m_is8audio_9784>●</TD>
          <TD id=m_is8audio_9786>●</TD>
          <TD id=m_is8audio_9382>●</TD>
          <TD id=m_is8audio_9383>●</TD>
          <TD id=m_is8audio_9384>●</TD>
          <TD id=m_is8audio_9385>●</TD>
          <TD id=m_is8audio_9386>●</TD>
          <TD id=m_is8audio_9785>●</TD></TR>
        <TR id=base_13>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9784 scope=col><B href="#/m9784/" 
            target=_blank>2012款迈腾 1.4T 舒适版 </A><I id=base_13_img_9784></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9786 scope=col><B href="#/m9786/" 
            target=_blank>2012款迈腾 1.4T 豪华版 </A><I id=base_13_img_9786></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9382 scope=col><B href="#/m9382/" 
            target=_blank>2012款迈腾 1.8T 舒适版 </A><I id=base_13_img_9382></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9383 scope=col><B href="#/m9383/" 
            target=_blank>2012款迈腾 1.8T 豪华版 </A><I id=base_13_img_9383></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9384 scope=col><B href="#/m9384/" 
            target=_blank>2012款迈腾 1.8T 尊贵版 </A><I id=base_13_img_9384></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9385 scope=col><B href="#/m9385/" 
            target=_blank>2012款迈腾 2.0T 尊贵版 </A><I id=base_13_img_9385></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9386 scope=col><B href="#/m9386/" 
            target=_blank>2012款迈腾 2.0T 至尊版 </A><I id=base_13_img_9386></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9785 scope=col><B href="#/m9785/" 
            target=_blank>2012款迈腾 3.0L 旗舰版 </A><I id=base_13_img_9785></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isxelamp_9784>-</TD>
          <TD id=m_isxelamp_9786>-</TD>
          <TD id=m_isxelamp_9382>-</TD>
          <TD id=m_isxelamp_9383>●</TD>
          <TD id=m_isxelamp_9384>●</TD>
          <TD id=m_isxelamp_9385>●</TD>
          <TD id=m_isxelamp_9386>●</TD>
          <TD id=m_isxelamp_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_isautohlamp_9784>-</TD>
          <TD id=m_isautohlamp_9786>-</TD>
          <TD id=m_isautohlamp_9382>-</TD>
          <TD id=m_isautohlamp_9383>-</TD>
          <TD id=m_isautohlamp_9384>●</TD>
          <TD id=m_isautohlamp_9385>●</TD>
          <TD id=m_isautohlamp_9386>●</TD>
          <TD id=m_isautohlamp_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isturnhlamp_9784>●</TD>
          <TD id=m_isturnhlamp_9786>●</TD>
          <TD id=m_isturnhlamp_9382>●</TD>
          <TD id=m_isturnhlamp_9383>●</TD>
          <TD id=m_isturnhlamp_9384>●</TD>
          <TD id=m_isturnhlamp_9385>●</TD>
          <TD id=m_isturnhlamp_9386>●</TD>
          <TD id=m_isturnhlamp_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ishfoglamp_9784>●</TD>
          <TD id=m_ishfoglamp_9786>●</TD>
          <TD id=m_ishfoglamp_9382>●</TD>
          <TD id=m_ishfoglamp_9383>●</TD>
          <TD id=m_ishfoglamp_9384>●</TD>
          <TD id=m_ishfoglamp_9385>●</TD>
          <TD id=m_ishfoglamp_9386>●</TD>
          <TD id=m_ishfoglamp_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbfoglamp_9784>●</TD>
          <TD id=m_isbfoglamp_9786>●</TD>
          <TD id=m_isbfoglamp_9382>●</TD>
          <TD id=m_isbfoglamp_9383>●</TD>
          <TD id=m_isbfoglamp_9384>●</TD>
          <TD id=m_isbfoglamp_9385>●</TD>
          <TD id=m_isbfoglamp_9386>●</TD>
          <TD id=m_isbfoglamp_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_islampheiadj_9784>-</TD>
          <TD id=m_islampheiadj_9786>-</TD>
          <TD id=m_islampheiadj_9382>-</TD>
          <TD id=m_islampheiadj_9383>●</TD>
          <TD id=m_islampheiadj_9384>●</TD>
          <TD id=m_islampheiadj_9385>●</TD>
          <TD id=m_islampheiadj_9386>●</TD>
          <TD id=m_islampheiadj_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_islampclset_9784>-</TD>
          <TD id=m_islampclset_9786>-</TD>
          <TD id=m_islampclset_9382>-</TD>
          <TD id=m_islampclset_9383>●</TD>
          <TD id=m_islampclset_9384>●</TD>
          <TD id=m_islampclset_9385>●</TD>
          <TD id=m_islampclset_9386>●</TD>
          <TD id=m_islampclset_9785>●</TD></TR>
        <TR id=base_14>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9784 scope=col><B href="#/m9784/" 
            target=_blank>2012款迈腾 1.4T 舒适版 </A><I id=base_14_img_9784></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9786 scope=col><B href="#/m9786/" 
            target=_blank>2012款迈腾 1.4T 豪华版 </A><I id=base_14_img_9786></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9382 scope=col><B href="#/m9382/" 
            target=_blank>2012款迈腾 1.8T 舒适版 </A><I id=base_14_img_9382></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9383 scope=col><B href="#/m9383/" 
            target=_blank>2012款迈腾 1.8T 豪华版 </A><I id=base_14_img_9383></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9384 scope=col><B href="#/m9384/" 
            target=_blank>2012款迈腾 1.8T 尊贵版 </A><I id=base_14_img_9384></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9385 scope=col><B href="#/m9385/" 
            target=_blank>2012款迈腾 2.0T 尊贵版 </A><I id=base_14_img_9385></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9386 scope=col><B href="#/m9386/" 
            target=_blank>2012款迈腾 2.0T 至尊版 </A><I id=base_14_img_9386></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9785 scope=col><B href="#/m9785/" 
            target=_blank>2012款迈腾 3.0L 旗舰版 </A><I id=base_14_img_9785></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isfewindow_9784>●</TD>
          <TD id=m_isfewindow_9786>●</TD>
          <TD id=m_isfewindow_9382>●</TD>
          <TD id=m_isfewindow_9383>●</TD>
          <TD id=m_isfewindow_9384>●</TD>
          <TD id=m_isfewindow_9385>●</TD>
          <TD id=m_isfewindow_9386>●</TD>
          <TD id=m_isfewindow_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbewindow_9784>●</TD>
          <TD id=m_isbewindow_9786>●</TD>
          <TD id=m_isbewindow_9382>●</TD>
          <TD id=m_isbewindow_9383>●</TD>
          <TD id=m_isbewindow_9384>●</TD>
          <TD id=m_isbewindow_9385>●</TD>
          <TD id=m_isbewindow_9386>●</TD>
          <TD id=m_isbewindow_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isgnhand_9784>●</TD>
          <TD id=m_isgnhand_9786>●</TD>
          <TD id=m_isgnhand_9382>●</TD>
          <TD id=m_isgnhand_9383>●</TD>
          <TD id=m_isgnhand_9384>●</TD>
          <TD id=m_isgnhand_9385>●</TD>
          <TD id=m_isgnhand_9386>●</TD>
          <TD id=m_isgnhand_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ispreventionuv_9784>●</TD>
          <TD id=m_ispreventionuv_9786>●</TD>
          <TD id=m_ispreventionuv_9382>●</TD>
          <TD id=m_ispreventionuv_9383>●</TD>
          <TD id=m_ispreventionuv_9384>●</TD>
          <TD id=m_ispreventionuv_9385>●</TD>
          <TD id=m_ispreventionuv_9386>●</TD>
          <TD id=m_ispreventionuv_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isermirror_9784>●</TD>
          <TD id=m_isermirror_9786>●</TD>
          <TD id=m_isermirror_9382>●</TD>
          <TD id=m_isermirror_9383>●</TD>
          <TD id=m_isermirror_9384>●</TD>
          <TD id=m_isermirror_9385>●</TD>
          <TD id=m_isermirror_9386>●</TD>
          <TD id=m_isermirror_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ishotrmirror_9784>●</TD>
          <TD id=m_ishotrmirror_9786>●</TD>
          <TD id=m_ishotrmirror_9382>●</TD>
          <TD id=m_ishotrmirror_9383>●</TD>
          <TD id=m_ishotrmirror_9384>●</TD>
          <TD id=m_ishotrmirror_9385>●</TD>
          <TD id=m_ishotrmirror_9386>●</TD>
          <TD id=m_ishotrmirror_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_ismemorymirror_9784>-</TD>
          <TD id=m_ismemorymirror_9786>-</TD>
          <TD id=m_ismemorymirror_9382>-</TD>
          <TD id=m_ismemorymirror_9383>-</TD>
          <TD id=m_ismemorymirror_9384>●</TD>
          <TD id=m_ismemorymirror_9385>●</TD>
          <TD id=m_ismemorymirror_9386>●</TD>
          <TD id=m_ismemorymirror_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_iseprmirror_9784>-</TD>
          <TD id=m_iseprmirror_9786>●</TD>
          <TD id=m_iseprmirror_9382>-</TD>
          <TD id=m_iseprmirror_9383>●</TD>
          <TD id=m_iseprmirror_9384>●</TD>
          <TD id=m_iseprmirror_9385>●</TD>
          <TD id=m_iseprmirror_9386>●</TD>
          <TD id=m_iseprmirror_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_isrmirrorge_9784>-</TD>
          <TD id=m_isrmirrorge_9786>-</TD>
          <TD id=m_isrmirrorge_9382>-</TD>
          <TD id=m_isrmirrorge_9383>-</TD>
          <TD id=m_isrmirrorge_9384>●</TD>
          <TD id=m_isrmirrorge_9385>●</TD>
          <TD id=m_isrmirrorge_9386>●</TD>
          <TD id=m_isrmirrorge_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_isbsvisor_9784>- </TD>
          <TD id=m_isbsvisor_9786>- </TD>
          <TD id=m_isbsvisor_9382>- </TD>
          <TD id=m_isbsvisor_9383>- </TD>
          <TD id=m_isbsvisor_9384>●</TD>
          <TD id=m_isbsvisor_9385>●</TD>
          <TD id=m_isbsvisor_9386>- </TD>
          <TD id=m_isbsvisor_9785>- </TD></TR><!--	



			<tr class="disc" >



				



				


					


						<td id="m_ishbsvisor_9784">-</td>



					


						<td id="m_ishbsvisor_9786">-</td>



					


						<td id="m_ishbsvisor_9382">-</td>



					


						<td id="m_ishbsvisor_9383">-</td>



					


						<td id="m_ishbsvisor_9384">●</td>



					


						<td id="m_ishbsvisor_9385">●</td>



					


						<td id="m_ishbsvisor_9386">-</td>



					


						<td id="m_ishbsvisor_9785">-</td>



					


							</tr>







			<tr class="hidd" >



				



				


					


						<td id="m_isebsvisor_9784"> - </td>



					


						<td id="m_isebsvisor_9786"> - </td>



					


						<td id="m_isebsvisor_9382"> - </td>



					


						<td id="m_isebsvisor_9383"> - </td>



					


						<td id="m_isebsvisor_9384"> - </td>



					


						<td id="m_isebsvisor_9385"> - </td>



					


						<td id="m_isebsvisor_9386"> - </td>



					


						<td id="m_isebsvisor_9785"> - </td>



					


							</tr>



-->
        <TR class=hidd>
          <TD id=m_isbssvisor_9784>-</TD>
          <TD id=m_isbssvisor_9786>-</TD>
          <TD id=m_isbssvisor_9382>-</TD>
          <TD id=m_isbssvisor_9383>-</TD>
          <TD id=m_isbssvisor_9384>-</TD>
          <TD id=m_isbssvisor_9385>-</TD>
          <TD id=m_isbssvisor_9386>-</TD>
          <TD id=m_isbssvisor_9785>-</TD></TR>
        <TR class=hidd>
          <TD id=m_issvisordr_9784>●</TD>
          <TD id=m_issvisordr_9786>●</TD>
          <TD id=m_issvisordr_9382>●</TD>
          <TD id=m_issvisordr_9383>●</TD>
          <TD id=m_issvisordr_9384>●</TD>
          <TD id=m_issvisordr_9385>●</TD>
          <TD id=m_issvisordr_9386>●</TD>
          <TD id=m_issvisordr_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_isinswiper_9784>-</TD>
          <TD id=m_isinswiper_9786>-</TD>
          <TD id=m_isinswiper_9382>-</TD>
          <TD id=m_isinswiper_9383>-</TD>
          <TD id=m_isinswiper_9384>●</TD>
          <TD id=m_isinswiper_9385>●</TD>
          <TD id=m_isinswiper_9386>●</TD>
          <TD id=m_isinswiper_9785>●</TD></TR>
        <TR id=base_15>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9784 scope=col><B href="#/m9784/" 
            target=_blank>2012款迈腾 1.4T 舒适版 </A><I id=base_15_img_9784></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9786 scope=col><B href="#/m9786/" 
            target=_blank>2012款迈腾 1.4T 豪华版 </A><I id=base_15_img_9786></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9382 scope=col><B href="#/m9382/" 
            target=_blank>2012款迈腾 1.8T 舒适版 </A><I id=base_15_img_9382></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9383 scope=col><B href="#/m9383/" 
            target=_blank>2012款迈腾 1.8T 豪华版 </A><I id=base_15_img_9383></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9384 scope=col><B href="#/m9384/" 
            target=_blank>2012款迈腾 1.8T 尊贵版 </A><I id=base_15_img_9384></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9385 scope=col><B href="#/m9385/" 
            target=_blank>2012款迈腾 2.0T 尊贵版 </A><I id=base_15_img_9385></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9386 scope=col><B href="#/m9386/" 
            target=_blank>2012款迈腾 2.0T 至尊版 </A><I id=base_15_img_9386></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9785 scope=col><B href="#/m9785/" 
            target=_blank>2012款迈腾 3.0L 旗舰版 </A><I id=base_15_img_9785></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isairc_9784>●</TD>
          <TD id=m_isairc_9786>●</TD>
          <TD id=m_isairc_9382>●</TD>
          <TD id=m_isairc_9383>●</TD>
          <TD id=m_isairc_9384>●</TD>
          <TD id=m_isairc_9385>●</TD>
          <TD id=m_isairc_9386>●</TD>
          <TD id=m_isairc_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbsairo_9784>●</TD>
          <TD id=m_isbsairo_9786>●</TD>
          <TD id=m_isbsairo_9382>●</TD>
          <TD id=m_isbsairo_9383>●</TD>
          <TD id=m_isbsairo_9384>●</TD>
          <TD id=m_isbsairo_9385>●</TD>
          <TD id=m_isbsairo_9386>●</TD>
          <TD id=m_isbsairo_9785>●</TD></TR>
        <TR class=disc>
          <TD id=m_istempdct_9784>-</TD>
          <TD id=m_istempdct_9786>●</TD>
          <TD id=m_istempdct_9382>-</TD>
          <TD id=m_istempdct_9383>●</TD>
          <TD id=m_istempdct_9384>●</TD>
          <TD id=m_istempdct_9385>●</TD>
          <TD id=m_istempdct_9386>●</TD>
          <TD id=m_istempdct_9785>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscaricebox_9784>-</TD>
          <TD id=m_iscaricebox_9786>-</TD>
          <TD id=m_iscaricebox_9382>-</TD>
          <TD id=m_iscaricebox_9383>-</TD>
          <TD id=m_iscaricebox_9384>-</TD>
          <TD id=m_iscaricebox_9385>-</TD>
          <TD id=m_iscaricebox_9386>-</TD>
          <TD 
id=m_iscaricebox_9785>-</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
<DIV class=clear></DIV></DIV>
<SCRIPT type=text/javascript 
src="【迈腾】迈腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/analytics.htm"></SCRIPT>
<!--登陆js-->
<SCRIPT 
src="【迈腾】迈腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/new_login2011_newcar.htm"></SCRIPT>

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
    <OPTION selected value=9784>2012款迈腾 1.4T 舒适版</OPTION> <OPTION 
    value=9786>2012款迈腾 1.4T 豪华版</OPTION> <OPTION value=9382>2012款迈腾 1.8T 
    舒适版</OPTION> <OPTION value=9383>2012款迈腾 1.8T 豪华版</OPTION> <OPTION 
    value=9384>2012款迈腾 1.8T 尊贵版</OPTION> <OPTION value=9385>2012款迈腾 2.0T 
    尊贵版</OPTION> <OPTION value=9386>2012款迈腾 2.0T 至尊版</OPTION> <OPTION 
    value=9785>2012款迈腾 3.0L 旗舰版</OPTION></SELECT></LI>
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
src="【迈腾】迈腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/news_forall.js"></SCRIPT>

<SCRIPT type=text/javascript 
src="【迈腾】迈腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/dw.js"></SCRIPT>

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
