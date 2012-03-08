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
  CHECKED type=checkbox>2012款奥迪A4L </LI></UL><EM class=b>排量：</EM> 
<UL class=x>
  <LI><INPUT id=dislCheckbox_0 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','2','0','一种发动机')" value=1,2 CHECKED 
  type=checkbox>1.8T </LI>
  <LI><INPUT id=dislCheckbox_1 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','2','1','一种发动机')" value=3,4,5,6,7,8 
  CHECKED type=checkbox>2.0T </LI></UL><EM class=c>变速箱：</EM> 
<UL class=y>
  <LI><INPUT id=transtypeCheckbox_0 class=t1126_teys 
  onclick="chg_checkbox('transtypeCheckbox','2','0','一种变速箱')" value=1 CHECKED 
  type=checkbox>手动变速箱 </LI>
  <LI><INPUT id=transtypeCheckbox_1 class=t1126_teys 
  onclick="chg_checkbox('transtypeCheckbox','2','1','一种变速箱')" 
  value=2,3,4,5,6,7,8 CHECKED type=checkbox>无极变速箱 </LI></UL></DIV>
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
            style="WIDTH: 147px !important" src="a7_files/t1125arr_e.gif" 
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
      <TABLE style="BORDER-LEFT-WIDTH: 0px" id=Table1 class=t1125_se_tab 
      border=0 cellSpacing=0 cellPadding=0 width="100%">
        <TBODY>
        <TR>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a7_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a7_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a7_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a7_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a7_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a7_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a7_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a7_files/t1125arr_e.gif" 
            height=1></TH></TR>
        <TR id=base_1>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10006 scope=col><B href="#/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_1_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="#/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_1_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="#/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_1_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="#/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_1_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="#/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_1_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="#/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_1_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="#/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_1_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="#/m10013/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT尊享版 </A><I 
            id=base_1_img_10013></I> </TH></TR>
        <TR class=disc>
          <TD id=min_price_10006>27.28万</TD>
          <TD id=min_price_10007>29.10万</TD>
          <TD id=min_price_10008>30.98万</TD>
          <TD id=min_price_10009>32.99万</TD>
          <TD id=min_price_10010>36.98万</TD>
          <TD id=min_price_10011>39.90万</TD>
          <TD id=min_price_10012>42.38万</TD>
          <TD id=min_price_10013>46.45万</TD></TR>
        <TR class=hidd>
          <TD id=bname_10006><B title=一汽奥迪 
            href="#/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_10007><B title=一汽奥迪 
            href="#/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_10008><B title=一汽奥迪 
            href="#/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_10009><B title=一汽奥迪 
            href="#/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_10010><B title=一汽奥迪 
            href="#/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_10011><B title=一汽奥迪 
            href="#/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_10012><B title=一汽奥迪 
            href="#/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_10013><B title=一汽奥迪 
            href="#/price/b5/" 
        target=_blank>一汽奥迪</A></TD></TR>
        <TR class=hidd>
          <TD id=type2_10006><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10007><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10008><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10009><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10010><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10011><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10012><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10013><B 
            href="#/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD></TR>
        <TR class=disc>
          <TD id=m_disl_10006>1.8L 118kW </TD>
          <TD id=m_disl_10007>1.8L 118kW </TD>
          <TD id=m_disl_10008>2.0L 132kW </TD>
          <TD id=m_disl_10009>2.0L 132kW </TD>
          <TD id=m_disl_10010>2.0L 132kW </TD>
          <TD id=m_disl_10011>2.0L 132kW </TD>
          <TD id=m_disl_10012>2.0L 155kW </TD>
          <TD id=m_disl_10013>2.0L 155kW </TD></TR>
        <TR class=disc>
          <TD id=m_transtype_10006>6挡手动</TD>
          <TD id=m_transtype_10007>8挡无级变速器</TD>
          <TD id=m_transtype_10008>8挡无级变速器</TD>
          <TD id=m_transtype_10009>8挡无级变速器</TD>
          <TD id=m_transtype_10010>8挡无级变速器</TD>
          <TD id=m_transtype_10011>8挡无级变速器</TD>
          <TD id=m_transtype_10012>8挡无级变速器</TD>
          <TD id=m_transtype_10013>8挡无级变速器</TD></TR>
        <TR class=hidd>
          <TD id=m_length_width_height_10006><!---->4763×1826×1426 <!----></TD>
          <TD id=m_length_width_height_10007><!---->4763×1826×1426 <!----></TD>
          <TD id=m_length_width_height_10008><!---->4763×1826×1426 <!----></TD>
          <TD id=m_length_width_height_10009><!---->4763×1826×1426 <!----></TD>
          <TD id=m_length_width_height_10010><!---->4763×1826×1426 <!----></TD>
          <TD id=m_length_width_height_10011><!---->4763×1826×1426 <!----></TD>
          <TD id=m_length_width_height_10012><!---->4763×1826×1426 <!----></TD>
          <TD id=m_length_width_height_10013><!---->4763×1826×1426 
        <!----></TD></TR>
        <TR class=hidd>
          <TD id=m_frame_10006>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10007>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10008>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10009>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10010>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10011>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10012>4门 5座 三厢轿车</TD>
          <TD id=m_frame_10013>4门 5座 三厢轿车</TD></TR>
        <TR class=hidd>
          <TD id=syear_10006>2011</TD>
          <TD id=syear_10007>2011</TD>
          <TD id=syear_10008>2011</TD>
          <TD id=syear_10009>2011</TD>
          <TD id=syear_10010>2011</TD>
          <TD id=syear_10011>2011</TD>
          <TD id=syear_10012>2011</TD>
          <TD id=syear_10013>2011</TD></TR>
        <TR class=disc>
          <TD id=m_mspeed_10006>220</TD>
          <TD id=m_mspeed_10007>216</TD>
          <TD id=m_mspeed_10008>225</TD>
          <TD id=m_mspeed_10009>225</TD>
          <TD id=m_mspeed_10010>225</TD>
          <TD id=m_mspeed_10011>225</TD>
          <TD id=m_mspeed_10012>235</TD>
          <TD id=m_mspeed_10013>235</TD></TR>
        <TR class=disc>
          <TD id=m_hatime_10006>- </TD>
          <TD id=m_hatime_10007>9</TD>
          <TD id=m_hatime_10008>8.4</TD>
          <TD id=m_hatime_10009>8.4</TD>
          <TD id=m_hatime_10010>8.4</TD>
          <TD id=m_hatime_10011>8.4</TD>
          <TD id=m_hatime_10012>7.3</TD>
          <TD id=m_hatime_10013>7.3</TD></TR>
        <TR class=hidd>
          <TD id=m_comfuel_10006>- </TD>
          <TD id=m_comfuel_10007>- </TD>
          <TD id=m_comfuel_10008>- </TD>
          <TD id=m_comfuel_10009>- </TD>
          <TD id=m_comfuel_10010>- </TD>
          <TD id=m_comfuel_10011>- </TD>
          <TD id=m_comfuel_10012>- </TD>
          <TD id=m_comfuel_10013>- </TD></TR>
        <TR class=hidd>
          <TD id=m_lkmfuel_10006>- </TD>
          <TD id=m_lkmfuel_10007>- </TD>
          <TD id=m_lkmfuel_10008>- </TD>
          <TD id=m_lkmfuel_10009>- </TD>
          <TD id=m_lkmfuel_10010>- </TD>
          <TD id=m_lkmfuel_10011>- </TD>
          <TD id=m_lkmfuel_10012>- </TD>
          <TD id=m_lkmfuel_10013>- </TD></TR>
        <TR class=hidd>
          <TD id=m_hkmfuel_10006>- </TD>
          <TD id=m_hkmfuel_10007>- </TD>
          <TD id=m_hkmfuel_10008>- </TD>
          <TD id=m_hkmfuel_10009>- </TD>
          <TD id=m_hkmfuel_10010>- </TD>
          <TD id=m_hkmfuel_10011>- </TD>
          <TD id=m_hkmfuel_10012>- </TD>
          <TD id=m_hkmfuel_10013>- </TD></TR>
        <TR class=hidd>
          <TD id=m_ypolicy_10006>2年 </TD>
          <TD id=m_ypolicy_10007>2年 </TD>
          <TD id=m_ypolicy_10008>2年 </TD>
          <TD id=m_ypolicy_10009>2年 </TD>
          <TD id=m_ypolicy_10010>2年 </TD>
          <TD id=m_ypolicy_10011>2年 </TD>
          <TD id=m_ypolicy_10012>2年 </TD>
          <TD id=m_ypolicy_10013>2年 </TD></TR>
        <TR id=base_2>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10006 scope=col><B href="#/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版</A> <I 
            id=base_2_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="#/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版</A> <I 
            id=base_2_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="#/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版</A> <I 
            id=base_2_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="#/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版</A> <I 
            id=base_2_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="#/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版</A> <I 
            id=base_2_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="#/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版</A> <I 
            id=base_2_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="#/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版</A> <I 
            id=base_2_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="#/m10013/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT尊享版</A> <I 
            id=base_2_img_10013></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_length_10006>4763</TD>
          <TD id=m_length_10007>4763</TD>
          <TD id=m_length_10008>4763</TD>
          <TD id=m_length_10009>4763</TD>
          <TD id=m_length_10010>4763</TD>
          <TD id=m_length_10011>4763</TD>
          <TD id=m_length_10012>4763</TD>
          <TD id=m_length_10013>4763</TD></TR>
        <TR class=hidd>
          <TD id=m_width_10006>1826</TD>
          <TD id=m_width_10007>1826</TD>
          <TD id=m_width_10008>1826</TD>
          <TD id=m_width_10009>1826</TD>
          <TD id=m_width_10010>1826</TD>
          <TD id=m_width_10011>1826</TD>
          <TD id=m_width_10012>1826</TD>
          <TD id=m_width_10013>1826</TD></TR>
        <TR class=hidd>
          <TD id=m_height_10006>1426</TD>
          <TD id=m_height_10007>1426</TD>
          <TD id=m_height_10008>1426</TD>
          <TD id=m_height_10009>1426</TD>
          <TD id=m_height_10010>1426</TD>
          <TD id=m_height_10011>1426</TD>
          <TD id=m_height_10012>1426</TD>
          <TD id=m_height_10013>1426</TD></TR>
        <TR class=hidd>
          <TD id=m_wheelbase_10006>2869</TD>
          <TD id=m_wheelbase_10007>2869</TD>
          <TD id=m_wheelbase_10008>2869</TD>
          <TD id=m_wheelbase_10009>2869</TD>
          <TD id=m_wheelbase_10010>2869</TD>
          <TD id=m_wheelbase_10011>2869</TD>
          <TD id=m_wheelbase_10012>2869</TD>
          <TD id=m_wheelbase_10013>2869</TD></TR>
        <TR class=disc>
          <TD id=m_weight_10006>- </TD>
          <TD id=m_weight_10007>1610</TD>
          <TD id=m_weight_10008>1615</TD>
          <TD id=m_weight_10009>1615</TD>
          <TD id=m_weight_10010>1615</TD>
          <TD id=m_weight_10011>1615</TD>
          <TD id=m_weight_10012>1630</TD>
          <TD id=m_weight_10013>1630</TD></TR>
        <TR class=hidd>
          <TD id=m_clearance_10006>130</TD>
          <TD id=m_clearance_10007>130</TD>
          <TD id=m_clearance_10008>130</TD>
          <TD id=m_clearance_10009>130</TD>
          <TD id=m_clearance_10010>130</TD>
          <TD id=m_clearance_10011>130</TD>
          <TD id=m_clearance_10012>130</TD>
          <TD id=m_clearance_10013>130</TD></TR>
        <TR class=hidd>
          <TD id=m_frame2_10006>三厢轿车</TD>
          <TD id=m_frame2_10007>三厢轿车</TD>
          <TD id=m_frame2_10008>三厢轿车</TD>
          <TD id=m_frame2_10009>三厢轿车</TD>
          <TD id=m_frame2_10010>三厢轿车</TD>
          <TD id=m_frame2_10011>三厢轿车</TD>
          <TD id=m_frame2_10012>三厢轿车</TD>
          <TD id=m_frame2_10013>三厢轿车</TD></TR>
        <TR class=hidd>
          <TD id=m_door_10006>4</TD>
          <TD id=m_door_10007>4</TD>
          <TD id=m_door_10008>4</TD>
          <TD id=m_door_10009>4</TD>
          <TD id=m_door_10010>4</TD>
          <TD id=m_door_10011>4</TD>
          <TD id=m_door_10012>4</TD>
          <TD id=m_door_10013>4</TD></TR>
        <TR class=hidd>
          <TD id=m_seat_10006>5</TD>
          <TD id=m_seat_10007>5</TD>
          <TD id=m_seat_10008>5</TD>
          <TD id=m_seat_10009>5</TD>
          <TD id=m_seat_10010>5</TD>
          <TD id=m_seat_10011>5</TD>
          <TD id=m_seat_10012>5</TD>
          <TD id=m_seat_10013>5</TD></TR>
        <TR class=hidd>
          <TD id=m_oilbox_10006>65.00</TD>
          <TD id=m_oilbox_10007>65.00</TD>
          <TD id=m_oilbox_10008>65.00</TD>
          <TD id=m_oilbox_10009>65.00</TD>
          <TD id=m_oilbox_10010>65.00</TD>
          <TD id=m_oilbox_10011>65.00</TD>
          <TD id=m_oilbox_10012>65.00</TD>
          <TD id=m_oilbox_10013>65.00</TD></TR>
        <TR class=hidd>
          <TD id=m_trunk_10006>480</TD>
          <TD id=m_trunk_10007>480</TD>
          <TD id=m_trunk_10008>480</TD>
          <TD id=m_trunk_10009>480</TD>
          <TD id=m_trunk_10010>480</TD>
          <TD id=m_trunk_10011>480</TD>
          <TD id=m_trunk_10012>480</TD>
          <TD id=m_trunk_10013>480</TD></TR>
        <TR class=hidd>
          <TD id=m_mtrunk_10006>480</TD>
          <TD id=m_mtrunk_10007>480</TD>
          <TD id=m_mtrunk_10008>480</TD>
          <TD id=m_mtrunk_10009>480</TD>
          <TD id=m_mtrunk_10010>480</TD>
          <TD id=m_mtrunk_10011>480</TD>
          <TD id=m_mtrunk_10012>480</TD>
          <TD id=m_mtrunk_10013>480</TD></TR>
        <TR id=base_3>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10006 scope=col><B href="#/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_3_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="#/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_3_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="#/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_3_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="#/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_3_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="#/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_3_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="#/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_3_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="#/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_3_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="#/m10013/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT尊享版 </A><I 
            id=base_3_img_10013></I> </TH></TR>
        <TR class=disc>
          <TD id=m_disl2_10006>1.8</TD>
          <TD id=m_disl2_10007>1.8</TD>
          <TD id=m_disl2_10008>2.0</TD>
          <TD id=m_disl2_10009>2.0</TD>
          <TD id=m_disl2_10010>2.0</TD>
          <TD id=m_disl2_10011>2.0</TD>
          <TD id=m_disl2_10012>2.0</TD>
          <TD id=m_disl2_10013>2.0</TD></TR>
        <TR class=hidd>
          <TD id=m_working_10006>涡轮增压</TD>
          <TD id=m_working_10007>涡轮增压</TD>
          <TD id=m_working_10008>涡轮增压</TD>
          <TD id=m_working_10009>涡轮增压</TD>
          <TD id=m_working_10010>涡轮增压</TD>
          <TD id=m_working_10011>涡轮增压</TD>
          <TD id=m_working_10012>涡轮增压</TD>
          <TD id=m_working_10013>涡轮增压</TD></TR>
        <TR class=disc>
          <TD id=m_mpower_10006>118</TD>
          <TD id=m_mpower_10007>118</TD>
          <TD id=m_mpower_10008>132</TD>
          <TD id=m_mpower_10009>132</TD>
          <TD id=m_mpower_10010>132</TD>
          <TD id=m_mpower_10011>132</TD>
          <TD id=m_mpower_10012>155</TD>
          <TD id=m_mpower_10013>155</TD></TR>
        <TR class=disc>
          <TD id=m_mpowersp_10006>4500-6200</TD>
          <TD id=m_mpowersp_10007>4500-6200</TD>
          <TD id=m_mpowersp_10008>4000-6000</TD>
          <TD id=m_mpowersp_10009>4000-6000</TD>
          <TD id=m_mpowersp_10010>4000-6000</TD>
          <TD id=m_mpowersp_10011>4000-6000</TD>
          <TD id=m_mpowersp_10012>4300-6000</TD>
          <TD id=m_mpowersp_10013>4300-6000</TD></TR>
        <TR class=disc>
          <TD id=m_mtorque_10006>250</TD>
          <TD id=m_mtorque_10007>250</TD>
          <TD id=m_mtorque_10008>320</TD>
          <TD id=m_mtorque_10009>320</TD>
          <TD id=m_mtorque_10010>320</TD>
          <TD id=m_mtorque_10011>320</TD>
          <TD id=m_mtorque_10012>350</TD>
          <TD id=m_mtorque_10013>350</TD></TR>
        <TR class=disc>
          <TD id=m_mtorsp_10006>1500-4500</TD>
          <TD id=m_mtorsp_10007>1500-4500</TD>
          <TD id=m_mtorsp_10008>1500-3900</TD>
          <TD id=m_mtorsp_10009>1500-3900</TD>
          <TD id=m_mtorsp_10010>1500-3900</TD>
          <TD id=m_mtorsp_10011>1500-3900</TD>
          <TD id=m_mtorsp_10012>1500-4200</TD>
          <TD id=m_mtorsp_10013>1500-4200</TD></TR>
        <TR class=hidd>
          <TD id=m_fuel_10006>汽油</TD>
          <TD id=m_fuel_10007>汽油</TD>
          <TD id=m_fuel_10008>汽油</TD>
          <TD id=m_fuel_10009>汽油</TD>
          <TD id=m_fuel_10010>汽油</TD>
          <TD id=m_fuel_10011>汽油</TD>
          <TD id=m_fuel_10012>汽油</TD>
          <TD id=m_fuel_10013>汽油</TD></TR>
        <TR class=hidd>
          <TD id=m_fuelno_10006>97</TD>
          <TD id=m_fuelno_10007>97</TD>
          <TD id=m_fuelno_10008>97</TD>
          <TD id=m_fuelno_10009>97</TD>
          <TD id=m_fuelno_10010>97</TD>
          <TD id=m_fuelno_10011>97</TD>
          <TD id=m_fuelno_10012>97</TD>
          <TD id=m_fuelno_10013>97</TD></TR>
        <TR class=hidd>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_10006>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_10007>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_10008>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_10009>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_10010>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_10011>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_10012>国IV+OBD </TD>
          <TD style="HEIGHT: 100px; OVERFLOW: hidden" 
            id=m_envstand_10013>国IV+OBD </TD></TR>
        <TR id=base_4>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10006 scope=col><B href="#/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_4_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="#/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_4_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="#/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_4_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="#/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_4_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="#/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_4_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="#/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_4_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="#/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_4_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="#/m10013/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT尊享版 </A><I 
            id=base_4_img_10013></I> </TH></TR>
        <TR class=disc>
          <TD id=m_speed_10006>6</TD>
          <TD id=m_speed_10007>8</TD>
          <TD id=m_speed_10008>8</TD>
          <TD id=m_speed_10009>8</TD>
          <TD id=m_speed_10010>8</TD>
          <TD id=m_speed_10011>8</TD>
          <TD id=m_speed_10012>8</TD>
          <TD id=m_speed_10013>8</TD></TR>
        <TR class=disc>
          <TD id=m_transtype2_10006>MT</TD>
          <TD id=m_transtype2_10007>CVT</TD>
          <TD id=m_transtype2_10008>CVT</TD>
          <TD id=m_transtype2_10009>CVT</TD>
          <TD id=m_transtype2_10010>CVT</TD>
          <TD id=m_transtype2_10011>CVT</TD>
          <TD id=m_transtype2_10012>CVT</TD>
          <TD id=m_transtype2_10013>CVT</TD></TR>
        <TR id=base_5>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10006 scope=col><B href="#/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_5_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="#/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_5_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="#/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_5_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="#/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_5_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="#/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_5_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="#/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_5_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="#/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_5_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="#/m10013/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT尊享版 </A><I 
            id=base_5_img_10013></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_drivetype_10006>前置前驱</TD>
          <TD id=m_drivetype_10007>前置前驱</TD>
          <TD id=m_drivetype_10008>前置前驱</TD>
          <TD id=m_drivetype_10009>前置前驱</TD>
          <TD id=m_drivetype_10010>前置前驱</TD>
          <TD id=m_drivetype_10011>前置前驱</TD>
          <TD id=m_drivetype_10012>前置前驱</TD>
          <TD id=m_drivetype_10013>前置前驱</TD></TR>
        <TR class=hidd height=60>
          <TD id=m_fsustype_text_10006>五连杆式独立悬挂</TD>
          <TD id=m_fsustype_text_10007>五连杆式独立悬挂</TD>
          <TD id=m_fsustype_text_10008>五连杆式独立悬挂</TD>
          <TD id=m_fsustype_text_10009>五连杆式独立悬挂</TD>
          <TD id=m_fsustype_text_10010>五连杆式独立悬挂</TD>
          <TD id=m_fsustype_text_10011>五连杆式独立悬挂</TD>
          <TD id=m_fsustype_text_10012>五连杆式独立悬挂</TD>
          <TD id=m_fsustype_text_10013>五连杆式独立悬挂</TD></TR>
        <TR class=hidd height=60>
          <TD id=m_bsustype_text_10006>梯形连杆式独立悬挂</TD>
          <TD id=m_bsustype_text_10007>梯形连杆式独立悬挂</TD>
          <TD id=m_bsustype_text_10008>梯形连杆式独立悬挂</TD>
          <TD id=m_bsustype_text_10009>梯形连杆式独立悬挂</TD>
          <TD id=m_bsustype_text_10010>梯形连杆式独立悬挂</TD>
          <TD id=m_bsustype_text_10011>梯形连杆式独立悬挂</TD>
          <TD id=m_bsustype_text_10012>梯形连杆式独立悬挂</TD>
          <TD id=m_bsustype_text_10013>梯形连杆式独立悬挂</TD></TR>
        <TR id=base_6>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10006 scope=col><B href="#/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_6_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="#/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_6_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="#/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_6_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="#/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_6_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="#/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_6_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="#/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_6_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="#/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_6_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="#/m10013/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT尊享版 </A><I 
            id=base_6_img_10013></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_fbraketype_10006>盘式</TD>
          <TD id=m_fbraketype_10007>盘式</TD>
          <TD id=m_fbraketype_10008>盘式</TD>
          <TD id=m_fbraketype_10009>盘式</TD>
          <TD id=m_fbraketype_10010>盘式</TD>
          <TD id=m_fbraketype_10011>盘式</TD>
          <TD id=m_fbraketype_10012>盘式</TD>
          <TD id=m_fbraketype_10013>盘式</TD></TR>
        <TR class=hidd>
          <TD id=m_bbraketype_10006>盘式</TD>
          <TD id=m_bbraketype_10007>盘式</TD>
          <TD id=m_bbraketype_10008>盘式</TD>
          <TD id=m_bbraketype_10009>盘式</TD>
          <TD id=m_bbraketype_10010>盘式</TD>
          <TD id=m_bbraketype_10011>盘式</TD>
          <TD id=m_bbraketype_10012>盘式</TD>
          <TD id=m_bbraketype_10013>盘式</TD></TR>
        <TR class=disc>
          <TD id=m_ftiresize_10006>225/55 R16</TD>
          <TD id=m_ftiresize_10007>225/55 R16</TD>
          <TD id=m_ftiresize_10008>225/55 R16</TD>
          <TD id=m_ftiresize_10009>225/55 R16</TD>
          <TD id=m_ftiresize_10010>225/55 R16</TD>
          <TD id=m_ftiresize_10011>245/45 R17</TD>
          <TD id=m_ftiresize_10012>245/40 R18</TD>
          <TD id=m_ftiresize_10013>245/40 R18</TD></TR>
        <TR class=disc>
          <TD id=m_btiresize_10006>225/55 R16</TD>
          <TD id=m_btiresize_10007>225/55 R16</TD>
          <TD id=m_btiresize_10008>225/55 R16</TD>
          <TD id=m_btiresize_10009>225/55 R16</TD>
          <TD id=m_btiresize_10010>225/55 R16</TD>
          <TD id=m_btiresize_10011>245/45 R17</TD>
          <TD id=m_btiresize_10012>245/40 R18</TD>
          <TD id=m_btiresize_10013>245/40 R18</TD></TR>
        <TR class=hidd>
          <TD id=m_sparetire_10006>非全尺寸</TD>
          <TD id=m_sparetire_10007>非全尺寸</TD>
          <TD id=m_sparetire_10008>非全尺寸</TD>
          <TD id=m_sparetire_10009>非全尺寸</TD>
          <TD id=m_sparetire_10010>非全尺寸</TD>
          <TD id=m_sparetire_10011>非全尺寸</TD>
          <TD id=m_sparetire_10012>非全尺寸</TD>
          <TD id=m_sparetire_10013>非全尺寸</TD></TR>
        <TR id=base_7>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10006 scope=col><B href="#/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_7_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="#/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_7_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="#/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_7_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="#/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_7_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="#/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_7_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="#/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_7_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="#/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_7_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="#/m10013/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT尊享版 </A><I 
            id=base_7_img_10013></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isdairbag_10006>●</TD>
          <TD id=m_isdairbag_10007>●</TD>
          <TD id=m_isdairbag_10008>●</TD>
          <TD id=m_isdairbag_10009>●</TD>
          <TD id=m_isdairbag_10010>●</TD>
          <TD id=m_isdairbag_10011>●</TD>
          <TD id=m_isdairbag_10012>●</TD>
          <TD id=m_isdairbag_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isadairbag_10006>●</TD>
          <TD id=m_isadairbag_10007>●</TD>
          <TD id=m_isadairbag_10008>●</TD>
          <TD id=m_isadairbag_10009>●</TD>
          <TD id=m_isadairbag_10010>●</TD>
          <TD id=m_isadairbag_10011>●</TD>
          <TD id=m_isadairbag_10012>●</TD>
          <TD id=m_isadairbag_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isfhairbag_10006>●</TD>
          <TD id=m_isfhairbag_10007>●</TD>
          <TD id=m_isfhairbag_10008>●</TD>
          <TD id=m_isfhairbag_10009>●</TD>
          <TD id=m_isfhairbag_10010>●</TD>
          <TD id=m_isfhairbag_10011>●</TD>
          <TD id=m_isfhairbag_10012>●</TD>
          <TD id=m_isfhairbag_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbhairbag_10006>●</TD>
          <TD id=m_isbhairbag_10007>●</TD>
          <TD id=m_isbhairbag_10008>●</TD>
          <TD id=m_isbhairbag_10009>●</TD>
          <TD id=m_isbhairbag_10010>●</TD>
          <TD id=m_isbhairbag_10011>●</TD>
          <TD id=m_isbhairbag_10012>●</TD>
          <TD id=m_isbhairbag_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isfsairbag_10006>●</TD>
          <TD id=m_isfsairbag_10007>●</TD>
          <TD id=m_isfsairbag_10008>●</TD>
          <TD id=m_isfsairbag_10009>●</TD>
          <TD id=m_isfsairbag_10010>●</TD>
          <TD id=m_isfsairbag_10011>●</TD>
          <TD id=m_isfsairbag_10012>●</TD>
          <TD id=m_isfsairbag_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_isbsairbag_10006>-</TD>
          <TD id=m_isbsairbag_10007>-</TD>
          <TD id=m_isbsairbag_10008>-</TD>
          <TD id=m_isbsairbag_10009>●</TD>
          <TD id=m_isbsairbag_10010>●</TD>
          <TD id=m_isbsairbag_10011>●</TD>
          <TD id=m_isbsairbag_10012>●</TD>
          <TD id=m_isbsairbag_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iskairbag_10006>-</TD>
          <TD id=m_iskairbag_10007>-</TD>
          <TD id=m_iskairbag_10008>-</TD>
          <TD id=m_iskairbag_10009>-</TD>
          <TD id=m_iskairbag_10010>-</TD>
          <TD id=m_iskairbag_10011>-</TD>
          <TD id=m_iskairbag_10012>-</TD>
          <TD id=m_iskairbag_10013>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatbeltti_10006>●</TD>
          <TD id=m_isseatbeltti_10007>●</TD>
          <TD id=m_isseatbeltti_10008>●</TD>
          <TD id=m_isseatbeltti_10009>●</TD>
          <TD id=m_isseatbeltti_10010>●</TD>
          <TD id=m_isseatbeltti_10011>●</TD>
          <TD id=m_isseatbeltti_10012>●</TD>
          <TD id=m_isseatbeltti_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iseanti_10006>●</TD>
          <TD id=m_iseanti_10007>●</TD>
          <TD id=m_iseanti_10008>●</TD>
          <TD id=m_iseanti_10009>●</TD>
          <TD id=m_iseanti_10010>●</TD>
          <TD id=m_iseanti_10011>●</TD>
          <TD id=m_iseanti_10012>●</TD>
          <TD id=m_iseanti_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscclock_10006>●</TD>
          <TD id=m_iscclock_10007>●</TD>
          <TD id=m_iscclock_10008>●</TD>
          <TD id=m_iscclock_10009>●</TD>
          <TD id=m_iscclock_10010>●</TD>
          <TD id=m_iscclock_10011>●</TD>
          <TD id=m_iscclock_10012>●</TD>
          <TD id=m_iscclock_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isrekey_10006>●</TD>
          <TD id=m_isrekey_10007>●</TD>
          <TD id=m_isrekey_10008>●</TD>
          <TD id=m_isrekey_10009>●</TD>
          <TD id=m_isrekey_10010>●</TD>
          <TD id=m_isrekey_10011>●</TD>
          <TD id=m_isrekey_10012>●</TD>
          <TD id=m_isrekey_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_isnokeysys_10006>-</TD>
          <TD id=m_isnokeysys_10007>-</TD>
          <TD id=m_isnokeysys_10008>-</TD>
          <TD id=m_isnokeysys_10009>-</TD>
          <TD id=m_isnokeysys_10010>●</TD>
          <TD id=m_isnokeysys_10011>●</TD>
          <TD id=m_isnokeysys_10012>●</TD>
          <TD id=m_isnokeysys_10013>●</TD></TR>
        <TR id=base_8>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10006 scope=col><B href="#/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_8_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="#/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_8_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="#/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_8_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="#/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_8_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="#/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_8_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="#/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_8_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="#/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_8_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="#/m10013/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT尊享版 </A><I 
            id=base_8_img_10013></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isabs_10006>●</TD>
          <TD id=m_isabs_10007>●</TD>
          <TD id=m_isabs_10008>●</TD>
          <TD id=m_isabs_10009>●</TD>
          <TD id=m_isabs_10010>●</TD>
          <TD id=m_isabs_10011>●</TD>
          <TD id=m_isabs_10012>●</TD>
          <TD id=m_isabs_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isesp_10006>●</TD>
          <TD id=m_isesp_10007>●</TD>
          <TD id=m_isesp_10008>●</TD>
          <TD id=m_isesp_10009>●</TD>
          <TD id=m_isesp_10010>●</TD>
          <TD id=m_isesp_10011>●</TD>
          <TD id=m_isesp_10012>●</TD>
          <TD id=m_isesp_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isadsus_10006>-</TD>
          <TD id=m_isadsus_10007>-</TD>
          <TD id=m_isadsus_10008>-</TD>
          <TD id=m_isadsus_10009>-</TD>
          <TD id=m_isadsus_10010>-</TD>
          <TD id=m_isadsus_10011>-</TD>
          <TD id=m_isadsus_10012>-</TD>
          <TD id=m_isadsus_10013>-</TD></TR>
        <TR class=disc>
          <TD id=m_istpmonitor_10006>-</TD>
          <TD id=m_istpmonitor_10007>●</TD>
          <TD id=m_istpmonitor_10008>●</TD>
          <TD id=m_istpmonitor_10009>●</TD>
          <TD id=m_istpmonitor_10010>●</TD>
          <TD id=m_istpmonitor_10011>●</TD>
          <TD id=m_istpmonitor_10012>●</TD>
          <TD id=m_istpmonitor_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_istpruning_10006>-</TD>
          <TD id=m_istpruning_10007>-</TD>
          <TD id=m_istpruning_10008>-</TD>
          <TD id=m_istpruning_10009>-</TD>
          <TD id=m_istpruning_10010>-</TD>
          <TD id=m_istpruning_10011>-</TD>
          <TD id=m_istpruning_10012>-</TD>
          <TD id=m_istpruning_10013>-</TD></TR>
        <TR class=disc>
          <TD id=m_isfsteering_10006>●</TD>
          <TD id=m_isfsteering_10007>●</TD>
          <TD id=m_isfsteering_10008>●</TD>
          <TD id=m_isfsteering_10009>●</TD>
          <TD id=m_isfsteering_10010>●</TD>
          <TD id=m_isfsteering_10011>●</TD>
          <TD id=m_isfsteering_10012>●</TD>
          <TD id=m_isfsteering_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_issteesys_10006>-</TD>
          <TD id=m_issteesys_10007>-</TD>
          <TD id=m_issteesys_10008>-</TD>
          <TD id=m_issteesys_10009>-</TD>
          <TD id=m_issteesys_10010>-</TD>
          <TD id=m_issteesys_10011>-</TD>
          <TD id=m_issteesys_10012>●</TD>
          <TD id=m_issteesys_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isuphillassist_10006>●</TD>
          <TD id=m_isuphillassist_10007>●</TD>
          <TD id=m_isuphillassist_10008>●</TD>
          <TD id=m_isuphillassist_10009>●</TD>
          <TD id=m_isuphillassist_10010>●</TD>
          <TD id=m_isuphillassist_10011>●</TD>
          <TD id=m_isuphillassist_10012>●</TD>
          <TD id=m_isuphillassist_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_isandstitch_10006>-</TD>
          <TD id=m_isandstitch_10007>-</TD>
          <TD id=m_isandstitch_10008>-</TD>
          <TD id=m_isandstitch_10009>-</TD>
          <TD id=m_isandstitch_10010>-</TD>
          <TD id=m_isandstitch_10011>●</TD>
          <TD id=m_isandstitch_10012>●</TD>
          <TD id=m_isandstitch_10013>●</TD></TR>
        <TR id=base_9>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10006 scope=col><B href="#/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_9_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="#/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_9_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="#/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_9_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="#/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_9_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="#/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_9_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="#/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_9_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="#/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_9_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="#/m10013/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT尊享版 </A><I 
            id=base_9_img_10013></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_iswindow_10006>●</TD>
          <TD id=m_iswindow_10007>●</TD>
          <TD id=m_iswindow_10008>●</TD>
          <TD id=m_iswindow_10009>●</TD>
          <TD id=m_iswindow_10010>●</TD>
          <TD id=m_iswindow_10011>●</TD>
          <TD id=m_iswindow_10012>●</TD>
          <TD id=m_iswindow_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isarwindow_10006>-</TD>
          <TD id=m_isarwindow_10007>-</TD>
          <TD id=m_isarwindow_10008>-</TD>
          <TD id=m_isarwindow_10009>-</TD>
          <TD id=m_isarwindow_10010>-</TD>
          <TD id=m_isarwindow_10011>-</TD>
          <TD id=m_isarwindow_10012>-</TD>
          <TD id=m_isarwindow_10013>-</TD></TR>
        <TR class=disc>
          <TD id=m_isspround_10006>-</TD>
          <TD id=m_isspround_10007>-</TD>
          <TD id=m_isspround_10008>-</TD>
          <TD id=m_isspround_10009>-</TD>
          <TD id=m_isspround_10010>-</TD>
          <TD id=m_isspround_10011>-</TD>
          <TD id=m_isspround_10012>●</TD>
          <TD id=m_isspround_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isaluhub_10006>●</TD>
          <TD id=m_isaluhub_10007>●</TD>
          <TD id=m_isaluhub_10008>●</TD>
          <TD id=m_isaluhub_10009>●</TD>
          <TD id=m_isaluhub_10010>●</TD>
          <TD id=m_isaluhub_10011>●</TD>
          <TD id=m_isaluhub_10012>●</TD>
          <TD id=m_isaluhub_10013>●</TD></TR>
        <TR id=base_10>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10006 scope=col><B href="#/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_10_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="#/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_10_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="#/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_10_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="#/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_10_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="#/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_10_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="#/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_10_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="#/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_10_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="#/m10013/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT尊享版 </A><I 
            id=base_10_img_10013></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isleasw_10006>●</TD>
          <TD id=m_isleasw_10007>●</TD>
          <TD id=m_isleasw_10008>●</TD>
          <TD id=m_isleasw_10009>●</TD>
          <TD id=m_isleasw_10010>●</TD>
          <TD id=m_isleasw_10011>●</TD>
          <TD id=m_isleasw_10012>●</TD>
          <TD id=m_isleasw_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswud_10006>●</TD>
          <TD id=m_isswud_10007>●</TD>
          <TD id=m_isswud_10008>●</TD>
          <TD id=m_isswud_10009>●</TD>
          <TD id=m_isswud_10010>●</TD>
          <TD id=m_isswud_10011>●</TD>
          <TD id=m_isswud_10012>●</TD>
          <TD id=m_isswud_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswfb_10006>●</TD>
          <TD id=m_isswfb_10007>●</TD>
          <TD id=m_isswfb_10008>●</TD>
          <TD id=m_isswfb_10009>●</TD>
          <TD id=m_isswfb_10010>●</TD>
          <TD id=m_isswfb_10011>●</TD>
          <TD id=m_isswfb_10012>●</TD>
          <TD id=m_isswfb_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_ismultisw_10006>-</TD>
          <TD id=m_ismultisw_10007>-</TD>
          <TD id=m_ismultisw_10008>●</TD>
          <TD id=m_ismultisw_10009>●</TD>
          <TD id=m_ismultisw_10010>●</TD>
          <TD id=m_ismultisw_10011>●</TD>
          <TD id=m_ismultisw_10012>●</TD>
          <TD id=m_ismultisw_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_isswshift_10006>-</TD>
          <TD id=m_isswshift_10007>-</TD>
          <TD id=m_isswshift_10008>-</TD>
          <TD id=m_isswshift_10009>-</TD>
          <TD id=m_isswshift_10010>-</TD>
          <TD id=m_isswshift_10011>-</TD>
          <TD id=m_isswshift_10012>●</TD>
          <TD id=m_isswshift_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_isascd_10006>-</TD>
          <TD id=m_isascd_10007>-</TD>
          <TD id=m_isascd_10008>●</TD>
          <TD id=m_isascd_10009>●</TD>
          <TD id=m_isascd_10010>●</TD>
          <TD id=m_isascd_10011>●</TD>
          <TD id=m_isascd_10012>●</TD>
          <TD id=m_isascd_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isassibc_10006>●</TD>
          <TD id=m_isassibc_10007>●</TD>
          <TD id=m_isassibc_10008>●</TD>
          <TD id=m_isassibc_10009>●</TD>
          <TD id=m_isassibc_10010>●</TD>
          <TD id=m_isassibc_10011>●</TD>
          <TD id=m_isassibc_10012>●</TD>
          <TD id=m_isassibc_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_isparkvideo_10006>-</TD>
          <TD id=m_isparkvideo_10007>-</TD>
          <TD id=m_isparkvideo_10008>-</TD>
          <TD id=m_isparkvideo_10009>-</TD>
          <TD id=m_isparkvideo_10010>-</TD>
          <TD id=m_isparkvideo_10011>●</TD>
          <TD id=m_isparkvideo_10012>●</TD>
          <TD id=m_isparkvideo_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ispark_10006>-</TD>
          <TD id=m_ispark_10007>-</TD>
          <TD id=m_ispark_10008>-</TD>
          <TD id=m_ispark_10009>-</TD>
          <TD id=m_ispark_10010>-</TD>
          <TD id=m_ispark_10011>-</TD>
          <TD id=m_ispark_10012>-</TD>
          <TD id=m_ispark_10013>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ishud_10006>-</TD>
          <TD id=m_ishud_10007>-</TD>
          <TD id=m_ishud_10008>-</TD>
          <TD id=m_ishud_10009>-</TD>
          <TD id=m_ishud_10010>-</TD>
          <TD id=m_ishud_10011>-</TD>
          <TD id=m_ishud_10012>-</TD>
          <TD id=m_ishud_10013>-</TD></TR>
        <TR id=base_11>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10006 scope=col><B href="#/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_11_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="#/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_11_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="#/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_11_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="#/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_11_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="#/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_11_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="#/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_11_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="#/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_11_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="#/m10013/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT尊享版 </A><I 
            id=base_11_img_10013></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isleaseat_10006>-</TD>
          <TD id=m_isleaseat_10007>-</TD>
          <TD id=m_isleaseat_10008>-</TD>
          <TD id=m_isleaseat_10009>●</TD>
          <TD id=m_isleaseat_10010>●</TD>
          <TD id=m_isleaseat_10011>●</TD>
          <TD id=m_isleaseat_10012>●</TD>
          <TD id=m_isleaseat_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatadj_10006>●</TD>
          <TD id=m_isseatadj_10007>●</TD>
          <TD id=m_isseatadj_10008>●</TD>
          <TD id=m_isseatadj_10009>●</TD>
          <TD id=m_isseatadj_10010>●</TD>
          <TD id=m_isseatadj_10011>●</TD>
          <TD id=m_isseatadj_10012>●</TD>
          <TD id=m_isseatadj_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iswaistadj_10006>●</TD>
          <TD id=m_iswaistadj_10007>●</TD>
          <TD id=m_iswaistadj_10008>●</TD>
          <TD id=m_iswaistadj_10009>●</TD>
          <TD id=m_iswaistadj_10010>●</TD>
          <TD id=m_iswaistadj_10011>●</TD>
          <TD id=m_iswaistadj_10012>●</TD>
          <TD id=m_iswaistadj_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isfseatadj_10006>●</TD>
          <TD id=m_isfseatadj_10007>●</TD>
          <TD id=m_isfseatadj_10008>●</TD>
          <TD id=m_isfseatadj_10009>●</TD>
          <TD id=m_isfseatadj_10010>●</TD>
          <TD id=m_isfseatadj_10011>●</TD>
          <TD id=m_isfseatadj_10012>●</TD>
          <TD id=m_isfseatadj_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_iseseatmem_10006>-</TD>
          <TD id=m_iseseatmem_10007>-</TD>
          <TD id=m_iseseatmem_10008>-</TD>
          <TD id=m_iseseatmem_10009>-</TD>
          <TD id=m_iseseatmem_10010>●</TD>
          <TD id=m_iseseatmem_10011>●</TD>
          <TD id=m_iseseatmem_10012>-</TD>
          <TD id=m_iseseatmem_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_isseathot_10006>-</TD>
          <TD id=m_isseathot_10007>-</TD>
          <TD id=m_isseathot_10008>-</TD>
          <TD id=m_isseathot_10009>●</TD>
          <TD id=m_isseathot_10010>●</TD>
          <TD id=m_isseathot_10011>●</TD>
          <TD id=m_isseathot_10012>-</TD>
          <TD id=m_isseathot_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_isseatknead_10006>-</TD>
          <TD id=m_isseatknead_10007>-</TD>
          <TD id=m_isseatknead_10008>-</TD>
          <TD id=m_isseatknead_10009>-</TD>
          <TD id=m_isseatknead_10010>-</TD>
          <TD id=m_isseatknead_10011>-</TD>
          <TD id=m_isseatknead_10012>-</TD>
          <TD id=m_isseatknead_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbseatlay_10006>-</TD>
          <TD id=m_isbseatlay_10007>-</TD>
          <TD id=m_isbseatlay_10008>-</TD>
          <TD id=m_isbseatlay_10009>-</TD>
          <TD id=m_isbseatlay_10010>-</TD>
          <TD id=m_isbseatlay_10011>-</TD>
          <TD id=m_isbseatlay_10012>-</TD>
          <TD id=m_isbseatlay_10013>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isbseatplay_10006>●</TD>
          <TD id=m_isbseatplay_10007>●</TD>
          <TD id=m_isbseatplay_10008>●</TD>
          <TD id=m_isbseatplay_10009>●</TD>
          <TD id=m_isbseatplay_10010>●</TD>
          <TD id=m_isbseatplay_10011>●</TD>
          <TD id=m_isbseatplay_10012>●</TD>
          <TD id=m_isbseatplay_10013>●</TD></TR>
        <TR id=base_12>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10006 scope=col><B href="#/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_12_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="#/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_12_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="#/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_12_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="#/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_12_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="#/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_12_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="#/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_12_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="#/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_12_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="#/m10013/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT尊享版 </A><I 
            id=base_12_img_10013></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isgps_10006>-</TD>
          <TD id=m_isgps_10007>-</TD>
          <TD id=m_isgps_10008>-</TD>
          <TD id=m_isgps_10009>-</TD>
          <TD id=m_isgps_10010>●</TD>
          <TD id=m_isgps_10011>●</TD>
          <TD id=m_isgps_10012>●</TD>
          <TD id=m_isgps_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_isbluetooth_10006>-</TD>
          <TD id=m_isbluetooth_10007>-</TD>
          <TD id=m_isbluetooth_10008>-</TD>
          <TD id=m_isbluetooth_10009>-</TD>
          <TD id=m_isbluetooth_10010>-</TD>
          <TD id=m_isbluetooth_10011>●</TD>
          <TD id=m_isbluetooth_10012>-</TD>
          <TD id=m_isbluetooth_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_istv_10006>-</TD>
          <TD id=m_istv_10007>-</TD>
          <TD id=m_istv_10008>-</TD>
          <TD id=m_istv_10009>-</TD>
          <TD id=m_istv_10010>-</TD>
          <TD id=m_istv_10011>-</TD>
          <TD id=m_istv_10012>-</TD>
          <TD id=m_istv_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscclcd_10006>●</TD>
          <TD id=m_iscclcd_10007>●</TD>
          <TD id=m_iscclcd_10008>●</TD>
          <TD id=m_iscclcd_10009>●</TD>
          <TD id=m_iscclcd_10010>●</TD>
          <TD id=m_iscclcd_10011>●</TD>
          <TD id=m_iscclcd_10012>●</TD>
          <TD id=m_iscclcd_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isblcd_10006>-</TD>
          <TD id=m_isblcd_10007>-</TD>
          <TD id=m_isblcd_10008>-</TD>
          <TD id=m_isblcd_10009>-</TD>
          <TD id=m_isblcd_10010>-</TD>
          <TD id=m_isblcd_10011>-</TD>
          <TD id=m_isblcd_10012>-</TD>
          <TD id=m_isblcd_10013>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ismp3_10006>●</TD>
          <TD id=m_ismp3_10007>●</TD>
          <TD id=m_ismp3_10008>●</TD>
          <TD id=m_ismp3_10009>●</TD>
          <TD id=m_ismp3_10010>●</TD>
          <TD id=m_ismp3_10011>●</TD>
          <TD id=m_ismp3_10012>●</TD>
          <TD id=m_ismp3_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_iscd_10006>●</TD>
          <TD id=m_iscd_10007>●</TD>
          <TD id=m_iscd_10008>●</TD>
          <TD id=m_iscd_10009>●</TD>
          <TD id=m_iscd_10010>-</TD>
          <TD id=m_iscd_10011>-</TD>
          <TD id=m_iscd_10012>-</TD>
          <TD id=m_iscd_10013>-</TD></TR>
        <TR class=disc>
          <TD id=m_iscd_10006>6 </TD>
          <TD id=m_iscd_10007>6 </TD>
          <TD id=m_iscd_10008>6 </TD>
          <TD id=m_iscd_10009>6 </TD>
          <TD id=m_iscd_10010>- </TD>
          <TD id=m_iscd_10011>- </TD>
          <TD id=m_iscd_10012>- </TD>
          <TD id=m_iscd_10013>- </TD></TR>
        <TR class=disc>
          <TD id=10006>-</TD>
          <TD id=10007>-</TD>
          <TD id=10008>-</TD>
          <TD id=10009>-</TD>
          <TD id=10010>●</TD>
          <TD id=10011>●</TD>
          <TD id=10012>●</TD>
          <TD id=10013>●</TD></TR>
        <TR class=disc>
          <TD id=10006>- </TD>
          <TD id=10007>- </TD>
          <TD id=10008>- </TD>
          <TD id=10009>- </TD>
          <TD id=10010>6 </TD>
          <TD id=10011>6 </TD>
          <TD id=10012>6 </TD>
          <TD id=10013>6 </TD></TR>
        <TR class=hidd>
          <TD id=m_is2audio_10006>-</TD>
          <TD id=m_is2audio_10007>-</TD>
          <TD id=m_is2audio_10008>-</TD>
          <TD id=m_is2audio_10009>-</TD>
          <TD id=m_is2audio_10010>-</TD>
          <TD id=m_is2audio_10011>-</TD>
          <TD id=m_is2audio_10012>-</TD>
          <TD id=m_is2audio_10013>-</TD></TR>
        <TR class=hidd>
          <TD id=m_is4audio_10006>-</TD>
          <TD id=m_is4audio_10007>-</TD>
          <TD id=m_is4audio_10008>-</TD>
          <TD id=m_is4audio_10009>-</TD>
          <TD id=m_is4audio_10010>-</TD>
          <TD id=m_is4audio_10011>-</TD>
          <TD id=m_is4audio_10012>-</TD>
          <TD id=m_is4audio_10013>-</TD></TR>
        <TR class=hidd>
          <TD id=m_is6audio_10006>-</TD>
          <TD id=m_is6audio_10007>-</TD>
          <TD id=m_is6audio_10008>-</TD>
          <TD id=m_is6audio_10009>-</TD>
          <TD id=m_is6audio_10010>-</TD>
          <TD id=m_is6audio_10011>-</TD>
          <TD id=m_is6audio_10012>-</TD>
          <TD id=m_is6audio_10013>-</TD></TR>
        <TR class=hidd>
          <TD id=m_is8audio_10006>●</TD>
          <TD id=m_is8audio_10007>●</TD>
          <TD id=m_is8audio_10008>●</TD>
          <TD id=m_is8audio_10009>●</TD>
          <TD id=m_is8audio_10010>●</TD>
          <TD id=m_is8audio_10011>●</TD>
          <TD id=m_is8audio_10012>●</TD>
          <TD id=m_is8audio_10013>●</TD></TR>
        <TR id=base_13>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10006 scope=col><B href="#/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_13_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="#/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_13_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="#/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_13_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="#/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_13_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="#/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_13_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="#/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_13_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="#/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_13_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="#/m10013/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT尊享版 </A><I 
            id=base_13_img_10013></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isxelamp_10006>-</TD>
          <TD id=m_isxelamp_10007>-</TD>
          <TD id=m_isxelamp_10008>●</TD>
          <TD id=m_isxelamp_10009>●</TD>
          <TD id=m_isxelamp_10010>●</TD>
          <TD id=m_isxelamp_10011>●</TD>
          <TD id=m_isxelamp_10012>●</TD>
          <TD id=m_isxelamp_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_isautohlamp_10006>-</TD>
          <TD id=m_isautohlamp_10007>-</TD>
          <TD id=m_isautohlamp_10008>-</TD>
          <TD id=m_isautohlamp_10009>-</TD>
          <TD id=m_isautohlamp_10010>-</TD>
          <TD id=m_isautohlamp_10011>●</TD>
          <TD id=m_isautohlamp_10012>●</TD>
          <TD id=m_isautohlamp_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_isturnhlamp_10006>-</TD>
          <TD id=m_isturnhlamp_10007>-</TD>
          <TD id=m_isturnhlamp_10008>-</TD>
          <TD id=m_isturnhlamp_10009>-</TD>
          <TD id=m_isturnhlamp_10010>-</TD>
          <TD id=m_isturnhlamp_10011>●</TD>
          <TD id=m_isturnhlamp_10012>●</TD>
          <TD id=m_isturnhlamp_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ishfoglamp_10006>●</TD>
          <TD id=m_ishfoglamp_10007>●</TD>
          <TD id=m_ishfoglamp_10008>●</TD>
          <TD id=m_ishfoglamp_10009>●</TD>
          <TD id=m_ishfoglamp_10010>●</TD>
          <TD id=m_ishfoglamp_10011>●</TD>
          <TD id=m_ishfoglamp_10012>●</TD>
          <TD id=m_ishfoglamp_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbfoglamp_10006>●</TD>
          <TD id=m_isbfoglamp_10007>●</TD>
          <TD id=m_isbfoglamp_10008>●</TD>
          <TD id=m_isbfoglamp_10009>●</TD>
          <TD id=m_isbfoglamp_10010>●</TD>
          <TD id=m_isbfoglamp_10011>●</TD>
          <TD id=m_isbfoglamp_10012>●</TD>
          <TD id=m_isbfoglamp_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_islampheiadj_10006>●</TD>
          <TD id=m_islampheiadj_10007>●</TD>
          <TD id=m_islampheiadj_10008>●</TD>
          <TD id=m_islampheiadj_10009>●</TD>
          <TD id=m_islampheiadj_10010>●</TD>
          <TD id=m_islampheiadj_10011>●</TD>
          <TD id=m_islampheiadj_10012>●</TD>
          <TD id=m_islampheiadj_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_islampclset_10006>-</TD>
          <TD id=m_islampclset_10007>-</TD>
          <TD id=m_islampclset_10008>●</TD>
          <TD id=m_islampclset_10009>●</TD>
          <TD id=m_islampclset_10010>●</TD>
          <TD id=m_islampclset_10011>●</TD>
          <TD id=m_islampclset_10012>●</TD>
          <TD id=m_islampclset_10013>●</TD></TR>
        <TR id=base_14>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10006 scope=col><B href="#/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_14_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="#/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_14_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="#/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_14_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="#/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_14_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="#/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_14_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="#/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_14_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="#/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_14_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="#/m10013/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT尊享版 </A><I 
            id=base_14_img_10013></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isfewindow_10006>●</TD>
          <TD id=m_isfewindow_10007>●</TD>
          <TD id=m_isfewindow_10008>●</TD>
          <TD id=m_isfewindow_10009>●</TD>
          <TD id=m_isfewindow_10010>●</TD>
          <TD id=m_isfewindow_10011>●</TD>
          <TD id=m_isfewindow_10012>●</TD>
          <TD id=m_isfewindow_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbewindow_10006>●</TD>
          <TD id=m_isbewindow_10007>●</TD>
          <TD id=m_isbewindow_10008>●</TD>
          <TD id=m_isbewindow_10009>●</TD>
          <TD id=m_isbewindow_10010>●</TD>
          <TD id=m_isbewindow_10011>●</TD>
          <TD id=m_isbewindow_10012>●</TD>
          <TD id=m_isbewindow_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isgnhand_10006>●</TD>
          <TD id=m_isgnhand_10007>●</TD>
          <TD id=m_isgnhand_10008>●</TD>
          <TD id=m_isgnhand_10009>●</TD>
          <TD id=m_isgnhand_10010>●</TD>
          <TD id=m_isgnhand_10011>●</TD>
          <TD id=m_isgnhand_10012>●</TD>
          <TD id=m_isgnhand_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ispreventionuv_10006>●</TD>
          <TD id=m_ispreventionuv_10007>●</TD>
          <TD id=m_ispreventionuv_10008>●</TD>
          <TD id=m_ispreventionuv_10009>●</TD>
          <TD id=m_ispreventionuv_10010>●</TD>
          <TD id=m_ispreventionuv_10011>●</TD>
          <TD id=m_ispreventionuv_10012>●</TD>
          <TD id=m_ispreventionuv_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isermirror_10006>●</TD>
          <TD id=m_isermirror_10007>●</TD>
          <TD id=m_isermirror_10008>●</TD>
          <TD id=m_isermirror_10009>●</TD>
          <TD id=m_isermirror_10010>●</TD>
          <TD id=m_isermirror_10011>●</TD>
          <TD id=m_isermirror_10012>●</TD>
          <TD id=m_isermirror_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ishotrmirror_10006>●</TD>
          <TD id=m_ishotrmirror_10007>●</TD>
          <TD id=m_ishotrmirror_10008>●</TD>
          <TD id=m_ishotrmirror_10009>●</TD>
          <TD id=m_ishotrmirror_10010>●</TD>
          <TD id=m_ishotrmirror_10011>●</TD>
          <TD id=m_ishotrmirror_10012>●</TD>
          <TD id=m_ishotrmirror_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_ismemorymirror_10006>-</TD>
          <TD id=m_ismemorymirror_10007>-</TD>
          <TD id=m_ismemorymirror_10008>-</TD>
          <TD id=m_ismemorymirror_10009>-</TD>
          <TD id=m_ismemorymirror_10010>●</TD>
          <TD id=m_ismemorymirror_10011>●</TD>
          <TD id=m_ismemorymirror_10012>-</TD>
          <TD id=m_ismemorymirror_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_iseprmirror_10006>-</TD>
          <TD id=m_iseprmirror_10007>-</TD>
          <TD id=m_iseprmirror_10008>-</TD>
          <TD id=m_iseprmirror_10009>-</TD>
          <TD id=m_iseprmirror_10010>●</TD>
          <TD id=m_iseprmirror_10011>●</TD>
          <TD id=m_iseprmirror_10012>●</TD>
          <TD id=m_iseprmirror_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_isrmirrorge_10006>-</TD>
          <TD id=m_isrmirrorge_10007>-</TD>
          <TD id=m_isrmirrorge_10008>-</TD>
          <TD id=m_isrmirrorge_10009>-</TD>
          <TD id=m_isrmirrorge_10010>●</TD>
          <TD id=m_isrmirrorge_10011>●</TD>
          <TD id=m_isrmirrorge_10012>●</TD>
          <TD id=m_isrmirrorge_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_isbsvisor_10006>- </TD>
          <TD id=m_isbsvisor_10007>- </TD>
          <TD id=m_isbsvisor_10008>- </TD>
          <TD id=m_isbsvisor_10009>- </TD>
          <TD id=m_isbsvisor_10010>- </TD>
          <TD id=m_isbsvisor_10011>●</TD>
          <TD id=m_isbsvisor_10012>- </TD>
          <TD id=m_isbsvisor_10013>- </TD></TR><!--	



			<tr class="disc" >



				



				


					


						<td id="m_ishbsvisor_10006">-</td>



					


						<td id="m_ishbsvisor_10007">-</td>



					


						<td id="m_ishbsvisor_10008">-</td>



					


						<td id="m_ishbsvisor_10009">-</td>



					


						<td id="m_ishbsvisor_10010">-</td>



					


						<td id="m_ishbsvisor_10011">●</td>



					


						<td id="m_ishbsvisor_10012">-</td>



					


						<td id="m_ishbsvisor_10013">-</td>



					


							</tr>







			<tr class="hidd" >



				



				


					


						<td id="m_isebsvisor_10006"> - </td>



					


						<td id="m_isebsvisor_10007"> - </td>



					


						<td id="m_isebsvisor_10008"> - </td>



					


						<td id="m_isebsvisor_10009"> - </td>



					


						<td id="m_isebsvisor_10010"> - </td>



					


						<td id="m_isebsvisor_10011"> - </td>



					


						<td id="m_isebsvisor_10012"> - </td>



					


						<td id="m_isebsvisor_10013"> - </td>



					


							</tr>



-->
        <TR class=disc>
          <TD id=m_isbssvisor_10006>-</TD>
          <TD id=m_isbssvisor_10007>-</TD>
          <TD id=m_isbssvisor_10008>-</TD>
          <TD id=m_isbssvisor_10009>-</TD>
          <TD id=m_isbssvisor_10010>-</TD>
          <TD id=m_isbssvisor_10011>●</TD>
          <TD id=m_isbssvisor_10012>-</TD>
          <TD id=m_isbssvisor_10013>-</TD></TR>
        <TR class=hidd>
          <TD id=m_issvisordr_10006>●</TD>
          <TD id=m_issvisordr_10007>●</TD>
          <TD id=m_issvisordr_10008>●</TD>
          <TD id=m_issvisordr_10009>●</TD>
          <TD id=m_issvisordr_10010>●</TD>
          <TD id=m_issvisordr_10011>●</TD>
          <TD id=m_issvisordr_10012>●</TD>
          <TD id=m_issvisordr_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_isinswiper_10006>-</TD>
          <TD id=m_isinswiper_10007>-</TD>
          <TD id=m_isinswiper_10008>-</TD>
          <TD id=m_isinswiper_10009>-</TD>
          <TD id=m_isinswiper_10010>●</TD>
          <TD id=m_isinswiper_10011>●</TD>
          <TD id=m_isinswiper_10012>●</TD>
          <TD id=m_isinswiper_10013>●</TD></TR>
        <TR id=base_15>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10006 scope=col><B href="#/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_15_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="#/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_15_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="#/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_15_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="#/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_15_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="#/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_15_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="#/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_15_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="#/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_15_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="#/m10013/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT尊享版 </A><I 
            id=base_15_img_10013></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isairc_10006>●</TD>
          <TD id=m_isairc_10007>●</TD>
          <TD id=m_isairc_10008>●</TD>
          <TD id=m_isairc_10009>●</TD>
          <TD id=m_isairc_10010>●</TD>
          <TD id=m_isairc_10011>●</TD>
          <TD id=m_isairc_10012>●</TD>
          <TD id=m_isairc_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_isbsairo_10006>-</TD>
          <TD id=m_isbsairo_10007>-</TD>
          <TD id=m_isbsairo_10008>-</TD>
          <TD id=m_isbsairo_10009>-</TD>
          <TD id=m_isbsairo_10010>●</TD>
          <TD id=m_isbsairo_10011>●</TD>
          <TD id=m_isbsairo_10012>●</TD>
          <TD id=m_isbsairo_10013>●</TD></TR>
        <TR class=disc>
          <TD id=m_istempdct_10006>-</TD>
          <TD id=m_istempdct_10007>-</TD>
          <TD id=m_istempdct_10008>-</TD>
          <TD id=m_istempdct_10009>-</TD>
          <TD id=m_istempdct_10010>●</TD>
          <TD id=m_istempdct_10011>●</TD>
          <TD id=m_istempdct_10012>●</TD>
          <TD id=m_istempdct_10013>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscaricebox_10006>-</TD>
          <TD id=m_iscaricebox_10007>-</TD>
          <TD id=m_iscaricebox_10008>-</TD>
          <TD id=m_iscaricebox_10009>-</TD>
          <TD id=m_iscaricebox_10010>-</TD>
          <TD id=m_iscaricebox_10011>-</TD>
          <TD id=m_iscaricebox_10012>-</TD>
          <TD 
id=m_iscaricebox_10013>-</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
<DIV class=clear></DIV></DIV>
<SCRIPT type=text/javascript src="a7_files/analytics.htm"></SCRIPT>
<!--登陆js-->
<SCRIPT src="a7_files/new_login2011_newcar.htm"></SCRIPT>

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
  <LI>选择问题所在车型 </LI>
  <LI><SELECT id=mid class=t0401_tpsel onchange=getmid(this.value) name=mid> 
    <OPTION selected value=10006>2012款奥迪A4L 1.8TFSI 手动舒适版</OPTION> <OPTION 
    value=10007>2012款奥迪A4L 1.8TFSI CVT舒适版</OPTION> <OPTION 
    value=10008>2012款奥迪A4L 2.0TFSI CVT标准版</OPTION> <OPTION 
    value=10009>2012款奥迪A4L 2.0TFSI CVT舒适版</OPTION> <OPTION 
    value=10010>2012款奥迪A4L 2.0TFSI CVT技术版</OPTION> <OPTION 
    value=10011>2012款奥迪A4L 2.0TFSI CVT豪华版</OPTION> <OPTION 
    value=10012>2012款奥迪A4L 2.0TFSI CVT运动版</OPTION> <OPTION 
    value=10013>2012款奥迪A4L 2.0TFSI CVT尊享版</OPTION></SELECT> </LI>
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
src="a7_files/news_forall.js"></SCRIPT>

<SCRIPT type=text/javascript src="a7_files/dw.js"></SCRIPT>

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
