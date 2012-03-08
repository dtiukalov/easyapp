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
  onclick="chg_checkbox('seriseCheckbox','1','0','一个子车系')" value=1,2,3,4,5 
  CHECKED type=checkbox>2011款大众CC</LI></UL><EM class=b>排量：</EM> 
<UL class=x>
  <LI><INPUT id=dislCheckbox_0 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','2','0','一种发动机')" value=1,2 CHECKED 
  type=checkbox>1.8T</LI>
  <LI><INPUT id=dislCheckbox_1 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','2','1','一种发动机')" value=3,4,5 CHECKED 
  type=checkbox>2.0T</LI></UL><EM class=c>变速箱：</EM> 
<UL class=y>
  <LI><INPUT id=transtypeCheckbox_0 class=gm_cfradio 
  onclick="chg_checkbox('transtypeCheckbox','1','0','一种变速箱')" value=1,2,3,4,5 
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
            src="【大众CC】大众CC%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
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
            src="【大众CC】大众CC%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【大众CC】大众CC%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【大众CC】大众CC%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【大众CC】大众CC%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【大众CC】大众CC%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/t1125arr_e.gif" 
            height=1></TH></TR>
        <TR id=base_1>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9086 scope=col><B href="#/m9086/" 
            target=_blank>2011款大众CC 1.8T 尊贵版 </A><I id=base_1_img_9086></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9087 scope=col><B href="#/m9087/" 
            target=_blank>2011款大众CC 1.8T 豪华版 </A><I id=base_1_img_9087></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9102 scope=col><B href="#/m9102/" 
            target=_blank>2011款大众CC 2.0T 尊贵版 </A><I id=base_1_img_9102></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9103 scope=col><B href="#/m9103/" 
            target=_blank>2011款大众CC 2.0T 豪华版 </A><I id=base_1_img_9103></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9104 scope=col><B href="#/m9104/" 
            target=_blank>2011款大众CC 2.0T 至尊版 </A><I id=base_1_img_9104></I> </TH></TR>
        <TR class=disc>
          <TD id=min_price_9086>25.38万</TD>
          <TD id=min_price_9087>26.38万</TD>
          <TD id=min_price_9102>26.88万</TD>
          <TD id=min_price_9103>27.88万</TD>
          <TD id=min_price_9104>30.08万</TD></TR>
        <TR class=hidd>
          <TD id=bname_9086><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_9087><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_9102><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_9103><B title=一汽-大众 
            href="#/price/b2/" 
target=_blank>一汽-大众</A></TD>
          <TD id=bname_9104><B title=一汽-大众 
            href="#/price/b2/" 
        target=_blank>一汽-大众</A></TD></TR>
        <TR class=hidd>
          <TD id=type2_9086><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_9087><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_9102><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_9103><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_9104><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD></TR>
        <TR class=disc>
          <TD id=m_disl_9086>1.8L 118kW </TD>
          <TD id=m_disl_9087>1.8L 118kW </TD>
          <TD id=m_disl_9102>2.0L 147kW </TD>
          <TD id=m_disl_9103>2.0L 147kW </TD>
          <TD id=m_disl_9104>2.0L 147kW </TD></TR>
        <TR class=disc>
          <TD id=m_transtype_9086>7挡双离合变速箱</TD>
          <TD id=m_transtype_9087>7挡双离合变速箱</TD>
          <TD id=m_transtype_9102>6挡双离合变速箱</TD>
          <TD id=m_transtype_9103>6挡双离合变速箱</TD>
          <TD id=m_transtype_9104>6挡双离合变速箱</TD></TR>
        <TR class=hidd>
          <TD id=m_length_width_height_9086><!---->4799×1855×1417 <!----></TD>
          <TD id=m_length_width_height_9087><!---->4799×1855×1417 <!----></TD>
          <TD id=m_length_width_height_9102><!---->4799×1855×1417 <!----></TD>
          <TD id=m_length_width_height_9103><!---->4799×1855×1417 <!----></TD>
          <TD id=m_length_width_height_9104><!---->4799×1855×1417 
<!----></TD></TR>
        <TR class=hidd>
          <TD id=m_frame_9086>4门 5座 三厢轿车</TD>
          <TD id=m_frame_9087>4门 5座 三厢轿车</TD>
          <TD id=m_frame_9102>4门 5座 三厢轿车</TD>
          <TD id=m_frame_9103>4门 5座 三厢轿车</TD>
          <TD id=m_frame_9104>4门 5座 三厢轿车</TD></TR>
        <TR class=hidd>
          <TD id=syear_9086>2011</TD>
          <TD id=syear_9087>2011</TD>
          <TD id=syear_9102>2011</TD>
          <TD id=syear_9103>2011</TD>
          <TD id=syear_9104>2011</TD></TR>
        <TR class=hidd>
          <TD id=m_mspeed_9086>- </TD>
          <TD id=m_mspeed_9087>- </TD>
          <TD id=m_mspeed_9102>- </TD>
          <TD id=m_mspeed_9103>- </TD>
          <TD id=m_mspeed_9104>- </TD></TR>
        <TR class=disc>
          <TD id=m_hatime_9086>- </TD>
          <TD id=m_hatime_9087>- </TD>
          <TD id=m_hatime_9102>8</TD>
          <TD id=m_hatime_9103>- </TD>
          <TD id=m_hatime_9104>- </TD></TR>
        <TR class=disc>
          <TD id=m_comfuel_9086>7.8</TD>
          <TD id=m_comfuel_9087>7.8</TD>
          <TD id=m_comfuel_9102>8</TD>
          <TD id=m_comfuel_9103>8</TD>
          <TD id=m_comfuel_9104>8</TD></TR>
        <TR class=disc>
          <TD id=m_lkmfuel_9086>- </TD>
          <TD id=m_lkmfuel_9087>- </TD>
          <TD id=m_lkmfuel_9102>- </TD>
          <TD id=m_lkmfuel_9103>- </TD>
          <TD id=m_lkmfuel_9104>6.5</TD></TR>
        <TR class=disc>
          <TD id=m_hkmfuel_9086>- </TD>
          <TD id=m_hkmfuel_9087>- </TD>
          <TD id=m_hkmfuel_9102>- </TD>
          <TD id=m_hkmfuel_9103>- </TD>
          <TD id=m_hkmfuel_9104>90</TD></TR>
        <TR class=hidd>
          <TD id=m_ypolicy_9086>2年6万公里 </TD>
          <TD id=m_ypolicy_9087>2年6万公里 </TD>
          <TD id=m_ypolicy_9102>2年6万公里 </TD>
          <TD id=m_ypolicy_9103>2年6万公里 </TD>
          <TD id=m_ypolicy_9104>2年6万公里 </TD></TR>
        <TR id=base_2>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9086 scope=col><B href="#/m9086/" 
            target=_blank>2011款大众CC 1.8T 尊贵版</A> <I id=base_2_img_9086></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9087 scope=col><B href="#/m9087/" 
            target=_blank>2011款大众CC 1.8T 豪华版</A> <I id=base_2_img_9087></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9102 scope=col><B href="#/m9102/" 
            target=_blank>2011款大众CC 2.0T 尊贵版</A> <I id=base_2_img_9102></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9103 scope=col><B href="#/m9103/" 
            target=_blank>2011款大众CC 2.0T 豪华版</A> <I id=base_2_img_9103></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9104 scope=col><B href="#/m9104/" 
            target=_blank>2011款大众CC 2.0T 至尊版</A> <I id=base_2_img_9104></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_length_9086>4799</TD>
          <TD id=m_length_9087>4799</TD>
          <TD id=m_length_9102>4799</TD>
          <TD id=m_length_9103>4799</TD>
          <TD id=m_length_9104>4799</TD></TR>
        <TR class=hidd>
          <TD id=m_width_9086>1855</TD>
          <TD id=m_width_9087>1855</TD>
          <TD id=m_width_9102>1855</TD>
          <TD id=m_width_9103>1855</TD>
          <TD id=m_width_9104>1855</TD></TR>
        <TR class=hidd>
          <TD id=m_height_9086>1417</TD>
          <TD id=m_height_9087>1417</TD>
          <TD id=m_height_9102>1417</TD>
          <TD id=m_height_9103>1417</TD>
          <TD id=m_height_9104>1417</TD></TR>
        <TR class=hidd>
          <TD id=m_wheelbase_9086>2712</TD>
          <TD id=m_wheelbase_9087>2712</TD>
          <TD id=m_wheelbase_9102>2712</TD>
          <TD id=m_wheelbase_9103>2712</TD>
          <TD id=m_wheelbase_9104>2712</TD></TR>
        <TR class=disc>
          <TD id=m_weight_9086>1535</TD>
          <TD id=m_weight_9087>1535</TD>
          <TD id=m_weight_9102>1545</TD>
          <TD id=m_weight_9103>1545</TD>
          <TD id=m_weight_9104>1545</TD></TR>
        <TR class=hidd>
          <TD id=m_clearance_9086>- </TD>
          <TD id=m_clearance_9087>- </TD>
          <TD id=m_clearance_9102>- </TD>
          <TD id=m_clearance_9103>- </TD>
          <TD id=m_clearance_9104>- </TD></TR>
        <TR class=hidd>
          <TD id=m_frame2_9086>三厢轿车</TD>
          <TD id=m_frame2_9087>三厢轿车</TD>
          <TD id=m_frame2_9102>三厢轿车</TD>
          <TD id=m_frame2_9103>三厢轿车</TD>
          <TD id=m_frame2_9104>三厢轿车</TD></TR>
        <TR class=hidd>
          <TD id=m_door_9086>4</TD>
          <TD id=m_door_9087>4</TD>
          <TD id=m_door_9102>4</TD>
          <TD id=m_door_9103>4</TD>
          <TD id=m_door_9104>4</TD></TR>
        <TR class=hidd>
          <TD id=m_seat_9086>5</TD>
          <TD id=m_seat_9087>5</TD>
          <TD id=m_seat_9102>5</TD>
          <TD id=m_seat_9103>5</TD>
          <TD id=m_seat_9104>5</TD></TR>
        <TR class=hidd>
          <TD id=m_oilbox_9086>70.00</TD>
          <TD id=m_oilbox_9087>70.00</TD>
          <TD id=m_oilbox_9102>70.00</TD>
          <TD id=m_oilbox_9103>70.00</TD>
          <TD id=m_oilbox_9104>70.00</TD></TR>
        <TR class=hidd>
          <TD id=m_trunk_9086>532</TD>
          <TD id=m_trunk_9087>532</TD>
          <TD id=m_trunk_9102>532</TD>
          <TD id=m_trunk_9103>532</TD>
          <TD id=m_trunk_9104>532</TD></TR>
        <TR class=hidd>
          <TD id=m_mtrunk_9086>532</TD>
          <TD id=m_mtrunk_9087>532</TD>
          <TD id=m_mtrunk_9102>532</TD>
          <TD id=m_mtrunk_9103>532</TD>
          <TD id=m_mtrunk_9104>532</TD></TR>
        <TR id=base_3>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9086 scope=col><B href="#/m9086/" 
            target=_blank>2011款大众CC 1.8T 尊贵版 </A><I id=base_3_img_9086></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9087 scope=col><B href="#/m9087/" 
            target=_blank>2011款大众CC 1.8T 豪华版 </A><I id=base_3_img_9087></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9102 scope=col><B href="#/m9102/" 
            target=_blank>2011款大众CC 2.0T 尊贵版 </A><I id=base_3_img_9102></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9103 scope=col><B href="#/m9103/" 
            target=_blank>2011款大众CC 2.0T 豪华版 </A><I id=base_3_img_9103></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9104 scope=col><B href="#/m9104/" 
            target=_blank>2011款大众CC 2.0T 至尊版 </A><I id=base_3_img_9104></I> </TH></TR>
        <TR class=disc>
          <TD id=m_disl2_9086>1.8</TD>
          <TD id=m_disl2_9087>1.8</TD>
          <TD id=m_disl2_9102>2.0</TD>
          <TD id=m_disl2_9103>2.0</TD>
          <TD id=m_disl2_9104>2.0</TD></TR>
        <TR class=hidd>
          <TD id=m_working_9086>涡轮增压</TD>
          <TD id=m_working_9087>涡轮增压</TD>
          <TD id=m_working_9102>涡轮增压</TD>
          <TD id=m_working_9103>涡轮增压</TD>
          <TD id=m_working_9104>涡轮增压</TD></TR>
        <TR class=disc>
          <TD id=m_mpower_9086>118</TD>
          <TD id=m_mpower_9087>118</TD>
          <TD id=m_mpower_9102>147</TD>
          <TD id=m_mpower_9103>147</TD>
          <TD id=m_mpower_9104>147</TD></TR>
        <TR class=disc>
          <TD id=m_mpowersp_9086>6000</TD>
          <TD id=m_mpowersp_9087>6000</TD>
          <TD id=m_mpowersp_9102>5100-6000</TD>
          <TD id=m_mpowersp_9103>5100-6000</TD>
          <TD id=m_mpowersp_9104>5100-6000</TD></TR>
        <TR class=disc>
          <TD id=m_mtorque_9086>250</TD>
          <TD id=m_mtorque_9087>250</TD>
          <TD id=m_mtorque_9102>280</TD>
          <TD id=m_mtorque_9103>280</TD>
          <TD id=m_mtorque_9104>280</TD></TR>
        <TR class=disc>
          <TD id=m_mtorsp_9086>1500-4200</TD>
          <TD id=m_mtorsp_9087>1500-4200</TD>
          <TD id=m_mtorsp_9102>1700-5000</TD>
          <TD id=m_mtorsp_9103>1700-5000</TD>
          <TD id=m_mtorsp_9104>1700-5000</TD></TR>
        <TR class=hidd>
          <TD id=m_fuel_9086>汽油</TD>
          <TD id=m_fuel_9087>汽油</TD>
          <TD id=m_fuel_9102>汽油</TD>
          <TD id=m_fuel_9103>汽油</TD>
          <TD id=m_fuel_9104>汽油</TD></TR>
        <TR class=hidd>
          <TD id=m_fuelno_9086>97</TD>
          <TD id=m_fuelno_9087>97</TD>
          <TD id=m_fuelno_9102>97</TD>
          <TD id=m_fuelno_9103>97</TD>
          <TD id=m_fuelno_9104>97</TD></TR>
        <TR class=hidd>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_9086>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_9087>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_9102>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_9103>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_9104>国IV+OBD </TD></TR>
        <TR id=base_4>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9086 scope=col><B href="#/m9086/" 
            target=_blank>2011款大众CC 1.8T 尊贵版 </A><I id=base_4_img_9086></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9087 scope=col><B href="#/m9087/" 
            target=_blank>2011款大众CC 1.8T 豪华版 </A><I id=base_4_img_9087></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9102 scope=col><B href="#/m9102/" 
            target=_blank>2011款大众CC 2.0T 尊贵版 </A><I id=base_4_img_9102></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9103 scope=col><B href="#/m9103/" 
            target=_blank>2011款大众CC 2.0T 豪华版 </A><I id=base_4_img_9103></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9104 scope=col><B href="#/m9104/" 
            target=_blank>2011款大众CC 2.0T 至尊版 </A><I id=base_4_img_9104></I> </TH></TR>
        <TR class=disc>
          <TD id=m_speed_9086>7</TD>
          <TD id=m_speed_9087>7</TD>
          <TD id=m_speed_9102>6</TD>
          <TD id=m_speed_9103>6</TD>
          <TD id=m_speed_9104>6</TD></TR>
        <TR class=hidd>
          <TD id=m_transtype2_9086>双离合变速箱</TD>
          <TD id=m_transtype2_9087>双离合变速箱</TD>
          <TD id=m_transtype2_9102>双离合变速箱</TD>
          <TD id=m_transtype2_9103>双离合变速箱</TD>
          <TD id=m_transtype2_9104>双离合变速箱</TD></TR>
        <TR id=base_5>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9086 scope=col><B href="#/m9086/" 
            target=_blank>2011款大众CC 1.8T 尊贵版 </A><I id=base_5_img_9086></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9087 scope=col><B href="#/m9087/" 
            target=_blank>2011款大众CC 1.8T 豪华版 </A><I id=base_5_img_9087></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9102 scope=col><B href="#/m9102/" 
            target=_blank>2011款大众CC 2.0T 尊贵版 </A><I id=base_5_img_9102></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9103 scope=col><B href="#/m9103/" 
            target=_blank>2011款大众CC 2.0T 豪华版 </A><I id=base_5_img_9103></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9104 scope=col><B href="#/m9104/" 
            target=_blank>2011款大众CC 2.0T 至尊版 </A><I id=base_5_img_9104></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_drivetype_9086>前置前驱</TD>
          <TD id=m_drivetype_9087>前置前驱</TD>
          <TD id=m_drivetype_9102>前置前驱</TD>
          <TD id=m_drivetype_9103>前置前驱</TD>
          <TD id=m_drivetype_9104>前置前驱</TD></TR>
        <TR class=hidd height=60>
          <TD id=m_fsustype_text_9086>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_9087>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_9102>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_9103>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_9104>麦弗逊式独立悬架</TD></TR>
        <TR class=hidd height=60>
          <TD id=m_bsustype_text_9086>四连杆式独立悬架</TD>
          <TD id=m_bsustype_text_9087>四连杆式独立悬架</TD>
          <TD id=m_bsustype_text_9102>四连杆式独立悬架</TD>
          <TD id=m_bsustype_text_9103>四连杆式独立悬架</TD>
          <TD id=m_bsustype_text_9104>四连杆式独立悬架</TD></TR>
        <TR id=base_6>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9086 scope=col><B href="#/m9086/" 
            target=_blank>2011款大众CC 1.8T 尊贵版 </A><I id=base_6_img_9086></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9087 scope=col><B href="#/m9087/" 
            target=_blank>2011款大众CC 1.8T 豪华版 </A><I id=base_6_img_9087></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9102 scope=col><B href="#/m9102/" 
            target=_blank>2011款大众CC 2.0T 尊贵版 </A><I id=base_6_img_9102></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9103 scope=col><B href="#/m9103/" 
            target=_blank>2011款大众CC 2.0T 豪华版 </A><I id=base_6_img_9103></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9104 scope=col><B href="#/m9104/" 
            target=_blank>2011款大众CC 2.0T 至尊版 </A><I id=base_6_img_9104></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_fbraketype_9086>通风盘式</TD>
          <TD id=m_fbraketype_9087>通风盘式</TD>
          <TD id=m_fbraketype_9102>通风盘式</TD>
          <TD id=m_fbraketype_9103>通风盘式</TD>
          <TD id=m_fbraketype_9104>通风盘式</TD></TR>
        <TR class=hidd>
          <TD id=m_bbraketype_9086>盘式</TD>
          <TD id=m_bbraketype_9087>盘式</TD>
          <TD id=m_bbraketype_9102>盘式</TD>
          <TD id=m_bbraketype_9103>盘式</TD>
          <TD id=m_bbraketype_9104>盘式</TD></TR>
        <TR class=hidd>
          <TD id=m_ftiresize_9086>235/45 R17</TD>
          <TD id=m_ftiresize_9087>235/45 R17</TD>
          <TD id=m_ftiresize_9102>235/45 R17</TD>
          <TD id=m_ftiresize_9103>235/45 R17</TD>
          <TD id=m_ftiresize_9104>235/45 R17</TD></TR>
        <TR class=hidd>
          <TD id=m_btiresize_9086>235/45 R17</TD>
          <TD id=m_btiresize_9087>235/45 R17</TD>
          <TD id=m_btiresize_9102>235/45 R17</TD>
          <TD id=m_btiresize_9103>235/45 R17</TD>
          <TD id=m_btiresize_9104>235/45 R17</TD></TR>
        <TR class=hidd>
          <TD id=m_sparetire_9086>全尺寸</TD>
          <TD id=m_sparetire_9087>全尺寸</TD>
          <TD id=m_sparetire_9102>全尺寸</TD>
          <TD id=m_sparetire_9103>全尺寸</TD>
          <TD id=m_sparetire_9104>全尺寸</TD></TR>
        <TR id=base_7>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9086 scope=col><B href="#/m9086/" 
            target=_blank>2011款大众CC 1.8T 尊贵版 </A><I id=base_7_img_9086></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9087 scope=col><B href="#/m9087/" 
            target=_blank>2011款大众CC 1.8T 豪华版 </A><I id=base_7_img_9087></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9102 scope=col><B href="#/m9102/" 
            target=_blank>2011款大众CC 2.0T 尊贵版 </A><I id=base_7_img_9102></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9103 scope=col><B href="#/m9103/" 
            target=_blank>2011款大众CC 2.0T 豪华版 </A><I id=base_7_img_9103></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9104 scope=col><B href="#/m9104/" 
            target=_blank>2011款大众CC 2.0T 至尊版 </A><I id=base_7_img_9104></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isdairbag_9086>●</TD>
          <TD id=m_isdairbag_9087>●</TD>
          <TD id=m_isdairbag_9102>●</TD>
          <TD id=m_isdairbag_9103>●</TD>
          <TD id=m_isdairbag_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isadairbag_9086>●</TD>
          <TD id=m_isadairbag_9087>●</TD>
          <TD id=m_isadairbag_9102>●</TD>
          <TD id=m_isadairbag_9103>●</TD>
          <TD id=m_isadairbag_9104>●</TD></TR>
        <TR class=disc>
          <TD id=m_isfhairbag_9086>-</TD>
          <TD id=m_isfhairbag_9087>●</TD>
          <TD id=m_isfhairbag_9102>-</TD>
          <TD id=m_isfhairbag_9103>●</TD>
          <TD id=m_isfhairbag_9104>●</TD></TR>
        <TR class=disc>
          <TD id=m_isbhairbag_9086>-</TD>
          <TD id=m_isbhairbag_9087>●</TD>
          <TD id=m_isbhairbag_9102>-</TD>
          <TD id=m_isbhairbag_9103>●</TD>
          <TD id=m_isbhairbag_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isfsairbag_9086>●</TD>
          <TD id=m_isfsairbag_9087>●</TD>
          <TD id=m_isfsairbag_9102>●</TD>
          <TD id=m_isfsairbag_9103>●</TD>
          <TD id=m_isfsairbag_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbsairbag_9086>-</TD>
          <TD id=m_isbsairbag_9087>-</TD>
          <TD id=m_isbsairbag_9102>-</TD>
          <TD id=m_isbsairbag_9103>-</TD>
          <TD id=m_isbsairbag_9104>-</TD></TR>
        <TR class=hidd>
          <TD id=m_iskairbag_9086>-</TD>
          <TD id=m_iskairbag_9087>-</TD>
          <TD id=m_iskairbag_9102>-</TD>
          <TD id=m_iskairbag_9103>-</TD>
          <TD id=m_iskairbag_9104>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatbeltti_9086>●</TD>
          <TD id=m_isseatbeltti_9087>●</TD>
          <TD id=m_isseatbeltti_9102>●</TD>
          <TD id=m_isseatbeltti_9103>●</TD>
          <TD id=m_isseatbeltti_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iseanti_9086>●</TD>
          <TD id=m_iseanti_9087>●</TD>
          <TD id=m_iseanti_9102>●</TD>
          <TD id=m_iseanti_9103>●</TD>
          <TD id=m_iseanti_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscclock_9086>●</TD>
          <TD id=m_iscclock_9087>●</TD>
          <TD id=m_iscclock_9102>●</TD>
          <TD id=m_iscclock_9103>●</TD>
          <TD id=m_iscclock_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isrekey_9086>●</TD>
          <TD id=m_isrekey_9087>●</TD>
          <TD id=m_isrekey_9102>●</TD>
          <TD id=m_isrekey_9103>●</TD>
          <TD id=m_isrekey_9104>●</TD></TR>
        <TR class=disc>
          <TD id=m_isnokeysys_9086>-</TD>
          <TD id=m_isnokeysys_9087>●</TD>
          <TD id=m_isnokeysys_9102>-</TD>
          <TD id=m_isnokeysys_9103>●</TD>
          <TD id=m_isnokeysys_9104>●</TD></TR>
        <TR id=base_8>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9086 scope=col><B href="#/m9086/" 
            target=_blank>2011款大众CC 1.8T 尊贵版 </A><I id=base_8_img_9086></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9087 scope=col><B href="#/m9087/" 
            target=_blank>2011款大众CC 1.8T 豪华版 </A><I id=base_8_img_9087></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9102 scope=col><B href="#/m9102/" 
            target=_blank>2011款大众CC 2.0T 尊贵版 </A><I id=base_8_img_9102></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9103 scope=col><B href="#/m9103/" 
            target=_blank>2011款大众CC 2.0T 豪华版 </A><I id=base_8_img_9103></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9104 scope=col><B href="#/m9104/" 
            target=_blank>2011款大众CC 2.0T 至尊版 </A><I id=base_8_img_9104></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isabs_9086>●</TD>
          <TD id=m_isabs_9087>●</TD>
          <TD id=m_isabs_9102>●</TD>
          <TD id=m_isabs_9103>●</TD>
          <TD id=m_isabs_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isesp_9086>●</TD>
          <TD id=m_isesp_9087>●</TD>
          <TD id=m_isesp_9102>●</TD>
          <TD id=m_isesp_9103>●</TD>
          <TD id=m_isesp_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isadsus_9086>-</TD>
          <TD id=m_isadsus_9087>-</TD>
          <TD id=m_isadsus_9102>-</TD>
          <TD id=m_isadsus_9103>-</TD>
          <TD id=m_isadsus_9104>-</TD></TR>
        <TR class=hidd>
          <TD id=m_istpmonitor_9086>●</TD>
          <TD id=m_istpmonitor_9087>●</TD>
          <TD id=m_istpmonitor_9102>●</TD>
          <TD id=m_istpmonitor_9103>●</TD>
          <TD id=m_istpmonitor_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_istpruning_9086>-</TD>
          <TD id=m_istpruning_9087>-</TD>
          <TD id=m_istpruning_9102>-</TD>
          <TD id=m_istpruning_9103>-</TD>
          <TD id=m_istpruning_9104>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isfsteering_9086>●</TD>
          <TD id=m_isfsteering_9087>●</TD>
          <TD id=m_isfsteering_9102>●</TD>
          <TD id=m_isfsteering_9103>●</TD>
          <TD id=m_isfsteering_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_issteesys_9086>-</TD>
          <TD id=m_issteesys_9087>-</TD>
          <TD id=m_issteesys_9102>-</TD>
          <TD id=m_issteesys_9103>-</TD>
          <TD id=m_issteesys_9104>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isuphillassist_9086>●</TD>
          <TD id=m_isuphillassist_9087>●</TD>
          <TD id=m_isuphillassist_9102>●</TD>
          <TD id=m_isuphillassist_9103>●</TD>
          <TD id=m_isuphillassist_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isandstitch_9086>-</TD>
          <TD id=m_isandstitch_9087>-</TD>
          <TD id=m_isandstitch_9102>-</TD>
          <TD id=m_isandstitch_9103>-</TD>
          <TD id=m_isandstitch_9104>-</TD></TR>
        <TR id=base_9>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9086 scope=col><B href="#/m9086/" 
            target=_blank>2011款大众CC 1.8T 尊贵版 </A><I id=base_9_img_9086></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9087 scope=col><B href="#/m9087/" 
            target=_blank>2011款大众CC 1.8T 豪华版 </A><I id=base_9_img_9087></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9102 scope=col><B href="#/m9102/" 
            target=_blank>2011款大众CC 2.0T 尊贵版 </A><I id=base_9_img_9102></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9103 scope=col><B href="#/m9103/" 
            target=_blank>2011款大众CC 2.0T 豪华版 </A><I id=base_9_img_9103></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9104 scope=col><B href="#/m9104/" 
            target=_blank>2011款大众CC 2.0T 至尊版 </A><I id=base_9_img_9104></I> </TH></TR>
        <TR class=disc>
          <TD id=m_iswindow_9086>-</TD>
          <TD id=m_iswindow_9087>●</TD>
          <TD id=m_iswindow_9102>-</TD>
          <TD id=m_iswindow_9103>●</TD>
          <TD id=m_iswindow_9104>●</TD></TR>
        <TR class=disc>
          <TD id=m_isarwindow_9086>-</TD>
          <TD id=m_isarwindow_9087>●</TD>
          <TD id=m_isarwindow_9102>-</TD>
          <TD id=m_isarwindow_9103>●</TD>
          <TD id=m_isarwindow_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isspround_9086>-</TD>
          <TD id=m_isspround_9087>-</TD>
          <TD id=m_isspround_9102>-</TD>
          <TD id=m_isspround_9103>-</TD>
          <TD id=m_isspround_9104>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isaluhub_9086>●</TD>
          <TD id=m_isaluhub_9087>●</TD>
          <TD id=m_isaluhub_9102>●</TD>
          <TD id=m_isaluhub_9103>●</TD>
          <TD id=m_isaluhub_9104>●</TD></TR>
        <TR id=base_10>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9086 scope=col><B href="#/m9086/" 
            target=_blank>2011款大众CC 1.8T 尊贵版 </A><I id=base_10_img_9086></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9087 scope=col><B href="#/m9087/" 
            target=_blank>2011款大众CC 1.8T 豪华版 </A><I id=base_10_img_9087></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9102 scope=col><B href="#/m9102/" 
            target=_blank>2011款大众CC 2.0T 尊贵版 </A><I id=base_10_img_9102></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9103 scope=col><B href="#/m9103/" 
            target=_blank>2011款大众CC 2.0T 豪华版 </A><I id=base_10_img_9103></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9104 scope=col><B href="#/m9104/" 
            target=_blank>2011款大众CC 2.0T 至尊版 </A><I id=base_10_img_9104></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isleasw_9086>●</TD>
          <TD id=m_isleasw_9087>●</TD>
          <TD id=m_isleasw_9102>●</TD>
          <TD id=m_isleasw_9103>●</TD>
          <TD id=m_isleasw_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswud_9086>●</TD>
          <TD id=m_isswud_9087>●</TD>
          <TD id=m_isswud_9102>●</TD>
          <TD id=m_isswud_9103>●</TD>
          <TD id=m_isswud_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswfb_9086>●</TD>
          <TD id=m_isswfb_9087>●</TD>
          <TD id=m_isswfb_9102>●</TD>
          <TD id=m_isswfb_9103>●</TD>
          <TD id=m_isswfb_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ismultisw_9086>●</TD>
          <TD id=m_ismultisw_9087>●</TD>
          <TD id=m_ismultisw_9102>●</TD>
          <TD id=m_ismultisw_9103>●</TD>
          <TD id=m_ismultisw_9104>●</TD></TR>
        <TR class=disc>
          <TD id=m_isswshift_9086>-</TD>
          <TD id=m_isswshift_9087>○</TD>
          <TD id=m_isswshift_9102>-</TD>
          <TD id=m_isswshift_9103>○</TD>
          <TD id=m_isswshift_9104>○</TD></TR>
        <TR class=hidd>
          <TD id=m_isascd_9086>●</TD>
          <TD id=m_isascd_9087>●</TD>
          <TD id=m_isascd_9102>●</TD>
          <TD id=m_isascd_9103>●</TD>
          <TD id=m_isascd_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isassibc_9086>●</TD>
          <TD id=m_isassibc_9087>●</TD>
          <TD id=m_isassibc_9102>●</TD>
          <TD id=m_isassibc_9103>●</TD>
          <TD id=m_isassibc_9104>●</TD></TR>
        <TR class=disc>
          <TD id=m_isparkvideo_9086>-</TD>
          <TD id=m_isparkvideo_9087>○</TD>
          <TD id=m_isparkvideo_9102>-</TD>
          <TD id=m_isparkvideo_9103>○</TD>
          <TD id=m_isparkvideo_9104>●</TD></TR>
        <TR class=disc>
          <TD id=m_ispark_9086>-</TD>
          <TD id=m_ispark_9087>-</TD>
          <TD id=m_ispark_9102>-</TD>
          <TD id=m_ispark_9103>-</TD>
          <TD id=m_ispark_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ishud_9086>-</TD>
          <TD id=m_ishud_9087>-</TD>
          <TD id=m_ishud_9102>-</TD>
          <TD id=m_ishud_9103>-</TD>
          <TD id=m_ishud_9104>-</TD></TR>
        <TR id=base_11>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9086 scope=col><B href="#/m9086/" 
            target=_blank>2011款大众CC 1.8T 尊贵版 </A><I id=base_11_img_9086></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9087 scope=col><B href="#/m9087/" 
            target=_blank>2011款大众CC 1.8T 豪华版 </A><I id=base_11_img_9087></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9102 scope=col><B href="#/m9102/" 
            target=_blank>2011款大众CC 2.0T 尊贵版 </A><I id=base_11_img_9102></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9103 scope=col><B href="#/m9103/" 
            target=_blank>2011款大众CC 2.0T 豪华版 </A><I id=base_11_img_9103></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9104 scope=col><B href="#/m9104/" 
            target=_blank>2011款大众CC 2.0T 至尊版 </A><I id=base_11_img_9104></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isleaseat_9086>●</TD>
          <TD id=m_isleaseat_9087>●</TD>
          <TD id=m_isleaseat_9102>●</TD>
          <TD id=m_isleaseat_9103>●</TD>
          <TD id=m_isleaseat_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatadj_9086>●</TD>
          <TD id=m_isseatadj_9087>●</TD>
          <TD id=m_isseatadj_9102>●</TD>
          <TD id=m_isseatadj_9103>●</TD>
          <TD id=m_isseatadj_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iswaistadj_9086>●</TD>
          <TD id=m_iswaistadj_9087>●</TD>
          <TD id=m_iswaistadj_9102>●</TD>
          <TD id=m_iswaistadj_9103>●</TD>
          <TD id=m_iswaistadj_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isfseatadj_9086>●</TD>
          <TD id=m_isfseatadj_9087>●</TD>
          <TD id=m_isfseatadj_9102>●</TD>
          <TD id=m_isfseatadj_9103>●</TD>
          <TD id=m_isfseatadj_9104>●</TD></TR>
        <TR class=disc>
          <TD id=m_iseseatmem_9086>-</TD>
          <TD id=m_iseseatmem_9087>●</TD>
          <TD id=m_iseseatmem_9102>●</TD>
          <TD id=m_iseseatmem_9103>●</TD>
          <TD id=m_iseseatmem_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isseathot_9086>●</TD>
          <TD id=m_isseathot_9087>●</TD>
          <TD id=m_isseathot_9102>●</TD>
          <TD id=m_isseathot_9103>●</TD>
          <TD id=m_isseathot_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatknead_9086>-</TD>
          <TD id=m_isseatknead_9087>-</TD>
          <TD id=m_isseatknead_9102>-</TD>
          <TD id=m_isseatknead_9103>-</TD>
          <TD id=m_isseatknead_9104>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isbseatlay_9086>-</TD>
          <TD id=m_isbseatlay_9087>-</TD>
          <TD id=m_isbseatlay_9102>-</TD>
          <TD id=m_isbseatlay_9103>-</TD>
          <TD id=m_isbseatlay_9104>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isbseatplay_9086>●</TD>
          <TD id=m_isbseatplay_9087>●</TD>
          <TD id=m_isbseatplay_9102>●</TD>
          <TD id=m_isbseatplay_9103>●</TD>
          <TD id=m_isbseatplay_9104>●</TD></TR>
        <TR id=base_12>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9086 scope=col><B href="#/m9086/" 
            target=_blank>2011款大众CC 1.8T 尊贵版 </A><I id=base_12_img_9086></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9087 scope=col><B href="#/m9087/" 
            target=_blank>2011款大众CC 1.8T 豪华版 </A><I id=base_12_img_9087></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9102 scope=col><B href="#/m9102/" 
            target=_blank>2011款大众CC 2.0T 尊贵版 </A><I id=base_12_img_9102></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9103 scope=col><B href="#/m9103/" 
            target=_blank>2011款大众CC 2.0T 豪华版 </A><I id=base_12_img_9103></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9104 scope=col><B href="#/m9104/" 
            target=_blank>2011款大众CC 2.0T 至尊版 </A><I id=base_12_img_9104></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isgps_9086>-</TD>
          <TD id=m_isgps_9087>○</TD>
          <TD id=m_isgps_9102>-</TD>
          <TD id=m_isgps_9103>○</TD>
          <TD id=m_isgps_9104>●</TD></TR>
        <TR class=disc>
          <TD id=m_isbluetooth_9086>-</TD>
          <TD id=m_isbluetooth_9087>●</TD>
          <TD id=m_isbluetooth_9102>-</TD>
          <TD id=m_isbluetooth_9103>●</TD>
          <TD id=m_isbluetooth_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_istv_9086>-</TD>
          <TD id=m_istv_9087>-</TD>
          <TD id=m_istv_9102>-</TD>
          <TD id=m_istv_9103>-</TD>
          <TD id=m_istv_9104>-</TD></TR>
        <TR class=hidd>
          <TD id=m_iscclcd_9086>●</TD>
          <TD id=m_iscclcd_9087>●</TD>
          <TD id=m_iscclcd_9102>●</TD>
          <TD id=m_iscclcd_9103>●</TD>
          <TD id=m_iscclcd_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isblcd_9086>-</TD>
          <TD id=m_isblcd_9087>-</TD>
          <TD id=m_isblcd_9102>-</TD>
          <TD id=m_isblcd_9103>-</TD>
          <TD id=m_isblcd_9104>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ismp3_9086>●</TD>
          <TD id=m_ismp3_9087>●</TD>
          <TD id=m_ismp3_9102>●</TD>
          <TD id=m_ismp3_9103>●</TD>
          <TD id=m_ismp3_9104>●</TD></TR>
        <TR class=disc>
          <TD id=m_iscd_9086>●</TD>
          <TD id=m_iscd_9087>●</TD>
          <TD id=m_iscd_9102>●</TD>
          <TD id=m_iscd_9103>●</TD>
          <TD id=m_iscd_9104>-</TD></TR>
        <TR class=disc>
          <TD id=m_iscd_9086>6 </TD>
          <TD id=m_iscd_9087>6 </TD>
          <TD id=m_iscd_9102>6 </TD>
          <TD id=m_iscd_9103>6 </TD>
          <TD id=m_iscd_9104>- </TD></TR>
        <TR class=disc>
          <TD id=9086>-</TD>
          <TD id=9087>- </TD>
          <TD id=9102>-</TD>
          <TD id=9103>- </TD>
          <TD id=9104>●</TD></TR>
        <TR class=disc>
          <TD id=9086>- </TD>
          <TD id=9087>- </TD>
          <TD id=9102>- </TD>
          <TD id=9103>- </TD>
          <TD id=9104>1 </TD></TR>
        <TR class=hidd>
          <TD id=m_is2audio_9086>-</TD>
          <TD id=m_is2audio_9087>-</TD>
          <TD id=m_is2audio_9102>-</TD>
          <TD id=m_is2audio_9103>-</TD>
          <TD id=m_is2audio_9104>-</TD></TR>
        <TR class=hidd>
          <TD id=m_is4audio_9086>-</TD>
          <TD id=m_is4audio_9087>-</TD>
          <TD id=m_is4audio_9102>-</TD>
          <TD id=m_is4audio_9103>-</TD>
          <TD id=m_is4audio_9104>-</TD></TR>
        <TR class=hidd>
          <TD id=m_is6audio_9086>-</TD>
          <TD id=m_is6audio_9087>-</TD>
          <TD id=m_is6audio_9102>-</TD>
          <TD id=m_is6audio_9103>-</TD>
          <TD id=m_is6audio_9104>-</TD></TR>
        <TR class=hidd>
          <TD id=m_is8audio_9086>●</TD>
          <TD id=m_is8audio_9087>●</TD>
          <TD id=m_is8audio_9102>●</TD>
          <TD id=m_is8audio_9103>●</TD>
          <TD id=m_is8audio_9104>●</TD></TR>
        <TR id=base_13>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9086 scope=col><B href="#/m9086/" 
            target=_blank>2011款大众CC 1.8T 尊贵版 </A><I id=base_13_img_9086></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9087 scope=col><B href="#/m9087/" 
            target=_blank>2011款大众CC 1.8T 豪华版 </A><I id=base_13_img_9087></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9102 scope=col><B href="#/m9102/" 
            target=_blank>2011款大众CC 2.0T 尊贵版 </A><I id=base_13_img_9102></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9103 scope=col><B href="#/m9103/" 
            target=_blank>2011款大众CC 2.0T 豪华版 </A><I id=base_13_img_9103></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9104 scope=col><B href="#/m9104/" 
            target=_blank>2011款大众CC 2.0T 至尊版 </A><I id=base_13_img_9104></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isxelamp_9086>●</TD>
          <TD id=m_isxelamp_9087>●</TD>
          <TD id=m_isxelamp_9102>●</TD>
          <TD id=m_isxelamp_9103>●</TD>
          <TD id=m_isxelamp_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isautohlamp_9086>●</TD>
          <TD id=m_isautohlamp_9087>●</TD>
          <TD id=m_isautohlamp_9102>●</TD>
          <TD id=m_isautohlamp_9103>●</TD>
          <TD id=m_isautohlamp_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isturnhlamp_9086>●</TD>
          <TD id=m_isturnhlamp_9087>●</TD>
          <TD id=m_isturnhlamp_9102>●</TD>
          <TD id=m_isturnhlamp_9103>●</TD>
          <TD id=m_isturnhlamp_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ishfoglamp_9086>●</TD>
          <TD id=m_ishfoglamp_9087>●</TD>
          <TD id=m_ishfoglamp_9102>●</TD>
          <TD id=m_ishfoglamp_9103>●</TD>
          <TD id=m_ishfoglamp_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbfoglamp_9086>●</TD>
          <TD id=m_isbfoglamp_9087>●</TD>
          <TD id=m_isbfoglamp_9102>●</TD>
          <TD id=m_isbfoglamp_9103>●</TD>
          <TD id=m_isbfoglamp_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_islampheiadj_9086>●</TD>
          <TD id=m_islampheiadj_9087>●</TD>
          <TD id=m_islampheiadj_9102>●</TD>
          <TD id=m_islampheiadj_9103>●</TD>
          <TD id=m_islampheiadj_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_islampclset_9086>●</TD>
          <TD id=m_islampclset_9087>●</TD>
          <TD id=m_islampclset_9102>●</TD>
          <TD id=m_islampclset_9103>●</TD>
          <TD id=m_islampclset_9104>●</TD></TR>
        <TR id=base_14>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9086 scope=col><B href="#/m9086/" 
            target=_blank>2011款大众CC 1.8T 尊贵版 </A><I id=base_14_img_9086></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9087 scope=col><B href="#/m9087/" 
            target=_blank>2011款大众CC 1.8T 豪华版 </A><I id=base_14_img_9087></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9102 scope=col><B href="#/m9102/" 
            target=_blank>2011款大众CC 2.0T 尊贵版 </A><I id=base_14_img_9102></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9103 scope=col><B href="#/m9103/" 
            target=_blank>2011款大众CC 2.0T 豪华版 </A><I id=base_14_img_9103></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9104 scope=col><B href="#/m9104/" 
            target=_blank>2011款大众CC 2.0T 至尊版 </A><I id=base_14_img_9104></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isfewindow_9086>●</TD>
          <TD id=m_isfewindow_9087>●</TD>
          <TD id=m_isfewindow_9102>●</TD>
          <TD id=m_isfewindow_9103>●</TD>
          <TD id=m_isfewindow_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbewindow_9086>●</TD>
          <TD id=m_isbewindow_9087>●</TD>
          <TD id=m_isbewindow_9102>●</TD>
          <TD id=m_isbewindow_9103>●</TD>
          <TD id=m_isbewindow_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isgnhand_9086>●</TD>
          <TD id=m_isgnhand_9087>●</TD>
          <TD id=m_isgnhand_9102>●</TD>
          <TD id=m_isgnhand_9103>●</TD>
          <TD id=m_isgnhand_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ispreventionuv_9086>●</TD>
          <TD id=m_ispreventionuv_9087>●</TD>
          <TD id=m_ispreventionuv_9102>●</TD>
          <TD id=m_ispreventionuv_9103>●</TD>
          <TD id=m_ispreventionuv_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isermirror_9086>●</TD>
          <TD id=m_isermirror_9087>●</TD>
          <TD id=m_isermirror_9102>●</TD>
          <TD id=m_isermirror_9103>●</TD>
          <TD id=m_isermirror_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ishotrmirror_9086>●</TD>
          <TD id=m_ishotrmirror_9087>●</TD>
          <TD id=m_ishotrmirror_9102>●</TD>
          <TD id=m_ishotrmirror_9103>●</TD>
          <TD id=m_ishotrmirror_9104>●</TD></TR>
        <TR class=disc>
          <TD id=m_ismemorymirror_9086>-</TD>
          <TD id=m_ismemorymirror_9087>●</TD>
          <TD id=m_ismemorymirror_9102>●</TD>
          <TD id=m_ismemorymirror_9103>●</TD>
          <TD id=m_ismemorymirror_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iseprmirror_9086>●</TD>
          <TD id=m_iseprmirror_9087>●</TD>
          <TD id=m_iseprmirror_9102>●</TD>
          <TD id=m_iseprmirror_9103>●</TD>
          <TD id=m_iseprmirror_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isrmirrorge_9086>●</TD>
          <TD id=m_isrmirrorge_9087>●</TD>
          <TD id=m_isrmirrorge_9102>●</TD>
          <TD id=m_isrmirrorge_9103>●</TD>
          <TD id=m_isrmirrorge_9104>●</TD></TR>
        <TR class=disc>
          <TD id=m_isbsvisor_9086>- </TD>
          <TD id=m_isbsvisor_9087>- </TD>
          <TD id=m_isbsvisor_9102>- </TD>
          <TD id=m_isbsvisor_9103>●</TD>
          <TD id=m_isbsvisor_9104>●</TD></TR><!--	



			<tr class="disc" >



				



				


					


						<td id="m_ishbsvisor_9086">-</td>



					


						<td id="m_ishbsvisor_9087">-</td>



					


						<td id="m_ishbsvisor_9102">-</td>



					


						<td id="m_ishbsvisor_9103">●</td>



					


						<td id="m_ishbsvisor_9104">●</td>



					


							</tr>







			<tr class="hidd" >



				



				


					


						<td id="m_isebsvisor_9086"> - </td>



					


						<td id="m_isebsvisor_9087"> - </td>



					


						<td id="m_isebsvisor_9102"> - </td>



					


						<td id="m_isebsvisor_9103"> - </td>



					


						<td id="m_isebsvisor_9104"> - </td>



					


							</tr>



-->
        <TR class=hidd>
          <TD id=m_isbssvisor_9086>-</TD>
          <TD id=m_isbssvisor_9087>-</TD>
          <TD id=m_isbssvisor_9102>-</TD>
          <TD id=m_isbssvisor_9103>-</TD>
          <TD id=m_isbssvisor_9104>-</TD></TR>
        <TR class=hidd>
          <TD id=m_issvisordr_9086>●</TD>
          <TD id=m_issvisordr_9087>●</TD>
          <TD id=m_issvisordr_9102>●</TD>
          <TD id=m_issvisordr_9103>●</TD>
          <TD id=m_issvisordr_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isinswiper_9086>●</TD>
          <TD id=m_isinswiper_9087>●</TD>
          <TD id=m_isinswiper_9102>●</TD>
          <TD id=m_isinswiper_9103>●</TD>
          <TD id=m_isinswiper_9104>●</TD></TR>
        <TR id=base_15>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9086 scope=col><B href="#/m9086/" 
            target=_blank>2011款大众CC 1.8T 尊贵版 </A><I id=base_15_img_9086></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9087 scope=col><B href="#/m9087/" 
            target=_blank>2011款大众CC 1.8T 豪华版 </A><I id=base_15_img_9087></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9102 scope=col><B href="#/m9102/" 
            target=_blank>2011款大众CC 2.0T 尊贵版 </A><I id=base_15_img_9102></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9103 scope=col><B href="#/m9103/" 
            target=_blank>2011款大众CC 2.0T 豪华版 </A><I id=base_15_img_9103></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9104 scope=col><B href="#/m9104/" 
            target=_blank>2011款大众CC 2.0T 至尊版 </A><I id=base_15_img_9104></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isairc_9086>●</TD>
          <TD id=m_isairc_9087>●</TD>
          <TD id=m_isairc_9102>●</TD>
          <TD id=m_isairc_9103>●</TD>
          <TD id=m_isairc_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbsairo_9086>●</TD>
          <TD id=m_isbsairo_9087>●</TD>
          <TD id=m_isbsairo_9102>●</TD>
          <TD id=m_isbsairo_9103>●</TD>
          <TD id=m_isbsairo_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_istempdct_9086>●</TD>
          <TD id=m_istempdct_9087>●</TD>
          <TD id=m_istempdct_9102>●</TD>
          <TD id=m_istempdct_9103>●</TD>
          <TD id=m_istempdct_9104>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscaricebox_9086>-</TD>
          <TD id=m_iscaricebox_9087>-</TD>
          <TD id=m_iscaricebox_9102>-</TD>
          <TD id=m_iscaricebox_9103>-</TD>
          <TD 
id=m_iscaricebox_9104>-</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
<DIV class=clear></DIV></DIV>
<SCRIPT type=text/javascript src=""></SCRIPT>
<!--登陆js-->
<SCRIPT 
src="【大众CC】大众CC%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/new_login2011_newcar.htm"></SCRIPT>

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
    <OPTION selected value=9086>2011款大众CC 1.8T 尊贵版</OPTION> <OPTION 
    value=9087>2011款大众CC 1.8T 豪华版</OPTION> <OPTION value=9102>2011款大众CC 2.0T 
    尊贵版</OPTION> <OPTION value=9103>2011款大众CC 2.0T 豪华版</OPTION> <OPTION 
    value=9104>2011款大众CC 2.0T 至尊版</OPTION></SELECT></LI>
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
src="【大众CC】大众CC%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/news_forall.js"></SCRIPT>

<SCRIPT type=text/javascript 
src="【大众CC】大众CC%20汽车配置_参数%20一汽-大众_爱卡汽车网_files/dw.js"></SCRIPT>

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
