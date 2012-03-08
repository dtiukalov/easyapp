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
  onclick="chg_checkbox('seriseCheckbox','2','0','一个子车系')" value=1 CHECKED 
  type=checkbox>2012款君威GS</LI>
  <LI><INPUT id=seriseCheckbox_1 class=t1126_teys 
  onclick="chg_checkbox('seriseCheckbox','2','1','一个子车系')" value=2 CHECKED 
  type=checkbox>2011款君威GS</LI></UL><EM class=b>排量：</EM> 
<UL class=x>
  <LI><INPUT id=dislCheckbox_0 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','1','0','一种发动机')" value=1,2 CHECKED 
  type=checkbox>2.0T</LI></UL><EM class=c>变速箱：</EM> 
<UL class=y>
  <LI><INPUT id=transtypeCheckbox_0 class=t1126_teys 
  onclick="chg_checkbox('transtypeCheckbox','1','0','一种变速箱')" value=1,2 CHECKED 
  type=checkbox>自动变速箱</LI></UL></DIV>
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
            src="【君威GS】君威GS%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/t1125arr_e.gif" 
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
            src="【君威GS】君威GS%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 112px !important" 
            src="【君威GS】君威GS%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/t1125arr_e.gif" 
            height=1></TH></TR>
        <TR id=base_1>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10898 scope=col><B href="#/m10898/" 
            target=_blank>2012款君威GS 2.0T 超级运动版 </A><I id=base_1_img_10898></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10065 scope=col><B href="#/m10065/" 
            target=_blank>2011款君威GS 2.0T 超级运动版(停产) </A><I 
            id=base_1_img_10065></I> </TH></TR>
        <TR class=hidd>
          <TD id=min_price_10898>28.39万</TD>
          <TD id=min_price_10065>28.39万</TD></TR>
        <TR class=hidd>
          <TD id=bname_10898><B title=上海通用别克 
            href="#/price/b3/" 
          target=_blank>上海通用别克</A></TD>
          <TD id=bname_10065><B title=上海通用别克 
            href="#/price/b3/" 
          target=_blank>上海通用别克</A></TD></TR>
        <TR class=hidd>
          <TD id=type2_10898><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10065><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD></TR>
        <TR class=hidd>
          <TD id=m_disl_10898>2.0L 162kW </TD>
          <TD id=m_disl_10065>2.0L 162kW </TD></TR>
        <TR class=hidd>
          <TD id=m_transtype_10898>6挡自动</TD>
          <TD id=m_transtype_10065>6挡自动</TD></TR>
        <TR class=hidd>
          <TD id=m_length_width_height_10898><!---->4830×1856×1484 <!----></TD>
          <TD id=m_length_width_height_10065><!---->4830×1856×1484 
        <!----></TD></TR>
        <TR class=hidd>
          <TD id=m_frame_10898>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10065>4门 5座 三厢轿车</TD></TR>
        <TR class=disc>
          <TD id=syear_10898>2012</TD>
          <TD id=syear_10065>2011</TD></TR>
        <TR class=hidd>
          <TD id=m_mspeed_10898>232</TD>
          <TD id=m_mspeed_10065>232</TD></TR>
        <TR class=hidd>
          <TD id=m_hatime_10898>7.3</TD>
          <TD id=m_hatime_10065>7.3</TD></TR>
        <TR class=hidd>
          <TD id=m_comfuel_10898>- </TD>
          <TD id=m_comfuel_10065>- </TD></TR>
        <TR class=disc>
          <TD id=m_lkmfuel_10898>- </TD>
          <TD id=m_lkmfuel_10065>- </TD></TR>
        <TR class=disc>
          <TD id=m_hkmfuel_10898>- </TD>
          <TD id=m_hkmfuel_10065>- </TD></TR>
        <TR class=hidd>
          <TD id=m_ypolicy_10898>2年6万公里 </TD>
          <TD id=m_ypolicy_10065>2年6万公里 </TD></TR>
        <TR id=base_2>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10898 scope=col><B href="#/m10898/" 
            target=_blank>2012款君威GS 2.0T 超级运动版</A> <I id=base_2_img_10898></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10065 scope=col><B href="#/m10065/" 
            target=_blank>2011款君威GS 2.0T 超级运动版(停产)</A> <I 
            id=base_2_img_10065></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_length_10898>4830</TD>
          <TD id=m_length_10065>4830</TD></TR>
        <TR class=hidd>
          <TD id=m_width_10898>1856</TD>
          <TD id=m_width_10065>1856</TD></TR>
        <TR class=hidd>
          <TD id=m_height_10898>1484</TD>
          <TD id=m_height_10065>1484</TD></TR>
        <TR class=hidd>
          <TD id=m_wheelbase_10898>2737</TD>
          <TD id=m_wheelbase_10065>2737</TD></TR>
        <TR class=hidd>
          <TD id=m_weight_10898>1650</TD>
          <TD id=m_weight_10065>1650</TD></TR>
        <TR class=hidd>
          <TD id=m_clearance_10898>160</TD>
          <TD id=m_clearance_10065>160</TD></TR>
        <TR class=hidd>
          <TD id=m_frame2_10898>三厢轿车</TD>
          <TD id=m_frame2_10065>三厢轿车</TD></TR>
        <TR class=hidd>
          <TD id=m_door_10898>4</TD>
          <TD id=m_door_10065>4</TD></TR>
        <TR class=hidd>
          <TD id=m_seat_10898>5</TD>
          <TD id=m_seat_10065>5</TD></TR>
        <TR class=hidd>
          <TD id=m_oilbox_10898>70.00</TD>
          <TD id=m_oilbox_10065>70.00</TD></TR>
        <TR class=hidd>
          <TD id=m_trunk_10898>500</TD>
          <TD id=m_trunk_10065>500</TD></TR>
        <TR class=disc>
          <TD id=m_mtrunk_10898>- </TD>
          <TD id=m_mtrunk_10065>500</TD></TR>
        <TR id=base_3>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10898 scope=col><B href="#/m10898/" 
            target=_blank>2012款君威GS 2.0T 超级运动版 </A><I id=base_3_img_10898></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10065 scope=col><B href="#/m10065/" 
            target=_blank>2011款君威GS 2.0T 超级运动版(停产) </A><I 
            id=base_3_img_10065></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_disl2_10898>2.0</TD>
          <TD id=m_disl2_10065>2.0</TD></TR>
        <TR class=hidd>
          <TD id=m_working_10898>涡轮增压</TD>
          <TD id=m_working_10065>涡轮增压</TD></TR>
        <TR class=hidd>
          <TD id=m_mpower_10898>162</TD>
          <TD id=m_mpower_10065>162</TD></TR>
        <TR class=hidd>
          <TD id=m_mpowersp_10898>5300</TD>
          <TD id=m_mpowersp_10065>5300</TD></TR>
        <TR class=hidd>
          <TD id=m_mtorque_10898>350</TD>
          <TD id=m_mtorque_10065>350</TD></TR>
        <TR class=hidd>
          <TD id=m_mtorsp_10898>2000-4000</TD>
          <TD id=m_mtorsp_10065>2000-4000</TD></TR>
        <TR class=hidd>
          <TD id=m_fuel_10898>汽油</TD>
          <TD id=m_fuel_10065>汽油</TD></TR>
        <TR class=hidd>
          <TD id=m_fuelno_10898>93</TD>
          <TD id=m_fuelno_10065>93</TD></TR>
        <TR class=hidd>
          <TD id=m_envstand_10898>国IV </TD>
          <TD id=m_envstand_10065>国IV </TD></TR>
        <TR id=base_4>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10898 scope=col><B href="#/m10898/" 
            target=_blank>2012款君威GS 2.0T 超级运动版 </A><I id=base_4_img_10898></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10065 scope=col><B href="#/m10065/" 
            target=_blank>2011款君威GS 2.0T 超级运动版(停产) </A><I 
            id=base_4_img_10065></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_speed_10898>6</TD>
          <TD id=m_speed_10065>6</TD></TR>
        <TR class=hidd>
          <TD id=m_transtype2_10898>AT</TD>
          <TD id=m_transtype2_10065>AT</TD></TR>
        <TR id=base_5>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10898 scope=col><B href="#/m10898/" 
            target=_blank>2012款君威GS 2.0T 超级运动版 </A><I id=base_5_img_10898></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10065 scope=col><B href="#/m10065/" 
            target=_blank>2011款君威GS 2.0T 超级运动版(停产) </A><I 
            id=base_5_img_10065></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_drivetype_10898>前置前驱</TD>
          <TD id=m_drivetype_10065>前置前驱</TD></TR>
        <TR class=hidd height=60>
          <TD id=m_fsustype_text_10898>麦弗逊式独立悬架</TD>
          <TD id=m_fsustype_text_10065>麦弗逊式独立悬架</TD></TR>
        <TR class=hidd height=60>
          <TD id=m_bsustype_text_10898>多连杆独立悬架</TD>
          <TD id=m_bsustype_text_10065>多连杆独立悬架</TD></TR>
        <TR id=base_6>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10898 scope=col><B href="#/m10898/" 
            target=_blank>2012款君威GS 2.0T 超级运动版 </A><I id=base_6_img_10898></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10065 scope=col><B href="#/m10065/" 
            target=_blank>2011款君威GS 2.0T 超级运动版(停产) </A><I 
            id=base_6_img_10065></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_fbraketype_10898>通风盘式</TD>
          <TD id=m_fbraketype_10065>通风盘式</TD></TR>
        <TR class=hidd>
          <TD id=m_bbraketype_10898>通风盘式</TD>
          <TD id=m_bbraketype_10065>通风盘式</TD></TR>
        <TR class=hidd>
          <TD id=m_ftiresize_10898>245/45 R18</TD>
          <TD id=m_ftiresize_10065>245/45 R18</TD></TR>
        <TR class=hidd>
          <TD id=m_btiresize_10898>245/45 R18</TD>
          <TD id=m_btiresize_10065>245/45 R18</TD></TR>
        <TR class=hidd>
          <TD id=m_sparetire_10898>非全尺寸</TD>
          <TD id=m_sparetire_10065>非全尺寸</TD></TR>
        <TR id=base_7>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10898 scope=col><B href="#/m10898/" 
            target=_blank>2012款君威GS 2.0T 超级运动版 </A><I id=base_7_img_10898></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10065 scope=col><B href="#/m10065/" 
            target=_blank>2011款君威GS 2.0T 超级运动版(停产) </A><I 
            id=base_7_img_10065></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isdairbag_10898>●</TD>
          <TD id=m_isdairbag_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isadairbag_10898>●</TD>
          <TD id=m_isadairbag_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isfhairbag_10898>●</TD>
          <TD id=m_isfhairbag_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbhairbag_10898>●</TD>
          <TD id=m_isbhairbag_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isfsairbag_10898>●</TD>
          <TD id=m_isfsairbag_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbsairbag_10898>-</TD>
          <TD id=m_isbsairbag_10065>-</TD></TR>
        <TR class=hidd>
          <TD id=m_iskairbag_10898>-</TD>
          <TD id=m_iskairbag_10065>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatbeltti_10898>●</TD>
          <TD id=m_isseatbeltti_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iseanti_10898>●</TD>
          <TD id=m_iseanti_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscclock_10898>●</TD>
          <TD id=m_iscclock_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isrekey_10898>●</TD>
          <TD id=m_isrekey_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isnokeysys_10898>●</TD>
          <TD id=m_isnokeysys_10065>●</TD></TR>
        <TR id=base_8>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10898 scope=col><B href="#/m10898/" 
            target=_blank>2012款君威GS 2.0T 超级运动版 </A><I id=base_8_img_10898></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10065 scope=col><B href="#/m10065/" 
            target=_blank>2011款君威GS 2.0T 超级运动版(停产) </A><I 
            id=base_8_img_10065></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isabs_10898>●</TD>
          <TD id=m_isabs_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isesp_10898>●</TD>
          <TD id=m_isesp_10065>●</TD></TR>
        <TR class=disc>
          <TD id=m_isadsus_10898>- </TD>
          <TD id=m_isadsus_10065>-</TD></TR>
        <TR class=hidd>
          <TD id=m_istpmonitor_10898>●</TD>
          <TD id=m_istpmonitor_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_istpruning_10898>-</TD>
          <TD id=m_istpruning_10065>-</TD></TR>
        <TR class=disc>
          <TD id=m_isfsteering_10898>- </TD>
          <TD id=m_isfsteering_10065>- </TD></TR>
        <TR class=disc>
          <TD id=m_issteesys_10898>-</TD>
          <TD id=m_issteesys_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isuphillassist_10898>●</TD>
          <TD id=m_isuphillassist_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isandstitch_10898>-</TD>
          <TD id=m_isandstitch_10065>-</TD></TR>
        <TR id=base_9>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10898 scope=col><B href="#/m10898/" 
            target=_blank>2012款君威GS 2.0T 超级运动版 </A><I id=base_9_img_10898></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10065 scope=col><B href="#/m10065/" 
            target=_blank>2011款君威GS 2.0T 超级运动版(停产) </A><I 
            id=base_9_img_10065></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_iswindow_10898>●</TD>
          <TD id=m_iswindow_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isarwindow_10898>-</TD>
          <TD id=m_isarwindow_10065>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isspround_10898>●</TD>
          <TD id=m_isspround_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isaluhub_10898>●</TD>
          <TD id=m_isaluhub_10065>●</TD></TR>
        <TR id=base_10>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10898 scope=col><B href="#/m10898/" 
            target=_blank>2012款君威GS 2.0T 超级运动版 </A><I id=base_10_img_10898></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10065 scope=col><B href="#/m10065/" 
            target=_blank>2011款君威GS 2.0T 超级运动版(停产) </A><I 
            id=base_10_img_10065></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isleasw_10898>●</TD>
          <TD id=m_isleasw_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswud_10898>●</TD>
          <TD id=m_isswud_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswfb_10898>●</TD>
          <TD id=m_isswfb_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ismultisw_10898>●</TD>
          <TD id=m_ismultisw_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswshift_10898>●</TD>
          <TD id=m_isswshift_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isascd_10898>●</TD>
          <TD id=m_isascd_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isassibc_10898>●</TD>
          <TD id=m_isassibc_10065>●</TD></TR>
        <TR class=disc>
          <TD id=m_isparkvideo_10898>●</TD>
          <TD id=m_isparkvideo_10065>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ispark_10898>-</TD>
          <TD id=m_ispark_10065>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ishud_10898>-</TD>
          <TD id=m_ishud_10065>-</TD></TR>
        <TR id=base_11>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10898 scope=col><B href="#/m10898/" 
            target=_blank>2012款君威GS 2.0T 超级运动版 </A><I id=base_11_img_10898></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10065 scope=col><B href="#/m10065/" 
            target=_blank>2011款君威GS 2.0T 超级运动版(停产) </A><I 
            id=base_11_img_10065></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isleaseat_10898>●</TD>
          <TD id=m_isleaseat_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatadj_10898>●</TD>
          <TD id=m_isseatadj_10065>●</TD></TR>
        <TR class=disc>
          <TD id=m_iswaistadj_10898>-</TD>
          <TD id=m_iswaistadj_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isfseatadj_10898>●</TD>
          <TD id=m_isfseatadj_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iseseatmem_10898>●</TD>
          <TD id=m_iseseatmem_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isseathot_10898>●</TD>
          <TD id=m_isseathot_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatknead_10898>●</TD>
          <TD id=m_isseatknead_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbseatlay_10898>-</TD>
          <TD id=m_isbseatlay_10065>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isbseatplay_10898>●</TD>
          <TD id=m_isbseatplay_10065>●</TD></TR>
        <TR id=base_12>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10898 scope=col><B href="#/m10898/" 
            target=_blank>2012款君威GS 2.0T 超级运动版 </A><I id=base_12_img_10898></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10065 scope=col><B href="#/m10065/" 
            target=_blank>2011款君威GS 2.0T 超级运动版(停产) </A><I 
            id=base_12_img_10065></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isgps_10898>●</TD>
          <TD id=m_isgps_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbluetooth_10898>●</TD>
          <TD id=m_isbluetooth_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_istv_10898>-</TD>
          <TD id=m_istv_10065>-</TD></TR>
        <TR class=hidd>
          <TD id=m_iscclcd_10898>●</TD>
          <TD id=m_iscclcd_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isblcd_10898>-</TD>
          <TD id=m_isblcd_10065>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ismp3_10898>●</TD>
          <TD id=m_ismp3_10065>●</TD></TR>
        <TR class=disc>
          <TD id=m_iscd_10898>-</TD>
          <TD id=m_iscd_10065>-</TD></TR>
        <TR class=disc>
          <TD id=m_iscd_10898>- </TD>
          <TD id=m_iscd_10065>- </TD></TR>
        <TR class=disc>
          <TD id=10898>●</TD>
          <TD id=10065>●</TD></TR>
        <TR class=disc>
          <TD id=10898>1 </TD>
          <TD id=10065>1 </TD></TR>
        <TR class=hidd>
          <TD id=m_is2audio_10898>-</TD>
          <TD id=m_is2audio_10065>-</TD></TR>
        <TR class=hidd>
          <TD id=m_is4audio_10898>-</TD>
          <TD id=m_is4audio_10065>-</TD></TR>
        <TR class=hidd>
          <TD id=m_is6audio_10898>-</TD>
          <TD id=m_is6audio_10065>-</TD></TR>
        <TR class=hidd>
          <TD id=m_is8audio_10898>●</TD>
          <TD id=m_is8audio_10065>●</TD></TR>
        <TR id=base_13>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10898 scope=col><B href="#/m10898/" 
            target=_blank>2012款君威GS 2.0T 超级运动版 </A><I id=base_13_img_10898></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10065 scope=col><B href="#/m10065/" 
            target=_blank>2011款君威GS 2.0T 超级运动版(停产) </A><I 
            id=base_13_img_10065></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isxelamp_10898>●</TD>
          <TD id=m_isxelamp_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isautohlamp_10898>●</TD>
          <TD id=m_isautohlamp_10065>●</TD></TR>
        <TR class=disc>
          <TD id=m_isturnhlamp_10898>-</TD>
          <TD id=m_isturnhlamp_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ishfoglamp_10898>-</TD>
          <TD id=m_ishfoglamp_10065>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isbfoglamp_10898>●</TD>
          <TD id=m_isbfoglamp_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_islampheiadj_10898>●</TD>
          <TD id=m_islampheiadj_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_islampclset_10898>●</TD>
          <TD id=m_islampclset_10065>●</TD></TR>
        <TR id=base_14>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10898 scope=col><B href="#/m10898/" 
            target=_blank>2012款君威GS 2.0T 超级运动版 </A><I id=base_14_img_10898></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10065 scope=col><B href="#/m10065/" 
            target=_blank>2011款君威GS 2.0T 超级运动版(停产) </A><I 
            id=base_14_img_10065></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isfewindow_10898>●</TD>
          <TD id=m_isfewindow_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbewindow_10898>●</TD>
          <TD id=m_isbewindow_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isgnhand_10898>●</TD>
          <TD id=m_isgnhand_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ispreventionuv_10898>-</TD>
          <TD id=m_ispreventionuv_10065>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isermirror_10898>●</TD>
          <TD id=m_isermirror_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ishotrmirror_10898>●</TD>
          <TD id=m_ishotrmirror_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ismemorymirror_10898>●</TD>
          <TD id=m_ismemorymirror_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iseprmirror_10898>●</TD>
          <TD id=m_iseprmirror_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isrmirrorge_10898>●</TD>
          <TD id=m_isrmirrorge_10065>●</TD></TR>
        <TR class=disc>
          <TD id=m_isbsvisor_10898>- </TD>
          <TD id=m_isbsvisor_10065>- </TD></TR><!--	



			<tr class="hidd" >



				



				


					


						<td id="m_ishbsvisor_10898">-</td>



					


						<td id="m_ishbsvisor_10065">-</td>



					


							</tr>







			<tr class="hidd" >



				



				


					


						<td id="m_isebsvisor_10898"> - </td>



					


						<td id="m_isebsvisor_10065"> - </td>



					


							</tr>



-->
        <TR class=hidd>
          <TD id=m_isbssvisor_10898>-</TD>
          <TD id=m_isbssvisor_10065>-</TD></TR>
        <TR class=hidd>
          <TD id=m_issvisordr_10898>●</TD>
          <TD id=m_issvisordr_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isinswiper_10898>●</TD>
          <TD id=m_isinswiper_10065>●</TD></TR>
        <TR id=base_15>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10898 scope=col><B href="#/m10898/" 
            target=_blank>2012款君威GS 2.0T 超级运动版 </A><I id=base_15_img_10898></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10065 scope=col><B href="#/m10065/" 
            target=_blank>2011款君威GS 2.0T 超级运动版(停产) </A><I 
            id=base_15_img_10065></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isairc_10898>●</TD>
          <TD id=m_isairc_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbsairo_10898>●</TD>
          <TD id=m_isbsairo_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_istempdct_10898>●</TD>
          <TD id=m_istempdct_10065>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscaricebox_10898>-</TD>
          <TD 
id=m_iscaricebox_10065>-</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
<DIV class=clear></DIV></DIV>\
<SCRIPT type=text/javascript 
src="【君威GS】君威GS%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/analytics.htm"></SCRIPT>
<!--登陆js-->
<SCRIPT 
src="【君威GS】君威GS%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/new_login2011_newcar.htm"></SCRIPT>

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
    <OPTION selected value=10898>2012款君威GS 2.0T 超级运动版</OPTION> <OPTION 
    value=10065>2011款君威GS 2.0T 超级运动版</OPTION></SELECT></LI>
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
src="【君威GS】君威GS%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/news_forall.js"></SCRIPT>

<SCRIPT type=text/javascript 
src="【君威GS】君威GS%20汽车配置_参数%20上海通用别克_爱卡汽车网_files/dw.js"></SCRIPT>

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
