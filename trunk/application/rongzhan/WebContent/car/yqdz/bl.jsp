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
>参数展示： <INPUT class=t1126_teys 
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
  value=1,2,3,4,5,6,7,8,9,10,11 CHECKED type=checkbox>2012款宝来</LI></UL><EM 
class=b>排量：</EM> 
<UL class=x>
  <LI><INPUT id=dislCheckbox_0 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','2','0','一种发动机')" value=1,2,3,4,5,6 
  CHECKED type=checkbox>1.4T</LI>
  <LI><INPUT id=dislCheckbox_1 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','2','1','一种发动机')" value=7,8,9,10,11 
  CHECKED type=checkbox>1.6L</LI></UL><EM class=c>变速箱：</EM> 
<UL class=y>
  <LI><INPUT id=transtypeCheckbox_0 class=t1126_teys 
  onclick="chg_checkbox('transtypeCheckbox','3','0','一种变速箱')" value=1,2,3,7,8 
  CHECKED type=checkbox>手动变速箱</LI>
  <LI><INPUT id=transtypeCheckbox_1 class=t1126_teys 
  onclick="chg_checkbox('transtypeCheckbox','3','1','一种变速箱')" value=9,10,11 
  CHECKED type=checkbox>自动变速箱</LI>
  <LI><INPUT id=transtypeCheckbox_2 class=gm_cfradio 
  onclick="chg_checkbox('transtypeCheckbox','3','2','一种变速箱')" value=4,5,6 
  CHECKED type=checkbox>双离合变速箱</LI></UL></DIV>
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
            src="【宝来】宝来%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
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
            src="【宝来】宝来%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【宝来】宝来%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【宝来】宝来%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【宝来】宝来%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【宝来】宝来%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【宝来】宝来%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【宝来】宝来%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【宝来】宝来%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【宝来】宝来%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【宝来】宝来%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【宝来】宝来%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
          height=1></TH></TR>
        <TR id=base_1>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10166 scope=col><B href="#/m10166/" 
            target=_blank>2012款宝来 1.4T 手动舒适型 </A><I id=base_1_img_10166></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10168 scope=col><B href="#/m10168/" 
            target=_blank>2012款宝来 1.4T 手动豪华型 </A><I id=base_1_img_10168></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10170 scope=col><B href="#/m10170/" 
            target=_blank>2012款宝来 1.4T 手动Sportline </A><I 
            id=base_1_img_10170></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10167 scope=col><B href="#/m10167/" 
            target=_blank>2012款宝来 1.4T DSG 舒适型 </A><I id=base_1_img_10167></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10169 scope=col><B href="#/m10169/" 
            target=_blank>2012款宝来 1.4T DSG 豪华型 </A><I id=base_1_img_10169></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10171 scope=col><B href="#/m10171/" 
            target=_blank>2012款宝来 1.4T DSG Sportline </A><I 
            id=base_1_img_10171></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10161 scope=col><B href="#/m10161/" 
            target=_blank>2012款宝来 1.6L 手动时尚型 </A><I id=base_1_img_10161></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10163 scope=col><B href="#/m10163/" 
            target=_blank>2012款宝来 1.6L 手动舒适型 </A><I id=base_1_img_10163></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10162 scope=col><B href="#/m10162/" 
            target=_blank>2012款宝来 1.6L 自动时尚型 </A><I id=base_1_img_10162></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10164 scope=col><B href="#/m10164/" 
            target=_blank>2012款宝来 1.6L 自动舒适型 </A><I id=base_1_img_10164></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10165 scope=col><B href="#/m10165/" 
            target=_blank>2012款宝来 1.6L 自动豪华型 </A><I id=base_1_img_10165></I> </TH></TR>
        <TR class=disc>
          <TD id=min_price_10166>12.88万</TD>
          <TD id=min_price_10168>13.25万</TD>
          <TD id=min_price_10170>13.28万</TD>
          <TD id=min_price_10167>14.28万</TD>
          <TD id=min_price_10169>14.65万</TD>
          <TD id=min_price_10171>14.68万</TD>
          <TD id=min_price_10161>10.78万</TD>
          <TD id=min_price_10163>11.88万</TD>
          <TD id=min_price_10162>11.98万</TD>
          <TD id=min_price_10164>13.08万</TD>
          <TD id=min_price_10165>13.45万</TD></TR>
        <TR class=hidd>
          <TD id=bname_10166><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_10168><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_10170><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_10167><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_10169><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_10171><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_10161><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_10163><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_10162><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_10164><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_10165><B title=一汽-大众 
            href="#/price/b2/" 
        target=_blank>一汽-大众</A></TD></TR>
        <TR class=hidd>
          <TD id=type2_10166><B 
            href="#/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_10168><B 
            href="#/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_10170><B 
            href="#/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_10167><B 
            href="#/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_10169><B 
            href="#/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_10171><B 
            href="#/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_10161><B 
            href="#/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_10163><B 
            href="#/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_10162><B 
            href="#/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_10164><B 
            href="#/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD>
          <TD id=type2_10165><B 
            href="#/car/0-0-0-0-0-0-2-0-0-0-0-0/">紧凑型车</A></TD></TR>
        <TR class=disc>
          <TD id=m_disl_10166>1.4L 96kW </TD>
          <TD id=m_disl_10168>1.4L 96kW </TD>
          <TD id=m_disl_10170>1.4L 96kW </TD>
          <TD id=m_disl_10167>1.4L 96kW </TD>
          <TD id=m_disl_10169>1.4L 96kW </TD>
          <TD id=m_disl_10171>1.4L 96kW </TD>
          <TD id=m_disl_10161>1.6L 77kW </TD>
          <TD id=m_disl_10163>1.6L 77kW </TD>
          <TD id=m_disl_10162>1.6L 77kW </TD>
          <TD id=m_disl_10164>1.6L 77kW </TD>
          <TD id=m_disl_10165>1.6L 77kW </TD></TR>
        <TR class=disc>
          <TD id=m_transtype_10166>5挡手动</TD>
          <TD id=m_transtype_10168>5挡手动</TD>
          <TD id=m_transtype_10170>5挡手动</TD>
          <TD id=m_transtype_10167>7挡双离合变速箱</TD>
          <TD id=m_transtype_10169>7挡双离合变速箱</TD>
          <TD id=m_transtype_10171>7挡双离合变速箱</TD>
          <TD id=m_transtype_10161>5挡手动</TD>
          <TD id=m_transtype_10163>5挡手动</TD>
          <TD id=m_transtype_10162>6挡自动</TD>
          <TD id=m_transtype_10164>6挡自动</TD>
          <TD id=m_transtype_10165>6挡自动</TD></TR>
        <TR class=hidd>
          <TD id=m_length_width_height_10166><!---->4540×1775×1467 <!----></TD>
          <TD id=m_length_width_height_10168><!---->4540×1775×1467 <!----></TD>
          <TD id=m_length_width_height_10170><!---->4540×1775×1467 <!----></TD>
          <TD id=m_length_width_height_10167><!---->4540×1775×1467 <!----></TD>
          <TD id=m_length_width_height_10169><!---->4540×1775×1467 <!----></TD>
          <TD id=m_length_width_height_10171><!---->4540×1775×1467 <!----></TD>
          <TD id=m_length_width_height_10161><!---->4540×1775×1467 <!----></TD>
          <TD id=m_length_width_height_10163><!---->4540×1775×1467 <!----></TD>
          <TD id=m_length_width_height_10162><!---->4540×1775×1467 <!----></TD>
          <TD id=m_length_width_height_10164><!---->4540×1775×1467 <!----></TD>
          <TD id=m_length_width_height_10165><!---->4540×1775×1467 
        <!----></TD></TR>
        <TR class=hidd>
          <TD id=m_frame_10166>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10168>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10170>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10167>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10169>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10171>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10161>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10163>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10162>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10164>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10165>4门 5座 三厢轿车</TD></TR>
        <TR class=hidd>
          <TD id=syear_10166>2011</TD>
          <TD id=syear_10168>2011</TD>
          <TD id=syear_10170>2011</TD>
          <TD id=syear_10167>2011</TD>
          <TD id=syear_10169>2011</TD>
          <TD id=syear_10171>2011</TD>
          <TD id=syear_10161>2011</TD>
          <TD id=syear_10163>2011</TD>
          <TD id=syear_10162>2011</TD>
          <TD id=syear_10164>2011</TD>
          <TD id=syear_10165>2011</TD></TR>
        <TR class=disc>
          <TD id=m_mspeed_10166>200</TD>
          <TD id=m_mspeed_10168>200</TD>
          <TD id=m_mspeed_10170>200</TD>
          <TD id=m_mspeed_10167>200</TD>
          <TD id=m_mspeed_10169>200</TD>
          <TD id=m_mspeed_10171>200</TD>
          <TD id=m_mspeed_10161>185</TD>
          <TD id=m_mspeed_10163>185</TD>
          <TD id=m_mspeed_10162>180</TD>
          <TD id=m_mspeed_10164>180</TD>
          <TD id=m_mspeed_10165>180</TD></TR>
        <TR class=disc>
          <TD id=m_hatime_10166>9.8</TD>
          <TD id=m_hatime_10168>9.8</TD>
          <TD id=m_hatime_10170>9.8</TD>
          <TD id=m_hatime_10167>9.7</TD>
          <TD id=m_hatime_10169>9.7</TD>
          <TD id=m_hatime_10171>9.7</TD>
          <TD id=m_hatime_10161>11.8</TD>
          <TD id=m_hatime_10163>11.8</TD>
          <TD id=m_hatime_10162>12.8</TD>
          <TD id=m_hatime_10164>12.8</TD>
          <TD id=m_hatime_10165>12.8</TD></TR>
        <TR class=disc>
          <TD id=m_comfuel_10166>6.6</TD>
          <TD id=m_comfuel_10168>6.6</TD>
          <TD id=m_comfuel_10170>6.6</TD>
          <TD id=m_comfuel_10167>6.4</TD>
          <TD id=m_comfuel_10169>6.4</TD>
          <TD id=m_comfuel_10171>6.4</TD>
          <TD id=m_comfuel_10161>6.9</TD>
          <TD id=m_comfuel_10163>6.9</TD>
          <TD id=m_comfuel_10162>7.2</TD>
          <TD id=m_comfuel_10164>7.2</TD>
          <TD id=m_comfuel_10165>7.2</TD></TR>
        <TR class=disc>
          <TD id=m_lkmfuel_10166>- </TD>
          <TD id=m_lkmfuel_10168>- </TD>
          <TD id=m_lkmfuel_10170>5.2</TD>
          <TD id=m_lkmfuel_10167>- </TD>
          <TD id=m_lkmfuel_10169>- </TD>
          <TD id=m_lkmfuel_10171>- </TD>
          <TD id=m_lkmfuel_10161>- </TD>
          <TD id=m_lkmfuel_10163>6.9</TD>
          <TD id=m_lkmfuel_10162>- </TD>
          <TD id=m_lkmfuel_10164>- </TD>
          <TD id=m_lkmfuel_10165>- </TD></TR>
        <TR class=disc>
          <TD id=m_hkmfuel_10166>- </TD>
          <TD id=m_hkmfuel_10168>- </TD>
          <TD id=m_hkmfuel_10170>90</TD>
          <TD id=m_hkmfuel_10167>- </TD>
          <TD id=m_hkmfuel_10169>- </TD>
          <TD id=m_hkmfuel_10171>- </TD>
          <TD id=m_hkmfuel_10161>- </TD>
          <TD id=m_hkmfuel_10163>100</TD>
          <TD id=m_hkmfuel_10162>- </TD>
          <TD id=m_hkmfuel_10164>- </TD>
          <TD id=m_hkmfuel_10165>- </TD></TR>
        <TR class=hidd>
          <TD id=m_ypolicy_10166>2年6万公里 </TD>
          <TD id=m_ypolicy_10168>2年6万公里 </TD>
          <TD id=m_ypolicy_10170>2年6万公里 </TD>
          <TD id=m_ypolicy_10167>2年6万公里 </TD>
          <TD id=m_ypolicy_10169>2年6万公里 </TD>
          <TD id=m_ypolicy_10171>2年6万公里 </TD>
          <TD id=m_ypolicy_10161>2年6万公里 </TD>
          <TD id=m_ypolicy_10163>2年6万公里 </TD>
          <TD id=m_ypolicy_10162>2年6万公里 </TD>
          <TD id=m_ypolicy_10164>2年6万公里 </TD>
          <TD id=m_ypolicy_10165>2年6万公里 </TD></TR>
        <TR id=base_2>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10166 scope=col><B href="#/m10166/" 
            target=_blank>2012款宝来 1.4T 手动舒适型</A> <I id=base_2_img_10166></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10168 scope=col><B href="#/m10168/" 
            target=_blank>2012款宝来 1.4T 手动豪华型</A> <I id=base_2_img_10168></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10170 scope=col><B href="#/m10170/" 
            target=_blank>2012款宝来 1.4T 手动Sportline</A> <I 
            id=base_2_img_10170></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10167 scope=col><B href="#/m10167/" 
            target=_blank>2012款宝来 1.4T DSG 舒适型</A> <I id=base_2_img_10167></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10169 scope=col><B href="#/m10169/" 
            target=_blank>2012款宝来 1.4T DSG 豪华型</A> <I id=base_2_img_10169></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10171 scope=col><B href="#/m10171/" 
            target=_blank>2012款宝来 1.4T DSG Sportline</A> <I 
            id=base_2_img_10171></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10161 scope=col><B href="#/m10161/" 
            target=_blank>2012款宝来 1.6L 手动时尚型</A> <I id=base_2_img_10161></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10163 scope=col><B href="#/m10163/" 
            target=_blank>2012款宝来 1.6L 手动舒适型</A> <I id=base_2_img_10163></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10162 scope=col><B href="#/m10162/" 
            target=_blank>2012款宝来 1.6L 自动时尚型</A> <I id=base_2_img_10162></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10164 scope=col><B href="#/m10164/" 
            target=_blank>2012款宝来 1.6L 自动舒适型</A> <I id=base_2_img_10164></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10165 scope=col><B href="#/m10165/" 
            target=_blank>2012款宝来 1.6L 自动豪华型</A> <I id=base_2_img_10165></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_length_10166>4540</TD>
          <TD id=m_length_10168>4540</TD>
          <TD id=m_length_10170>4540</TD>
          <TD id=m_length_10167>4540</TD>
          <TD id=m_length_10169>4540</TD>
          <TD id=m_length_10171>4540</TD>
          <TD id=m_length_10161>4540</TD>
          <TD id=m_length_10163>4540</TD>
          <TD id=m_length_10162>4540</TD>
          <TD id=m_length_10164>4540</TD>
          <TD id=m_length_10165>4540</TD></TR>
        <TR class=hidd>
          <TD id=m_width_10166>1775</TD>
          <TD id=m_width_10168>1775</TD>
          <TD id=m_width_10170>1775</TD>
          <TD id=m_width_10167>1775</TD>
          <TD id=m_width_10169>1775</TD>
          <TD id=m_width_10171>1775</TD>
          <TD id=m_width_10161>1775</TD>
          <TD id=m_width_10163>1775</TD>
          <TD id=m_width_10162>1775</TD>
          <TD id=m_width_10164>1775</TD>
          <TD id=m_width_10165>1775</TD></TR>
        <TR class=hidd>
          <TD id=m_height_10166>1467</TD>
          <TD id=m_height_10168>1467</TD>
          <TD id=m_height_10170>1467</TD>
          <TD id=m_height_10167>1467</TD>
          <TD id=m_height_10169>1467</TD>
          <TD id=m_height_10171>1467</TD>
          <TD id=m_height_10161>1467</TD>
          <TD id=m_height_10163>1467</TD>
          <TD id=m_height_10162>1467</TD>
          <TD id=m_height_10164>1467</TD>
          <TD id=m_height_10165>1467</TD></TR>
        <TR class=hidd>
          <TD id=m_wheelbase_10166>2610</TD>
          <TD id=m_wheelbase_10168>2610</TD>
          <TD id=m_wheelbase_10170>2610</TD>
          <TD id=m_wheelbase_10167>2610</TD>
          <TD id=m_wheelbase_10169>2610</TD>
          <TD id=m_wheelbase_10171>2610</TD>
          <TD id=m_wheelbase_10161>2610</TD>
          <TD id=m_wheelbase_10163>2610</TD>
          <TD id=m_wheelbase_10162>2610</TD>
          <TD id=m_wheelbase_10164>2610</TD>
          <TD id=m_wheelbase_10165>2610</TD></TR>
        <TR class=disc>
          <TD id=m_weight_10166>1315</TD>
          <TD id=m_weight_10168>1315</TD>
          <TD id=m_weight_10170>1315</TD>
          <TD id=m_weight_10167>1335</TD>
          <TD id=m_weight_10169>1335</TD>
          <TD id=m_weight_10171>1335</TD>
          <TD id=m_weight_10161>1265</TD>
          <TD id=m_weight_10163>1265</TD>
          <TD id=m_weight_10162>1305</TD>
          <TD id=m_weight_10164>1305</TD>
          <TD id=m_weight_10165>1305</TD></TR>
        <TR class=hidd>
          <TD id=m_clearance_10166>125</TD>
          <TD id=m_clearance_10168>125</TD>
          <TD id=m_clearance_10170>125</TD>
          <TD id=m_clearance_10167>125</TD>
          <TD id=m_clearance_10169>125</TD>
          <TD id=m_clearance_10171>125</TD>
          <TD id=m_clearance_10161>125</TD>
          <TD id=m_clearance_10163>125</TD>
          <TD id=m_clearance_10162>125</TD>
          <TD id=m_clearance_10164>125</TD>
          <TD id=m_clearance_10165>125</TD></TR>
        <TR class=hidd>
          <TD id=m_frame2_10166>三厢轿车</TD>
          <TD id=m_frame2_10168>三厢轿车</TD>
          <TD id=m_frame2_10170>三厢轿车</TD>
          <TD id=m_frame2_10167>三厢轿车</TD>
          <TD id=m_frame2_10169>三厢轿车</TD>
          <TD id=m_frame2_10171>三厢轿车</TD>
          <TD id=m_frame2_10161>三厢轿车</TD>
          <TD id=m_frame2_10163>三厢轿车</TD>
          <TD id=m_frame2_10162>三厢轿车</TD>
          <TD id=m_frame2_10164>三厢轿车</TD>
          <TD id=m_frame2_10165>三厢轿车</TD></TR>
        <TR class=hidd>
          <TD id=m_door_10166>4</TD>
          <TD id=m_door_10168>4</TD>
          <TD id=m_door_10170>4</TD>
          <TD id=m_door_10167>4</TD>
          <TD id=m_door_10169>4</TD>
          <TD id=m_door_10171>4</TD>
          <TD id=m_door_10161>4</TD>
          <TD id=m_door_10163>4</TD>
          <TD id=m_door_10162>4</TD>
          <TD id=m_door_10164>4</TD>
          <TD id=m_door_10165>4</TD></TR>
        <TR class=hidd>
          <TD id=m_seat_10166>5</TD>
          <TD id=m_seat_10168>5</TD>
          <TD id=m_seat_10170>5</TD>
          <TD id=m_seat_10167>5</TD>
          <TD id=m_seat_10169>5</TD>
          <TD id=m_seat_10171>5</TD>
          <TD id=m_seat_10161>5</TD>
          <TD id=m_seat_10163>5</TD>
          <TD id=m_seat_10162>5</TD>
          <TD id=m_seat_10164>5</TD>
          <TD id=m_seat_10165>5</TD></TR>
        <TR class=hidd>
          <TD id=m_oilbox_10166>55.00</TD>
          <TD id=m_oilbox_10168>55.00</TD>
          <TD id=m_oilbox_10170>55.00</TD>
          <TD id=m_oilbox_10167>55.00</TD>
          <TD id=m_oilbox_10169>55.00</TD>
          <TD id=m_oilbox_10171>55.00</TD>
          <TD id=m_oilbox_10161>55.00</TD>
          <TD id=m_oilbox_10163>55.00</TD>
          <TD id=m_oilbox_10162>55.00</TD>
          <TD id=m_oilbox_10164>55.00</TD>
          <TD id=m_oilbox_10165>55.00</TD></TR>
        <TR class=hidd>
          <TD id=m_trunk_10166>450</TD>
          <TD id=m_trunk_10168>450</TD>
          <TD id=m_trunk_10170>450</TD>
          <TD id=m_trunk_10167>450</TD>
          <TD id=m_trunk_10169>450</TD>
          <TD id=m_trunk_10171>450</TD>
          <TD id=m_trunk_10161>450</TD>
          <TD id=m_trunk_10163>450</TD>
          <TD id=m_trunk_10162>450</TD>
          <TD id=m_trunk_10164>450</TD>
          <TD id=m_trunk_10165>450</TD></TR>
        <TR class=hidd>
          <TD id=m_mtrunk_10166>450</TD>
          <TD id=m_mtrunk_10168>450</TD>
          <TD id=m_mtrunk_10170>450</TD>
          <TD id=m_mtrunk_10167>450</TD>
          <TD id=m_mtrunk_10169>450</TD>
          <TD id=m_mtrunk_10171>450</TD>
          <TD id=m_mtrunk_10161>450</TD>
          <TD id=m_mtrunk_10163>450</TD>
          <TD id=m_mtrunk_10162>450</TD>
          <TD id=m_mtrunk_10164>450</TD>
          <TD id=m_mtrunk_10165>450</TD></TR>
        <TR id=base_3>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10166 scope=col><B href="#/m10166/" 
            target=_blank>2012款宝来 1.4T 手动舒适型 </A><I id=base_3_img_10166></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10168 scope=col><B href="#/m10168/" 
            target=_blank>2012款宝来 1.4T 手动豪华型 </A><I id=base_3_img_10168></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10170 scope=col><B href="#/m10170/" 
            target=_blank>2012款宝来 1.4T 手动Sportline </A><I 
            id=base_3_img_10170></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10167 scope=col><B href="#/m10167/" 
            target=_blank>2012款宝来 1.4T DSG 舒适型 </A><I id=base_3_img_10167></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10169 scope=col><B href="#/m10169/" 
            target=_blank>2012款宝来 1.4T DSG 豪华型 </A><I id=base_3_img_10169></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10171 scope=col><B href="#/m10171/" 
            target=_blank>2012款宝来 1.4T DSG Sportline </A><I 
            id=base_3_img_10171></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10161 scope=col><B href="#/m10161/" 
            target=_blank>2012款宝来 1.6L 手动时尚型 </A><I id=base_3_img_10161></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10163 scope=col><B href="#/m10163/" 
            target=_blank>2012款宝来 1.6L 手动舒适型 </A><I id=base_3_img_10163></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10162 scope=col><B href="#/m10162/" 
            target=_blank>2012款宝来 1.6L 自动时尚型 </A><I id=base_3_img_10162></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10164 scope=col><B href="#/m10164/" 
            target=_blank>2012款宝来 1.6L 自动舒适型 </A><I id=base_3_img_10164></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10165 scope=col><B href="#/m10165/" 
            target=_blank>2012款宝来 1.6L 自动豪华型 </A><I id=base_3_img_10165></I> </TH></TR>
        <TR class=disc>
          <TD id=m_disl2_10166>1.4</TD>
          <TD id=m_disl2_10168>1.4</TD>
          <TD id=m_disl2_10170>1.4</TD>
          <TD id=m_disl2_10167>1.4</TD>
          <TD id=m_disl2_10169>1.4</TD>
          <TD id=m_disl2_10171>1.4</TD>
          <TD id=m_disl2_10161>1.6</TD>
          <TD id=m_disl2_10163>1.6</TD>
          <TD id=m_disl2_10162>1.6</TD>
          <TD id=m_disl2_10164>1.6</TD>
          <TD id=m_disl2_10165>1.6</TD></TR>
        <TR class=disc>
          <TD id=m_working_10166>涡轮增压</TD>
          <TD id=m_working_10168>涡轮增压</TD>
          <TD id=m_working_10170>涡轮增压</TD>
          <TD id=m_working_10167>涡轮增压</TD>
          <TD id=m_working_10169>涡轮增压</TD>
          <TD id=m_working_10171>涡轮增压</TD>
          <TD id=m_working_10161>自然吸气</TD>
          <TD id=m_working_10163>自然吸气</TD>
          <TD id=m_working_10162>自然吸气</TD>
          <TD id=m_working_10164>自然吸气</TD>
          <TD id=m_working_10165>自然吸气</TD></TR>
        <TR class=disc>
          <TD id=m_mpower_10166>96</TD>
          <TD id=m_mpower_10168>96</TD>
          <TD id=m_mpower_10170>96</TD>
          <TD id=m_mpower_10167>96</TD>
          <TD id=m_mpower_10169>96</TD>
          <TD id=m_mpower_10171>96</TD>
          <TD id=m_mpower_10161>77</TD>
          <TD id=m_mpower_10163>77</TD>
          <TD id=m_mpower_10162>77</TD>
          <TD id=m_mpower_10164>77</TD>
          <TD id=m_mpower_10165>77</TD></TR>
        <TR class=disc>
          <TD id=m_mpowersp_10166>5000</TD>
          <TD id=m_mpowersp_10168>5000</TD>
          <TD id=m_mpowersp_10170>5000</TD>
          <TD id=m_mpowersp_10167>5000</TD>
          <TD id=m_mpowersp_10169>5000</TD>
          <TD id=m_mpowersp_10171>5000</TD>
          <TD id=m_mpowersp_10161>5600</TD>
          <TD id=m_mpowersp_10163>5600</TD>
          <TD id=m_mpowersp_10162>5600</TD>
          <TD id=m_mpowersp_10164>5600</TD>
          <TD id=m_mpowersp_10165>5600</TD></TR>
        <TR class=disc>
          <TD id=m_mtorque_10166>220</TD>
          <TD id=m_mtorque_10168>220</TD>
          <TD id=m_mtorque_10170>220</TD>
          <TD id=m_mtorque_10167>220</TD>
          <TD id=m_mtorque_10169>220</TD>
          <TD id=m_mtorque_10171>220</TD>
          <TD id=m_mtorque_10161>155</TD>
          <TD id=m_mtorque_10163>155</TD>
          <TD id=m_mtorque_10162>155</TD>
          <TD id=m_mtorque_10164>155</TD>
          <TD id=m_mtorque_10165>155</TD></TR>
        <TR class=disc>
          <TD id=m_mtorsp_10166>1750-3500</TD>
          <TD id=m_mtorsp_10168>1750-3500</TD>
          <TD id=m_mtorsp_10170>1750-3500</TD>
          <TD id=m_mtorsp_10167>1750-3500</TD>
          <TD id=m_mtorsp_10169>1750-3500</TD>
          <TD id=m_mtorsp_10171>1750-3500</TD>
          <TD id=m_mtorsp_10161>3800</TD>
          <TD id=m_mtorsp_10163>3800</TD>
          <TD id=m_mtorsp_10162>3800</TD>
          <TD id=m_mtorsp_10164>3800</TD>
          <TD id=m_mtorsp_10165>3800</TD></TR>
        <TR class=hidd>
          <TD id=m_fuel_10166>汽油</TD>
          <TD id=m_fuel_10168>汽油</TD>
          <TD id=m_fuel_10170>汽油</TD>
          <TD id=m_fuel_10167>汽油</TD>
          <TD id=m_fuel_10169>汽油</TD>
          <TD id=m_fuel_10171>汽油</TD>
          <TD id=m_fuel_10161>汽油</TD>
          <TD id=m_fuel_10163>汽油</TD>
          <TD id=m_fuel_10162>汽油</TD>
          <TD id=m_fuel_10164>汽油</TD>
          <TD id=m_fuel_10165>汽油</TD></TR>
        <TR class=hidd>
          <TD id=m_fuelno_10166>93</TD>
          <TD id=m_fuelno_10168>93</TD>
          <TD id=m_fuelno_10170>93</TD>
          <TD id=m_fuelno_10167>93</TD>
          <TD id=m_fuelno_10169>93</TD>
          <TD id=m_fuelno_10171>93</TD>
          <TD id=m_fuelno_10161>93</TD>
          <TD id=m_fuelno_10163>93</TD>
          <TD id=m_fuelno_10162>93</TD>
          <TD id=m_fuelno_10164>93</TD>
          <TD id=m_fuelno_10165>93</TD></TR>
        <TR class=hidd>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_10166>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_10168>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_10170>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_10167>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_10169>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_10171>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_10161>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_10163>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_10162>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_10164>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_10165>国IV+OBD </TD></TR>
        <TR id=base_4>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10166 scope=col><B href="#/m10166/" 
            target=_blank>2012款宝来 1.4T 手动舒适型 </A><I id=base_4_img_10166></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10168 scope=col><B href="#/m10168/" 
            target=_blank>2012款宝来 1.4T 手动豪华型 </A><I id=base_4_img_10168></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10170 scope=col><B href="#/m10170/" 
            target=_blank>2012款宝来 1.4T 手动Sportline </A><I 
            id=base_4_img_10170></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10167 scope=col><B href="#/m10167/" 
            target=_blank>2012款宝来 1.4T DSG 舒适型 </A><I id=base_4_img_10167></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10169 scope=col><B href="#/m10169/" 
            target=_blank>2012款宝来 1.4T DSG 豪华型 </A><I id=base_4_img_10169></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10171 scope=col><B href="#/m10171/" 
            target=_blank>2012款宝来 1.4T DSG Sportline </A><I 
            id=base_4_img_10171></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10161 scope=col><B href="#/m10161/" 
            target=_blank>2012款宝来 1.6L 手动时尚型 </A><I id=base_4_img_10161></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10163 scope=col><B href="#/m10163/" 
            target=_blank>2012款宝来 1.6L 手动舒适型 </A><I id=base_4_img_10163></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10162 scope=col><B href="#/m10162/" 
            target=_blank>2012款宝来 1.6L 自动时尚型 </A><I id=base_4_img_10162></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10164 scope=col><B href="#/m10164/" 
            target=_blank>2012款宝来 1.6L 自动舒适型 </A><I id=base_4_img_10164></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10165 scope=col><B href="#/m10165/" 
            target=_blank>2012款宝来 1.6L 自动豪华型 </A><I id=base_4_img_10165></I> </TH></TR>
        <TR class=disc>
          <TD id=m_speed_10166>5</TD>
          <TD id=m_speed_10168>5</TD>
          <TD id=m_speed_10170>5</TD>
          <TD id=m_speed_10167>7</TD>
          <TD id=m_speed_10169>7</TD>
          <TD id=m_speed_10171>7</TD>
          <TD id=m_speed_10161>5</TD>
          <TD id=m_speed_10163>5</TD>
          <TD id=m_speed_10162>6</TD>
          <TD id=m_speed_10164>6</TD>
          <TD id=m_speed_10165>6</TD></TR>
        <TR class=disc>
          <TD id=m_transtype2_10166>MT</TD>
          <TD id=m_transtype2_10168>MT</TD>
          <TD id=m_transtype2_10170>MT</TD>
          <TD id=m_transtype2_10167>双离合变速箱</TD>
          <TD id=m_transtype2_10169>双离合变速箱</TD>
          <TD id=m_transtype2_10171>双离合变速箱</TD>
          <TD id=m_transtype2_10161>MT</TD>
          <TD id=m_transtype2_10163>MT</TD>
          <TD id=m_transtype2_10162>AT</TD>
          <TD id=m_transtype2_10164>AT</TD>
          <TD id=m_transtype2_10165>AT</TD></TR>
        <TR id=base_5>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10166 scope=col><B href="#/m10166/" 
            target=_blank>2012款宝来 1.4T 手动舒适型 </A><I id=base_5_img_10166></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10168 scope=col><B href="#/m10168/" 
            target=_blank>2012款宝来 1.4T 手动豪华型 </A><I id=base_5_img_10168></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10170 scope=col><B href="#/m10170/" 
            target=_blank>2012款宝来 1.4T 手动Sportline </A><I 
            id=base_5_img_10170></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10167 scope=col><B href="#/m10167/" 
            target=_blank>2012款宝来 1.4T DSG 舒适型 </A><I id=base_5_img_10167></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10169 scope=col><B href="#/m10169/" 
            target=_blank>2012款宝来 1.4T DSG 豪华型 </A><I id=base_5_img_10169></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10171 scope=col><B href="#/m10171/" 
            target=_blank>2012款宝来 1.4T DSG Sportline </A><I 
            id=base_5_img_10171></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10161 scope=col><B href="#/m10161/" 
            target=_blank>2012款宝来 1.6L 手动时尚型 </A><I id=base_5_img_10161></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10163 scope=col><B href="#/m10163/" 
            target=_blank>2012款宝来 1.6L 手动舒适型 </A><I id=base_5_img_10163></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10162 scope=col><B href="#/m10162/" 
            target=_blank>2012款宝来 1.6L 自动时尚型 </A><I id=base_5_img_10162></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10164 scope=col><B href="#/m10164/" 
            target=_blank>2012款宝来 1.6L 自动舒适型 </A><I id=base_5_img_10164></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10165 scope=col><B href="#/m10165/" 
            target=_blank>2012款宝来 1.6L 自动豪华型 </A><I id=base_5_img_10165></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_drivetype_10166>前置前驱</TD>
          <TD id=m_drivetype_10168>前置前驱</TD>
          <TD id=m_drivetype_10170>前置前驱</TD>
          <TD id=m_drivetype_10167>前置前驱</TD>
          <TD id=m_drivetype_10169>前置前驱</TD>
          <TD id=m_drivetype_10171>前置前驱</TD>
          <TD id=m_drivetype_10161>前置前驱</TD>
          <TD id=m_drivetype_10163>前置前驱</TD>
          <TD id=m_drivetype_10162>前置前驱</TD>
          <TD id=m_drivetype_10164>前置前驱</TD>
          <TD id=m_drivetype_10165>前置前驱</TD></TR>
        <TR class=hidd height=60>
          <TD id=m_fsustype_text_10166>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_10168>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_10170>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_10167>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_10169>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_10171>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_10161>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_10163>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_10162>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_10164>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_10165>麦弗逊式独立悬架</TD></TR>
        <TR class=hidd height=60>
          <TD id=m_bsustype_text_10166>扭力梁式半独立悬架</TD>
          <TD id=m_bsustype_text_10168>扭力梁式半独立悬架</TD>
          <TD id=m_bsustype_text_10170>扭力梁式半独立悬架</TD>
          <TD id=m_bsustype_text_10167>扭力梁式半独立悬架</TD>
          <TD id=m_bsustype_text_10169>扭力梁式半独立悬架</TD>
          <TD id=m_bsustype_text_10171>扭力梁式半独立悬架</TD>
          <TD id=m_bsustype_text_10161>扭力梁式半独立悬架</TD>
          <TD id=m_bsustype_text_10163>扭力梁式半独立悬架</TD>
          <TD id=m_bsustype_text_10162>扭力梁式半独立悬架</TD>
          <TD id=m_bsustype_text_10164>扭力梁式半独立悬架</TD>
          <TD id=m_bsustype_text_10165>扭力梁式半独立悬架</TD></TR>
        <TR id=base_6>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10166 scope=col><B href="#/m10166/" 
            target=_blank>2012款宝来 1.4T 手动舒适型 </A><I id=base_6_img_10166></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10168 scope=col><B href="#/m10168/" 
            target=_blank>2012款宝来 1.4T 手动豪华型 </A><I id=base_6_img_10168></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10170 scope=col><B href="#/m10170/" 
            target=_blank>2012款宝来 1.4T 手动Sportline </A><I 
            id=base_6_img_10170></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10167 scope=col><B href="#/m10167/" 
            target=_blank>2012款宝来 1.4T DSG 舒适型 </A><I id=base_6_img_10167></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10169 scope=col><B href="#/m10169/" 
            target=_blank>2012款宝来 1.4T DSG 豪华型 </A><I id=base_6_img_10169></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10171 scope=col><B href="#/m10171/" 
            target=_blank>2012款宝来 1.4T DSG Sportline </A><I 
            id=base_6_img_10171></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10161 scope=col><B href="#/m10161/" 
            target=_blank>2012款宝来 1.6L 手动时尚型 </A><I id=base_6_img_10161></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10163 scope=col><B href="#/m10163/" 
            target=_blank>2012款宝来 1.6L 手动舒适型 </A><I id=base_6_img_10163></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10162 scope=col><B href="#/m10162/" 
            target=_blank>2012款宝来 1.6L 自动时尚型 </A><I id=base_6_img_10162></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10164 scope=col><B href="#/m10164/" 
            target=_blank>2012款宝来 1.6L 自动舒适型 </A><I id=base_6_img_10164></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10165 scope=col><B href="#/m10165/" 
            target=_blank>2012款宝来 1.6L 自动豪华型 </A><I id=base_6_img_10165></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_fbraketype_10166>通风盘式</TD>
          <TD id=m_fbraketype_10168>通风盘式</TD>
          <TD id=m_fbraketype_10170>通风盘式</TD>
          <TD id=m_fbraketype_10167>通风盘式</TD>
          <TD id=m_fbraketype_10169>通风盘式</TD>
          <TD id=m_fbraketype_10171>通风盘式</TD>
          <TD id=m_fbraketype_10161>通风盘式</TD>
          <TD id=m_fbraketype_10163>通风盘式</TD>
          <TD id=m_fbraketype_10162>通风盘式</TD>
          <TD id=m_fbraketype_10164>通风盘式</TD>
          <TD id=m_fbraketype_10165>通风盘式</TD></TR>
        <TR class=hidd>
          <TD id=m_bbraketype_10166>盘式</TD>
          <TD id=m_bbraketype_10168>盘式</TD>
          <TD id=m_bbraketype_10170>盘式</TD>
          <TD id=m_bbraketype_10167>盘式</TD>
          <TD id=m_bbraketype_10169>盘式</TD>
          <TD id=m_bbraketype_10171>盘式</TD>
          <TD id=m_bbraketype_10161>盘式</TD>
          <TD id=m_bbraketype_10163>盘式</TD>
          <TD id=m_bbraketype_10162>盘式</TD>
          <TD id=m_bbraketype_10164>盘式</TD>
          <TD id=m_bbraketype_10165>盘式</TD></TR>
        <TR class=disc>
          <TD id=m_ftiresize_10166>205/55 R16</TD>
          <TD id=m_ftiresize_10168>205/55 R16</TD>
          <TD id=m_ftiresize_10170>205/55 R16</TD>
          <TD id=m_ftiresize_10167>205/55 R16</TD>
          <TD id=m_ftiresize_10169>205/55 R16</TD>
          <TD id=m_ftiresize_10171>205/55 R16</TD>
          <TD id=m_ftiresize_10161>195/65 R15</TD>
          <TD id=m_ftiresize_10163>195/65 R15</TD>
          <TD id=m_ftiresize_10162>195/65 R15</TD>
          <TD id=m_ftiresize_10164>195/65 R15</TD>
          <TD id=m_ftiresize_10165>205/55 R16</TD></TR>
        <TR class=disc>
          <TD id=m_btiresize_10166>205/55 R16</TD>
          <TD id=m_btiresize_10168>205/55 R16</TD>
          <TD id=m_btiresize_10170>205/55 R16</TD>
          <TD id=m_btiresize_10167>205/55 R16</TD>
          <TD id=m_btiresize_10169>205/55 R16</TD>
          <TD id=m_btiresize_10171>205/55 R16</TD>
          <TD id=m_btiresize_10161>195/65 R15</TD>
          <TD id=m_btiresize_10163>195/65 R15</TD>
          <TD id=m_btiresize_10162>195/65 R15</TD>
          <TD id=m_btiresize_10164>195/65 R15</TD>
          <TD id=m_btiresize_10165>205/55 R16</TD></TR>
        <TR class=disc>
          <TD id=m_sparetire_10166>非全尺寸</TD>
          <TD id=m_sparetire_10168>非全尺寸</TD>
          <TD id=m_sparetire_10170>非全尺寸</TD>
          <TD id=m_sparetire_10167>非全尺寸</TD>
          <TD id=m_sparetire_10169>非全尺寸</TD>
          <TD id=m_sparetire_10171>非全尺寸</TD>
          <TD id=m_sparetire_10161>全尺寸</TD>
          <TD id=m_sparetire_10163>全尺寸</TD>
          <TD id=m_sparetire_10162>全尺寸</TD>
          <TD id=m_sparetire_10164>全尺寸</TD>
          <TD id=m_sparetire_10165>非全尺寸</TD></TR>
        <TR id=base_7>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10166 scope=col><B href="#/m10166/" 
            target=_blank>2012款宝来 1.4T 手动舒适型 </A><I id=base_7_img_10166></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10168 scope=col><B href="#/m10168/" 
            target=_blank>2012款宝来 1.4T 手动豪华型 </A><I id=base_7_img_10168></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10170 scope=col><B href="#/m10170/" 
            target=_blank>2012款宝来 1.4T 手动Sportline </A><I 
            id=base_7_img_10170></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10167 scope=col><B href="#/m10167/" 
            target=_blank>2012款宝来 1.4T DSG 舒适型 </A><I id=base_7_img_10167></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10169 scope=col><B href="#/m10169/" 
            target=_blank>2012款宝来 1.4T DSG 豪华型 </A><I id=base_7_img_10169></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10171 scope=col><B href="#/m10171/" 
            target=_blank>2012款宝来 1.4T DSG Sportline </A><I 
            id=base_7_img_10171></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10161 scope=col><B href="#/m10161/" 
            target=_blank>2012款宝来 1.6L 手动时尚型 </A><I id=base_7_img_10161></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10163 scope=col><B href="#/m10163/" 
            target=_blank>2012款宝来 1.6L 手动舒适型 </A><I id=base_7_img_10163></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10162 scope=col><B href="#/m10162/" 
            target=_blank>2012款宝来 1.6L 自动时尚型 </A><I id=base_7_img_10162></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10164 scope=col><B href="#/m10164/" 
            target=_blank>2012款宝来 1.6L 自动舒适型 </A><I id=base_7_img_10164></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10165 scope=col><B href="#/m10165/" 
            target=_blank>2012款宝来 1.6L 自动豪华型 </A><I id=base_7_img_10165></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isdairbag_10166>●</TD>
          <TD id=m_isdairbag_10168>●</TD>
          <TD id=m_isdairbag_10170>●</TD>
          <TD id=m_isdairbag_10167>●</TD>
          <TD id=m_isdairbag_10169>●</TD>
          <TD id=m_isdairbag_10171>●</TD>
          <TD id=m_isdairbag_10161>●</TD>
          <TD id=m_isdairbag_10163>●</TD>
          <TD id=m_isdairbag_10162>●</TD>
          <TD id=m_isdairbag_10164>●</TD>
          <TD id=m_isdairbag_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isadairbag_10166>●</TD>
          <TD id=m_isadairbag_10168>●</TD>
          <TD id=m_isadairbag_10170>●</TD>
          <TD id=m_isadairbag_10167>●</TD>
          <TD id=m_isadairbag_10169>●</TD>
          <TD id=m_isadairbag_10171>●</TD>
          <TD id=m_isadairbag_10161>●</TD>
          <TD id=m_isadairbag_10163>●</TD>
          <TD id=m_isadairbag_10162>●</TD>
          <TD id=m_isadairbag_10164>●</TD>
          <TD id=m_isadairbag_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isfhairbag_10166>-</TD>
          <TD id=m_isfhairbag_10168>-</TD>
          <TD id=m_isfhairbag_10170>-</TD>
          <TD id=m_isfhairbag_10167>-</TD>
          <TD id=m_isfhairbag_10169>-</TD>
          <TD id=m_isfhairbag_10171>-</TD>
          <TD id=m_isfhairbag_10161>-</TD>
          <TD id=m_isfhairbag_10163>-</TD>
          <TD id=m_isfhairbag_10162>-</TD>
          <TD id=m_isfhairbag_10164>-</TD>
          <TD id=m_isfhairbag_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isbhairbag_10166>-</TD>
          <TD id=m_isbhairbag_10168>-</TD>
          <TD id=m_isbhairbag_10170>-</TD>
          <TD id=m_isbhairbag_10167>-</TD>
          <TD id=m_isbhairbag_10169>-</TD>
          <TD id=m_isbhairbag_10171>-</TD>
          <TD id=m_isbhairbag_10161>-</TD>
          <TD id=m_isbhairbag_10163>-</TD>
          <TD id=m_isbhairbag_10162>-</TD>
          <TD id=m_isbhairbag_10164>-</TD>
          <TD id=m_isbhairbag_10165>-</TD></TR>
        <TR class=disc>
          <TD id=m_isfsairbag_10166>●</TD>
          <TD id=m_isfsairbag_10168>●</TD>
          <TD id=m_isfsairbag_10170>●</TD>
          <TD id=m_isfsairbag_10167>●</TD>
          <TD id=m_isfsairbag_10169>●</TD>
          <TD id=m_isfsairbag_10171>●</TD>
          <TD id=m_isfsairbag_10161>-</TD>
          <TD id=m_isfsairbag_10163>●</TD>
          <TD id=m_isfsairbag_10162>-</TD>
          <TD id=m_isfsairbag_10164>●</TD>
          <TD id=m_isfsairbag_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbsairbag_10166>-</TD>
          <TD id=m_isbsairbag_10168>-</TD>
          <TD id=m_isbsairbag_10170>-</TD>
          <TD id=m_isbsairbag_10167>-</TD>
          <TD id=m_isbsairbag_10169>-</TD>
          <TD id=m_isbsairbag_10171>-</TD>
          <TD id=m_isbsairbag_10161>-</TD>
          <TD id=m_isbsairbag_10163>-</TD>
          <TD id=m_isbsairbag_10162>-</TD>
          <TD id=m_isbsairbag_10164>-</TD>
          <TD id=m_isbsairbag_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_iskairbag_10166>-</TD>
          <TD id=m_iskairbag_10168>-</TD>
          <TD id=m_iskairbag_10170>-</TD>
          <TD id=m_iskairbag_10167>-</TD>
          <TD id=m_iskairbag_10169>-</TD>
          <TD id=m_iskairbag_10171>-</TD>
          <TD id=m_iskairbag_10161>-</TD>
          <TD id=m_iskairbag_10163>-</TD>
          <TD id=m_iskairbag_10162>-</TD>
          <TD id=m_iskairbag_10164>-</TD>
          <TD id=m_iskairbag_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatbeltti_10166>●</TD>
          <TD id=m_isseatbeltti_10168>●</TD>
          <TD id=m_isseatbeltti_10170>●</TD>
          <TD id=m_isseatbeltti_10167>●</TD>
          <TD id=m_isseatbeltti_10169>●</TD>
          <TD id=m_isseatbeltti_10171>●</TD>
          <TD id=m_isseatbeltti_10161>●</TD>
          <TD id=m_isseatbeltti_10163>●</TD>
          <TD id=m_isseatbeltti_10162>●</TD>
          <TD id=m_isseatbeltti_10164>●</TD>
          <TD id=m_isseatbeltti_10165>●</TD></TR>
        <TR class=disc>
          <TD id=m_iseanti_10166>●</TD>
          <TD id=m_iseanti_10168>●</TD>
          <TD id=m_iseanti_10170>●</TD>
          <TD id=m_iseanti_10167>●</TD>
          <TD id=m_iseanti_10169>●</TD>
          <TD id=m_iseanti_10171>●</TD>
          <TD id=m_iseanti_10161>●</TD>
          <TD id=m_iseanti_10163>●</TD>
          <TD id=m_iseanti_10162>●</TD>
          <TD id=m_iseanti_10164>●</TD>
          <TD id=m_iseanti_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscclock_10166>●</TD>
          <TD id=m_iscclock_10168>●</TD>
          <TD id=m_iscclock_10170>●</TD>
          <TD id=m_iscclock_10167>●</TD>
          <TD id=m_iscclock_10169>●</TD>
          <TD id=m_iscclock_10171>●</TD>
          <TD id=m_iscclock_10161>●</TD>
          <TD id=m_iscclock_10163>●</TD>
          <TD id=m_iscclock_10162>●</TD>
          <TD id=m_iscclock_10164>●</TD>
          <TD id=m_iscclock_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isrekey_10166>●</TD>
          <TD id=m_isrekey_10168>●</TD>
          <TD id=m_isrekey_10170>●</TD>
          <TD id=m_isrekey_10167>●</TD>
          <TD id=m_isrekey_10169>●</TD>
          <TD id=m_isrekey_10171>●</TD>
          <TD id=m_isrekey_10161>●</TD>
          <TD id=m_isrekey_10163>●</TD>
          <TD id=m_isrekey_10162>●</TD>
          <TD id=m_isrekey_10164>●</TD>
          <TD id=m_isrekey_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isnokeysys_10166>-</TD>
          <TD id=m_isnokeysys_10168>-</TD>
          <TD id=m_isnokeysys_10170>-</TD>
          <TD id=m_isnokeysys_10167>-</TD>
          <TD id=m_isnokeysys_10169>-</TD>
          <TD id=m_isnokeysys_10171>-</TD>
          <TD id=m_isnokeysys_10161>-</TD>
          <TD id=m_isnokeysys_10163>-</TD>
          <TD id=m_isnokeysys_10162>-</TD>
          <TD id=m_isnokeysys_10164>-</TD>
          <TD id=m_isnokeysys_10165>-</TD></TR>
        <TR id=base_8>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10166 scope=col><B href="#/m10166/" 
            target=_blank>2012款宝来 1.4T 手动舒适型 </A><I id=base_8_img_10166></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10168 scope=col><B href="#/m10168/" 
            target=_blank>2012款宝来 1.4T 手动豪华型 </A><I id=base_8_img_10168></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10170 scope=col><B href="#/m10170/" 
            target=_blank>2012款宝来 1.4T 手动Sportline </A><I 
            id=base_8_img_10170></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10167 scope=col><B href="#/m10167/" 
            target=_blank>2012款宝来 1.4T DSG 舒适型 </A><I id=base_8_img_10167></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10169 scope=col><B href="#/m10169/" 
            target=_blank>2012款宝来 1.4T DSG 豪华型 </A><I id=base_8_img_10169></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10171 scope=col><B href="#/m10171/" 
            target=_blank>2012款宝来 1.4T DSG Sportline </A><I 
            id=base_8_img_10171></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10161 scope=col><B href="#/m10161/" 
            target=_blank>2012款宝来 1.6L 手动时尚型 </A><I id=base_8_img_10161></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10163 scope=col><B href="#/m10163/" 
            target=_blank>2012款宝来 1.6L 手动舒适型 </A><I id=base_8_img_10163></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10162 scope=col><B href="#/m10162/" 
            target=_blank>2012款宝来 1.6L 自动时尚型 </A><I id=base_8_img_10162></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10164 scope=col><B href="#/m10164/" 
            target=_blank>2012款宝来 1.6L 自动舒适型 </A><I id=base_8_img_10164></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10165 scope=col><B href="#/m10165/" 
            target=_blank>2012款宝来 1.6L 自动豪华型 </A><I id=base_8_img_10165></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isabs_10166>●</TD>
          <TD id=m_isabs_10168>●</TD>
          <TD id=m_isabs_10170>●</TD>
          <TD id=m_isabs_10167>●</TD>
          <TD id=m_isabs_10169>●</TD>
          <TD id=m_isabs_10171>●</TD>
          <TD id=m_isabs_10161>●</TD>
          <TD id=m_isabs_10163>●</TD>
          <TD id=m_isabs_10162>●</TD>
          <TD id=m_isabs_10164>●</TD>
          <TD id=m_isabs_10165>●</TD></TR>
        <TR class=disc>
          <TD id=m_isesp_10166>-</TD>
          <TD id=m_isesp_10168>-</TD>
          <TD id=m_isesp_10170>-</TD>
          <TD id=m_isesp_10167>●</TD>
          <TD id=m_isesp_10169>●</TD>
          <TD id=m_isesp_10171>●</TD>
          <TD id=m_isesp_10161>-</TD>
          <TD id=m_isesp_10163>-</TD>
          <TD id=m_isesp_10162>-</TD>
          <TD id=m_isesp_10164>-</TD>
          <TD id=m_isesp_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isadsus_10166>-</TD>
          <TD id=m_isadsus_10168>-</TD>
          <TD id=m_isadsus_10170>-</TD>
          <TD id=m_isadsus_10167>-</TD>
          <TD id=m_isadsus_10169>-</TD>
          <TD id=m_isadsus_10171>-</TD>
          <TD id=m_isadsus_10161>-</TD>
          <TD id=m_isadsus_10163>-</TD>
          <TD id=m_isadsus_10162>-</TD>
          <TD id=m_isadsus_10164>-</TD>
          <TD id=m_isadsus_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_istpmonitor_10166>-</TD>
          <TD id=m_istpmonitor_10168>-</TD>
          <TD id=m_istpmonitor_10170>-</TD>
          <TD id=m_istpmonitor_10167>-</TD>
          <TD id=m_istpmonitor_10169>-</TD>
          <TD id=m_istpmonitor_10171>-</TD>
          <TD id=m_istpmonitor_10161>-</TD>
          <TD id=m_istpmonitor_10163>-</TD>
          <TD id=m_istpmonitor_10162>-</TD>
          <TD id=m_istpmonitor_10164>-</TD>
          <TD id=m_istpmonitor_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_istpruning_10166>-</TD>
          <TD id=m_istpruning_10168>-</TD>
          <TD id=m_istpruning_10170>-</TD>
          <TD id=m_istpruning_10167>-</TD>
          <TD id=m_istpruning_10169>-</TD>
          <TD id=m_istpruning_10171>-</TD>
          <TD id=m_istpruning_10161>-</TD>
          <TD id=m_istpruning_10163>-</TD>
          <TD id=m_istpruning_10162>-</TD>
          <TD id=m_istpruning_10164>-</TD>
          <TD id=m_istpruning_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isfsteering_10166>- </TD>
          <TD id=m_isfsteering_10168>- </TD>
          <TD id=m_isfsteering_10170>- </TD>
          <TD id=m_isfsteering_10167>- </TD>
          <TD id=m_isfsteering_10169>- </TD>
          <TD id=m_isfsteering_10171>- </TD>
          <TD id=m_isfsteering_10161>- </TD>
          <TD id=m_isfsteering_10163>- </TD>
          <TD id=m_isfsteering_10162>- </TD>
          <TD id=m_isfsteering_10164>- </TD>
          <TD id=m_isfsteering_10165>- </TD></TR>
        <TR class=hidd>
          <TD id=m_issteesys_10166>-</TD>
          <TD id=m_issteesys_10168>-</TD>
          <TD id=m_issteesys_10170>-</TD>
          <TD id=m_issteesys_10167>-</TD>
          <TD id=m_issteesys_10169>-</TD>
          <TD id=m_issteesys_10171>-</TD>
          <TD id=m_issteesys_10161>-</TD>
          <TD id=m_issteesys_10163>-</TD>
          <TD id=m_issteesys_10162>-</TD>
          <TD id=m_issteesys_10164>-</TD>
          <TD id=m_issteesys_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isuphillassist_10166>-</TD>
          <TD id=m_isuphillassist_10168>-</TD>
          <TD id=m_isuphillassist_10170>-</TD>
          <TD id=m_isuphillassist_10167>-</TD>
          <TD id=m_isuphillassist_10169>-</TD>
          <TD id=m_isuphillassist_10171>-</TD>
          <TD id=m_isuphillassist_10161>-</TD>
          <TD id=m_isuphillassist_10163>-</TD>
          <TD id=m_isuphillassist_10162>-</TD>
          <TD id=m_isuphillassist_10164>-</TD>
          <TD id=m_isuphillassist_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isandstitch_10166>-</TD>
          <TD id=m_isandstitch_10168>-</TD>
          <TD id=m_isandstitch_10170>-</TD>
          <TD id=m_isandstitch_10167>-</TD>
          <TD id=m_isandstitch_10169>-</TD>
          <TD id=m_isandstitch_10171>-</TD>
          <TD id=m_isandstitch_10161>-</TD>
          <TD id=m_isandstitch_10163>-</TD>
          <TD id=m_isandstitch_10162>-</TD>
          <TD id=m_isandstitch_10164>-</TD>
          <TD id=m_isandstitch_10165>-</TD></TR>
        <TR id=base_9>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10166 scope=col><B href="#/m10166/" 
            target=_blank>2012款宝来 1.4T 手动舒适型 </A><I id=base_9_img_10166></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10168 scope=col><B href="#/m10168/" 
            target=_blank>2012款宝来 1.4T 手动豪华型 </A><I id=base_9_img_10168></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10170 scope=col><B href="#/m10170/" 
            target=_blank>2012款宝来 1.4T 手动Sportline </A><I 
            id=base_9_img_10170></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10167 scope=col><B href="#/m10167/" 
            target=_blank>2012款宝来 1.4T DSG 舒适型 </A><I id=base_9_img_10167></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10169 scope=col><B href="#/m10169/" 
            target=_blank>2012款宝来 1.4T DSG 豪华型 </A><I id=base_9_img_10169></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10171 scope=col><B href="#/m10171/" 
            target=_blank>2012款宝来 1.4T DSG Sportline </A><I 
            id=base_9_img_10171></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10161 scope=col><B href="#/m10161/" 
            target=_blank>2012款宝来 1.6L 手动时尚型 </A><I id=base_9_img_10161></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10163 scope=col><B href="#/m10163/" 
            target=_blank>2012款宝来 1.6L 手动舒适型 </A><I id=base_9_img_10163></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10162 scope=col><B href="#/m10162/" 
            target=_blank>2012款宝来 1.6L 自动时尚型 </A><I id=base_9_img_10162></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10164 scope=col><B href="#/m10164/" 
            target=_blank>2012款宝来 1.6L 自动舒适型 </A><I id=base_9_img_10164></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10165 scope=col><B href="#/m10165/" 
            target=_blank>2012款宝来 1.6L 自动豪华型 </A><I id=base_9_img_10165></I> </TH></TR>
        <TR class=disc>
          <TD id=m_iswindow_10166>●</TD>
          <TD id=m_iswindow_10168>●</TD>
          <TD id=m_iswindow_10170>●</TD>
          <TD id=m_iswindow_10167>●</TD>
          <TD id=m_iswindow_10169>●</TD>
          <TD id=m_iswindow_10171>●</TD>
          <TD id=m_iswindow_10161>-</TD>
          <TD id=m_iswindow_10163>●</TD>
          <TD id=m_iswindow_10162>-</TD>
          <TD id=m_iswindow_10164>●</TD>
          <TD id=m_iswindow_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isarwindow_10166>-</TD>
          <TD id=m_isarwindow_10168>-</TD>
          <TD id=m_isarwindow_10170>-</TD>
          <TD id=m_isarwindow_10167>-</TD>
          <TD id=m_isarwindow_10169>-</TD>
          <TD id=m_isarwindow_10171>-</TD>
          <TD id=m_isarwindow_10161>-</TD>
          <TD id=m_isarwindow_10163>-</TD>
          <TD id=m_isarwindow_10162>-</TD>
          <TD id=m_isarwindow_10164>-</TD>
          <TD id=m_isarwindow_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isspround_10166>-</TD>
          <TD id=m_isspround_10168>-</TD>
          <TD id=m_isspround_10170>-</TD>
          <TD id=m_isspround_10167>-</TD>
          <TD id=m_isspround_10169>-</TD>
          <TD id=m_isspround_10171>-</TD>
          <TD id=m_isspround_10161>-</TD>
          <TD id=m_isspround_10163>-</TD>
          <TD id=m_isspround_10162>-</TD>
          <TD id=m_isspround_10164>-</TD>
          <TD id=m_isspround_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isaluhub_10166>●</TD>
          <TD id=m_isaluhub_10168>●</TD>
          <TD id=m_isaluhub_10170>●</TD>
          <TD id=m_isaluhub_10167>●</TD>
          <TD id=m_isaluhub_10169>●</TD>
          <TD id=m_isaluhub_10171>●</TD>
          <TD id=m_isaluhub_10161>●</TD>
          <TD id=m_isaluhub_10163>●</TD>
          <TD id=m_isaluhub_10162>●</TD>
          <TD id=m_isaluhub_10164>●</TD>
          <TD id=m_isaluhub_10165>●</TD></TR>
        <TR id=base_10>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10166 scope=col><B href="#/m10166/" 
            target=_blank>2012款宝来 1.4T 手动舒适型 </A><I id=base_10_img_10166></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10168 scope=col><B href="#/m10168/" 
            target=_blank>2012款宝来 1.4T 手动豪华型 </A><I id=base_10_img_10168></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10170 scope=col><B href="#/m10170/" 
            target=_blank>2012款宝来 1.4T 手动Sportline </A><I 
            id=base_10_img_10170></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10167 scope=col><B href="#/m10167/" 
            target=_blank>2012款宝来 1.4T DSG 舒适型 </A><I id=base_10_img_10167></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10169 scope=col><B href="#/m10169/" 
            target=_blank>2012款宝来 1.4T DSG 豪华型 </A><I id=base_10_img_10169></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10171 scope=col><B href="#/m10171/" 
            target=_blank>2012款宝来 1.4T DSG Sportline </A><I 
            id=base_10_img_10171></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10161 scope=col><B href="#/m10161/" 
            target=_blank>2012款宝来 1.6L 手动时尚型 </A><I id=base_10_img_10161></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10163 scope=col><B href="#/m10163/" 
            target=_blank>2012款宝来 1.6L 手动舒适型 </A><I id=base_10_img_10163></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10162 scope=col><B href="#/m10162/" 
            target=_blank>2012款宝来 1.6L 自动时尚型 </A><I id=base_10_img_10162></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10164 scope=col><B href="#/m10164/" 
            target=_blank>2012款宝来 1.6L 自动舒适型 </A><I id=base_10_img_10164></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10165 scope=col><B href="#/m10165/" 
            target=_blank>2012款宝来 1.6L 自动豪华型 </A><I id=base_10_img_10165></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isleasw_10166>●</TD>
          <TD id=m_isleasw_10168>●</TD>
          <TD id=m_isleasw_10170>●</TD>
          <TD id=m_isleasw_10167>●</TD>
          <TD id=m_isleasw_10169>●</TD>
          <TD id=m_isleasw_10171>●</TD>
          <TD id=m_isleasw_10161>-</TD>
          <TD id=m_isleasw_10163>●</TD>
          <TD id=m_isleasw_10162>-</TD>
          <TD id=m_isleasw_10164>●</TD>
          <TD id=m_isleasw_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswud_10166>●</TD>
          <TD id=m_isswud_10168>●</TD>
          <TD id=m_isswud_10170>●</TD>
          <TD id=m_isswud_10167>●</TD>
          <TD id=m_isswud_10169>●</TD>
          <TD id=m_isswud_10171>●</TD>
          <TD id=m_isswud_10161>●</TD>
          <TD id=m_isswud_10163>●</TD>
          <TD id=m_isswud_10162>●</TD>
          <TD id=m_isswud_10164>●</TD>
          <TD id=m_isswud_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswfb_10166>-</TD>
          <TD id=m_isswfb_10168>-</TD>
          <TD id=m_isswfb_10170>-</TD>
          <TD id=m_isswfb_10167>-</TD>
          <TD id=m_isswfb_10169>-</TD>
          <TD id=m_isswfb_10171>-</TD>
          <TD id=m_isswfb_10161>-</TD>
          <TD id=m_isswfb_10163>-</TD>
          <TD id=m_isswfb_10162>-</TD>
          <TD id=m_isswfb_10164>-</TD>
          <TD id=m_isswfb_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ismultisw_10166>-</TD>
          <TD id=m_ismultisw_10168>-</TD>
          <TD id=m_ismultisw_10170>-</TD>
          <TD id=m_ismultisw_10167>-</TD>
          <TD id=m_ismultisw_10169>-</TD>
          <TD id=m_ismultisw_10171>-</TD>
          <TD id=m_ismultisw_10161>-</TD>
          <TD id=m_ismultisw_10163>-</TD>
          <TD id=m_ismultisw_10162>-</TD>
          <TD id=m_ismultisw_10164>-</TD>
          <TD id=m_ismultisw_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isswshift_10166>-</TD>
          <TD id=m_isswshift_10168>-</TD>
          <TD id=m_isswshift_10170>-</TD>
          <TD id=m_isswshift_10167>-</TD>
          <TD id=m_isswshift_10169>-</TD>
          <TD id=m_isswshift_10171>-</TD>
          <TD id=m_isswshift_10161>-</TD>
          <TD id=m_isswshift_10163>-</TD>
          <TD id=m_isswshift_10162>-</TD>
          <TD id=m_isswshift_10164>-</TD>
          <TD id=m_isswshift_10165>-</TD></TR>
        <TR class=disc>
          <TD id=m_isascd_10166>●</TD>
          <TD id=m_isascd_10168>●</TD>
          <TD id=m_isascd_10170>●</TD>
          <TD id=m_isascd_10167>●</TD>
          <TD id=m_isascd_10169>●</TD>
          <TD id=m_isascd_10171>●</TD>
          <TD id=m_isascd_10161>-</TD>
          <TD id=m_isascd_10163>●</TD>
          <TD id=m_isascd_10162>-</TD>
          <TD id=m_isascd_10164>●</TD>
          <TD id=m_isascd_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isassibc_10166>●</TD>
          <TD id=m_isassibc_10168>●</TD>
          <TD id=m_isassibc_10170>●</TD>
          <TD id=m_isassibc_10167>●</TD>
          <TD id=m_isassibc_10169>●</TD>
          <TD id=m_isassibc_10171>●</TD>
          <TD id=m_isassibc_10161>●</TD>
          <TD id=m_isassibc_10163>●</TD>
          <TD id=m_isassibc_10162>●</TD>
          <TD id=m_isassibc_10164>●</TD>
          <TD id=m_isassibc_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isparkvideo_10166>-</TD>
          <TD id=m_isparkvideo_10168>-</TD>
          <TD id=m_isparkvideo_10170>-</TD>
          <TD id=m_isparkvideo_10167>-</TD>
          <TD id=m_isparkvideo_10169>-</TD>
          <TD id=m_isparkvideo_10171>-</TD>
          <TD id=m_isparkvideo_10161>-</TD>
          <TD id=m_isparkvideo_10163>-</TD>
          <TD id=m_isparkvideo_10162>-</TD>
          <TD id=m_isparkvideo_10164>-</TD>
          <TD id=m_isparkvideo_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ispark_10166>-</TD>
          <TD id=m_ispark_10168>-</TD>
          <TD id=m_ispark_10170>-</TD>
          <TD id=m_ispark_10167>-</TD>
          <TD id=m_ispark_10169>-</TD>
          <TD id=m_ispark_10171>-</TD>
          <TD id=m_ispark_10161>-</TD>
          <TD id=m_ispark_10163>-</TD>
          <TD id=m_ispark_10162>-</TD>
          <TD id=m_ispark_10164>-</TD>
          <TD id=m_ispark_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ishud_10166>-</TD>
          <TD id=m_ishud_10168>-</TD>
          <TD id=m_ishud_10170>-</TD>
          <TD id=m_ishud_10167>-</TD>
          <TD id=m_ishud_10169>-</TD>
          <TD id=m_ishud_10171>-</TD>
          <TD id=m_ishud_10161>-</TD>
          <TD id=m_ishud_10163>-</TD>
          <TD id=m_ishud_10162>-</TD>
          <TD id=m_ishud_10164>-</TD>
          <TD id=m_ishud_10165>-</TD></TR>
        <TR id=base_11>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10166 scope=col><B href="#/m10166/" 
            target=_blank>2012款宝来 1.4T 手动舒适型 </A><I id=base_11_img_10166></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10168 scope=col><B href="#/m10168/" 
            target=_blank>2012款宝来 1.4T 手动豪华型 </A><I id=base_11_img_10168></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10170 scope=col><B href="#/m10170/" 
            target=_blank>2012款宝来 1.4T 手动Sportline </A><I 
            id=base_11_img_10170></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10167 scope=col><B href="#/m10167/" 
            target=_blank>2012款宝来 1.4T DSG 舒适型 </A><I id=base_11_img_10167></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10169 scope=col><B href="#/m10169/" 
            target=_blank>2012款宝来 1.4T DSG 豪华型 </A><I id=base_11_img_10169></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10171 scope=col><B href="#/m10171/" 
            target=_blank>2012款宝来 1.4T DSG Sportline </A><I 
            id=base_11_img_10171></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10161 scope=col><B href="#/m10161/" 
            target=_blank>2012款宝来 1.6L 手动时尚型 </A><I id=base_11_img_10161></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10163 scope=col><B href="#/m10163/" 
            target=_blank>2012款宝来 1.6L 手动舒适型 </A><I id=base_11_img_10163></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10162 scope=col><B href="#/m10162/" 
            target=_blank>2012款宝来 1.6L 自动时尚型 </A><I id=base_11_img_10162></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10164 scope=col><B href="#/m10164/" 
            target=_blank>2012款宝来 1.6L 自动舒适型 </A><I id=base_11_img_10164></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10165 scope=col><B href="#/m10165/" 
            target=_blank>2012款宝来 1.6L 自动豪华型 </A><I id=base_11_img_10165></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isleaseat_10166>●</TD>
          <TD id=m_isleaseat_10168>●</TD>
          <TD id=m_isleaseat_10170>●</TD>
          <TD id=m_isleaseat_10167>●</TD>
          <TD id=m_isleaseat_10169>●</TD>
          <TD id=m_isleaseat_10171>●</TD>
          <TD id=m_isleaseat_10161>-</TD>
          <TD id=m_isleaseat_10163>●</TD>
          <TD id=m_isleaseat_10162>-</TD>
          <TD id=m_isleaseat_10164>●</TD>
          <TD id=m_isleaseat_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatadj_10166>●</TD>
          <TD id=m_isseatadj_10168>●</TD>
          <TD id=m_isseatadj_10170>●</TD>
          <TD id=m_isseatadj_10167>●</TD>
          <TD id=m_isseatadj_10169>●</TD>
          <TD id=m_isseatadj_10171>●</TD>
          <TD id=m_isseatadj_10161>●</TD>
          <TD id=m_isseatadj_10163>●</TD>
          <TD id=m_isseatadj_10162>●</TD>
          <TD id=m_isseatadj_10164>●</TD>
          <TD id=m_isseatadj_10165>●</TD></TR>
        <TR class=disc>
          <TD id=m_iswaistadj_10166>●</TD>
          <TD id=m_iswaistadj_10168>●</TD>
          <TD id=m_iswaistadj_10170>●</TD>
          <TD id=m_iswaistadj_10167>●</TD>
          <TD id=m_iswaistadj_10169>●</TD>
          <TD id=m_iswaistadj_10171>●</TD>
          <TD id=m_iswaistadj_10161>-</TD>
          <TD id=m_iswaistadj_10163>●</TD>
          <TD id=m_iswaistadj_10162>-</TD>
          <TD id=m_iswaistadj_10164>●</TD>
          <TD id=m_iswaistadj_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isfseatadj_10166>-</TD>
          <TD id=m_isfseatadj_10168>-</TD>
          <TD id=m_isfseatadj_10170>-</TD>
          <TD id=m_isfseatadj_10167>-</TD>
          <TD id=m_isfseatadj_10169>-</TD>
          <TD id=m_isfseatadj_10171>-</TD>
          <TD id=m_isfseatadj_10161>-</TD>
          <TD id=m_isfseatadj_10163>-</TD>
          <TD id=m_isfseatadj_10162>-</TD>
          <TD id=m_isfseatadj_10164>-</TD>
          <TD id=m_isfseatadj_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_iseseatmem_10166>-</TD>
          <TD id=m_iseseatmem_10168>-</TD>
          <TD id=m_iseseatmem_10170>-</TD>
          <TD id=m_iseseatmem_10167>-</TD>
          <TD id=m_iseseatmem_10169>-</TD>
          <TD id=m_iseseatmem_10171>-</TD>
          <TD id=m_iseseatmem_10161>-</TD>
          <TD id=m_iseseatmem_10163>-</TD>
          <TD id=m_iseseatmem_10162>-</TD>
          <TD id=m_iseseatmem_10164>-</TD>
          <TD id=m_iseseatmem_10165>-</TD></TR>
        <TR class=disc>
          <TD id=m_isseathot_10166>-</TD>
          <TD id=m_isseathot_10168>●</TD>
          <TD id=m_isseathot_10170>-</TD>
          <TD id=m_isseathot_10167>-</TD>
          <TD id=m_isseathot_10169>●</TD>
          <TD id=m_isseathot_10171>-</TD>
          <TD id=m_isseathot_10161>-</TD>
          <TD id=m_isseathot_10163>-</TD>
          <TD id=m_isseathot_10162>-</TD>
          <TD id=m_isseathot_10164>-</TD>
          <TD id=m_isseathot_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatknead_10166>-</TD>
          <TD id=m_isseatknead_10168>-</TD>
          <TD id=m_isseatknead_10170>-</TD>
          <TD id=m_isseatknead_10167>-</TD>
          <TD id=m_isseatknead_10169>-</TD>
          <TD id=m_isseatknead_10171>-</TD>
          <TD id=m_isseatknead_10161>-</TD>
          <TD id=m_isseatknead_10163>-</TD>
          <TD id=m_isseatknead_10162>-</TD>
          <TD id=m_isseatknead_10164>-</TD>
          <TD id=m_isseatknead_10165>-</TD></TR>
        <TR class=disc>
          <TD id=m_isbseatlay_10166>-</TD>
          <TD id=m_isbseatlay_10168>-</TD>
          <TD id=m_isbseatlay_10170>-</TD>
          <TD id=m_isbseatlay_10167>-</TD>
          <TD id=m_isbseatlay_10169>-</TD>
          <TD id=m_isbseatlay_10171>-</TD>
          <TD id=m_isbseatlay_10161>●</TD>
          <TD id=m_isbseatlay_10163>-</TD>
          <TD id=m_isbseatlay_10162>●</TD>
          <TD id=m_isbseatlay_10164>-</TD>
          <TD id=m_isbseatlay_10165>-</TD></TR>
        <TR class=disc>
          <TD id=m_isbseatplay_10166>●</TD>
          <TD id=m_isbseatplay_10168>●</TD>
          <TD id=m_isbseatplay_10170>●</TD>
          <TD id=m_isbseatplay_10167>●</TD>
          <TD id=m_isbseatplay_10169>●</TD>
          <TD id=m_isbseatplay_10171>●</TD>
          <TD id=m_isbseatplay_10161>-</TD>
          <TD id=m_isbseatplay_10163>●</TD>
          <TD id=m_isbseatplay_10162>-</TD>
          <TD id=m_isbseatplay_10164>●</TD>
          <TD id=m_isbseatplay_10165>●</TD></TR>
        <TR id=base_12>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10166 scope=col><B href="#/m10166/" 
            target=_blank>2012款宝来 1.4T 手动舒适型 </A><I id=base_12_img_10166></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10168 scope=col><B href="#/m10168/" 
            target=_blank>2012款宝来 1.4T 手动豪华型 </A><I id=base_12_img_10168></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10170 scope=col><B href="#/m10170/" 
            target=_blank>2012款宝来 1.4T 手动Sportline </A><I 
            id=base_12_img_10170></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10167 scope=col><B href="#/m10167/" 
            target=_blank>2012款宝来 1.4T DSG 舒适型 </A><I id=base_12_img_10167></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10169 scope=col><B href="#/m10169/" 
            target=_blank>2012款宝来 1.4T DSG 豪华型 </A><I id=base_12_img_10169></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10171 scope=col><B href="#/m10171/" 
            target=_blank>2012款宝来 1.4T DSG Sportline </A><I 
            id=base_12_img_10171></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10161 scope=col><B href="#/m10161/" 
            target=_blank>2012款宝来 1.6L 手动时尚型 </A><I id=base_12_img_10161></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10163 scope=col><B href="#/m10163/" 
            target=_blank>2012款宝来 1.6L 手动舒适型 </A><I id=base_12_img_10163></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10162 scope=col><B href="#/m10162/" 
            target=_blank>2012款宝来 1.6L 自动时尚型 </A><I id=base_12_img_10162></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10164 scope=col><B href="#/m10164/" 
            target=_blank>2012款宝来 1.6L 自动舒适型 </A><I id=base_12_img_10164></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10165 scope=col><B href="#/m10165/" 
            target=_blank>2012款宝来 1.6L 自动豪华型 </A><I id=base_12_img_10165></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isgps_10166>-</TD>
          <TD id=m_isgps_10168>-</TD>
          <TD id=m_isgps_10170>○</TD>
          <TD id=m_isgps_10167>-</TD>
          <TD id=m_isgps_10169>○</TD>
          <TD id=m_isgps_10171>○</TD>
          <TD id=m_isgps_10161>-</TD>
          <TD id=m_isgps_10163>-</TD>
          <TD id=m_isgps_10162>-</TD>
          <TD id=m_isgps_10164>-</TD>
          <TD id=m_isgps_10165>-</TD></TR>
        <TR class=disc>
          <TD id=m_isbluetooth_10166>-</TD>
          <TD id=m_isbluetooth_10168>-</TD>
          <TD id=m_isbluetooth_10170>○</TD>
          <TD id=m_isbluetooth_10167>-</TD>
          <TD id=m_isbluetooth_10169>○</TD>
          <TD id=m_isbluetooth_10171>○</TD>
          <TD id=m_isbluetooth_10161>-</TD>
          <TD id=m_isbluetooth_10163>-</TD>
          <TD id=m_isbluetooth_10162>-</TD>
          <TD id=m_isbluetooth_10164>-</TD>
          <TD id=m_isbluetooth_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_istv_10166>-</TD>
          <TD id=m_istv_10168>-</TD>
          <TD id=m_istv_10170>-</TD>
          <TD id=m_istv_10167>-</TD>
          <TD id=m_istv_10169>-</TD>
          <TD id=m_istv_10171>-</TD>
          <TD id=m_istv_10161>-</TD>
          <TD id=m_istv_10163>-</TD>
          <TD id=m_istv_10162>-</TD>
          <TD id=m_istv_10164>-</TD>
          <TD id=m_istv_10165>-</TD></TR>
        <TR class=disc>
          <TD id=m_iscclcd_10166>-</TD>
          <TD id=m_iscclcd_10168>-</TD>
          <TD id=m_iscclcd_10170>○</TD>
          <TD id=m_iscclcd_10167>-</TD>
          <TD id=m_iscclcd_10169>○</TD>
          <TD id=m_iscclcd_10171>○</TD>
          <TD id=m_iscclcd_10161>-</TD>
          <TD id=m_iscclcd_10163>-</TD>
          <TD id=m_iscclcd_10162>-</TD>
          <TD id=m_iscclcd_10164>-</TD>
          <TD id=m_iscclcd_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isblcd_10166>-</TD>
          <TD id=m_isblcd_10168>-</TD>
          <TD id=m_isblcd_10170>-</TD>
          <TD id=m_isblcd_10167>-</TD>
          <TD id=m_isblcd_10169>-</TD>
          <TD id=m_isblcd_10171>-</TD>
          <TD id=m_isblcd_10161>-</TD>
          <TD id=m_isblcd_10163>-</TD>
          <TD id=m_isblcd_10162>-</TD>
          <TD id=m_isblcd_10164>-</TD>
          <TD id=m_isblcd_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ismp3_10166>●</TD>
          <TD id=m_ismp3_10168>●</TD>
          <TD id=m_ismp3_10170>●</TD>
          <TD id=m_ismp3_10167>●</TD>
          <TD id=m_ismp3_10169>●</TD>
          <TD id=m_ismp3_10171>●</TD>
          <TD id=m_ismp3_10161>●</TD>
          <TD id=m_ismp3_10163>●</TD>
          <TD id=m_ismp3_10162>●</TD>
          <TD id=m_ismp3_10164>●</TD>
          <TD id=m_ismp3_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscd_10166>●</TD>
          <TD id=m_iscd_10168>●</TD>
          <TD id=m_iscd_10170>●</TD>
          <TD id=m_iscd_10167>●</TD>
          <TD id=m_iscd_10169>●</TD>
          <TD id=m_iscd_10171>●</TD>
          <TD id=m_iscd_10161>●</TD>
          <TD id=m_iscd_10163>●</TD>
          <TD id=m_iscd_10162>●</TD>
          <TD id=m_iscd_10164>●</TD>
          <TD id=m_iscd_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscd_10166>1 </TD>
          <TD id=m_iscd_10168>1 </TD>
          <TD id=m_iscd_10170>1 </TD>
          <TD id=m_iscd_10167>1 </TD>
          <TD id=m_iscd_10169>1 </TD>
          <TD id=m_iscd_10171>1 </TD>
          <TD id=m_iscd_10161>1 </TD>
          <TD id=m_iscd_10163>1 </TD>
          <TD id=m_iscd_10162>1 </TD>
          <TD id=m_iscd_10164>1 </TD>
          <TD id=m_iscd_10165>1 </TD></TR>
        <TR class=disc>
          <TD id=10166>-</TD>
          <TD id=10168>-</TD>
          <TD id=10170>- </TD>
          <TD id=10167>-</TD>
          <TD id=10169>- </TD>
          <TD id=10171>- </TD>
          <TD id=10161>-</TD>
          <TD id=10163>-</TD>
          <TD id=10162>-</TD>
          <TD id=10164>-</TD>
          <TD id=10165>-</TD></TR>
        <TR class=disc>
          <TD id=10166>- </TD>
          <TD id=10168>- </TD>
          <TD id=10170>- </TD>
          <TD id=10167>- </TD>
          <TD id=10169>- </TD>
          <TD id=10171>- </TD>
          <TD id=10161>- </TD>
          <TD id=10163>- </TD>
          <TD id=10162>- </TD>
          <TD id=10164>- </TD>
          <TD id=10165>- </TD></TR>
        <TR class=hidd>
          <TD id=m_is2audio_10166>-</TD>
          <TD id=m_is2audio_10168>-</TD>
          <TD id=m_is2audio_10170>-</TD>
          <TD id=m_is2audio_10167>-</TD>
          <TD id=m_is2audio_10169>-</TD>
          <TD id=m_is2audio_10171>-</TD>
          <TD id=m_is2audio_10161>-</TD>
          <TD id=m_is2audio_10163>-</TD>
          <TD id=m_is2audio_10162>-</TD>
          <TD id=m_is2audio_10164>-</TD>
          <TD id=m_is2audio_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_is4audio_10166>-</TD>
          <TD id=m_is4audio_10168>-</TD>
          <TD id=m_is4audio_10170>-</TD>
          <TD id=m_is4audio_10167>-</TD>
          <TD id=m_is4audio_10169>-</TD>
          <TD id=m_is4audio_10171>-</TD>
          <TD id=m_is4audio_10161>-</TD>
          <TD id=m_is4audio_10163>-</TD>
          <TD id=m_is4audio_10162>-</TD>
          <TD id=m_is4audio_10164>-</TD>
          <TD id=m_is4audio_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_is6audio_10166>●</TD>
          <TD id=m_is6audio_10168>●</TD>
          <TD id=m_is6audio_10170>●</TD>
          <TD id=m_is6audio_10167>●</TD>
          <TD id=m_is6audio_10169>●</TD>
          <TD id=m_is6audio_10171>●</TD>
          <TD id=m_is6audio_10161>●</TD>
          <TD id=m_is6audio_10163>●</TD>
          <TD id=m_is6audio_10162>●</TD>
          <TD id=m_is6audio_10164>●</TD>
          <TD id=m_is6audio_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_is8audio_10166>-</TD>
          <TD id=m_is8audio_10168>-</TD>
          <TD id=m_is8audio_10170>-</TD>
          <TD id=m_is8audio_10167>-</TD>
          <TD id=m_is8audio_10169>-</TD>
          <TD id=m_is8audio_10171>-</TD>
          <TD id=m_is8audio_10161>-</TD>
          <TD id=m_is8audio_10163>-</TD>
          <TD id=m_is8audio_10162>-</TD>
          <TD id=m_is8audio_10164>-</TD>
          <TD id=m_is8audio_10165>-</TD></TR>
        <TR id=base_13>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10166 scope=col><B href="#/m10166/" 
            target=_blank>2012款宝来 1.4T 手动舒适型 </A><I id=base_13_img_10166></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10168 scope=col><B href="#/m10168/" 
            target=_blank>2012款宝来 1.4T 手动豪华型 </A><I id=base_13_img_10168></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10170 scope=col><B href="#/m10170/" 
            target=_blank>2012款宝来 1.4T 手动Sportline </A><I 
            id=base_13_img_10170></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10167 scope=col><B href="#/m10167/" 
            target=_blank>2012款宝来 1.4T DSG 舒适型 </A><I id=base_13_img_10167></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10169 scope=col><B href="#/m10169/" 
            target=_blank>2012款宝来 1.4T DSG 豪华型 </A><I id=base_13_img_10169></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10171 scope=col><B href="#/m10171/" 
            target=_blank>2012款宝来 1.4T DSG Sportline </A><I 
            id=base_13_img_10171></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10161 scope=col><B href="#/m10161/" 
            target=_blank>2012款宝来 1.6L 手动时尚型 </A><I id=base_13_img_10161></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10163 scope=col><B href="#/m10163/" 
            target=_blank>2012款宝来 1.6L 手动舒适型 </A><I id=base_13_img_10163></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10162 scope=col><B href="#/m10162/" 
            target=_blank>2012款宝来 1.6L 自动时尚型 </A><I id=base_13_img_10162></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10164 scope=col><B href="#/m10164/" 
            target=_blank>2012款宝来 1.6L 自动舒适型 </A><I id=base_13_img_10164></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10165 scope=col><B href="#/m10165/" 
            target=_blank>2012款宝来 1.6L 自动豪华型 </A><I id=base_13_img_10165></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isxelamp_10166>-</TD>
          <TD id=m_isxelamp_10168>-</TD>
          <TD id=m_isxelamp_10170>-</TD>
          <TD id=m_isxelamp_10167>-</TD>
          <TD id=m_isxelamp_10169>-</TD>
          <TD id=m_isxelamp_10171>-</TD>
          <TD id=m_isxelamp_10161>-</TD>
          <TD id=m_isxelamp_10163>-</TD>
          <TD id=m_isxelamp_10162>-</TD>
          <TD id=m_isxelamp_10164>-</TD>
          <TD id=m_isxelamp_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isautohlamp_10166>-</TD>
          <TD id=m_isautohlamp_10168>-</TD>
          <TD id=m_isautohlamp_10170>-</TD>
          <TD id=m_isautohlamp_10167>-</TD>
          <TD id=m_isautohlamp_10169>-</TD>
          <TD id=m_isautohlamp_10171>-</TD>
          <TD id=m_isautohlamp_10161>-</TD>
          <TD id=m_isautohlamp_10163>-</TD>
          <TD id=m_isautohlamp_10162>-</TD>
          <TD id=m_isautohlamp_10164>-</TD>
          <TD id=m_isautohlamp_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isturnhlamp_10166>-</TD>
          <TD id=m_isturnhlamp_10168>-</TD>
          <TD id=m_isturnhlamp_10170>-</TD>
          <TD id=m_isturnhlamp_10167>-</TD>
          <TD id=m_isturnhlamp_10169>-</TD>
          <TD id=m_isturnhlamp_10171>-</TD>
          <TD id=m_isturnhlamp_10161>-</TD>
          <TD id=m_isturnhlamp_10163>-</TD>
          <TD id=m_isturnhlamp_10162>-</TD>
          <TD id=m_isturnhlamp_10164>-</TD>
          <TD id=m_isturnhlamp_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ishfoglamp_10166>●</TD>
          <TD id=m_ishfoglamp_10168>●</TD>
          <TD id=m_ishfoglamp_10170>●</TD>
          <TD id=m_ishfoglamp_10167>●</TD>
          <TD id=m_ishfoglamp_10169>●</TD>
          <TD id=m_ishfoglamp_10171>●</TD>
          <TD id=m_ishfoglamp_10161>●</TD>
          <TD id=m_ishfoglamp_10163>●</TD>
          <TD id=m_ishfoglamp_10162>●</TD>
          <TD id=m_ishfoglamp_10164>●</TD>
          <TD id=m_ishfoglamp_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbfoglamp_10166>●</TD>
          <TD id=m_isbfoglamp_10168>●</TD>
          <TD id=m_isbfoglamp_10170>●</TD>
          <TD id=m_isbfoglamp_10167>●</TD>
          <TD id=m_isbfoglamp_10169>●</TD>
          <TD id=m_isbfoglamp_10171>●</TD>
          <TD id=m_isbfoglamp_10161>●</TD>
          <TD id=m_isbfoglamp_10163>●</TD>
          <TD id=m_isbfoglamp_10162>●</TD>
          <TD id=m_isbfoglamp_10164>●</TD>
          <TD id=m_isbfoglamp_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_islampheiadj_10166>-</TD>
          <TD id=m_islampheiadj_10168>-</TD>
          <TD id=m_islampheiadj_10170>-</TD>
          <TD id=m_islampheiadj_10167>-</TD>
          <TD id=m_islampheiadj_10169>-</TD>
          <TD id=m_islampheiadj_10171>-</TD>
          <TD id=m_islampheiadj_10161>-</TD>
          <TD id=m_islampheiadj_10163>-</TD>
          <TD id=m_islampheiadj_10162>-</TD>
          <TD id=m_islampheiadj_10164>-</TD>
          <TD id=m_islampheiadj_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_islampclset_10166>-</TD>
          <TD id=m_islampclset_10168>-</TD>
          <TD id=m_islampclset_10170>-</TD>
          <TD id=m_islampclset_10167>-</TD>
          <TD id=m_islampclset_10169>-</TD>
          <TD id=m_islampclset_10171>-</TD>
          <TD id=m_islampclset_10161>-</TD>
          <TD id=m_islampclset_10163>-</TD>
          <TD id=m_islampclset_10162>-</TD>
          <TD id=m_islampclset_10164>-</TD>
          <TD id=m_islampclset_10165>-</TD></TR>
        <TR id=base_14>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10166 scope=col><B href="#/m10166/" 
            target=_blank>2012款宝来 1.4T 手动舒适型 </A><I id=base_14_img_10166></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10168 scope=col><B href="#/m10168/" 
            target=_blank>2012款宝来 1.4T 手动豪华型 </A><I id=base_14_img_10168></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10170 scope=col><B href="#/m10170/" 
            target=_blank>2012款宝来 1.4T 手动Sportline </A><I 
            id=base_14_img_10170></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10167 scope=col><B href="#/m10167/" 
            target=_blank>2012款宝来 1.4T DSG 舒适型 </A><I id=base_14_img_10167></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10169 scope=col><B href="#/m10169/" 
            target=_blank>2012款宝来 1.4T DSG 豪华型 </A><I id=base_14_img_10169></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10171 scope=col><B href="#/m10171/" 
            target=_blank>2012款宝来 1.4T DSG Sportline </A><I 
            id=base_14_img_10171></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10161 scope=col><B href="#/m10161/" 
            target=_blank>2012款宝来 1.6L 手动时尚型 </A><I id=base_14_img_10161></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10163 scope=col><B href="#/m10163/" 
            target=_blank>2012款宝来 1.6L 手动舒适型 </A><I id=base_14_img_10163></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10162 scope=col><B href="#/m10162/" 
            target=_blank>2012款宝来 1.6L 自动时尚型 </A><I id=base_14_img_10162></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10164 scope=col><B href="#/m10164/" 
            target=_blank>2012款宝来 1.6L 自动舒适型 </A><I id=base_14_img_10164></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10165 scope=col><B href="#/m10165/" 
            target=_blank>2012款宝来 1.6L 自动豪华型 </A><I id=base_14_img_10165></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isfewindow_10166>●</TD>
          <TD id=m_isfewindow_10168>●</TD>
          <TD id=m_isfewindow_10170>●</TD>
          <TD id=m_isfewindow_10167>●</TD>
          <TD id=m_isfewindow_10169>●</TD>
          <TD id=m_isfewindow_10171>●</TD>
          <TD id=m_isfewindow_10161>●</TD>
          <TD id=m_isfewindow_10163>●</TD>
          <TD id=m_isfewindow_10162>●</TD>
          <TD id=m_isfewindow_10164>●</TD>
          <TD id=m_isfewindow_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbewindow_10166>●</TD>
          <TD id=m_isbewindow_10168>●</TD>
          <TD id=m_isbewindow_10170>●</TD>
          <TD id=m_isbewindow_10167>●</TD>
          <TD id=m_isbewindow_10169>●</TD>
          <TD id=m_isbewindow_10171>●</TD>
          <TD id=m_isbewindow_10161>●</TD>
          <TD id=m_isbewindow_10163>●</TD>
          <TD id=m_isbewindow_10162>●</TD>
          <TD id=m_isbewindow_10164>●</TD>
          <TD id=m_isbewindow_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isgnhand_10166>●</TD>
          <TD id=m_isgnhand_10168>●</TD>
          <TD id=m_isgnhand_10170>●</TD>
          <TD id=m_isgnhand_10167>●</TD>
          <TD id=m_isgnhand_10169>●</TD>
          <TD id=m_isgnhand_10171>●</TD>
          <TD id=m_isgnhand_10161>●</TD>
          <TD id=m_isgnhand_10163>●</TD>
          <TD id=m_isgnhand_10162>●</TD>
          <TD id=m_isgnhand_10164>●</TD>
          <TD id=m_isgnhand_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ispreventionuv_10166>●</TD>
          <TD id=m_ispreventionuv_10168>●</TD>
          <TD id=m_ispreventionuv_10170>●</TD>
          <TD id=m_ispreventionuv_10167>●</TD>
          <TD id=m_ispreventionuv_10169>●</TD>
          <TD id=m_ispreventionuv_10171>●</TD>
          <TD id=m_ispreventionuv_10161>●</TD>
          <TD id=m_ispreventionuv_10163>●</TD>
          <TD id=m_ispreventionuv_10162>●</TD>
          <TD id=m_ispreventionuv_10164>●</TD>
          <TD id=m_ispreventionuv_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isermirror_10166>●</TD>
          <TD id=m_isermirror_10168>●</TD>
          <TD id=m_isermirror_10170>●</TD>
          <TD id=m_isermirror_10167>●</TD>
          <TD id=m_isermirror_10169>●</TD>
          <TD id=m_isermirror_10171>●</TD>
          <TD id=m_isermirror_10161>●</TD>
          <TD id=m_isermirror_10163>●</TD>
          <TD id=m_isermirror_10162>●</TD>
          <TD id=m_isermirror_10164>●</TD>
          <TD id=m_isermirror_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ishotrmirror_10166>-</TD>
          <TD id=m_ishotrmirror_10168>-</TD>
          <TD id=m_ishotrmirror_10170>-</TD>
          <TD id=m_ishotrmirror_10167>-</TD>
          <TD id=m_ishotrmirror_10169>-</TD>
          <TD id=m_ishotrmirror_10171>-</TD>
          <TD id=m_ishotrmirror_10161>-</TD>
          <TD id=m_ishotrmirror_10163>-</TD>
          <TD id=m_ishotrmirror_10162>-</TD>
          <TD id=m_ishotrmirror_10164>-</TD>
          <TD id=m_ishotrmirror_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ismemorymirror_10166>-</TD>
          <TD id=m_ismemorymirror_10168>-</TD>
          <TD id=m_ismemorymirror_10170>-</TD>
          <TD id=m_ismemorymirror_10167>-</TD>
          <TD id=m_ismemorymirror_10169>-</TD>
          <TD id=m_ismemorymirror_10171>-</TD>
          <TD id=m_ismemorymirror_10161>-</TD>
          <TD id=m_ismemorymirror_10163>-</TD>
          <TD id=m_ismemorymirror_10162>-</TD>
          <TD id=m_ismemorymirror_10164>-</TD>
          <TD id=m_ismemorymirror_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_iseprmirror_10166>-</TD>
          <TD id=m_iseprmirror_10168>-</TD>
          <TD id=m_iseprmirror_10170>-</TD>
          <TD id=m_iseprmirror_10167>-</TD>
          <TD id=m_iseprmirror_10169>-</TD>
          <TD id=m_iseprmirror_10171>-</TD>
          <TD id=m_iseprmirror_10161>-</TD>
          <TD id=m_iseprmirror_10163>-</TD>
          <TD id=m_iseprmirror_10162>-</TD>
          <TD id=m_iseprmirror_10164>-</TD>
          <TD id=m_iseprmirror_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isrmirrorge_10166>-</TD>
          <TD id=m_isrmirrorge_10168>-</TD>
          <TD id=m_isrmirrorge_10170>-</TD>
          <TD id=m_isrmirrorge_10167>-</TD>
          <TD id=m_isrmirrorge_10169>-</TD>
          <TD id=m_isrmirrorge_10171>-</TD>
          <TD id=m_isrmirrorge_10161>-</TD>
          <TD id=m_isrmirrorge_10163>-</TD>
          <TD id=m_isrmirrorge_10162>-</TD>
          <TD id=m_isrmirrorge_10164>-</TD>
          <TD id=m_isrmirrorge_10165>-</TD></TR>
        <TR class=disc>
          <TD id=m_isbsvisor_10166>- </TD>
          <TD id=m_isbsvisor_10168>- </TD>
          <TD id=m_isbsvisor_10170>- </TD>
          <TD id=m_isbsvisor_10167>- </TD>
          <TD id=m_isbsvisor_10169>- </TD>
          <TD id=m_isbsvisor_10171>- </TD>
          <TD id=m_isbsvisor_10161>- </TD>
          <TD id=m_isbsvisor_10163>- </TD>
          <TD id=m_isbsvisor_10162>- </TD>
          <TD id=m_isbsvisor_10164>- </TD>
          <TD id=m_isbsvisor_10165>- </TD></TR><!--	



			<tr class="hidd" >



				



				


					


						<td id="m_ishbsvisor_10166">-</td>



					


						<td id="m_ishbsvisor_10168">-</td>



					


						<td id="m_ishbsvisor_10170">-</td>



					


						<td id="m_ishbsvisor_10167">-</td>



					


						<td id="m_ishbsvisor_10169">-</td>



					


						<td id="m_ishbsvisor_10171">-</td>



					


						<td id="m_ishbsvisor_10161">-</td>



					


						<td id="m_ishbsvisor_10163">-</td>



					


						<td id="m_ishbsvisor_10162">-</td>



					


						<td id="m_ishbsvisor_10164">-</td>



					


						<td id="m_ishbsvisor_10165">-</td>



					


							</tr>







			<tr class="hidd" >



				



				


					


						<td id="m_isebsvisor_10166"> - </td>



					


						<td id="m_isebsvisor_10168"> - </td>



					


						<td id="m_isebsvisor_10170"> - </td>



					


						<td id="m_isebsvisor_10167"> - </td>



					


						<td id="m_isebsvisor_10169"> - </td>



					


						<td id="m_isebsvisor_10171"> - </td>



					


						<td id="m_isebsvisor_10161"> - </td>



					


						<td id="m_isebsvisor_10163"> - </td>



					


						<td id="m_isebsvisor_10162"> - </td>



					


						<td id="m_isebsvisor_10164"> - </td>



					


						<td id="m_isebsvisor_10165"> - </td>



					


							</tr>



-->
        <TR class=hidd>
          <TD id=m_isbssvisor_10166>-</TD>
          <TD id=m_isbssvisor_10168>-</TD>
          <TD id=m_isbssvisor_10170>-</TD>
          <TD id=m_isbssvisor_10167>-</TD>
          <TD id=m_isbssvisor_10169>-</TD>
          <TD id=m_isbssvisor_10171>-</TD>
          <TD id=m_isbssvisor_10161>-</TD>
          <TD id=m_isbssvisor_10163>-</TD>
          <TD id=m_isbssvisor_10162>-</TD>
          <TD id=m_isbssvisor_10164>-</TD>
          <TD id=m_isbssvisor_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_issvisordr_10166>●</TD>
          <TD id=m_issvisordr_10168>●</TD>
          <TD id=m_issvisordr_10170>●</TD>
          <TD id=m_issvisordr_10167>●</TD>
          <TD id=m_issvisordr_10169>●</TD>
          <TD id=m_issvisordr_10171>●</TD>
          <TD id=m_issvisordr_10161>●</TD>
          <TD id=m_issvisordr_10163>●</TD>
          <TD id=m_issvisordr_10162>●</TD>
          <TD id=m_issvisordr_10164>●</TD>
          <TD id=m_issvisordr_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isinswiper_10166>-</TD>
          <TD id=m_isinswiper_10168>-</TD>
          <TD id=m_isinswiper_10170>-</TD>
          <TD id=m_isinswiper_10167>-</TD>
          <TD id=m_isinswiper_10169>-</TD>
          <TD id=m_isinswiper_10171>-</TD>
          <TD id=m_isinswiper_10161>-</TD>
          <TD id=m_isinswiper_10163>-</TD>
          <TD id=m_isinswiper_10162>-</TD>
          <TD id=m_isinswiper_10164>-</TD>
          <TD id=m_isinswiper_10165>-</TD></TR>
        <TR id=base_15>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10166 scope=col><B href="#/m10166/" 
            target=_blank>2012款宝来 1.4T 手动舒适型 </A><I id=base_15_img_10166></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10168 scope=col><B href="#/m10168/" 
            target=_blank>2012款宝来 1.4T 手动豪华型 </A><I id=base_15_img_10168></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10170 scope=col><B href="#/m10170/" 
            target=_blank>2012款宝来 1.4T 手动Sportline </A><I 
            id=base_15_img_10170></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10167 scope=col><B href="#/m10167/" 
            target=_blank>2012款宝来 1.4T DSG 舒适型 </A><I id=base_15_img_10167></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10169 scope=col><B href="#/m10169/" 
            target=_blank>2012款宝来 1.4T DSG 豪华型 </A><I id=base_15_img_10169></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10171 scope=col><B href="#/m10171/" 
            target=_blank>2012款宝来 1.4T DSG Sportline </A><I 
            id=base_15_img_10171></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10161 scope=col><B href="#/m10161/" 
            target=_blank>2012款宝来 1.6L 手动时尚型 </A><I id=base_15_img_10161></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10163 scope=col><B href="#/m10163/" 
            target=_blank>2012款宝来 1.6L 手动舒适型 </A><I id=base_15_img_10163></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10162 scope=col><B href="#/m10162/" 
            target=_blank>2012款宝来 1.6L 自动时尚型 </A><I id=base_15_img_10162></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10164 scope=col><B href="#/m10164/" 
            target=_blank>2012款宝来 1.6L 自动舒适型 </A><I id=base_15_img_10164></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10165 scope=col><B href="#/m10165/" 
            target=_blank>2012款宝来 1.6L 自动豪华型 </A><I id=base_15_img_10165></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isairc_10166>●</TD>
          <TD id=m_isairc_10168>●</TD>
          <TD id=m_isairc_10170>●</TD>
          <TD id=m_isairc_10167>●</TD>
          <TD id=m_isairc_10169>●</TD>
          <TD id=m_isairc_10171>●</TD>
          <TD id=m_isairc_10161>●</TD>
          <TD id=m_isairc_10163>●</TD>
          <TD id=m_isairc_10162>●</TD>
          <TD id=m_isairc_10164>●</TD>
          <TD id=m_isairc_10165>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbsairo_10166>-</TD>
          <TD id=m_isbsairo_10168>-</TD>
          <TD id=m_isbsairo_10170>-</TD>
          <TD id=m_isbsairo_10167>-</TD>
          <TD id=m_isbsairo_10169>-</TD>
          <TD id=m_isbsairo_10171>-</TD>
          <TD id=m_isbsairo_10161>-</TD>
          <TD id=m_isbsairo_10163>-</TD>
          <TD id=m_isbsairo_10162>-</TD>
          <TD id=m_isbsairo_10164>-</TD>
          <TD id=m_isbsairo_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_istempdct_10166>-</TD>
          <TD id=m_istempdct_10168>-</TD>
          <TD id=m_istempdct_10170>-</TD>
          <TD id=m_istempdct_10167>-</TD>
          <TD id=m_istempdct_10169>-</TD>
          <TD id=m_istempdct_10171>-</TD>
          <TD id=m_istempdct_10161>-</TD>
          <TD id=m_istempdct_10163>-</TD>
          <TD id=m_istempdct_10162>-</TD>
          <TD id=m_istempdct_10164>-</TD>
          <TD id=m_istempdct_10165>-</TD></TR>
        <TR class=hidd>
          <TD id=m_iscaricebox_10166>-</TD>
          <TD id=m_iscaricebox_10168>-</TD>
          <TD id=m_iscaricebox_10170>-</TD>
          <TD id=m_iscaricebox_10167>-</TD>
          <TD id=m_iscaricebox_10169>-</TD>
          <TD id=m_iscaricebox_10171>-</TD>
          <TD id=m_iscaricebox_10161>-</TD>
          <TD id=m_iscaricebox_10163>-</TD>
          <TD id=m_iscaricebox_10162>-</TD>
          <TD id=m_iscaricebox_10164>-</TD>
          <TD 
id=m_iscaricebox_10165>-</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
<DIV class=clear></DIV></DIV>
<SCRIPT type=text/javascript 
src="【宝来】宝来%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/analytics.htm"></SCRIPT>
<!--登陆js-->
<SCRIPT 
src="【宝来】宝来%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/new_login2011_newcar.htm"></SCRIPT>

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
    <OPTION selected value=10166>2012款宝来 1.4T 手动舒适型</OPTION> <OPTION 
    value=10168>2012款宝来 1.4T 手动豪华型</OPTION> <OPTION value=10170>2012款宝来 1.4T 
    手动Sportline</OPTION> <OPTION value=10167>2012款宝来 1.4T DSG 舒适型</OPTION> 
    <OPTION value=10169>2012款宝来 1.4T DSG 豪华型</OPTION> <OPTION 
    value=10171>2012款宝来 1.4T DSG Sportline</OPTION> <OPTION value=10161>2012款宝来 
    1.6L 手动时尚型</OPTION> <OPTION value=10163>2012款宝来 1.6L 手动舒适型</OPTION> <OPTION 
    value=10162>2012款宝来 1.6L 自动时尚型</OPTION> <OPTION value=10164>2012款宝来 1.6L 
    自动舒适型</OPTION> <OPTION value=10165>2012款宝来 1.6L 自动豪华型</OPTION></SELECT></LI>
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
src="【宝来】宝来%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/news_forall.js"></SCRIPT>

<SCRIPT type=text/javascript 
src="【宝来】宝来%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/dw.js"></SCRIPT>

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
