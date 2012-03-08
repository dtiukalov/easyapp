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
  value=1,2,3,4,5,6,7,8,9,10,11,12 CHECKED type=checkbox>2011款速腾</LI></UL><EM 
class=b>排量：</EM> 
<UL class=x>
  <LI><INPUT id=dislCheckbox_0 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','3','0','一种发动机')" value=1,2,3,4 CHECKED 
  type=checkbox>1.4T</LI>
  <LI><INPUT id=dislCheckbox_1 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','3','1','一种发动机')" value=5,6,7,8,9,10 
  CHECKED type=checkbox>1.6L</LI>
  <LI><INPUT id=dislCheckbox_2 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','3','2','一种发动机')" value=11,12 CHECKED 
  type=checkbox>1.8T</LI></UL><EM class=c>变速箱：</EM> 
<UL class=y>
  <LI><INPUT id=transtypeCheckbox_0 class=t1126_teys 
  onclick="chg_checkbox('transtypeCheckbox','3','0','一种变速箱')" value=1,2,5,6,7,11 
  CHECKED type=checkbox>手动变速箱</LI>
  <LI><INPUT id=transtypeCheckbox_1 class=t1126_teys 
  onclick="chg_checkbox('transtypeCheckbox','3','1','一种变速箱')" value=8,9,10,12 
  CHECKED type=checkbox>自动变速箱</LI>
  <LI><INPUT id=transtypeCheckbox_2 class=gm_cfradio 
  onclick="chg_checkbox('transtypeCheckbox','3','2','一种变速箱')" value=3,4 CHECKED 
  type=checkbox>双离合变速箱</LI></UL></DIV>
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
            src="【速腾】速腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
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
            src="【速腾】速腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【速腾】速腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【速腾】速腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【速腾】速腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【速腾】速腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【速腾】速腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【速腾】速腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【速腾】速腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【速腾】速腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【速腾】速腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【速腾】速腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【速腾】速腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH></TR>
        <TR id=base_1>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8356 scope=col><B href="/m8356/" 
            target=_blank>2011款速腾 1.4T 手动技术版 </A><I id=base_1_img_8356></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8248 scope=col><B href="/m8248/" 
            target=_blank>2011款速腾 1.4T 手动豪华版 </A><I id=base_1_img_8248></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8357 scope=col><B href="/m8357/" 
            target=_blank>2011款速腾 1.4T DSG技术版 </A><I id=base_1_img_8357></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8358 scope=col><B href="/m8358/" 
            target=_blank>2011款速腾 1.4T DSG豪华版 </A><I id=base_1_img_8358></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8354 scope=col><B href="/m8354/" 
            target=_blank>2011款速腾 1.6L 手动时尚版 </A><I id=base_1_img_8354></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8247 scope=col><B href="/m8247/" 
            target=_blank>2011款速腾 1.6L 手动舒适版 </A><I id=base_1_img_8247></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10794 scope=col><B href="/m10794/" 
            target=_blank>2011款速腾 1.6L 手动特别版 </A><I id=base_1_img_10794></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8355 scope=col><B href="/m8355/" 
            target=_blank>2011款速腾 1.6L 自动时尚版 </A><I id=base_1_img_8355></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8200 scope=col><B href="/m8200/" 
            target=_blank>2011款速腾 1.6L 自动舒适版 </A><I id=base_1_img_8200></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10795 scope=col><B href="/m10795/" 
            target=_blank>2011款速腾 1.6L 自动特别版 </A><I id=base_1_img_10795></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8359 scope=col><B href="/m8359/" 
            target=_blank>2011款速腾 1.8T 手动冠军版 </A><I id=base_1_img_8359></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8360 scope=col><B href="/m8360/" 
            target=_blank>2011款速腾 1.8T 自动冠军版 </A><I id=base_1_img_8360></I> </TH></TR>
        <TR class=disc>
          <TD id=min_price_8356>14.88万</TD>
          <TD id=min_price_8248>15.58万</TD>
          <TD id=min_price_8357>16.28万</TD>
          <TD id=min_price_8358>16.98万</TD>
          <TD id=min_price_8354>13.28万</TD>
          <TD id=min_price_8247>13.58万</TD>
          <TD id=min_price_10794>14.38万</TD>
          <TD id=min_price_8355>14.48万</TD>
          <TD id=min_price_8200>14.78万</TD>
          <TD id=min_price_10795>15.58万</TD>
          <TD id=min_price_8359>17.28万</TD>
          <TD id=min_price_8360>18.48万</TD></TR>
        <TR class=hidd>
          <TD id=bname_8356><B title=一汽-大众 
            href="/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_8248><B title=一汽-大众 
            href="/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_8357><B title=一汽-大众 
            href="/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_8358><B title=一汽-大众 
            href="/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_8354><B title=一汽-大众 
            href="/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_8247><B title=一汽-大众 
            href="/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_10794><B title=一汽-大众 
            href="/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_8355><B title=一汽-大众 
            href="/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_8200><B title=一汽-大众 
            href="/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_10795><B title=一汽-大众 
            href="/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_8359><B title=一汽-大众 
            href="/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_8360><B title=一汽-大众 
            href="/price/b2/" 
        target=_blank>一汽-大众</A></TD></TR>
        <TR class=hidd>
          <TD id=type2_8356><B 
            href="/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_8248><B 
            href="/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_8357><B 
            href="/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_8358><B 
            href="/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_8354><B 
            href="/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_8247><B 
            href="/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_10794><B 
            href="/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_8355><B 
            href="/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_8200><B 
            href="/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_10795><B 
            href="/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_8359><B 
            href="/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_8360><B 
            href="/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD></TR>
        <TR class=disc>
          <TD id=m_disl_8356>1.4L 96kW </TD>
          <TD id=m_disl_8248>1.4L 96kW </TD>
          <TD id=m_disl_8357>1.4L 96kW </TD>
          <TD id=m_disl_8358>1.4L 96kW </TD>
          <TD id=m_disl_8354>1.6L 74kW </TD>
          <TD id=m_disl_8247>1.6L 74kW </TD>
          <TD id=m_disl_10794>1.6L 74kW </TD>
          <TD id=m_disl_8355>1.6L 74kW </TD>
          <TD id=m_disl_8200>1.6L 74kW </TD>
          <TD id=m_disl_10795>1.6L 74kW </TD>
          <TD id=m_disl_8359>1.8L 118kW </TD>
          <TD id=m_disl_8360>1.8L 118kW </TD></TR>
        <TR class=disc>
          <TD id=m_transtype_8356>5挡手动</TD>
          <TD id=m_transtype_8248>5挡手动</TD>
          <TD id=m_transtype_8357>7挡双离合变速箱</TD>
          <TD id=m_transtype_8358>7挡双离合变速箱</TD>
          <TD id=m_transtype_8354>5挡手动</TD>
          <TD id=m_transtype_8247>5挡手动</TD>
          <TD id=m_transtype_10794>5挡手动</TD>
          <TD id=m_transtype_8355>6挡自动</TD>
          <TD id=m_transtype_8200>6挡自动</TD>
          <TD id=m_transtype_10795>6挡自动</TD>
          <TD id=m_transtype_8359>5挡手动</TD>
          <TD id=m_transtype_8360>6挡自动</TD></TR>
        <TR class=hidd>
          <TD id=m_length_width_height_8356><!---->4544×1760×1461 <!----></TD>
          <TD id=m_length_width_height_8248><!---->4544×1760×1461 <!----></TD>
          <TD id=m_length_width_height_8357><!---->4544×1760×1461 <!----></TD>
          <TD id=m_length_width_height_8358><!---->4544×1760×1461 <!----></TD>
          <TD id=m_length_width_height_8354><!---->4544×1760×1461 <!----></TD>
          <TD id=m_length_width_height_8247><!---->4544×1760×1461 <!----></TD>
          <TD id=m_length_width_height_10794><!---->4544×1760×1461 <!----></TD>
          <TD id=m_length_width_height_8355><!---->4544×1760×1461 <!----></TD>
          <TD id=m_length_width_height_8200><!---->4544×1760×1461 <!----></TD>
          <TD id=m_length_width_height_10795><!---->4544×1760×1461 <!----></TD>
          <TD id=m_length_width_height_8359><!---->4544×1760×1461 <!----></TD>
          <TD id=m_length_width_height_8360><!---->4544×1760×1461 
<!----></TD></TR>
        <TR class=hidd>
          <TD id=m_frame_8356>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8248>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8357>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8358>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8354>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8247>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10794>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8355>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8200>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10795>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8359>4门 5座 三厢轿车</TD>
          <TD id=m_frame_8360>4门 5座 三厢轿车</TD></TR>
        <TR class=hidd>
          <TD id=syear_8356>2010</TD>
          <TD id=syear_8248>2010</TD>
          <TD id=syear_8357>2010</TD>
          <TD id=syear_8358>2010</TD>
          <TD id=syear_8354>2010</TD>
          <TD id=syear_8247>2010</TD>
          <TD id=syear_10794>2010</TD>
          <TD id=syear_8355>2010</TD>
          <TD id=syear_8200>2010</TD>
          <TD id=syear_10795>2010</TD>
          <TD id=syear_8359>2010</TD>
          <TD id=syear_8360>2010</TD></TR>
        <TR class=disc>
          <TD id=m_mspeed_8356>203</TD>
          <TD id=m_mspeed_8248>203</TD>
          <TD id=m_mspeed_8357>200</TD>
          <TD id=m_mspeed_8358>200</TD>
          <TD id=m_mspeed_8354>185</TD>
          <TD id=m_mspeed_8247>185</TD>
          <TD id=m_mspeed_10794>185</TD>
          <TD id=m_mspeed_8355>180</TD>
          <TD id=m_mspeed_8200>180</TD>
          <TD id=m_mspeed_10795>180</TD>
          <TD id=m_mspeed_8359>216</TD>
          <TD id=m_mspeed_8360>210</TD></TR>
        <TR class=disc>
          <TD id=m_hatime_8356>10.2</TD>
          <TD id=m_hatime_8248>10.2</TD>
          <TD id=m_hatime_8357>10.2</TD>
          <TD id=m_hatime_8358>10.2</TD>
          <TD id=m_hatime_8354>15.5</TD>
          <TD id=m_hatime_8247>15.5</TD>
          <TD id=m_hatime_10794>15.5</TD>
          <TD id=m_hatime_8355>16</TD>
          <TD id=m_hatime_8200>16</TD>
          <TD id=m_hatime_10795>16</TD>
          <TD id=m_hatime_8359>8.9</TD>
          <TD id=m_hatime_8360>8.9</TD></TR>
        <TR class=disc>
          <TD id=m_comfuel_8356>6.5</TD>
          <TD id=m_comfuel_8248>6.5</TD>
          <TD id=m_comfuel_8357>6.4</TD>
          <TD id=m_comfuel_8358>6.4</TD>
          <TD id=m_comfuel_8354>6.6</TD>
          <TD id=m_comfuel_8247>6.6</TD>
          <TD id=m_comfuel_10794>6.6</TD>
          <TD id=m_comfuel_8355>6.7</TD>
          <TD id=m_comfuel_8200>6.7</TD>
          <TD id=m_comfuel_10795>6.7</TD>
          <TD id=m_comfuel_8359>7.5</TD>
          <TD id=m_comfuel_8360>8.6</TD></TR>
        <TR class=disc>
          <TD id=m_lkmfuel_8356>- </TD>
          <TD id=m_lkmfuel_8248>- </TD>
          <TD id=m_lkmfuel_8357>- </TD>
          <TD id=m_lkmfuel_8358>- </TD>
          <TD id=m_lkmfuel_8354>- </TD>
          <TD id=m_lkmfuel_8247>- </TD>
          <TD id=m_lkmfuel_10794>- </TD>
          <TD id=m_lkmfuel_8355>- </TD>
          <TD id=m_lkmfuel_8200>- </TD>
          <TD id=m_lkmfuel_10795>- </TD>
          <TD id=m_lkmfuel_8359>- </TD>
          <TD id=m_lkmfuel_8360>- </TD></TR>
        <TR class=disc>
          <TD id=m_hkmfuel_8356>- </TD>
          <TD id=m_hkmfuel_8248>- </TD>
          <TD id=m_hkmfuel_8357>- </TD>
          <TD id=m_hkmfuel_8358>- </TD>
          <TD id=m_hkmfuel_8354>- </TD>
          <TD id=m_hkmfuel_8247>- </TD>
          <TD id=m_hkmfuel_10794>- </TD>
          <TD id=m_hkmfuel_8355>- </TD>
          <TD id=m_hkmfuel_8200>- </TD>
          <TD id=m_hkmfuel_10795>- </TD>
          <TD id=m_hkmfuel_8359>- </TD>
          <TD id=m_hkmfuel_8360>- </TD></TR>
        <TR class=hidd>
          <TD id=m_ypolicy_8356>2年6万公里 </TD>
          <TD id=m_ypolicy_8248>2年6万公里 </TD>
          <TD id=m_ypolicy_8357>2年6万公里 </TD>
          <TD id=m_ypolicy_8358>2年6万公里 </TD>
          <TD id=m_ypolicy_8354>2年6万公里 </TD>
          <TD id=m_ypolicy_8247>2年6万公里 </TD>
          <TD id=m_ypolicy_10794>2年6万公里 </TD>
          <TD id=m_ypolicy_8355>2年6万公里 </TD>
          <TD id=m_ypolicy_8200>2年6万公里 </TD>
          <TD id=m_ypolicy_10795>2年6万公里 </TD>
          <TD id=m_ypolicy_8359>2年6万公里 </TD>
          <TD id=m_ypolicy_8360>2年6万公里 </TD></TR>
        <TR id=base_2>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8356 scope=col><B href="/m8356/" 
            target=_blank>2011款速腾 1.4T 手动技术版</A> <I id=base_2_img_8356></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8248 scope=col><B href="/m8248/" 
            target=_blank>2011款速腾 1.4T 手动豪华版</A> <I id=base_2_img_8248></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8357 scope=col><B href="/m8357/" 
            target=_blank>2011款速腾 1.4T DSG技术版</A> <I id=base_2_img_8357></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8358 scope=col><B href="/m8358/" 
            target=_blank>2011款速腾 1.4T DSG豪华版</A> <I id=base_2_img_8358></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8354 scope=col><B href="/m8354/" 
            target=_blank>2011款速腾 1.6L 手动时尚版</A> <I id=base_2_img_8354></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8247 scope=col><B href="/m8247/" 
            target=_blank>2011款速腾 1.6L 手动舒适版</A> <I id=base_2_img_8247></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10794 scope=col><B href="/m10794/" 
            target=_blank>2011款速腾 1.6L 手动特别版</A> <I id=base_2_img_10794></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8355 scope=col><B href="/m8355/" 
            target=_blank>2011款速腾 1.6L 自动时尚版</A> <I id=base_2_img_8355></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8200 scope=col><B href="/m8200/" 
            target=_blank>2011款速腾 1.6L 自动舒适版</A> <I id=base_2_img_8200></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10795 scope=col><B href="/m10795/" 
            target=_blank>2011款速腾 1.6L 自动特别版</A> <I id=base_2_img_10795></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8359 scope=col><B href="/m8359/" 
            target=_blank>2011款速腾 1.8T 手动冠军版</A> <I id=base_2_img_8359></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8360 scope=col><B href="/m8360/" 
            target=_blank>2011款速腾 1.8T 自动冠军版</A> <I id=base_2_img_8360></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_length_8356>4544</TD>
          <TD id=m_length_8248>4544</TD>
          <TD id=m_length_8357>4544</TD>
          <TD id=m_length_8358>4544</TD>
          <TD id=m_length_8354>4544</TD>
          <TD id=m_length_8247>4544</TD>
          <TD id=m_length_10794>4544</TD>
          <TD id=m_length_8355>4544</TD>
          <TD id=m_length_8200>4544</TD>
          <TD id=m_length_10795>4544</TD>
          <TD id=m_length_8359>4544</TD>
          <TD id=m_length_8360>4544</TD></TR>
        <TR class=hidd>
          <TD id=m_width_8356>1760</TD>
          <TD id=m_width_8248>1760</TD>
          <TD id=m_width_8357>1760</TD>
          <TD id=m_width_8358>1760</TD>
          <TD id=m_width_8354>1760</TD>
          <TD id=m_width_8247>1760</TD>
          <TD id=m_width_10794>1760</TD>
          <TD id=m_width_8355>1760</TD>
          <TD id=m_width_8200>1760</TD>
          <TD id=m_width_10795>1760</TD>
          <TD id=m_width_8359>1760</TD>
          <TD id=m_width_8360>1760</TD></TR>
        <TR class=hidd>
          <TD id=m_height_8356>1461</TD>
          <TD id=m_height_8248>1461</TD>
          <TD id=m_height_8357>1461</TD>
          <TD id=m_height_8358>1461</TD>
          <TD id=m_height_8354>1461</TD>
          <TD id=m_height_8247>1461</TD>
          <TD id=m_height_10794>1461</TD>
          <TD id=m_height_8355>1461</TD>
          <TD id=m_height_8200>1461</TD>
          <TD id=m_height_10795>1461</TD>
          <TD id=m_height_8359>1461</TD>
          <TD id=m_height_8360>1461</TD></TR>
        <TR class=hidd>
          <TD id=m_wheelbase_8356>2578</TD>
          <TD id=m_wheelbase_8248>2578</TD>
          <TD id=m_wheelbase_8357>2578</TD>
          <TD id=m_wheelbase_8358>2578</TD>
          <TD id=m_wheelbase_8354>2578</TD>
          <TD id=m_wheelbase_8247>2578</TD>
          <TD id=m_wheelbase_10794>2578</TD>
          <TD id=m_wheelbase_8355>2578</TD>
          <TD id=m_wheelbase_8200>2578</TD>
          <TD id=m_wheelbase_10795>2578</TD>
          <TD id=m_wheelbase_8359>2578</TD>
          <TD id=m_wheelbase_8360>2578</TD></TR>
        <TR class=disc>
          <TD id=m_weight_8356>1405</TD>
          <TD id=m_weight_8248>1405</TD>
          <TD id=m_weight_8357>1425</TD>
          <TD id=m_weight_8358>1425</TD>
          <TD id=m_weight_8354>1353</TD>
          <TD id=m_weight_8247>1353</TD>
          <TD id=m_weight_10794>1353</TD>
          <TD id=m_weight_8355>1379</TD>
          <TD id=m_weight_8200>1379</TD>
          <TD id=m_weight_10795>1379</TD>
          <TD id=m_weight_8359>1413</TD>
          <TD id=m_weight_8360>1446</TD></TR>
        <TR class=hidd>
          <TD id=m_clearance_8356>125</TD>
          <TD id=m_clearance_8248>125</TD>
          <TD id=m_clearance_8357>125</TD>
          <TD id=m_clearance_8358>125</TD>
          <TD id=m_clearance_8354>125</TD>
          <TD id=m_clearance_8247>125</TD>
          <TD id=m_clearance_10794>125</TD>
          <TD id=m_clearance_8355>125</TD>
          <TD id=m_clearance_8200>125</TD>
          <TD id=m_clearance_10795>125</TD>
          <TD id=m_clearance_8359>125</TD>
          <TD id=m_clearance_8360>125</TD></TR>
        <TR class=hidd>
          <TD id=m_frame2_8356>三厢轿车</TD>
          <TD id=m_frame2_8248>三厢轿车</TD>
          <TD id=m_frame2_8357>三厢轿车</TD>
          <TD id=m_frame2_8358>三厢轿车</TD>
          <TD id=m_frame2_8354>三厢轿车</TD>
          <TD id=m_frame2_8247>三厢轿车</TD>
          <TD id=m_frame2_10794>三厢轿车</TD>
          <TD id=m_frame2_8355>三厢轿车</TD>
          <TD id=m_frame2_8200>三厢轿车</TD>
          <TD id=m_frame2_10795>三厢轿车</TD>
          <TD id=m_frame2_8359>三厢轿车</TD>
          <TD id=m_frame2_8360>三厢轿车</TD></TR>
        <TR class=hidd>
          <TD id=m_door_8356>4</TD>
          <TD id=m_door_8248>4</TD>
          <TD id=m_door_8357>4</TD>
          <TD id=m_door_8358>4</TD>
          <TD id=m_door_8354>4</TD>
          <TD id=m_door_8247>4</TD>
          <TD id=m_door_10794>4</TD>
          <TD id=m_door_8355>4</TD>
          <TD id=m_door_8200>4</TD>
          <TD id=m_door_10795>4</TD>
          <TD id=m_door_8359>4</TD>
          <TD id=m_door_8360>4</TD></TR>
        <TR class=hidd>
          <TD id=m_seat_8356>5</TD>
          <TD id=m_seat_8248>5</TD>
          <TD id=m_seat_8357>5</TD>
          <TD id=m_seat_8358>5</TD>
          <TD id=m_seat_8354>5</TD>
          <TD id=m_seat_8247>5</TD>
          <TD id=m_seat_10794>5</TD>
          <TD id=m_seat_8355>5</TD>
          <TD id=m_seat_8200>5</TD>
          <TD id=m_seat_10795>5</TD>
          <TD id=m_seat_8359>5</TD>
          <TD id=m_seat_8360>5</TD></TR>
        <TR class=hidd>
          <TD id=m_oilbox_8356>55.00</TD>
          <TD id=m_oilbox_8248>55.00</TD>
          <TD id=m_oilbox_8357>55.00</TD>
          <TD id=m_oilbox_8358>55.00</TD>
          <TD id=m_oilbox_8354>55.00</TD>
          <TD id=m_oilbox_8247>55.00</TD>
          <TD id=m_oilbox_10794>55.00</TD>
          <TD id=m_oilbox_8355>55.00</TD>
          <TD id=m_oilbox_8200>55.00</TD>
          <TD id=m_oilbox_10795>55.00</TD>
          <TD id=m_oilbox_8359>55.00</TD>
          <TD id=m_oilbox_8360>55.00</TD></TR>
        <TR class=hidd>
          <TD id=m_trunk_8356>527</TD>
          <TD id=m_trunk_8248>527</TD>
          <TD id=m_trunk_8357>527</TD>
          <TD id=m_trunk_8358>527</TD>
          <TD id=m_trunk_8354>527</TD>
          <TD id=m_trunk_8247>527</TD>
          <TD id=m_trunk_10794>527</TD>
          <TD id=m_trunk_8355>527</TD>
          <TD id=m_trunk_8200>527</TD>
          <TD id=m_trunk_10795>527</TD>
          <TD id=m_trunk_8359>527</TD>
          <TD id=m_trunk_8360>527</TD></TR>
        <TR class=hidd>
          <TD id=m_mtrunk_8356>527</TD>
          <TD id=m_mtrunk_8248>527</TD>
          <TD id=m_mtrunk_8357>527</TD>
          <TD id=m_mtrunk_8358>527</TD>
          <TD id=m_mtrunk_8354>527</TD>
          <TD id=m_mtrunk_8247>527</TD>
          <TD id=m_mtrunk_10794>527</TD>
          <TD id=m_mtrunk_8355>527</TD>
          <TD id=m_mtrunk_8200>527</TD>
          <TD id=m_mtrunk_10795>527</TD>
          <TD id=m_mtrunk_8359>527</TD>
          <TD id=m_mtrunk_8360>527</TD></TR>
        <TR id=base_3>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8356 scope=col><B href="/m8356/" 
            target=_blank>2011款速腾 1.4T 手动技术版 </A><I id=base_3_img_8356></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8248 scope=col><B href="/m8248/" 
            target=_blank>2011款速腾 1.4T 手动豪华版 </A><I id=base_3_img_8248></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8357 scope=col><B href="/m8357/" 
            target=_blank>2011款速腾 1.4T DSG技术版 </A><I id=base_3_img_8357></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8358 scope=col><B href="/m8358/" 
            target=_blank>2011款速腾 1.4T DSG豪华版 </A><I id=base_3_img_8358></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8354 scope=col><B href="/m8354/" 
            target=_blank>2011款速腾 1.6L 手动时尚版 </A><I id=base_3_img_8354></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8247 scope=col><B href="/m8247/" 
            target=_blank>2011款速腾 1.6L 手动舒适版 </A><I id=base_3_img_8247></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10794 scope=col><B href="/m10794/" 
            target=_blank>2011款速腾 1.6L 手动特别版 </A><I id=base_3_img_10794></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8355 scope=col><B href="/m8355/" 
            target=_blank>2011款速腾 1.6L 自动时尚版 </A><I id=base_3_img_8355></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8200 scope=col><B href="/m8200/" 
            target=_blank>2011款速腾 1.6L 自动舒适版 </A><I id=base_3_img_8200></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10795 scope=col><B href="/m10795/" 
            target=_blank>2011款速腾 1.6L 自动特别版 </A><I id=base_3_img_10795></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8359 scope=col><B href="/m8359/" 
            target=_blank>2011款速腾 1.8T 手动冠军版 </A><I id=base_3_img_8359></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8360 scope=col><B href="/m8360/" 
            target=_blank>2011款速腾 1.8T 自动冠军版 </A><I id=base_3_img_8360></I> </TH></TR>
        <TR class=disc>
          <TD id=m_disl2_8356>1.4</TD>
          <TD id=m_disl2_8248>1.4</TD>
          <TD id=m_disl2_8357>1.4</TD>
          <TD id=m_disl2_8358>1.4</TD>
          <TD id=m_disl2_8354>1.6</TD>
          <TD id=m_disl2_8247>1.6</TD>
          <TD id=m_disl2_10794>1.6</TD>
          <TD id=m_disl2_8355>1.6</TD>
          <TD id=m_disl2_8200>1.6</TD>
          <TD id=m_disl2_10795>1.6</TD>
          <TD id=m_disl2_8359>1.8</TD>
          <TD id=m_disl2_8360>1.8</TD></TR>
        <TR class=disc>
          <TD id=m_working_8356>涡轮增压</TD>
          <TD id=m_working_8248>涡轮增压</TD>
          <TD id=m_working_8357>涡轮增压</TD>
          <TD id=m_working_8358>涡轮增压</TD>
          <TD id=m_working_8354>自然吸气</TD>
          <TD id=m_working_8247>自然吸气</TD>
          <TD id=m_working_10794>自然吸气</TD>
          <TD id=m_working_8355>自然吸气</TD>
          <TD id=m_working_8200>自然吸气</TD>
          <TD id=m_working_10795>自然吸气</TD>
          <TD id=m_working_8359>涡轮增压</TD>
          <TD id=m_working_8360>涡轮增压</TD></TR>
        <TR class=disc>
          <TD id=m_mpower_8356>96</TD>
          <TD id=m_mpower_8248>96</TD>
          <TD id=m_mpower_8357>96</TD>
          <TD id=m_mpower_8358>96</TD>
          <TD id=m_mpower_8354>74</TD>
          <TD id=m_mpower_8247>74</TD>
          <TD id=m_mpower_10794>74</TD>
          <TD id=m_mpower_8355>74</TD>
          <TD id=m_mpower_8200>74</TD>
          <TD id=m_mpower_10795>74</TD>
          <TD id=m_mpower_8359>118</TD>
          <TD id=m_mpower_8360>118</TD></TR>
        <TR class=disc>
          <TD id=m_mpowersp_8356>5000</TD>
          <TD id=m_mpowersp_8248>5000</TD>
          <TD id=m_mpowersp_8357>5000</TD>
          <TD id=m_mpowersp_8358>5000</TD>
          <TD id=m_mpowersp_8354>6000</TD>
          <TD id=m_mpowersp_8247>6000</TD>
          <TD id=m_mpowersp_10794>6000</TD>
          <TD id=m_mpowersp_8355>6000</TD>
          <TD id=m_mpowersp_8200>6000</TD>
          <TD id=m_mpowersp_10795>6000</TD>
          <TD id=m_mpowersp_8359>5000-6200</TD>
          <TD id=m_mpowersp_8360>5000-6200</TD></TR>
        <TR class=disc>
          <TD id=m_mtorque_8356>220</TD>
          <TD id=m_mtorque_8248>220</TD>
          <TD id=m_mtorque_8357>220</TD>
          <TD id=m_mtorque_8358>220</TD>
          <TD id=m_mtorque_8354>145</TD>
          <TD id=m_mtorque_8247>145</TD>
          <TD id=m_mtorque_10794>145</TD>
          <TD id=m_mtorque_8355>145</TD>
          <TD id=m_mtorque_8200>145</TD>
          <TD id=m_mtorque_10795>145</TD>
          <TD id=m_mtorque_8359>250</TD>
          <TD id=m_mtorque_8360>250</TD></TR>
        <TR class=disc>
          <TD id=m_mtorsp_8356>1750-3500</TD>
          <TD id=m_mtorsp_8248>1750-3500</TD>
          <TD id=m_mtorsp_8357>1750-3500</TD>
          <TD id=m_mtorsp_8358>1750-3500</TD>
          <TD id=m_mtorsp_8354>3800</TD>
          <TD id=m_mtorsp_8247>3800</TD>
          <TD id=m_mtorsp_10794>3800</TD>
          <TD id=m_mtorsp_8355>3800</TD>
          <TD id=m_mtorsp_8200>3800</TD>
          <TD id=m_mtorsp_10795>3800</TD>
          <TD id=m_mtorsp_8359>1500-4200</TD>
          <TD id=m_mtorsp_8360>1500-4200</TD></TR>
        <TR class=hidd>
          <TD id=m_fuel_8356>汽油</TD>
          <TD id=m_fuel_8248>汽油</TD>
          <TD id=m_fuel_8357>汽油</TD>
          <TD id=m_fuel_8358>汽油</TD>
          <TD id=m_fuel_8354>汽油</TD>
          <TD id=m_fuel_8247>汽油</TD>
          <TD id=m_fuel_10794>汽油</TD>
          <TD id=m_fuel_8355>汽油</TD>
          <TD id=m_fuel_8200>汽油</TD>
          <TD id=m_fuel_10795>汽油</TD>
          <TD id=m_fuel_8359>汽油</TD>
          <TD id=m_fuel_8360>汽油</TD></TR>
        <TR class=disc>
          <TD id=m_fuelno_8356>93</TD>
          <TD id=m_fuelno_8248>93</TD>
          <TD id=m_fuelno_8357>93</TD>
          <TD id=m_fuelno_8358>93</TD>
          <TD id=m_fuelno_8354>93</TD>
          <TD id=m_fuelno_8247>93</TD>
          <TD id=m_fuelno_10794>93</TD>
          <TD id=m_fuelno_8355>93</TD>
          <TD id=m_fuelno_8200>93</TD>
          <TD id=m_fuelno_10795>93</TD>
          <TD id=m_fuelno_8359>97</TD>
          <TD id=m_fuelno_8360>97</TD></TR>
        <TR class=disc>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_8356>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_8248>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_8357>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_8358>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" id=m_envstand_8354>欧IV 
          </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" id=m_envstand_8247>欧IV 
          </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" id=m_envstand_10794>欧IV 
          </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" id=m_envstand_8355>欧IV 
          </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" id=m_envstand_8200>欧IV 
          </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" id=m_envstand_10795>欧IV 
          </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_8359>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_8360>国IV+OBD </TD></TR>
        <TR id=base_4>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8356 scope=col><B href="/m8356/" 
            target=_blank>2011款速腾 1.4T 手动技术版 </A><I id=base_4_img_8356></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8248 scope=col><B href="/m8248/" 
            target=_blank>2011款速腾 1.4T 手动豪华版 </A><I id=base_4_img_8248></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8357 scope=col><B href="/m8357/" 
            target=_blank>2011款速腾 1.4T DSG技术版 </A><I id=base_4_img_8357></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8358 scope=col><B href="/m8358/" 
            target=_blank>2011款速腾 1.4T DSG豪华版 </A><I id=base_4_img_8358></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8354 scope=col><B href="/m8354/" 
            target=_blank>2011款速腾 1.6L 手动时尚版 </A><I id=base_4_img_8354></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8247 scope=col><B href="/m8247/" 
            target=_blank>2011款速腾 1.6L 手动舒适版 </A><I id=base_4_img_8247></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10794 scope=col><B href="/m10794/" 
            target=_blank>2011款速腾 1.6L 手动特别版 </A><I id=base_4_img_10794></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8355 scope=col><B href="/m8355/" 
            target=_blank>2011款速腾 1.6L 自动时尚版 </A><I id=base_4_img_8355></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8200 scope=col><B href="/m8200/" 
            target=_blank>2011款速腾 1.6L 自动舒适版 </A><I id=base_4_img_8200></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10795 scope=col><B href="/m10795/" 
            target=_blank>2011款速腾 1.6L 自动特别版 </A><I id=base_4_img_10795></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8359 scope=col><B href="/m8359/" 
            target=_blank>2011款速腾 1.8T 手动冠军版 </A><I id=base_4_img_8359></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8360 scope=col><B href="/m8360/" 
            target=_blank>2011款速腾 1.8T 自动冠军版 </A><I id=base_4_img_8360></I> </TH></TR>
        <TR class=disc>
          <TD id=m_speed_8356>5</TD>
          <TD id=m_speed_8248>5</TD>
          <TD id=m_speed_8357>7</TD>
          <TD id=m_speed_8358>7</TD>
          <TD id=m_speed_8354>5</TD>
          <TD id=m_speed_8247>5</TD>
          <TD id=m_speed_10794>5</TD>
          <TD id=m_speed_8355>6</TD>
          <TD id=m_speed_8200>6</TD>
          <TD id=m_speed_10795>6</TD>
          <TD id=m_speed_8359>5</TD>
          <TD id=m_speed_8360>6</TD></TR>
        <TR class=disc>
          <TD id=m_transtype2_8356>MT</TD>
          <TD id=m_transtype2_8248>MT</TD>
          <TD id=m_transtype2_8357>双离合变速箱</TD>
          <TD id=m_transtype2_8358>双离合变速箱</TD>
          <TD id=m_transtype2_8354>MT</TD>
          <TD id=m_transtype2_8247>MT</TD>
          <TD id=m_transtype2_10794>MT</TD>
          <TD id=m_transtype2_8355>AT</TD>
          <TD id=m_transtype2_8200>AT</TD>
          <TD id=m_transtype2_10795>AT</TD>
          <TD id=m_transtype2_8359>MT</TD>
          <TD id=m_transtype2_8360>AT</TD></TR>
        <TR id=base_5>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8356 scope=col><B href="/m8356/" 
            target=_blank>2011款速腾 1.4T 手动技术版 </A><I id=base_5_img_8356></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8248 scope=col><B href="/m8248/" 
            target=_blank>2011款速腾 1.4T 手动豪华版 </A><I id=base_5_img_8248></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8357 scope=col><B href="/m8357/" 
            target=_blank>2011款速腾 1.4T DSG技术版 </A><I id=base_5_img_8357></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8358 scope=col><B href="/m8358/" 
            target=_blank>2011款速腾 1.4T DSG豪华版 </A><I id=base_5_img_8358></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8354 scope=col><B href="/m8354/" 
            target=_blank>2011款速腾 1.6L 手动时尚版 </A><I id=base_5_img_8354></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8247 scope=col><B href="/m8247/" 
            target=_blank>2011款速腾 1.6L 手动舒适版 </A><I id=base_5_img_8247></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10794 scope=col><B href="/m10794/" 
            target=_blank>2011款速腾 1.6L 手动特别版 </A><I id=base_5_img_10794></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8355 scope=col><B href="/m8355/" 
            target=_blank>2011款速腾 1.6L 自动时尚版 </A><I id=base_5_img_8355></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8200 scope=col><B href="/m8200/" 
            target=_blank>2011款速腾 1.6L 自动舒适版 </A><I id=base_5_img_8200></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10795 scope=col><B href="/m10795/" 
            target=_blank>2011款速腾 1.6L 自动特别版 </A><I id=base_5_img_10795></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8359 scope=col><B href="/m8359/" 
            target=_blank>2011款速腾 1.8T 手动冠军版 </A><I id=base_5_img_8359></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8360 scope=col><B href="/m8360/" 
            target=_blank>2011款速腾 1.8T 自动冠军版 </A><I id=base_5_img_8360></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_drivetype_8356>前置前驱</TD>
          <TD id=m_drivetype_8248>前置前驱</TD>
          <TD id=m_drivetype_8357>前置前驱</TD>
          <TD id=m_drivetype_8358>前置前驱</TD>
          <TD id=m_drivetype_8354>前置前驱</TD>
          <TD id=m_drivetype_8247>前置前驱</TD>
          <TD id=m_drivetype_10794>前置前驱</TD>
          <TD id=m_drivetype_8355>前置前驱</TD>
          <TD id=m_drivetype_8200>前置前驱</TD>
          <TD id=m_drivetype_10795>前置前驱</TD>
          <TD id=m_drivetype_8359>前置前驱</TD>
          <TD id=m_drivetype_8360>前置前驱</TD></TR>
        <TR class=hidd height=60>
          <TD id=m_fsustype_text_8356>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_8248>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_8357>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_8358>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_8354>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_8247>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_10794>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_8355>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_8200>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_10795>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_8359>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_8360>麦弗逊式独立悬架</TD></TR>
        <TR class=hidd height=60>
          <TD id=m_bsustype_text_8356>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8248>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8357>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8358>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8354>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8247>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_10794>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8355>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8200>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_10795>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8359>多连杆式独立悬架</TD>
          <TD id=m_bsustype_text_8360>多连杆式独立悬架</TD></TR>
        <TR id=base_6>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8356 scope=col><B href="/m8356/" 
            target=_blank>2011款速腾 1.4T 手动技术版 </A><I id=base_6_img_8356></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8248 scope=col><B href="/m8248/" 
            target=_blank>2011款速腾 1.4T 手动豪华版 </A><I id=base_6_img_8248></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8357 scope=col><B href="/m8357/" 
            target=_blank>2011款速腾 1.4T DSG技术版 </A><I id=base_6_img_8357></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8358 scope=col><B href="/m8358/" 
            target=_blank>2011款速腾 1.4T DSG豪华版 </A><I id=base_6_img_8358></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8354 scope=col><B href="/m8354/" 
            target=_blank>2011款速腾 1.6L 手动时尚版 </A><I id=base_6_img_8354></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8247 scope=col><B href="/m8247/" 
            target=_blank>2011款速腾 1.6L 手动舒适版 </A><I id=base_6_img_8247></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10794 scope=col><B href="/m10794/" 
            target=_blank>2011款速腾 1.6L 手动特别版 </A><I id=base_6_img_10794></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8355 scope=col><B href="/m8355/" 
            target=_blank>2011款速腾 1.6L 自动时尚版 </A><I id=base_6_img_8355></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8200 scope=col><B href="/m8200/" 
            target=_blank>2011款速腾 1.6L 自动舒适版 </A><I id=base_6_img_8200></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10795 scope=col><B href="/m10795/" 
            target=_blank>2011款速腾 1.6L 自动特别版 </A><I id=base_6_img_10795></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8359 scope=col><B href="/m8359/" 
            target=_blank>2011款速腾 1.8T 手动冠军版 </A><I id=base_6_img_8359></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8360 scope=col><B href="/m8360/" 
            target=_blank>2011款速腾 1.8T 自动冠军版 </A><I id=base_6_img_8360></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_fbraketype_8356>通风盘式</TD>
          <TD id=m_fbraketype_8248>通风盘式</TD>
          <TD id=m_fbraketype_8357>通风盘式</TD>
          <TD id=m_fbraketype_8358>通风盘式</TD>
          <TD id=m_fbraketype_8354>通风盘式</TD>
          <TD id=m_fbraketype_8247>通风盘式</TD>
          <TD id=m_fbraketype_10794>通风盘式</TD>
          <TD id=m_fbraketype_8355>通风盘式</TD>
          <TD id=m_fbraketype_8200>通风盘式</TD>
          <TD id=m_fbraketype_10795>通风盘式</TD>
          <TD id=m_fbraketype_8359>通风盘式</TD>
          <TD id=m_fbraketype_8360>通风盘式</TD></TR>
        <TR class=hidd>
          <TD id=m_bbraketype_8356>盘式</TD>
          <TD id=m_bbraketype_8248>盘式</TD>
          <TD id=m_bbraketype_8357>盘式</TD>
          <TD id=m_bbraketype_8358>盘式</TD>
          <TD id=m_bbraketype_8354>盘式</TD>
          <TD id=m_bbraketype_8247>盘式</TD>
          <TD id=m_bbraketype_10794>盘式</TD>
          <TD id=m_bbraketype_8355>盘式</TD>
          <TD id=m_bbraketype_8200>盘式</TD>
          <TD id=m_bbraketype_10795>盘式</TD>
          <TD id=m_bbraketype_8359>盘式</TD>
          <TD id=m_bbraketype_8360>盘式</TD></TR>
        <TR class=disc>
          <TD id=m_ftiresize_8356>205/55 R16</TD>
          <TD id=m_ftiresize_8248>205/55 R16</TD>
          <TD id=m_ftiresize_8357>205/55 R16</TD>
          <TD id=m_ftiresize_8358>205/55 R16</TD>
          <TD id=m_ftiresize_8354>205/55 R16</TD>
          <TD id=m_ftiresize_8247>205/55 R16</TD>
          <TD id=m_ftiresize_10794>205/55 R16</TD>
          <TD id=m_ftiresize_8355>205/55 R16</TD>
          <TD id=m_ftiresize_8200>205/55 R16</TD>
          <TD id=m_ftiresize_10795>205/55 R16</TD>
          <TD id=m_ftiresize_8359>225/45 R17 </TD>
          <TD id=m_ftiresize_8360>225/45 R17 </TD></TR>
        <TR class=disc>
          <TD id=m_btiresize_8356>205/55 R16</TD>
          <TD id=m_btiresize_8248>205/55 R16</TD>
          <TD id=m_btiresize_8357>205/55 R16</TD>
          <TD id=m_btiresize_8358>205/55 R16</TD>
          <TD id=m_btiresize_8354>205/55 R16</TD>
          <TD id=m_btiresize_8247>205/55 R16</TD>
          <TD id=m_btiresize_10794>205/55 R16</TD>
          <TD id=m_btiresize_8355>205/55 R16</TD>
          <TD id=m_btiresize_8200>205/55 R16</TD>
          <TD id=m_btiresize_10795>205/55 R16</TD>
          <TD id=m_btiresize_8359>225/45 R17 </TD>
          <TD id=m_btiresize_8360>225/45 R17 </TD></TR>
        <TR class=hidd>
          <TD id=m_sparetire_8356>非全尺寸</TD>
          <TD id=m_sparetire_8248>非全尺寸</TD>
          <TD id=m_sparetire_8357>非全尺寸</TD>
          <TD id=m_sparetire_8358>非全尺寸</TD>
          <TD id=m_sparetire_8354>非全尺寸</TD>
          <TD id=m_sparetire_8247>非全尺寸</TD>
          <TD id=m_sparetire_10794>非全尺寸</TD>
          <TD id=m_sparetire_8355>非全尺寸</TD>
          <TD id=m_sparetire_8200>非全尺寸</TD>
          <TD id=m_sparetire_10795>非全尺寸</TD>
          <TD id=m_sparetire_8359>非全尺寸</TD>
          <TD id=m_sparetire_8360>非全尺寸</TD></TR>
        <TR id=base_7>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8356 scope=col><B href="/m8356/" 
            target=_blank>2011款速腾 1.4T 手动技术版 </A><I id=base_7_img_8356></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8248 scope=col><B href="/m8248/" 
            target=_blank>2011款速腾 1.4T 手动豪华版 </A><I id=base_7_img_8248></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8357 scope=col><B href="/m8357/" 
            target=_blank>2011款速腾 1.4T DSG技术版 </A><I id=base_7_img_8357></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8358 scope=col><B href="/m8358/" 
            target=_blank>2011款速腾 1.4T DSG豪华版 </A><I id=base_7_img_8358></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8354 scope=col><B href="/m8354/" 
            target=_blank>2011款速腾 1.6L 手动时尚版 </A><I id=base_7_img_8354></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8247 scope=col><B href="/m8247/" 
            target=_blank>2011款速腾 1.6L 手动舒适版 </A><I id=base_7_img_8247></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10794 scope=col><B href="/m10794/" 
            target=_blank>2011款速腾 1.6L 手动特别版 </A><I id=base_7_img_10794></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8355 scope=col><B href="/m8355/" 
            target=_blank>2011款速腾 1.6L 自动时尚版 </A><I id=base_7_img_8355></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8200 scope=col><B href="/m8200/" 
            target=_blank>2011款速腾 1.6L 自动舒适版 </A><I id=base_7_img_8200></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10795 scope=col><B href="/m10795/" 
            target=_blank>2011款速腾 1.6L 自动特别版 </A><I id=base_7_img_10795></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8359 scope=col><B href="/m8359/" 
            target=_blank>2011款速腾 1.8T 手动冠军版 </A><I id=base_7_img_8359></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8360 scope=col><B href="/m8360/" 
            target=_blank>2011款速腾 1.8T 自动冠军版 </A><I id=base_7_img_8360></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isdairbag_8356>●</TD>
          <TD id=m_isdairbag_8248>●</TD>
          <TD id=m_isdairbag_8357>●</TD>
          <TD id=m_isdairbag_8358>●</TD>
          <TD id=m_isdairbag_8354>●</TD>
          <TD id=m_isdairbag_8247>●</TD>
          <TD id=m_isdairbag_10794>●</TD>
          <TD id=m_isdairbag_8355>●</TD>
          <TD id=m_isdairbag_8200>●</TD>
          <TD id=m_isdairbag_10795>●</TD>
          <TD id=m_isdairbag_8359>●</TD>
          <TD id=m_isdairbag_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isadairbag_8356>●</TD>
          <TD id=m_isadairbag_8248>●</TD>
          <TD id=m_isadairbag_8357>●</TD>
          <TD id=m_isadairbag_8358>●</TD>
          <TD id=m_isadairbag_8354>●</TD>
          <TD id=m_isadairbag_8247>●</TD>
          <TD id=m_isadairbag_10794>●</TD>
          <TD id=m_isadairbag_8355>●</TD>
          <TD id=m_isadairbag_8200>●</TD>
          <TD id=m_isadairbag_10795>●</TD>
          <TD id=m_isadairbag_8359>●</TD>
          <TD id=m_isadairbag_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isfhairbag_8356>-</TD>
          <TD id=m_isfhairbag_8248>-</TD>
          <TD id=m_isfhairbag_8357>-</TD>
          <TD id=m_isfhairbag_8358>-</TD>
          <TD id=m_isfhairbag_8354>-</TD>
          <TD id=m_isfhairbag_8247>-</TD>
          <TD id=m_isfhairbag_10794>-</TD>
          <TD id=m_isfhairbag_8355>-</TD>
          <TD id=m_isfhairbag_8200>-</TD>
          <TD id=m_isfhairbag_10795>-</TD>
          <TD id=m_isfhairbag_8359>-</TD>
          <TD id=m_isfhairbag_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isbhairbag_8356>-</TD>
          <TD id=m_isbhairbag_8248>-</TD>
          <TD id=m_isbhairbag_8357>-</TD>
          <TD id=m_isbhairbag_8358>-</TD>
          <TD id=m_isbhairbag_8354>-</TD>
          <TD id=m_isbhairbag_8247>-</TD>
          <TD id=m_isbhairbag_10794>-</TD>
          <TD id=m_isbhairbag_8355>-</TD>
          <TD id=m_isbhairbag_8200>-</TD>
          <TD id=m_isbhairbag_10795>-</TD>
          <TD id=m_isbhairbag_8359>-</TD>
          <TD id=m_isbhairbag_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isfsairbag_8356>●</TD>
          <TD id=m_isfsairbag_8248>●</TD>
          <TD id=m_isfsairbag_8357>●</TD>
          <TD id=m_isfsairbag_8358>●</TD>
          <TD id=m_isfsairbag_8354>●</TD>
          <TD id=m_isfsairbag_8247>●</TD>
          <TD id=m_isfsairbag_10794>●</TD>
          <TD id=m_isfsairbag_8355>●</TD>
          <TD id=m_isfsairbag_8200>●</TD>
          <TD id=m_isfsairbag_10795>●</TD>
          <TD id=m_isfsairbag_8359>●</TD>
          <TD id=m_isfsairbag_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbsairbag_8356>-</TD>
          <TD id=m_isbsairbag_8248>-</TD>
          <TD id=m_isbsairbag_8357>-</TD>
          <TD id=m_isbsairbag_8358>-</TD>
          <TD id=m_isbsairbag_8354>-</TD>
          <TD id=m_isbsairbag_8247>-</TD>
          <TD id=m_isbsairbag_10794>-</TD>
          <TD id=m_isbsairbag_8355>-</TD>
          <TD id=m_isbsairbag_8200>-</TD>
          <TD id=m_isbsairbag_10795>-</TD>
          <TD id=m_isbsairbag_8359>-</TD>
          <TD id=m_isbsairbag_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_iskairbag_8356>-</TD>
          <TD id=m_iskairbag_8248>-</TD>
          <TD id=m_iskairbag_8357>-</TD>
          <TD id=m_iskairbag_8358>-</TD>
          <TD id=m_iskairbag_8354>-</TD>
          <TD id=m_iskairbag_8247>-</TD>
          <TD id=m_iskairbag_10794>-</TD>
          <TD id=m_iskairbag_8355>-</TD>
          <TD id=m_iskairbag_8200>-</TD>
          <TD id=m_iskairbag_10795>-</TD>
          <TD id=m_iskairbag_8359>-</TD>
          <TD id=m_iskairbag_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatbeltti_8356>●</TD>
          <TD id=m_isseatbeltti_8248>●</TD>
          <TD id=m_isseatbeltti_8357>●</TD>
          <TD id=m_isseatbeltti_8358>●</TD>
          <TD id=m_isseatbeltti_8354>●</TD>
          <TD id=m_isseatbeltti_8247>●</TD>
          <TD id=m_isseatbeltti_10794>●</TD>
          <TD id=m_isseatbeltti_8355>●</TD>
          <TD id=m_isseatbeltti_8200>●</TD>
          <TD id=m_isseatbeltti_10795>●</TD>
          <TD id=m_isseatbeltti_8359>●</TD>
          <TD id=m_isseatbeltti_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iseanti_8356>●</TD>
          <TD id=m_iseanti_8248>●</TD>
          <TD id=m_iseanti_8357>●</TD>
          <TD id=m_iseanti_8358>●</TD>
          <TD id=m_iseanti_8354>●</TD>
          <TD id=m_iseanti_8247>●</TD>
          <TD id=m_iseanti_10794>●</TD>
          <TD id=m_iseanti_8355>●</TD>
          <TD id=m_iseanti_8200>●</TD>
          <TD id=m_iseanti_10795>●</TD>
          <TD id=m_iseanti_8359>●</TD>
          <TD id=m_iseanti_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscclock_8356>●</TD>
          <TD id=m_iscclock_8248>●</TD>
          <TD id=m_iscclock_8357>●</TD>
          <TD id=m_iscclock_8358>●</TD>
          <TD id=m_iscclock_8354>●</TD>
          <TD id=m_iscclock_8247>●</TD>
          <TD id=m_iscclock_10794>●</TD>
          <TD id=m_iscclock_8355>●</TD>
          <TD id=m_iscclock_8200>●</TD>
          <TD id=m_iscclock_10795>●</TD>
          <TD id=m_iscclock_8359>●</TD>
          <TD id=m_iscclock_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isrekey_8356>●</TD>
          <TD id=m_isrekey_8248>●</TD>
          <TD id=m_isrekey_8357>●</TD>
          <TD id=m_isrekey_8358>●</TD>
          <TD id=m_isrekey_8354>●</TD>
          <TD id=m_isrekey_8247>●</TD>
          <TD id=m_isrekey_10794>●</TD>
          <TD id=m_isrekey_8355>●</TD>
          <TD id=m_isrekey_8200>●</TD>
          <TD id=m_isrekey_10795>●</TD>
          <TD id=m_isrekey_8359>●</TD>
          <TD id=m_isrekey_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isnokeysys_8356>-</TD>
          <TD id=m_isnokeysys_8248>-</TD>
          <TD id=m_isnokeysys_8357>-</TD>
          <TD id=m_isnokeysys_8358>-</TD>
          <TD id=m_isnokeysys_8354>-</TD>
          <TD id=m_isnokeysys_8247>-</TD>
          <TD id=m_isnokeysys_10794>-</TD>
          <TD id=m_isnokeysys_8355>-</TD>
          <TD id=m_isnokeysys_8200>-</TD>
          <TD id=m_isnokeysys_10795>-</TD>
          <TD id=m_isnokeysys_8359>-</TD>
          <TD id=m_isnokeysys_8360>-</TD></TR>
        <TR id=base_8>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8356 scope=col><B href="/m8356/" 
            target=_blank>2011款速腾 1.4T 手动技术版 </A><I id=base_8_img_8356></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8248 scope=col><B href="/m8248/" 
            target=_blank>2011款速腾 1.4T 手动豪华版 </A><I id=base_8_img_8248></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8357 scope=col><B href="/m8357/" 
            target=_blank>2011款速腾 1.4T DSG技术版 </A><I id=base_8_img_8357></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8358 scope=col><B href="/m8358/" 
            target=_blank>2011款速腾 1.4T DSG豪华版 </A><I id=base_8_img_8358></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8354 scope=col><B href="/m8354/" 
            target=_blank>2011款速腾 1.6L 手动时尚版 </A><I id=base_8_img_8354></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8247 scope=col><B href="/m8247/" 
            target=_blank>2011款速腾 1.6L 手动舒适版 </A><I id=base_8_img_8247></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10794 scope=col><B href="/m10794/" 
            target=_blank>2011款速腾 1.6L 手动特别版 </A><I id=base_8_img_10794></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8355 scope=col><B href="/m8355/" 
            target=_blank>2011款速腾 1.6L 自动时尚版 </A><I id=base_8_img_8355></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8200 scope=col><B href="/m8200/" 
            target=_blank>2011款速腾 1.6L 自动舒适版 </A><I id=base_8_img_8200></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10795 scope=col><B href="/m10795/" 
            target=_blank>2011款速腾 1.6L 自动特别版 </A><I id=base_8_img_10795></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8359 scope=col><B href="/m8359/" 
            target=_blank>2011款速腾 1.8T 手动冠军版 </A><I id=base_8_img_8359></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8360 scope=col><B href="/m8360/" 
            target=_blank>2011款速腾 1.8T 自动冠军版 </A><I id=base_8_img_8360></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isabs_8356>●</TD>
          <TD id=m_isabs_8248>●</TD>
          <TD id=m_isabs_8357>●</TD>
          <TD id=m_isabs_8358>●</TD>
          <TD id=m_isabs_8354>●</TD>
          <TD id=m_isabs_8247>●</TD>
          <TD id=m_isabs_10794>●</TD>
          <TD id=m_isabs_8355>●</TD>
          <TD id=m_isabs_8200>●</TD>
          <TD id=m_isabs_10795>●</TD>
          <TD id=m_isabs_8359>●</TD>
          <TD id=m_isabs_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isesp_8356>●</TD>
          <TD id=m_isesp_8248>●</TD>
          <TD id=m_isesp_8357>●</TD>
          <TD id=m_isesp_8358>●</TD>
          <TD id=m_isesp_8354>●</TD>
          <TD id=m_isesp_8247>●</TD>
          <TD id=m_isesp_10794>●</TD>
          <TD id=m_isesp_8355>●</TD>
          <TD id=m_isesp_8200>●</TD>
          <TD id=m_isesp_10795>●</TD>
          <TD id=m_isesp_8359>●</TD>
          <TD id=m_isesp_8360>●</TD></TR>
        <TR class=disc>
          <TD id=m_isadsus_8356>-</TD>
          <TD id=m_isadsus_8248>-</TD>
          <TD id=m_isadsus_8357>-</TD>
          <TD id=m_isadsus_8358>-</TD>
          <TD id=m_isadsus_8354>-</TD>
          <TD id=m_isadsus_8247>-</TD>
          <TD id=m_isadsus_10794>- </TD>
          <TD id=m_isadsus_8355>-</TD>
          <TD id=m_isadsus_8200>-</TD>
          <TD id=m_isadsus_10795>- </TD>
          <TD id=m_isadsus_8359>-</TD>
          <TD id=m_isadsus_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_istpmonitor_8356>-</TD>
          <TD id=m_istpmonitor_8248>-</TD>
          <TD id=m_istpmonitor_8357>-</TD>
          <TD id=m_istpmonitor_8358>-</TD>
          <TD id=m_istpmonitor_8354>-</TD>
          <TD id=m_istpmonitor_8247>-</TD>
          <TD id=m_istpmonitor_10794>-</TD>
          <TD id=m_istpmonitor_8355>-</TD>
          <TD id=m_istpmonitor_8200>-</TD>
          <TD id=m_istpmonitor_10795>-</TD>
          <TD id=m_istpmonitor_8359>-</TD>
          <TD id=m_istpmonitor_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_istpruning_8356>-</TD>
          <TD id=m_istpruning_8248>-</TD>
          <TD id=m_istpruning_8357>-</TD>
          <TD id=m_istpruning_8358>-</TD>
          <TD id=m_istpruning_8354>-</TD>
          <TD id=m_istpruning_8247>-</TD>
          <TD id=m_istpruning_10794>-</TD>
          <TD id=m_istpruning_8355>-</TD>
          <TD id=m_istpruning_8200>-</TD>
          <TD id=m_istpruning_10795>-</TD>
          <TD id=m_istpruning_8359>-</TD>
          <TD id=m_istpruning_8360>-</TD></TR>
        <TR class=disc>
          <TD id=m_isfsteering_8356>●</TD>
          <TD id=m_isfsteering_8248>●</TD>
          <TD id=m_isfsteering_8357>●</TD>
          <TD id=m_isfsteering_8358>●</TD>
          <TD id=m_isfsteering_8354>●</TD>
          <TD id=m_isfsteering_8247>●</TD>
          <TD id=m_isfsteering_10794>●</TD>
          <TD id=m_isfsteering_8355>●</TD>
          <TD id=m_isfsteering_8200>●</TD>
          <TD id=m_isfsteering_10795>●</TD>
          <TD id=m_isfsteering_8359>●</TD>
          <TD id=m_isfsteering_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_issteesys_8356>-</TD>
          <TD id=m_issteesys_8248>-</TD>
          <TD id=m_issteesys_8357>-</TD>
          <TD id=m_issteesys_8358>-</TD>
          <TD id=m_issteesys_8354>-</TD>
          <TD id=m_issteesys_8247>-</TD>
          <TD id=m_issteesys_10794>-</TD>
          <TD id=m_issteesys_8355>-</TD>
          <TD id=m_issteesys_8200>-</TD>
          <TD id=m_issteesys_10795>-</TD>
          <TD id=m_issteesys_8359>-</TD>
          <TD id=m_issteesys_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isuphillassist_8356>-</TD>
          <TD id=m_isuphillassist_8248>-</TD>
          <TD id=m_isuphillassist_8357>-</TD>
          <TD id=m_isuphillassist_8358>-</TD>
          <TD id=m_isuphillassist_8354>-</TD>
          <TD id=m_isuphillassist_8247>-</TD>
          <TD id=m_isuphillassist_10794>-</TD>
          <TD id=m_isuphillassist_8355>-</TD>
          <TD id=m_isuphillassist_8200>-</TD>
          <TD id=m_isuphillassist_10795>-</TD>
          <TD id=m_isuphillassist_8359>-</TD>
          <TD id=m_isuphillassist_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isandstitch_8356>-</TD>
          <TD id=m_isandstitch_8248>-</TD>
          <TD id=m_isandstitch_8357>-</TD>
          <TD id=m_isandstitch_8358>-</TD>
          <TD id=m_isandstitch_8354>-</TD>
          <TD id=m_isandstitch_8247>-</TD>
          <TD id=m_isandstitch_10794>-</TD>
          <TD id=m_isandstitch_8355>-</TD>
          <TD id=m_isandstitch_8200>-</TD>
          <TD id=m_isandstitch_10795>-</TD>
          <TD id=m_isandstitch_8359>-</TD>
          <TD id=m_isandstitch_8360>-</TD></TR>
        <TR id=base_9>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8356 scope=col><B href="/m8356/" 
            target=_blank>2011款速腾 1.4T 手动技术版 </A><I id=base_9_img_8356></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8248 scope=col><B href="/m8248/" 
            target=_blank>2011款速腾 1.4T 手动豪华版 </A><I id=base_9_img_8248></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8357 scope=col><B href="/m8357/" 
            target=_blank>2011款速腾 1.4T DSG技术版 </A><I id=base_9_img_8357></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8358 scope=col><B href="/m8358/" 
            target=_blank>2011款速腾 1.4T DSG豪华版 </A><I id=base_9_img_8358></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8354 scope=col><B href="/m8354/" 
            target=_blank>2011款速腾 1.6L 手动时尚版 </A><I id=base_9_img_8354></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8247 scope=col><B href="/m8247/" 
            target=_blank>2011款速腾 1.6L 手动舒适版 </A><I id=base_9_img_8247></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10794 scope=col><B href="/m10794/" 
            target=_blank>2011款速腾 1.6L 手动特别版 </A><I id=base_9_img_10794></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8355 scope=col><B href="/m8355/" 
            target=_blank>2011款速腾 1.6L 自动时尚版 </A><I id=base_9_img_8355></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8200 scope=col><B href="/m8200/" 
            target=_blank>2011款速腾 1.6L 自动舒适版 </A><I id=base_9_img_8200></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10795 scope=col><B href="/m10795/" 
            target=_blank>2011款速腾 1.6L 自动特别版 </A><I id=base_9_img_10795></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8359 scope=col><B href="/m8359/" 
            target=_blank>2011款速腾 1.8T 手动冠军版 </A><I id=base_9_img_8359></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8360 scope=col><B href="/m8360/" 
            target=_blank>2011款速腾 1.8T 自动冠军版 </A><I id=base_9_img_8360></I> </TH></TR>
        <TR class=disc>
          <TD id=m_iswindow_8356>●</TD>
          <TD id=m_iswindow_8248>●</TD>
          <TD id=m_iswindow_8357>●</TD>
          <TD id=m_iswindow_8358>●</TD>
          <TD id=m_iswindow_8354>-</TD>
          <TD id=m_iswindow_8247>●</TD>
          <TD id=m_iswindow_10794>●</TD>
          <TD id=m_iswindow_8355>-</TD>
          <TD id=m_iswindow_8200>●</TD>
          <TD id=m_iswindow_10795>●</TD>
          <TD id=m_iswindow_8359>●</TD>
          <TD id=m_iswindow_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isarwindow_8356>-</TD>
          <TD id=m_isarwindow_8248>-</TD>
          <TD id=m_isarwindow_8357>-</TD>
          <TD id=m_isarwindow_8358>-</TD>
          <TD id=m_isarwindow_8354>-</TD>
          <TD id=m_isarwindow_8247>-</TD>
          <TD id=m_isarwindow_10794>-</TD>
          <TD id=m_isarwindow_8355>-</TD>
          <TD id=m_isarwindow_8200>-</TD>
          <TD id=m_isarwindow_10795>-</TD>
          <TD id=m_isarwindow_8359>-</TD>
          <TD id=m_isarwindow_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isspround_8356>-</TD>
          <TD id=m_isspround_8248>-</TD>
          <TD id=m_isspround_8357>-</TD>
          <TD id=m_isspround_8358>-</TD>
          <TD id=m_isspround_8354>-</TD>
          <TD id=m_isspround_8247>-</TD>
          <TD id=m_isspround_10794>-</TD>
          <TD id=m_isspround_8355>-</TD>
          <TD id=m_isspround_8200>-</TD>
          <TD id=m_isspround_10795>-</TD>
          <TD id=m_isspround_8359>-</TD>
          <TD id=m_isspround_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isaluhub_8356>●</TD>
          <TD id=m_isaluhub_8248>●</TD>
          <TD id=m_isaluhub_8357>●</TD>
          <TD id=m_isaluhub_8358>●</TD>
          <TD id=m_isaluhub_8354>●</TD>
          <TD id=m_isaluhub_8247>●</TD>
          <TD id=m_isaluhub_10794>●</TD>
          <TD id=m_isaluhub_8355>●</TD>
          <TD id=m_isaluhub_8200>●</TD>
          <TD id=m_isaluhub_10795>●</TD>
          <TD id=m_isaluhub_8359>●</TD>
          <TD id=m_isaluhub_8360>●</TD></TR>
        <TR id=base_10>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8356 scope=col><B href="/m8356/" 
            target=_blank>2011款速腾 1.4T 手动技术版 </A><I id=base_10_img_8356></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8248 scope=col><B href="/m8248/" 
            target=_blank>2011款速腾 1.4T 手动豪华版 </A><I id=base_10_img_8248></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8357 scope=col><B href="/m8357/" 
            target=_blank>2011款速腾 1.4T DSG技术版 </A><I id=base_10_img_8357></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8358 scope=col><B href="/m8358/" 
            target=_blank>2011款速腾 1.4T DSG豪华版 </A><I id=base_10_img_8358></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8354 scope=col><B href="/m8354/" 
            target=_blank>2011款速腾 1.6L 手动时尚版 </A><I id=base_10_img_8354></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8247 scope=col><B href="/m8247/" 
            target=_blank>2011款速腾 1.6L 手动舒适版 </A><I id=base_10_img_8247></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10794 scope=col><B href="/m10794/" 
            target=_blank>2011款速腾 1.6L 手动特别版 </A><I id=base_10_img_10794></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8355 scope=col><B href="/m8355/" 
            target=_blank>2011款速腾 1.6L 自动时尚版 </A><I id=base_10_img_8355></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8200 scope=col><B href="/m8200/" 
            target=_blank>2011款速腾 1.6L 自动舒适版 </A><I id=base_10_img_8200></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10795 scope=col><B href="/m10795/" 
            target=_blank>2011款速腾 1.6L 自动特别版 </A><I id=base_10_img_10795></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8359 scope=col><B href="/m8359/" 
            target=_blank>2011款速腾 1.8T 手动冠军版 </A><I id=base_10_img_8359></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8360 scope=col><B href="/m8360/" 
            target=_blank>2011款速腾 1.8T 自动冠军版 </A><I id=base_10_img_8360></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isleasw_8356>-</TD>
          <TD id=m_isleasw_8248>●</TD>
          <TD id=m_isleasw_8357>-</TD>
          <TD id=m_isleasw_8358>●</TD>
          <TD id=m_isleasw_8354>-</TD>
          <TD id=m_isleasw_8247>-</TD>
          <TD id=m_isleasw_10794>●</TD>
          <TD id=m_isleasw_8355>-</TD>
          <TD id=m_isleasw_8200>-</TD>
          <TD id=m_isleasw_10795>●</TD>
          <TD id=m_isleasw_8359>●</TD>
          <TD id=m_isleasw_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswud_8356>●</TD>
          <TD id=m_isswud_8248>●</TD>
          <TD id=m_isswud_8357>●</TD>
          <TD id=m_isswud_8358>●</TD>
          <TD id=m_isswud_8354>●</TD>
          <TD id=m_isswud_8247>●</TD>
          <TD id=m_isswud_10794>●</TD>
          <TD id=m_isswud_8355>●</TD>
          <TD id=m_isswud_8200>●</TD>
          <TD id=m_isswud_10795>●</TD>
          <TD id=m_isswud_8359>●</TD>
          <TD id=m_isswud_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswfb_8356>●</TD>
          <TD id=m_isswfb_8248>●</TD>
          <TD id=m_isswfb_8357>●</TD>
          <TD id=m_isswfb_8358>●</TD>
          <TD id=m_isswfb_8354>●</TD>
          <TD id=m_isswfb_8247>●</TD>
          <TD id=m_isswfb_10794>●</TD>
          <TD id=m_isswfb_8355>●</TD>
          <TD id=m_isswfb_8200>●</TD>
          <TD id=m_isswfb_10795>●</TD>
          <TD id=m_isswfb_8359>●</TD>
          <TD id=m_isswfb_8360>●</TD></TR>
        <TR class=disc>
          <TD id=m_ismultisw_8356>-</TD>
          <TD id=m_ismultisw_8248>-</TD>
          <TD id=m_ismultisw_8357>-</TD>
          <TD id=m_ismultisw_8358>-</TD>
          <TD id=m_ismultisw_8354>-</TD>
          <TD id=m_ismultisw_8247>-</TD>
          <TD id=m_ismultisw_10794>-</TD>
          <TD id=m_ismultisw_8355>-</TD>
          <TD id=m_ismultisw_8200>-</TD>
          <TD id=m_ismultisw_10795>-</TD>
          <TD id=m_ismultisw_8359>●</TD>
          <TD id=m_ismultisw_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswshift_8356>-</TD>
          <TD id=m_isswshift_8248>-</TD>
          <TD id=m_isswshift_8357>-</TD>
          <TD id=m_isswshift_8358>-</TD>
          <TD id=m_isswshift_8354>-</TD>
          <TD id=m_isswshift_8247>-</TD>
          <TD id=m_isswshift_10794>-</TD>
          <TD id=m_isswshift_8355>-</TD>
          <TD id=m_isswshift_8200>-</TD>
          <TD id=m_isswshift_10795>-</TD>
          <TD id=m_isswshift_8359>-</TD>
          <TD id=m_isswshift_8360>-</TD></TR>
        <TR class=disc>
          <TD id=m_isascd_8356>●</TD>
          <TD id=m_isascd_8248>●</TD>
          <TD id=m_isascd_8357>●</TD>
          <TD id=m_isascd_8358>●</TD>
          <TD id=m_isascd_8354>-</TD>
          <TD id=m_isascd_8247>-</TD>
          <TD id=m_isascd_10794>●</TD>
          <TD id=m_isascd_8355>-</TD>
          <TD id=m_isascd_8200>-</TD>
          <TD id=m_isascd_10795>●</TD>
          <TD id=m_isascd_8359>●</TD>
          <TD id=m_isascd_8360>●</TD></TR>
        <TR class=disc>
          <TD id=m_isassibc_8356>●</TD>
          <TD id=m_isassibc_8248>●</TD>
          <TD id=m_isassibc_8357>●</TD>
          <TD id=m_isassibc_8358>●</TD>
          <TD id=m_isassibc_8354>-</TD>
          <TD id=m_isassibc_8247>●</TD>
          <TD id=m_isassibc_10794>●</TD>
          <TD id=m_isassibc_8355>-</TD>
          <TD id=m_isassibc_8200>●</TD>
          <TD id=m_isassibc_10795>●</TD>
          <TD id=m_isassibc_8359>●</TD>
          <TD id=m_isassibc_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isparkvideo_8356>-</TD>
          <TD id=m_isparkvideo_8248>-</TD>
          <TD id=m_isparkvideo_8357>-</TD>
          <TD id=m_isparkvideo_8358>-</TD>
          <TD id=m_isparkvideo_8354>-</TD>
          <TD id=m_isparkvideo_8247>-</TD>
          <TD id=m_isparkvideo_10794>-</TD>
          <TD id=m_isparkvideo_8355>-</TD>
          <TD id=m_isparkvideo_8200>-</TD>
          <TD id=m_isparkvideo_10795>-</TD>
          <TD id=m_isparkvideo_8359>-</TD>
          <TD id=m_isparkvideo_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ispark_8356>-</TD>
          <TD id=m_ispark_8248>-</TD>
          <TD id=m_ispark_8357>-</TD>
          <TD id=m_ispark_8358>-</TD>
          <TD id=m_ispark_8354>-</TD>
          <TD id=m_ispark_8247>-</TD>
          <TD id=m_ispark_10794>-</TD>
          <TD id=m_ispark_8355>-</TD>
          <TD id=m_ispark_8200>-</TD>
          <TD id=m_ispark_10795>-</TD>
          <TD id=m_ispark_8359>-</TD>
          <TD id=m_ispark_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ishud_8356>-</TD>
          <TD id=m_ishud_8248>-</TD>
          <TD id=m_ishud_8357>-</TD>
          <TD id=m_ishud_8358>-</TD>
          <TD id=m_ishud_8354>-</TD>
          <TD id=m_ishud_8247>-</TD>
          <TD id=m_ishud_10794>-</TD>
          <TD id=m_ishud_8355>-</TD>
          <TD id=m_ishud_8200>-</TD>
          <TD id=m_ishud_10795>-</TD>
          <TD id=m_ishud_8359>-</TD>
          <TD id=m_ishud_8360>-</TD></TR>
        <TR id=base_11>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8356 scope=col><B href="/m8356/" 
            target=_blank>2011款速腾 1.4T 手动技术版 </A><I id=base_11_img_8356></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8248 scope=col><B href="/m8248/" 
            target=_blank>2011款速腾 1.4T 手动豪华版 </A><I id=base_11_img_8248></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8357 scope=col><B href="/m8357/" 
            target=_blank>2011款速腾 1.4T DSG技术版 </A><I id=base_11_img_8357></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8358 scope=col><B href="/m8358/" 
            target=_blank>2011款速腾 1.4T DSG豪华版 </A><I id=base_11_img_8358></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8354 scope=col><B href="/m8354/" 
            target=_blank>2011款速腾 1.6L 手动时尚版 </A><I id=base_11_img_8354></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8247 scope=col><B href="/m8247/" 
            target=_blank>2011款速腾 1.6L 手动舒适版 </A><I id=base_11_img_8247></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10794 scope=col><B href="/m10794/" 
            target=_blank>2011款速腾 1.6L 手动特别版 </A><I id=base_11_img_10794></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8355 scope=col><B href="/m8355/" 
            target=_blank>2011款速腾 1.6L 自动时尚版 </A><I id=base_11_img_8355></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8200 scope=col><B href="/m8200/" 
            target=_blank>2011款速腾 1.6L 自动舒适版 </A><I id=base_11_img_8200></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10795 scope=col><B href="/m10795/" 
            target=_blank>2011款速腾 1.6L 自动特别版 </A><I id=base_11_img_10795></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8359 scope=col><B href="/m8359/" 
            target=_blank>2011款速腾 1.8T 手动冠军版 </A><I id=base_11_img_8359></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8360 scope=col><B href="/m8360/" 
            target=_blank>2011款速腾 1.8T 自动冠军版 </A><I id=base_11_img_8360></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isleaseat_8356>-</TD>
          <TD id=m_isleaseat_8248>●</TD>
          <TD id=m_isleaseat_8357>-</TD>
          <TD id=m_isleaseat_8358>●</TD>
          <TD id=m_isleaseat_8354>-</TD>
          <TD id=m_isleaseat_8247>○</TD>
          <TD id=m_isleaseat_10794>●</TD>
          <TD id=m_isleaseat_8355>-</TD>
          <TD id=m_isleaseat_8200>○</TD>
          <TD id=m_isleaseat_10795>●</TD>
          <TD id=m_isleaseat_8359>●</TD>
          <TD id=m_isleaseat_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatadj_8356>●</TD>
          <TD id=m_isseatadj_8248>●</TD>
          <TD id=m_isseatadj_8357>●</TD>
          <TD id=m_isseatadj_8358>●</TD>
          <TD id=m_isseatadj_8354>●</TD>
          <TD id=m_isseatadj_8247>●</TD>
          <TD id=m_isseatadj_10794>●</TD>
          <TD id=m_isseatadj_8355>●</TD>
          <TD id=m_isseatadj_8200>●</TD>
          <TD id=m_isseatadj_10795>●</TD>
          <TD id=m_isseatadj_8359>●</TD>
          <TD id=m_isseatadj_8360>●</TD></TR>
        <TR class=disc>
          <TD id=m_iswaistadj_8356>●</TD>
          <TD id=m_iswaistadj_8248>●</TD>
          <TD id=m_iswaistadj_8357>●</TD>
          <TD id=m_iswaistadj_8358>●</TD>
          <TD id=m_iswaistadj_8354>-</TD>
          <TD id=m_iswaistadj_8247>-</TD>
          <TD id=m_iswaistadj_10794>●</TD>
          <TD id=m_iswaistadj_8355>-</TD>
          <TD id=m_iswaistadj_8200>-</TD>
          <TD id=m_iswaistadj_10795>●</TD>
          <TD id=m_iswaistadj_8359>●</TD>
          <TD id=m_iswaistadj_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isfseatadj_8356>-</TD>
          <TD id=m_isfseatadj_8248>-</TD>
          <TD id=m_isfseatadj_8357>-</TD>
          <TD id=m_isfseatadj_8358>-</TD>
          <TD id=m_isfseatadj_8354>-</TD>
          <TD id=m_isfseatadj_8247>-</TD>
          <TD id=m_isfseatadj_10794>-</TD>
          <TD id=m_isfseatadj_8355>-</TD>
          <TD id=m_isfseatadj_8200>-</TD>
          <TD id=m_isfseatadj_10795>-</TD>
          <TD id=m_isfseatadj_8359>-</TD>
          <TD id=m_isfseatadj_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_iseseatmem_8356>-</TD>
          <TD id=m_iseseatmem_8248>-</TD>
          <TD id=m_iseseatmem_8357>-</TD>
          <TD id=m_iseseatmem_8358>-</TD>
          <TD id=m_iseseatmem_8354>-</TD>
          <TD id=m_iseseatmem_8247>-</TD>
          <TD id=m_iseseatmem_10794>-</TD>
          <TD id=m_iseseatmem_8355>-</TD>
          <TD id=m_iseseatmem_8200>-</TD>
          <TD id=m_iseseatmem_10795>-</TD>
          <TD id=m_iseseatmem_8359>-</TD>
          <TD id=m_iseseatmem_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isseathot_8356>-</TD>
          <TD id=m_isseathot_8248>-</TD>
          <TD id=m_isseathot_8357>-</TD>
          <TD id=m_isseathot_8358>-</TD>
          <TD id=m_isseathot_8354>-</TD>
          <TD id=m_isseathot_8247>-</TD>
          <TD id=m_isseathot_10794>-</TD>
          <TD id=m_isseathot_8355>-</TD>
          <TD id=m_isseathot_8200>-</TD>
          <TD id=m_isseathot_10795>-</TD>
          <TD id=m_isseathot_8359>-</TD>
          <TD id=m_isseathot_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatknead_8356>-</TD>
          <TD id=m_isseatknead_8248>-</TD>
          <TD id=m_isseatknead_8357>-</TD>
          <TD id=m_isseatknead_8358>-</TD>
          <TD id=m_isseatknead_8354>-</TD>
          <TD id=m_isseatknead_8247>-</TD>
          <TD id=m_isseatknead_10794>-</TD>
          <TD id=m_isseatknead_8355>-</TD>
          <TD id=m_isseatknead_8200>-</TD>
          <TD id=m_isseatknead_10795>-</TD>
          <TD id=m_isseatknead_8359>-</TD>
          <TD id=m_isseatknead_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isbseatlay_8356>-</TD>
          <TD id=m_isbseatlay_8248>-</TD>
          <TD id=m_isbseatlay_8357>-</TD>
          <TD id=m_isbseatlay_8358>-</TD>
          <TD id=m_isbseatlay_8354>-</TD>
          <TD id=m_isbseatlay_8247>-</TD>
          <TD id=m_isbseatlay_10794>-</TD>
          <TD id=m_isbseatlay_8355>-</TD>
          <TD id=m_isbseatlay_8200>-</TD>
          <TD id=m_isbseatlay_10795>-</TD>
          <TD id=m_isbseatlay_8359>-</TD>
          <TD id=m_isbseatlay_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isbseatplay_8356>●</TD>
          <TD id=m_isbseatplay_8248>●</TD>
          <TD id=m_isbseatplay_8357>●</TD>
          <TD id=m_isbseatplay_8358>●</TD>
          <TD id=m_isbseatplay_8354>●</TD>
          <TD id=m_isbseatplay_8247>●</TD>
          <TD id=m_isbseatplay_10794>●</TD>
          <TD id=m_isbseatplay_8355>●</TD>
          <TD id=m_isbseatplay_8200>●</TD>
          <TD id=m_isbseatplay_10795>●</TD>
          <TD id=m_isbseatplay_8359>●</TD>
          <TD id=m_isbseatplay_8360>●</TD></TR>
        <TR id=base_12>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8356 scope=col><B href="/m8356/" 
            target=_blank>2011款速腾 1.4T 手动技术版 </A><I id=base_12_img_8356></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8248 scope=col><B href="/m8248/" 
            target=_blank>2011款速腾 1.4T 手动豪华版 </A><I id=base_12_img_8248></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8357 scope=col><B href="/m8357/" 
            target=_blank>2011款速腾 1.4T DSG技术版 </A><I id=base_12_img_8357></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8358 scope=col><B href="/m8358/" 
            target=_blank>2011款速腾 1.4T DSG豪华版 </A><I id=base_12_img_8358></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8354 scope=col><B href="/m8354/" 
            target=_blank>2011款速腾 1.6L 手动时尚版 </A><I id=base_12_img_8354></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8247 scope=col><B href="/m8247/" 
            target=_blank>2011款速腾 1.6L 手动舒适版 </A><I id=base_12_img_8247></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10794 scope=col><B href="/m10794/" 
            target=_blank>2011款速腾 1.6L 手动特别版 </A><I id=base_12_img_10794></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8355 scope=col><B href="/m8355/" 
            target=_blank>2011款速腾 1.6L 自动时尚版 </A><I id=base_12_img_8355></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8200 scope=col><B href="/m8200/" 
            target=_blank>2011款速腾 1.6L 自动舒适版 </A><I id=base_12_img_8200></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10795 scope=col><B href="/m10795/" 
            target=_blank>2011款速腾 1.6L 自动特别版 </A><I id=base_12_img_10795></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8359 scope=col><B href="/m8359/" 
            target=_blank>2011款速腾 1.8T 手动冠军版 </A><I id=base_12_img_8359></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8360 scope=col><B href="/m8360/" 
            target=_blank>2011款速腾 1.8T 自动冠军版 </A><I id=base_12_img_8360></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isgps_8356>-</TD>
          <TD id=m_isgps_8248>-</TD>
          <TD id=m_isgps_8357>-</TD>
          <TD id=m_isgps_8358>-</TD>
          <TD id=m_isgps_8354>-</TD>
          <TD id=m_isgps_8247>-</TD>
          <TD id=m_isgps_10794>-</TD>
          <TD id=m_isgps_8355>-</TD>
          <TD id=m_isgps_8200>-</TD>
          <TD id=m_isgps_10795>-</TD>
          <TD id=m_isgps_8359>-</TD>
          <TD id=m_isgps_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isbluetooth_8356>-</TD>
          <TD id=m_isbluetooth_8248>-</TD>
          <TD id=m_isbluetooth_8357>-</TD>
          <TD id=m_isbluetooth_8358>-</TD>
          <TD id=m_isbluetooth_8354>-</TD>
          <TD id=m_isbluetooth_8247>-</TD>
          <TD id=m_isbluetooth_10794>-</TD>
          <TD id=m_isbluetooth_8355>-</TD>
          <TD id=m_isbluetooth_8200>-</TD>
          <TD id=m_isbluetooth_10795>-</TD>
          <TD id=m_isbluetooth_8359>-</TD>
          <TD id=m_isbluetooth_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_istv_8356>-</TD>
          <TD id=m_istv_8248>-</TD>
          <TD id=m_istv_8357>-</TD>
          <TD id=m_istv_8358>-</TD>
          <TD id=m_istv_8354>-</TD>
          <TD id=m_istv_8247>-</TD>
          <TD id=m_istv_10794>-</TD>
          <TD id=m_istv_8355>-</TD>
          <TD id=m_istv_8200>-</TD>
          <TD id=m_istv_10795>-</TD>
          <TD id=m_istv_8359>-</TD>
          <TD id=m_istv_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_iscclcd_8356>-</TD>
          <TD id=m_iscclcd_8248>-</TD>
          <TD id=m_iscclcd_8357>-</TD>
          <TD id=m_iscclcd_8358>-</TD>
          <TD id=m_iscclcd_8354>-</TD>
          <TD id=m_iscclcd_8247>-</TD>
          <TD id=m_iscclcd_10794>-</TD>
          <TD id=m_iscclcd_8355>-</TD>
          <TD id=m_iscclcd_8200>-</TD>
          <TD id=m_iscclcd_10795>-</TD>
          <TD id=m_iscclcd_8359>-</TD>
          <TD id=m_iscclcd_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isblcd_8356>-</TD>
          <TD id=m_isblcd_8248>-</TD>
          <TD id=m_isblcd_8357>-</TD>
          <TD id=m_isblcd_8358>-</TD>
          <TD id=m_isblcd_8354>-</TD>
          <TD id=m_isblcd_8247>-</TD>
          <TD id=m_isblcd_10794>-</TD>
          <TD id=m_isblcd_8355>-</TD>
          <TD id=m_isblcd_8200>-</TD>
          <TD id=m_isblcd_10795>-</TD>
          <TD id=m_isblcd_8359>-</TD>
          <TD id=m_isblcd_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ismp3_8356>●</TD>
          <TD id=m_ismp3_8248>●</TD>
          <TD id=m_ismp3_8357>●</TD>
          <TD id=m_ismp3_8358>●</TD>
          <TD id=m_ismp3_8354>●</TD>
          <TD id=m_ismp3_8247>●</TD>
          <TD id=m_ismp3_10794>●</TD>
          <TD id=m_ismp3_8355>●</TD>
          <TD id=m_ismp3_8200>●</TD>
          <TD id=m_ismp3_10795>●</TD>
          <TD id=m_ismp3_8359>●</TD>
          <TD id=m_ismp3_8360>●</TD></TR>
        <TR class=disc>
          <TD id=m_iscd_8356>●</TD>
          <TD id=m_iscd_8248>●</TD>
          <TD id=m_iscd_8357>●</TD>
          <TD id=m_iscd_8358>●</TD>
          <TD id=m_iscd_8354>●</TD>
          <TD id=m_iscd_8247>●</TD>
          <TD id=m_iscd_10794>●</TD>
          <TD id=m_iscd_8355>●</TD>
          <TD id=m_iscd_8200>●</TD>
          <TD id=m_iscd_10795>●</TD>
          <TD id=m_iscd_8359>●</TD>
          <TD id=m_iscd_8360>●</TD></TR>
        <TR class=disc>
          <TD id=m_iscd_8356>1 </TD>
          <TD id=m_iscd_8248>1 </TD>
          <TD id=m_iscd_8357>1 </TD>
          <TD id=m_iscd_8358>1 </TD>
          <TD id=m_iscd_8354>1 </TD>
          <TD id=m_iscd_8247>1 </TD>
          <TD id=m_iscd_10794>1 </TD>
          <TD id=m_iscd_8355>1 </TD>
          <TD id=m_iscd_8200>1 </TD>
          <TD id=m_iscd_10795>1 </TD>
          <TD id=m_iscd_8359>6 </TD>
          <TD id=m_iscd_8360>6 </TD></TR>
        <TR class=disc>
          <TD id=8356>-</TD>
          <TD id=8248>-</TD>
          <TD id=8357>-</TD>
          <TD id=8358>-</TD>
          <TD id=8354>-</TD>
          <TD id=8247>-</TD>
          <TD id=10794>-</TD>
          <TD id=8355>-</TD>
          <TD id=8200>-</TD>
          <TD id=10795>-</TD>
          <TD id=8359>-</TD>
          <TD id=8360>-</TD></TR>
        <TR class=disc>
          <TD id=8356>- </TD>
          <TD id=8248>- </TD>
          <TD id=8357>- </TD>
          <TD id=8358>- </TD>
          <TD id=8354>- </TD>
          <TD id=8247>- </TD>
          <TD id=10794>- </TD>
          <TD id=8355>- </TD>
          <TD id=8200>- </TD>
          <TD id=10795>- </TD>
          <TD id=8359>- </TD>
          <TD id=8360>- </TD></TR>
        <TR class=hidd>
          <TD id=m_is2audio_8356>-</TD>
          <TD id=m_is2audio_8248>-</TD>
          <TD id=m_is2audio_8357>-</TD>
          <TD id=m_is2audio_8358>-</TD>
          <TD id=m_is2audio_8354>-</TD>
          <TD id=m_is2audio_8247>-</TD>
          <TD id=m_is2audio_10794>-</TD>
          <TD id=m_is2audio_8355>-</TD>
          <TD id=m_is2audio_8200>-</TD>
          <TD id=m_is2audio_10795>-</TD>
          <TD id=m_is2audio_8359>-</TD>
          <TD id=m_is2audio_8360>-</TD></TR>
        <TR class=disc>
          <TD id=m_is4audio_8356>-</TD>
          <TD id=m_is4audio_8248>-</TD>
          <TD id=m_is4audio_8357>-</TD>
          <TD id=m_is4audio_8358>-</TD>
          <TD id=m_is4audio_8354>●</TD>
          <TD id=m_is4audio_8247>●</TD>
          <TD id=m_is4audio_10794>●</TD>
          <TD id=m_is4audio_8355>●</TD>
          <TD id=m_is4audio_8200>●</TD>
          <TD id=m_is4audio_10795>●</TD>
          <TD id=m_is4audio_8359>-</TD>
          <TD id=m_is4audio_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_is6audio_8356>-</TD>
          <TD id=m_is6audio_8248>-</TD>
          <TD id=m_is6audio_8357>-</TD>
          <TD id=m_is6audio_8358>-</TD>
          <TD id=m_is6audio_8354>-</TD>
          <TD id=m_is6audio_8247>-</TD>
          <TD id=m_is6audio_10794>-</TD>
          <TD id=m_is6audio_8355>-</TD>
          <TD id=m_is6audio_8200>-</TD>
          <TD id=m_is6audio_10795>-</TD>
          <TD id=m_is6audio_8359>-</TD>
          <TD id=m_is6audio_8360>-</TD></TR>
        <TR class=disc>
          <TD id=m_is8audio_8356>●</TD>
          <TD id=m_is8audio_8248>●</TD>
          <TD id=m_is8audio_8357>●</TD>
          <TD id=m_is8audio_8358>●</TD>
          <TD id=m_is8audio_8354>-</TD>
          <TD id=m_is8audio_8247>-</TD>
          <TD id=m_is8audio_10794>-</TD>
          <TD id=m_is8audio_8355>-</TD>
          <TD id=m_is8audio_8200>-</TD>
          <TD id=m_is8audio_10795>-</TD>
          <TD id=m_is8audio_8359>●</TD>
          <TD id=m_is8audio_8360>●</TD></TR>
        <TR id=base_13>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8356 scope=col><B href="/m8356/" 
            target=_blank>2011款速腾 1.4T 手动技术版 </A><I id=base_13_img_8356></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8248 scope=col><B href="/m8248/" 
            target=_blank>2011款速腾 1.4T 手动豪华版 </A><I id=base_13_img_8248></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8357 scope=col><B href="/m8357/" 
            target=_blank>2011款速腾 1.4T DSG技术版 </A><I id=base_13_img_8357></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8358 scope=col><B href="/m8358/" 
            target=_blank>2011款速腾 1.4T DSG豪华版 </A><I id=base_13_img_8358></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8354 scope=col><B href="/m8354/" 
            target=_blank>2011款速腾 1.6L 手动时尚版 </A><I id=base_13_img_8354></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8247 scope=col><B href="/m8247/" 
            target=_blank>2011款速腾 1.6L 手动舒适版 </A><I id=base_13_img_8247></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10794 scope=col><B href="/m10794/" 
            target=_blank>2011款速腾 1.6L 手动特别版 </A><I id=base_13_img_10794></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8355 scope=col><B href="/m8355/" 
            target=_blank>2011款速腾 1.6L 自动时尚版 </A><I id=base_13_img_8355></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8200 scope=col><B href="/m8200/" 
            target=_blank>2011款速腾 1.6L 自动舒适版 </A><I id=base_13_img_8200></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10795 scope=col><B href="/m10795/" 
            target=_blank>2011款速腾 1.6L 自动特别版 </A><I id=base_13_img_10795></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8359 scope=col><B href="/m8359/" 
            target=_blank>2011款速腾 1.8T 手动冠军版 </A><I id=base_13_img_8359></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8360 scope=col><B href="/m8360/" 
            target=_blank>2011款速腾 1.8T 自动冠军版 </A><I id=base_13_img_8360></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isxelamp_8356>-</TD>
          <TD id=m_isxelamp_8248>-</TD>
          <TD id=m_isxelamp_8357>-</TD>
          <TD id=m_isxelamp_8358>-</TD>
          <TD id=m_isxelamp_8354>-</TD>
          <TD id=m_isxelamp_8247>-</TD>
          <TD id=m_isxelamp_10794>●</TD>
          <TD id=m_isxelamp_8355>-</TD>
          <TD id=m_isxelamp_8200>-</TD>
          <TD id=m_isxelamp_10795>●</TD>
          <TD id=m_isxelamp_8359>●</TD>
          <TD id=m_isxelamp_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isautohlamp_8356>-</TD>
          <TD id=m_isautohlamp_8248>-</TD>
          <TD id=m_isautohlamp_8357>-</TD>
          <TD id=m_isautohlamp_8358>-</TD>
          <TD id=m_isautohlamp_8354>-</TD>
          <TD id=m_isautohlamp_8247>-</TD>
          <TD id=m_isautohlamp_10794>-</TD>
          <TD id=m_isautohlamp_8355>-</TD>
          <TD id=m_isautohlamp_8200>-</TD>
          <TD id=m_isautohlamp_10795>-</TD>
          <TD id=m_isautohlamp_8359>-</TD>
          <TD id=m_isautohlamp_8360>-</TD></TR>
        <TR class=disc>
          <TD id=m_isturnhlamp_8356>-</TD>
          <TD id=m_isturnhlamp_8248>-</TD>
          <TD id=m_isturnhlamp_8357>-</TD>
          <TD id=m_isturnhlamp_8358>-</TD>
          <TD id=m_isturnhlamp_8354>-</TD>
          <TD id=m_isturnhlamp_8247>-</TD>
          <TD id=m_isturnhlamp_10794>●</TD>
          <TD id=m_isturnhlamp_8355>-</TD>
          <TD id=m_isturnhlamp_8200>-</TD>
          <TD id=m_isturnhlamp_10795>●</TD>
          <TD id=m_isturnhlamp_8359>●</TD>
          <TD id=m_isturnhlamp_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ishfoglamp_8356>●</TD>
          <TD id=m_ishfoglamp_8248>●</TD>
          <TD id=m_ishfoglamp_8357>●</TD>
          <TD id=m_ishfoglamp_8358>●</TD>
          <TD id=m_ishfoglamp_8354>●</TD>
          <TD id=m_ishfoglamp_8247>●</TD>
          <TD id=m_ishfoglamp_10794>●</TD>
          <TD id=m_ishfoglamp_8355>●</TD>
          <TD id=m_ishfoglamp_8200>●</TD>
          <TD id=m_ishfoglamp_10795>●</TD>
          <TD id=m_ishfoglamp_8359>●</TD>
          <TD id=m_ishfoglamp_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbfoglamp_8356>●</TD>
          <TD id=m_isbfoglamp_8248>●</TD>
          <TD id=m_isbfoglamp_8357>●</TD>
          <TD id=m_isbfoglamp_8358>●</TD>
          <TD id=m_isbfoglamp_8354>●</TD>
          <TD id=m_isbfoglamp_8247>●</TD>
          <TD id=m_isbfoglamp_10794>●</TD>
          <TD id=m_isbfoglamp_8355>●</TD>
          <TD id=m_isbfoglamp_8200>●</TD>
          <TD id=m_isbfoglamp_10795>●</TD>
          <TD id=m_isbfoglamp_8359>●</TD>
          <TD id=m_isbfoglamp_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_islampheiadj_8356>-</TD>
          <TD id=m_islampheiadj_8248>-</TD>
          <TD id=m_islampheiadj_8357>-</TD>
          <TD id=m_islampheiadj_8358>-</TD>
          <TD id=m_islampheiadj_8354>-</TD>
          <TD id=m_islampheiadj_8247>-</TD>
          <TD id=m_islampheiadj_10794>-</TD>
          <TD id=m_islampheiadj_8355>-</TD>
          <TD id=m_islampheiadj_8200>-</TD>
          <TD id=m_islampheiadj_10795>-</TD>
          <TD id=m_islampheiadj_8359>-</TD>
          <TD id=m_islampheiadj_8360>-</TD></TR>
        <TR class=disc>
          <TD id=m_islampclset_8356>-</TD>
          <TD id=m_islampclset_8248>-</TD>
          <TD id=m_islampclset_8357>-</TD>
          <TD id=m_islampclset_8358>-</TD>
          <TD id=m_islampclset_8354>-</TD>
          <TD id=m_islampclset_8247>-</TD>
          <TD id=m_islampclset_10794>●</TD>
          <TD id=m_islampclset_8355>-</TD>
          <TD id=m_islampclset_8200>-</TD>
          <TD id=m_islampclset_10795>●</TD>
          <TD id=m_islampclset_8359>●</TD>
          <TD id=m_islampclset_8360>●</TD></TR>
        <TR id=base_14>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8356 scope=col><B href="/m8356/" 
            target=_blank>2011款速腾 1.4T 手动技术版 </A><I id=base_14_img_8356></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8248 scope=col><B href="/m8248/" 
            target=_blank>2011款速腾 1.4T 手动豪华版 </A><I id=base_14_img_8248></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8357 scope=col><B href="/m8357/" 
            target=_blank>2011款速腾 1.4T DSG技术版 </A><I id=base_14_img_8357></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8358 scope=col><B href="/m8358/" 
            target=_blank>2011款速腾 1.4T DSG豪华版 </A><I id=base_14_img_8358></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8354 scope=col><B href="/m8354/" 
            target=_blank>2011款速腾 1.6L 手动时尚版 </A><I id=base_14_img_8354></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8247 scope=col><B href="/m8247/" 
            target=_blank>2011款速腾 1.6L 手动舒适版 </A><I id=base_14_img_8247></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10794 scope=col><B href="/m10794/" 
            target=_blank>2011款速腾 1.6L 手动特别版 </A><I id=base_14_img_10794></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8355 scope=col><B href="/m8355/" 
            target=_blank>2011款速腾 1.6L 自动时尚版 </A><I id=base_14_img_8355></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8200 scope=col><B href="/m8200/" 
            target=_blank>2011款速腾 1.6L 自动舒适版 </A><I id=base_14_img_8200></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10795 scope=col><B href="/m10795/" 
            target=_blank>2011款速腾 1.6L 自动特别版 </A><I id=base_14_img_10795></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8359 scope=col><B href="/m8359/" 
            target=_blank>2011款速腾 1.8T 手动冠军版 </A><I id=base_14_img_8359></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8360 scope=col><B href="/m8360/" 
            target=_blank>2011款速腾 1.8T 自动冠军版 </A><I id=base_14_img_8360></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isfewindow_8356>●</TD>
          <TD id=m_isfewindow_8248>●</TD>
          <TD id=m_isfewindow_8357>●</TD>
          <TD id=m_isfewindow_8358>●</TD>
          <TD id=m_isfewindow_8354>●</TD>
          <TD id=m_isfewindow_8247>●</TD>
          <TD id=m_isfewindow_10794>●</TD>
          <TD id=m_isfewindow_8355>●</TD>
          <TD id=m_isfewindow_8200>●</TD>
          <TD id=m_isfewindow_10795>●</TD>
          <TD id=m_isfewindow_8359>●</TD>
          <TD id=m_isfewindow_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbewindow_8356>●</TD>
          <TD id=m_isbewindow_8248>●</TD>
          <TD id=m_isbewindow_8357>●</TD>
          <TD id=m_isbewindow_8358>●</TD>
          <TD id=m_isbewindow_8354>●</TD>
          <TD id=m_isbewindow_8247>●</TD>
          <TD id=m_isbewindow_10794>●</TD>
          <TD id=m_isbewindow_8355>●</TD>
          <TD id=m_isbewindow_8200>●</TD>
          <TD id=m_isbewindow_10795>●</TD>
          <TD id=m_isbewindow_8359>●</TD>
          <TD id=m_isbewindow_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isgnhand_8356>●</TD>
          <TD id=m_isgnhand_8248>●</TD>
          <TD id=m_isgnhand_8357>●</TD>
          <TD id=m_isgnhand_8358>●</TD>
          <TD id=m_isgnhand_8354>●</TD>
          <TD id=m_isgnhand_8247>●</TD>
          <TD id=m_isgnhand_10794>●</TD>
          <TD id=m_isgnhand_8355>●</TD>
          <TD id=m_isgnhand_8200>●</TD>
          <TD id=m_isgnhand_10795>●</TD>
          <TD id=m_isgnhand_8359>●</TD>
          <TD id=m_isgnhand_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ispreventionuv_8356>●</TD>
          <TD id=m_ispreventionuv_8248>●</TD>
          <TD id=m_ispreventionuv_8357>●</TD>
          <TD id=m_ispreventionuv_8358>●</TD>
          <TD id=m_ispreventionuv_8354>●</TD>
          <TD id=m_ispreventionuv_8247>●</TD>
          <TD id=m_ispreventionuv_10794>●</TD>
          <TD id=m_ispreventionuv_8355>●</TD>
          <TD id=m_ispreventionuv_8200>●</TD>
          <TD id=m_ispreventionuv_10795>●</TD>
          <TD id=m_ispreventionuv_8359>●</TD>
          <TD id=m_ispreventionuv_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isermirror_8356>●</TD>
          <TD id=m_isermirror_8248>●</TD>
          <TD id=m_isermirror_8357>●</TD>
          <TD id=m_isermirror_8358>●</TD>
          <TD id=m_isermirror_8354>●</TD>
          <TD id=m_isermirror_8247>●</TD>
          <TD id=m_isermirror_10794>●</TD>
          <TD id=m_isermirror_8355>●</TD>
          <TD id=m_isermirror_8200>●</TD>
          <TD id=m_isermirror_10795>●</TD>
          <TD id=m_isermirror_8359>●</TD>
          <TD id=m_isermirror_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ishotrmirror_8356>●</TD>
          <TD id=m_ishotrmirror_8248>●</TD>
          <TD id=m_ishotrmirror_8357>●</TD>
          <TD id=m_ishotrmirror_8358>●</TD>
          <TD id=m_ishotrmirror_8354>●</TD>
          <TD id=m_ishotrmirror_8247>●</TD>
          <TD id=m_ishotrmirror_10794>●</TD>
          <TD id=m_ishotrmirror_8355>●</TD>
          <TD id=m_ishotrmirror_8200>●</TD>
          <TD id=m_ishotrmirror_10795>●</TD>
          <TD id=m_ishotrmirror_8359>●</TD>
          <TD id=m_ishotrmirror_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ismemorymirror_8356>-</TD>
          <TD id=m_ismemorymirror_8248>-</TD>
          <TD id=m_ismemorymirror_8357>-</TD>
          <TD id=m_ismemorymirror_8358>-</TD>
          <TD id=m_ismemorymirror_8354>-</TD>
          <TD id=m_ismemorymirror_8247>-</TD>
          <TD id=m_ismemorymirror_10794>-</TD>
          <TD id=m_ismemorymirror_8355>-</TD>
          <TD id=m_ismemorymirror_8200>-</TD>
          <TD id=m_ismemorymirror_10795>-</TD>
          <TD id=m_ismemorymirror_8359>-</TD>
          <TD id=m_ismemorymirror_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_iseprmirror_8356>-</TD>
          <TD id=m_iseprmirror_8248>-</TD>
          <TD id=m_iseprmirror_8357>-</TD>
          <TD id=m_iseprmirror_8358>-</TD>
          <TD id=m_iseprmirror_8354>-</TD>
          <TD id=m_iseprmirror_8247>-</TD>
          <TD id=m_iseprmirror_10794>-</TD>
          <TD id=m_iseprmirror_8355>-</TD>
          <TD id=m_iseprmirror_8200>-</TD>
          <TD id=m_iseprmirror_10795>-</TD>
          <TD id=m_iseprmirror_8359>-</TD>
          <TD id=m_iseprmirror_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isrmirrorge_8356>-</TD>
          <TD id=m_isrmirrorge_8248>-</TD>
          <TD id=m_isrmirrorge_8357>-</TD>
          <TD id=m_isrmirrorge_8358>-</TD>
          <TD id=m_isrmirrorge_8354>-</TD>
          <TD id=m_isrmirrorge_8247>-</TD>
          <TD id=m_isrmirrorge_10794>-</TD>
          <TD id=m_isrmirrorge_8355>-</TD>
          <TD id=m_isrmirrorge_8200>-</TD>
          <TD id=m_isrmirrorge_10795>-</TD>
          <TD id=m_isrmirrorge_8359>-</TD>
          <TD id=m_isrmirrorge_8360>-</TD></TR>
        <TR class=disc>
          <TD id=m_isbsvisor_8356>- </TD>
          <TD id=m_isbsvisor_8248>- </TD>
          <TD id=m_isbsvisor_8357>- </TD>
          <TD id=m_isbsvisor_8358>- </TD>
          <TD id=m_isbsvisor_8354>- </TD>
          <TD id=m_isbsvisor_8247>- </TD>
          <TD id=m_isbsvisor_10794>- </TD>
          <TD id=m_isbsvisor_8355>- </TD>
          <TD id=m_isbsvisor_8200>- </TD>
          <TD id=m_isbsvisor_10795>- </TD>
          <TD id=m_isbsvisor_8359>- </TD>
          <TD id=m_isbsvisor_8360>- </TD></TR><!--	



			<tr class="hidd" >



				



				


					


						<td id="m_ishbsvisor_8356">-</td>



					


						<td id="m_ishbsvisor_8248">-</td>



					


						<td id="m_ishbsvisor_8357">-</td>



					


						<td id="m_ishbsvisor_8358">-</td>



					


						<td id="m_ishbsvisor_8354">-</td>



					


						<td id="m_ishbsvisor_8247">-</td>



					


						<td id="m_ishbsvisor_10794">-</td>



					


						<td id="m_ishbsvisor_8355">-</td>



					


						<td id="m_ishbsvisor_8200">-</td>



					


						<td id="m_ishbsvisor_10795">-</td>



					


						<td id="m_ishbsvisor_8359">-</td>



					


						<td id="m_ishbsvisor_8360">-</td>



					


							</tr>







			<tr class="hidd" >



				



				


					


						<td id="m_isebsvisor_8356"> - </td>



					


						<td id="m_isebsvisor_8248"> - </td>



					


						<td id="m_isebsvisor_8357"> - </td>



					


						<td id="m_isebsvisor_8358"> - </td>



					


						<td id="m_isebsvisor_8354"> - </td>



					


						<td id="m_isebsvisor_8247"> - </td>



					


						<td id="m_isebsvisor_10794"> - </td>



					


						<td id="m_isebsvisor_8355"> - </td>



					


						<td id="m_isebsvisor_8200"> - </td>



					


						<td id="m_isebsvisor_10795"> - </td>



					


						<td id="m_isebsvisor_8359"> - </td>



					


						<td id="m_isebsvisor_8360"> - </td>



					


							</tr>



-->
        <TR class=hidd>
          <TD id=m_isbssvisor_8356>-</TD>
          <TD id=m_isbssvisor_8248>-</TD>
          <TD id=m_isbssvisor_8357>-</TD>
          <TD id=m_isbssvisor_8358>-</TD>
          <TD id=m_isbssvisor_8354>-</TD>
          <TD id=m_isbssvisor_8247>-</TD>
          <TD id=m_isbssvisor_10794>-</TD>
          <TD id=m_isbssvisor_8355>-</TD>
          <TD id=m_isbssvisor_8200>-</TD>
          <TD id=m_isbssvisor_10795>-</TD>
          <TD id=m_isbssvisor_8359>-</TD>
          <TD id=m_isbssvisor_8360>-</TD></TR>
        <TR class=hidd>
          <TD id=m_issvisordr_8356>●</TD>
          <TD id=m_issvisordr_8248>●</TD>
          <TD id=m_issvisordr_8357>●</TD>
          <TD id=m_issvisordr_8358>●</TD>
          <TD id=m_issvisordr_8354>●</TD>
          <TD id=m_issvisordr_8247>●</TD>
          <TD id=m_issvisordr_10794>●</TD>
          <TD id=m_issvisordr_8355>●</TD>
          <TD id=m_issvisordr_8200>●</TD>
          <TD id=m_issvisordr_10795>●</TD>
          <TD id=m_issvisordr_8359>●</TD>
          <TD id=m_issvisordr_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isinswiper_8356>-</TD>
          <TD id=m_isinswiper_8248>-</TD>
          <TD id=m_isinswiper_8357>-</TD>
          <TD id=m_isinswiper_8358>-</TD>
          <TD id=m_isinswiper_8354>-</TD>
          <TD id=m_isinswiper_8247>-</TD>
          <TD id=m_isinswiper_10794>-</TD>
          <TD id=m_isinswiper_8355>-</TD>
          <TD id=m_isinswiper_8200>-</TD>
          <TD id=m_isinswiper_10795>-</TD>
          <TD id=m_isinswiper_8359>-</TD>
          <TD id=m_isinswiper_8360>-</TD></TR>
        <TR id=base_15>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8356 scope=col><B href="/m8356/" 
            target=_blank>2011款速腾 1.4T 手动技术版 </A><I id=base_15_img_8356></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8248 scope=col><B href="/m8248/" 
            target=_blank>2011款速腾 1.4T 手动豪华版 </A><I id=base_15_img_8248></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8357 scope=col><B href="/m8357/" 
            target=_blank>2011款速腾 1.4T DSG技术版 </A><I id=base_15_img_8357></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8358 scope=col><B href="/m8358/" 
            target=_blank>2011款速腾 1.4T DSG豪华版 </A><I id=base_15_img_8358></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8354 scope=col><B href="/m8354/" 
            target=_blank>2011款速腾 1.6L 手动时尚版 </A><I id=base_15_img_8354></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8247 scope=col><B href="/m8247/" 
            target=_blank>2011款速腾 1.6L 手动舒适版 </A><I id=base_15_img_8247></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10794 scope=col><B href="/m10794/" 
            target=_blank>2011款速腾 1.6L 手动特别版 </A><I id=base_15_img_10794></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8355 scope=col><B href="/m8355/" 
            target=_blank>2011款速腾 1.6L 自动时尚版 </A><I id=base_15_img_8355></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8200 scope=col><B href="/m8200/" 
            target=_blank>2011款速腾 1.6L 自动舒适版 </A><I id=base_15_img_8200></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10795 scope=col><B href="/m10795/" 
            target=_blank>2011款速腾 1.6L 自动特别版 </A><I id=base_15_img_10795></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8359 scope=col><B href="/m8359/" 
            target=_blank>2011款速腾 1.8T 手动冠军版 </A><I id=base_15_img_8359></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_8360 scope=col><B href="/m8360/" 
            target=_blank>2011款速腾 1.8T 自动冠军版 </A><I id=base_15_img_8360></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isairc_8356>●</TD>
          <TD id=m_isairc_8248>●</TD>
          <TD id=m_isairc_8357>●</TD>
          <TD id=m_isairc_8358>●</TD>
          <TD id=m_isairc_8354>●</TD>
          <TD id=m_isairc_8247>●</TD>
          <TD id=m_isairc_10794>●</TD>
          <TD id=m_isairc_8355>●</TD>
          <TD id=m_isairc_8200>●</TD>
          <TD id=m_isairc_10795>●</TD>
          <TD id=m_isairc_8359>●</TD>
          <TD id=m_isairc_8360>●</TD></TR>
        <TR class=disc>
          <TD id=m_isbsairo_8356>●</TD>
          <TD id=m_isbsairo_8248>●</TD>
          <TD id=m_isbsairo_8357>●</TD>
          <TD id=m_isbsairo_8358>●</TD>
          <TD id=m_isbsairo_8354>-</TD>
          <TD id=m_isbsairo_8247>-</TD>
          <TD id=m_isbsairo_10794>-</TD>
          <TD id=m_isbsairo_8355>-</TD>
          <TD id=m_isbsairo_8200>-</TD>
          <TD id=m_isbsairo_10795>-</TD>
          <TD id=m_isbsairo_8359>●</TD>
          <TD id=m_isbsairo_8360>●</TD></TR>
        <TR class=disc>
          <TD id=m_istempdct_8356>●</TD>
          <TD id=m_istempdct_8248>●</TD>
          <TD id=m_istempdct_8357>●</TD>
          <TD id=m_istempdct_8358>●</TD>
          <TD id=m_istempdct_8354>-</TD>
          <TD id=m_istempdct_8247>-</TD>
          <TD id=m_istempdct_10794>-</TD>
          <TD id=m_istempdct_8355>-</TD>
          <TD id=m_istempdct_8200>-</TD>
          <TD id=m_istempdct_10795>-</TD>
          <TD id=m_istempdct_8359>●</TD>
          <TD id=m_istempdct_8360>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscaricebox_8356>-</TD>
          <TD id=m_iscaricebox_8248>-</TD>
          <TD id=m_iscaricebox_8357>-</TD>
          <TD id=m_iscaricebox_8358>-</TD>
          <TD id=m_iscaricebox_8354>-</TD>
          <TD id=m_iscaricebox_8247>-</TD>
          <TD id=m_iscaricebox_10794>-</TD>
          <TD id=m_iscaricebox_8355>-</TD>
          <TD id=m_iscaricebox_8200>-</TD>
          <TD id=m_iscaricebox_10795>-</TD>
          <TD id=m_iscaricebox_8359>-</TD>
          <TD 
id=m_iscaricebox_8360>-</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
<DIV class=clear></DIV></DIV>
<SCRIPT type=text/javascript 
src="【速腾】速腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/analytics.htm"></SCRIPT>
<!--登陆js-->
<SCRIPT 
src="【速腾】速腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/new_login2011_newcar.htm"></SCRIPT>

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

		if(dh.src=="/inc_htm/all_cheshi_list.htm"){



		}else{

		dh.src = "/inc_htm/all_cheshi_list.htm";	

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
    <OPTION selected value=8356>2011款速腾 1.4T 手动技术版</OPTION> <OPTION 
    value=8248>2011款速腾 1.4T 手动豪华版</OPTION> <OPTION value=8357>2011款速腾 1.4T 
    DSG技术版</OPTION> <OPTION value=8358>2011款速腾 1.4T DSG豪华版</OPTION> <OPTION 
    value=8354>2011款速腾 1.6L 手动时尚版</OPTION> <OPTION value=8247>2011款速腾 1.6L 
    手动舒适版</OPTION> <OPTION value=10794>2011款速腾 1.6L 手动特别版</OPTION> <OPTION 
    value=8355>2011款速腾 1.6L 自动时尚版</OPTION> <OPTION value=8200>2011款速腾 1.6L 
    自动舒适版</OPTION> <OPTION value=10795>2011款速腾 1.6L 自动特别版</OPTION> <OPTION 
    value=8359>2011款速腾 1.8T 手动冠军版</OPTION> <OPTION value=8360>2011款速腾 1.8T 
    自动冠军版</OPTION></SELECT></LI>
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
src="【速腾】速腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/news_forall.js"></SCRIPT>

<SCRIPT type=text/javascript 
src="【速腾】速腾%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/dw.js"></SCRIPT>

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
