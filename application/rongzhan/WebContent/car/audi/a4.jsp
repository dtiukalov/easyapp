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
            style="WIDTH: 147px !important" src="a4l_files/t1125arr_e.gif" 
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
            style="WIDTH: 111px !important" src="a4l_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a4l_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a4l_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a4l_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a4l_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a4l_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a4l_files/t1125arr_e.gif" 
            height=1></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"><IMG 
            style="WIDTH: 111px !important" src="a4l_files/t1125arr_e.gif" 
            height=1></TH></TR>
        <TR id=base_1>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10006 scope=col><B href="http://newcar.xcar.com.cn/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_1_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="http://newcar.xcar.com.cn/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_1_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="http://newcar.xcar.com.cn/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_1_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="http://newcar.xcar.com.cn/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_1_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="http://newcar.xcar.com.cn/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_1_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="http://newcar.xcar.com.cn/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_1_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="http://newcar.xcar.com.cn/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_1_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="http://newcar.xcar.com.cn/m10013/" 
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
            href="http://newcar.xcar.com.cn/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_10007><B title=一汽奥迪 
            href="http://newcar.xcar.com.cn/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_10008><B title=一汽奥迪 
            href="http://newcar.xcar.com.cn/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_10009><B title=一汽奥迪 
            href="http://newcar.xcar.com.cn/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_10010><B title=一汽奥迪 
            href="http://newcar.xcar.com.cn/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_10011><B title=一汽奥迪 
            href="http://newcar.xcar.com.cn/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_10012><B title=一汽奥迪 
            href="http://newcar.xcar.com.cn/price/b5/" target=_blank>一汽奥迪</A></TD>
          <TD id=bname_10013><B title=一汽奥迪 
            href="http://newcar.xcar.com.cn/price/b5/" 
        target=_blank>一汽奥迪</A></TD></TR>
        <TR class=hidd>
          <TD id=type2_10006><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10007><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10008><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10009><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10010><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10011><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10012><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD>
          <TD id=type2_10013><B 
            href="http://newcar.xcar.com.cn/car/0-0-0-0-0-0-3-0-0-0-0-0/">中型车</A></TD></TR>
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
          id=mod_10006 scope=col><B href="http://newcar.xcar.com.cn/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版</A> <I 
            id=base_2_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="http://newcar.xcar.com.cn/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版</A> <I 
            id=base_2_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="http://newcar.xcar.com.cn/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版</A> <I 
            id=base_2_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="http://newcar.xcar.com.cn/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版</A> <I 
            id=base_2_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="http://newcar.xcar.com.cn/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版</A> <I 
            id=base_2_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="http://newcar.xcar.com.cn/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版</A> <I 
            id=base_2_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="http://newcar.xcar.com.cn/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版</A> <I 
            id=base_2_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="http://newcar.xcar.com.cn/m10013/" 
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
          id=mod_10006 scope=col><B href="http://newcar.xcar.com.cn/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_3_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="http://newcar.xcar.com.cn/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_3_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="http://newcar.xcar.com.cn/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_3_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="http://newcar.xcar.com.cn/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_3_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="http://newcar.xcar.com.cn/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_3_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="http://newcar.xcar.com.cn/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_3_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="http://newcar.xcar.com.cn/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_3_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="http://newcar.xcar.com.cn/m10013/" 
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
          id=mod_10006 scope=col><B href="http://newcar.xcar.com.cn/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_4_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="http://newcar.xcar.com.cn/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_4_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="http://newcar.xcar.com.cn/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_4_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="http://newcar.xcar.com.cn/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_4_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="http://newcar.xcar.com.cn/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_4_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="http://newcar.xcar.com.cn/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_4_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="http://newcar.xcar.com.cn/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_4_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="http://newcar.xcar.com.cn/m10013/" 
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
          id=mod_10006 scope=col><B href="http://newcar.xcar.com.cn/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_5_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="http://newcar.xcar.com.cn/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_5_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="http://newcar.xcar.com.cn/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_5_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="http://newcar.xcar.com.cn/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_5_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="http://newcar.xcar.com.cn/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_5_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="http://newcar.xcar.com.cn/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_5_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="http://newcar.xcar.com.cn/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_5_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="http://newcar.xcar.com.cn/m10013/" 
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
          id=mod_10006 scope=col><B href="http://newcar.xcar.com.cn/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_6_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="http://newcar.xcar.com.cn/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_6_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="http://newcar.xcar.com.cn/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_6_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="http://newcar.xcar.com.cn/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_6_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="http://newcar.xcar.com.cn/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_6_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="http://newcar.xcar.com.cn/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_6_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="http://newcar.xcar.com.cn/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_6_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="http://newcar.xcar.com.cn/m10013/" 
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
          id=mod_10006 scope=col><B href="http://newcar.xcar.com.cn/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_7_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="http://newcar.xcar.com.cn/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_7_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="http://newcar.xcar.com.cn/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_7_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="http://newcar.xcar.com.cn/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_7_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="http://newcar.xcar.com.cn/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_7_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="http://newcar.xcar.com.cn/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_7_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="http://newcar.xcar.com.cn/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_7_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="http://newcar.xcar.com.cn/m10013/" 
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
          id=mod_10006 scope=col><B href="http://newcar.xcar.com.cn/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_8_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="http://newcar.xcar.com.cn/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_8_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="http://newcar.xcar.com.cn/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_8_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="http://newcar.xcar.com.cn/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_8_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="http://newcar.xcar.com.cn/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_8_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="http://newcar.xcar.com.cn/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_8_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="http://newcar.xcar.com.cn/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_8_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="http://newcar.xcar.com.cn/m10013/" 
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
          id=mod_10006 scope=col><B href="http://newcar.xcar.com.cn/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_9_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="http://newcar.xcar.com.cn/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_9_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="http://newcar.xcar.com.cn/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_9_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="http://newcar.xcar.com.cn/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_9_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="http://newcar.xcar.com.cn/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_9_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="http://newcar.xcar.com.cn/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_9_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="http://newcar.xcar.com.cn/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_9_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="http://newcar.xcar.com.cn/m10013/" 
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
          id=mod_10006 scope=col><B href="http://newcar.xcar.com.cn/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_10_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="http://newcar.xcar.com.cn/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_10_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="http://newcar.xcar.com.cn/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_10_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="http://newcar.xcar.com.cn/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_10_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="http://newcar.xcar.com.cn/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_10_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="http://newcar.xcar.com.cn/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_10_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="http://newcar.xcar.com.cn/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_10_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="http://newcar.xcar.com.cn/m10013/" 
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
          id=mod_10006 scope=col><B href="http://newcar.xcar.com.cn/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_11_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="http://newcar.xcar.com.cn/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_11_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="http://newcar.xcar.com.cn/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_11_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="http://newcar.xcar.com.cn/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_11_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="http://newcar.xcar.com.cn/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_11_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="http://newcar.xcar.com.cn/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_11_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="http://newcar.xcar.com.cn/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_11_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="http://newcar.xcar.com.cn/m10013/" 
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
          id=mod_10006 scope=col><B href="http://newcar.xcar.com.cn/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_12_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="http://newcar.xcar.com.cn/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_12_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="http://newcar.xcar.com.cn/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_12_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="http://newcar.xcar.com.cn/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_12_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="http://newcar.xcar.com.cn/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_12_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="http://newcar.xcar.com.cn/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_12_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="http://newcar.xcar.com.cn/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_12_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="http://newcar.xcar.com.cn/m10013/" 
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
          id=mod_10006 scope=col><B href="http://newcar.xcar.com.cn/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_13_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="http://newcar.xcar.com.cn/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_13_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="http://newcar.xcar.com.cn/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_13_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="http://newcar.xcar.com.cn/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_13_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="http://newcar.xcar.com.cn/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_13_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="http://newcar.xcar.com.cn/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_13_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="http://newcar.xcar.com.cn/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_13_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="http://newcar.xcar.com.cn/m10013/" 
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
          id=mod_10006 scope=col><B href="http://newcar.xcar.com.cn/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_14_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="http://newcar.xcar.com.cn/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_14_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="http://newcar.xcar.com.cn/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_14_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="http://newcar.xcar.com.cn/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_14_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="http://newcar.xcar.com.cn/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_14_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="http://newcar.xcar.com.cn/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_14_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="http://newcar.xcar.com.cn/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_14_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="http://newcar.xcar.com.cn/m10013/" 
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
          id=mod_10006 scope=col><B href="http://newcar.xcar.com.cn/m10006/" 
            target=_blank>2012款奥迪A4L 1.8TFSI 手动舒适版 </A><I 
            id=base_15_img_10006></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10007 scope=col><B href="http://newcar.xcar.com.cn/m10007/" 
            target=_blank>2012款奥迪A4L 1.8TFSI CVT舒适版 </A><I 
            id=base_15_img_10007></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10008 scope=col><B href="http://newcar.xcar.com.cn/m10008/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT标准版 </A><I 
            id=base_15_img_10008></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10009 scope=col><B href="http://newcar.xcar.com.cn/m10009/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT舒适版 </A><I 
            id=base_15_img_10009></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10010 scope=col><B href="http://newcar.xcar.com.cn/m10010/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT技术版 </A><I 
            id=base_15_img_10010></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10011 scope=col><B href="http://newcar.xcar.com.cn/m10011/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT豪华版 </A><I 
            id=base_15_img_10011></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10012 scope=col><B href="http://newcar.xcar.com.cn/m10012/" 
            target=_blank>2012款奥迪A4L 2.0TFSI CVT运动版 </A><I 
            id=base_15_img_10012></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_10013 scope=col><B href="http://newcar.xcar.com.cn/m10013/" 
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
<SCRIPT type=text/javascript src="a4l_files/analytics.htm"></SCRIPT>
<!--登陆js-->
<SCRIPT src="a4l_files/new_login2011_newcar.htm"></SCRIPT>

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

<SCRIPT language=JavaScript>
eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('(H(){J w=1b.4M,3m$=1b.$;J D=1b.4M=1b.$=H(a,b){I 2B D.17.5j(a,b)};J u=/^[^<]*(<(.|\\s)+>)[^>]*$|^#(\\w+)$/,62=/^.[^:#\\[\\.]*$/,12;D.17=D.44={5j:H(d,b){d=d||S;G(d.16){7[0]=d;7.K=1;I 7}G(1j d=="23"){J c=u.2D(d);G(c&&(c[1]||!b)){G(c[1])d=D.4h([c[1]],b);N{J a=S.61(c[3]);G(a){G(a.2v!=c[3])I D().2q(d);I D(a)}d=[]}}N I D(b).2q(d)}N G(D.1D(d))I D(S)[D.17.27?"27":"43"](d);I 7.6Y(D.2d(d))},5w:"1.2.6",8G:H(){I 7.K},K:0,3p:H(a){I a==12?D.2d(7):7[a]},2I:H(b){J a=D(b);a.5n=7;I a},6Y:H(a){7.K=0;2p.44.1p.1w(7,a);I 7},P:H(a,b){I D.P(7,a,b)},5i:H(b){J a=-1;I D.2L(b&&b.5w?b[0]:b,7)},1K:H(c,a,b){J d=c;G(c.1q==56)G(a===12)I 7[0]&&D[b||"1K"](7[0],c);N{d={};d[c]=a}I 7.P(H(i){R(c 1n d)D.1K(b?7.V:7,c,D.1i(7,d[c],b,i,c))})},1g:H(b,a){G((b==\'2h\'||b==\'1Z\')&&3d(a)<0)a=12;I 7.1K(b,a,"2a")},1r:H(b){G(1j b!="49"&&b!=U)I 7.4E().3v((7[0]&&7[0].2z||S).5F(b));J a="";D.P(b||7,H(){D.P(7.3t,H(){G(7.16!=8)a+=7.16!=1?7.76:D.17.1r([7])})});I a},5z:H(b){G(7[0])D(b,7[0].2z).5y().39(7[0]).2l(H(){J a=7;1B(a.1x)a=a.1x;I a}).3v(7);I 7},8Y:H(a){I 7.P(H(){D(7).6Q().5z(a)})},8R:H(a){I 7.P(H(){D(7).5z(a)})},3v:H(){I 7.3W(19,M,Q,H(a){G(7.16==1)7.3U(a)})},6F:H(){I 7.3W(19,M,M,H(a){G(7.16==1)7.39(a,7.1x)})},6E:H(){I 7.3W(19,Q,Q,H(a){7.1d.39(a,7)})},5q:H(){I 7.3W(19,Q,M,H(a){7.1d.39(a,7.2H)})},3l:H(){I 7.5n||D([])},2q:H(b){J c=D.2l(7,H(a){I D.2q(b,a)});I 7.2I(/[^+>] [^+>]/.11(b)||b.1h("..")>-1?D.4r(c):c)},5y:H(e){J f=7.2l(H(){G(D.14.1f&&!D.4n(7)){J a=7.6o(M),5h=S.3h("1v");5h.3U(a);I D.4h([5h.4H])[0]}N I 7.6o(M)});J d=f.2q("*").5c().P(H(){G(7[E]!=12)7[E]=U});G(e===M)7.2q("*").5c().P(H(i){G(7.16==3)I;J c=D.L(7,"3w");R(J a 1n c)R(J b 1n c[a])D.W.1e(d[i],a,c[a][b],c[a][b].L)});I f},1E:H(b){I 7.2I(D.1D(b)&&D.3C(7,H(a,i){I b.1k(a,i)})||D.3g(b,7))},4Y:H(b){G(b.1q==56)G(62.11(b))I 7.2I(D.3g(b,7,M));N b=D.3g(b,7);J a=b.K&&b[b.K-1]!==12&&!b.16;I 7.1E(H(){I a?D.2L(7,b)<0:7!=b})},1e:H(a){I 7.2I(D.4r(D.2R(7.3p(),1j a==\'23\'?D(a):D.2d(a))))},3F:H(a){I!!a&&D.3g(a,7).K>0},7T:H(a){I 7.3F("."+a)},6e:H(b){G(b==12){G(7.K){J c=7[0];G(D.Y(c,"2A")){J e=c.64,63=[],15=c.15,2V=c.O=="2A-2V";G(e<0)I U;R(J i=2V?e:0,2f=2V?e+1:15.K;i<2f;i++){J d=15[i];G(d.2W){b=D.14.1f&&!d.at.2x.an?d.1r:d.2x;G(2V)I b;63.1p(b)}}I 63}N I(7[0].2x||"").1o(/\\r/g,"")}I 12}G(b.1q==4L)b+=\'\';I 7.P(H(){G(7.16!=1)I;G(b.1q==2p&&/5O|5L/.11(7.O))7.4J=(D.2L(7.2x,b)>=0||D.2L(7.34,b)>=0);N G(D.Y(7,"2A")){J a=D.2d(b);D("9R",7).P(H(){7.2W=(D.2L(7.2x,a)>=0||D.2L(7.1r,a)>=0)});G(!a.K)7.64=-1}N 7.2x=b})},2K:H(a){I a==12?(7[0]?7[0].4H:U):7.4E().3v(a)},7b:H(a){I 7.5q(a).21()},79:H(i){I 7.3s(i,i+1)},3s:H(){I 7.2I(2p.44.3s.1w(7,19))},2l:H(b){I 7.2I(D.2l(7,H(a,i){I b.1k(a,i,a)}))},5c:H(){I 7.1e(7.5n)},L:H(d,b){J a=d.1R(".");a[1]=a[1]?"."+a[1]:"";G(b===12){J c=7.5C("9z"+a[1]+"!",[a[0]]);G(c===12&&7.K)c=D.L(7[0],d);I c===12&&a[1]?7.L(a[0]):c}N I 7.1P("9u"+a[1]+"!",[a[0],b]).P(H(){D.L(7,d,b)})},3b:H(a){I 7.P(H(){D.3b(7,a)})},3W:H(g,f,h,d){J e=7.K>1,3x;I 7.P(H(){G(!3x){3x=D.4h(g,7.2z);G(h)3x.9o()}J b=7;G(f&&D.Y(7,"1T")&&D.Y(3x[0],"4F"))b=7.3H("22")[0]||7.3U(7.2z.3h("22"));J c=D([]);D.P(3x,H(){J a=e?D(7).5y(M)[0]:7;G(D.Y(a,"1m"))c=c.1e(a);N{G(a.16==1)c=c.1e(D("1m",a).21());d.1k(b,a)}});c.P(6T)})}};D.17.5j.44=D.17;H 6T(i,a){G(a.4d)D.3Y({1a:a.4d,31:Q,1O:"1m"});N D.5u(a.1r||a.6O||a.4H||"");G(a.1d)a.1d.37(a)}H 1z(){I+2B 8J}D.1l=D.17.1l=H(){J b=19[0]||{},i=1,K=19.K,4x=Q,15;G(b.1q==8I){4x=b;b=19[1]||{};i=2}G(1j b!="49"&&1j b!="H")b={};G(K==i){b=7;--i}R(;i<K;i++)G((15=19[i])!=U)R(J c 1n 15){J a=b[c],2w=15[c];G(b===2w)6M;G(4x&&2w&&1j 2w=="49"&&!2w.16)b[c]=D.1l(4x,a||(2w.K!=U?[]:{}),2w);N G(2w!==12)b[c]=2w}I b};J E="4M"+1z(),6K=0,5r={},6G=/z-?5i|8B-?8A|1y|6B|8v-?1Z/i,3P=S.3P||{};D.1l({8u:H(a){1b.$=3m$;G(a)1b.4M=w;I D},1D:H(a){I!!a&&1j a!="23"&&!a.Y&&a.1q!=2p&&/^[\\s[]?H/.11(a+"")},4n:H(a){I a.1C&&!a.1c||a.2j&&a.2z&&!a.2z.1c},5u:H(a){a=D.3k(a);G(a){J b=S.3H("6w")[0]||S.1C,1m=S.3h("1m");1m.O="1r/4t";G(D.14.1f)1m.1r=a;N 1m.3U(S.5F(a));b.39(1m,b.1x);b.37(1m)}},Y:H(b,a){I b.Y&&b.Y.2r()==a.2r()},1Y:{},L:H(c,d,b){c=c==1b?5r:c;J a=c[E];G(!a)a=c[E]=++6K;G(d&&!D.1Y[a])D.1Y[a]={};G(b!==12)D.1Y[a][d]=b;I d?D.1Y[a][d]:a},3b:H(c,b){c=c==1b?5r:c;J a=c[E];G(b){G(D.1Y[a]){2U D.1Y[a][b];b="";R(b 1n D.1Y[a])1X;G(!b)D.3b(c)}}N{1U{2U c[E]}1V(e){G(c.5l)c.5l(E)}2U D.1Y[a]}},P:H(d,a,c){J e,i=0,K=d.K;G(c){G(K==12){R(e 1n d)G(a.1w(d[e],c)===Q)1X}N R(;i<K;)G(a.1w(d[i++],c)===Q)1X}N{G(K==12){R(e 1n d)G(a.1k(d[e],e,d[e])===Q)1X}N R(J b=d[0];i<K&&a.1k(b,i,b)!==Q;b=d[++i]){}}I d},1i:H(b,a,c,i,d){G(D.1D(a))a=a.1k(b,i);I a&&a.1q==4L&&c=="2a"&&!6G.11(d)?a+"2X":a},1F:{1e:H(c,b){D.P((b||"").1R(/\\s+/),H(i,a){G(c.16==1&&!D.1F.3T(c.1F,a))c.1F+=(c.1F?" ":"")+a})},21:H(c,b){G(c.16==1)c.1F=b!=12?D.3C(c.1F.1R(/\\s+/),H(a){I!D.1F.3T(b,a)}).6s(" "):""},3T:H(b,a){I D.2L(a,(b.1F||b).6r().1R(/\\s+/))>-1}},6q:H(b,c,a){J e={};R(J d 1n c){e[d]=b.V[d];b.V[d]=c[d]}a.1k(b);R(J d 1n c)b.V[d]=e[d]},1g:H(d,e,c){G(e=="2h"||e=="1Z"){J b,3X={30:"5x",5g:"1G",18:"3I"},35=e=="2h"?["5e","6k"]:["5G","6i"];H 5b(){b=e=="2h"?d.8f:d.8c;J a=0,2C=0;D.P(35,H(){a+=3d(D.2a(d,"57"+7,M))||0;2C+=3d(D.2a(d,"2C"+7+"4b",M))||0});b-=29.83(a+2C)}G(D(d).3F(":4j"))5b();N D.6q(d,3X,5b);I 29.2f(0,b)}I D.2a(d,e,c)},2a:H(f,l,k){J e,V=f.V;H 3E(b){G(!D.14.2k)I Q;J a=3P.54(b,U);I!a||a.52("3E")==""}G(l=="1y"&&D.14.1f){e=D.1K(V,"1y");I e==""?"1":e}G(D.14.2G&&l=="18"){J d=V.50;V.50="0 7Y 7W";V.50=d}G(l.1I(/4i/i))l=y;G(!k&&V&&V[l])e=V[l];N G(3P.54){G(l.1I(/4i/i))l="4i";l=l.1o(/([A-Z])/g,"-$1").3y();J c=3P.54(f,U);G(c&&!3E(f))e=c.52(l);N{J g=[],2E=[],a=f,i=0;R(;a&&3E(a);a=a.1d)2E.6h(a);R(;i<2E.K;i++)G(3E(2E[i])){g[i]=2E[i].V.18;2E[i].V.18="3I"}e=l=="18"&&g[2E.K-1]!=U?"2F":(c&&c.52(l))||"";R(i=0;i<g.K;i++)G(g[i]!=U)2E[i].V.18=g[i]}G(l=="1y"&&e=="")e="1"}N G(f.4g){J h=l.1o(/\\-(\\w)/g,H(a,b){I b.2r()});e=f.4g[l]||f.4g[h];G(!/^\\d+(2X)?$/i.11(e)&&/^\\d/.11(e)){J j=V.1A,66=f.65.1A;f.65.1A=f.4g.1A;V.1A=e||0;e=V.aM+"2X";V.1A=j;f.65.1A=66}}I e},4h:H(l,h){J k=[];h=h||S;G(1j h.3h==\'12\')h=h.2z||h[0]&&h[0].2z||S;D.P(l,H(i,d){G(!d)I;G(d.1q==4L)d+=\'\';G(1j d=="23"){d=d.1o(/(<(\\w+)[^>]*?)\\/>/g,H(b,a,c){I c.1I(/^(aK|4f|7E|aG|4T|7A|aB|3n|az|ay|av)$/i)?b:a+"></"+c+">"});J f=D.3k(d).3y(),1v=h.3h("1v");J e=!f.1h("<au")&&[1,"<2A 7w=\'7w\'>","</2A>"]||!f.1h("<ar")&&[1,"<7v>","</7v>"]||f.1I(/^<(aq|22|am|ak|ai)/)&&[1,"<1T>","</1T>"]||!f.1h("<4F")&&[2,"<1T><22>","</22></1T>"]||(!f.1h("<af")||!f.1h("<ad"))&&[3,"<1T><22><4F>","</4F></22></1T>"]||!f.1h("<7E")&&[2,"<1T><22></22><7q>","</7q></1T>"]||D.14.1f&&[1,"1v<1v>","</1v>"]||[0,"",""];1v.4H=e[1]+d+e[2];1B(e[0]--)1v=1v.5T;G(D.14.1f){J g=!f.1h("<1T")&&f.1h("<22")<0?1v.1x&&1v.1x.3t:e[1]=="<1T>"&&f.1h("<22")<0?1v.3t:[];R(J j=g.K-1;j>=0;--j)G(D.Y(g[j],"22")&&!g[j].3t.K)g[j].1d.37(g[j]);G(/^\\s/.11(d))1v.39(h.5F(d.1I(/^\\s*/)[0]),1v.1x)}d=D.2d(1v.3t)}G(d.K===0&&(!D.Y(d,"3V")&&!D.Y(d,"2A")))I;G(d[0]==12||D.Y(d,"3V")||d.15)k.1p(d);N k=D.2R(k,d)});I k},1K:H(d,f,c){G(!d||d.16==3||d.16==8)I 12;J e=!D.4n(d),40=c!==12,1f=D.14.1f;f=e&&D.3X[f]||f;G(d.2j){J g=/5Q|4d|V/.11(f);G(f=="2W"&&D.14.2k)d.1d.64;G(f 1n d&&e&&!g){G(40){G(f=="O"&&D.Y(d,"4T")&&d.1d)7p"O a3 a1\'t 9V 9U";d[f]=c}G(D.Y(d,"3V")&&d.7i(f))I d.7i(f).76;I d[f]}G(1f&&e&&f=="V")I D.1K(d.V,"9T",c);G(40)d.9Q(f,""+c);J h=1f&&e&&g?d.4G(f,2):d.4G(f);I h===U?12:h}G(1f&&f=="1y"){G(40){d.6B=1;d.1E=(d.1E||"").1o(/7f\\([^)]*\\)/,"")+(3r(c)+\'\'=="9L"?"":"7f(1y="+c*7a+")")}I d.1E&&d.1E.1h("1y=")>=0?(3d(d.1E.1I(/1y=([^)]*)/)[1])/7a)+\'\':""}f=f.1o(/-([a-z])/9H,H(a,b){I b.2r()});G(40)d[f]=c;I d[f]},3k:H(a){I(a||"").1o(/^\\s+|\\s+$/g,"")},2d:H(b){J a=[];G(b!=U){J i=b.K;G(i==U||b.1R||b.4I||b.1k)a[0]=b;N 1B(i)a[--i]=b[i]}I a},2L:H(b,a){R(J i=0,K=a.K;i<K;i++)G(a[i]===b)I i;I-1},2R:H(a,b){J i=0,T,2S=a.K;G(D.14.1f){1B(T=b[i++])G(T.16!=8)a[2S++]=T}N 1B(T=b[i++])a[2S++]=T;I a},4r:H(a){J c=[],2o={};1U{R(J i=0,K=a.K;i<K;i++){J b=D.L(a[i]);G(!2o[b]){2o[b]=M;c.1p(a[i])}}}1V(e){c=a}I c},3C:H(c,a,d){J b=[];R(J i=0,K=c.K;i<K;i++)G(!d!=!a(c[i],i))b.1p(c[i]);I b},2l:H(d,a){J c=[];R(J i=0,K=d.K;i<K;i++){J b=a(d[i],i);G(b!=U)c[c.K]=b}I c.7d.1w([],c)}});J v=9B.9A.3y();D.14={5B:(v.1I(/.+(?:9y|9x|9w|9v)[\\/: ]([\\d.]+)/)||[])[1],2k:/75/.11(v),2G:/2G/.11(v),1f:/1f/.11(v)&&!/2G/.11(v),42:/42/.11(v)&&!/(9s|75)/.11(v)};J y=D.14.1f?"7o":"72";D.1l({71:!D.14.1f||S.70=="6Z",3X:{"R":"9n","9k":"1F","4i":y,72:y,7o:y,9h:"9f",9e:"9d",9b:"99"}});D.P({6W:H(a){I a.1d},97:H(a){I D.4S(a,"1d")},95:H(a){I D.3a(a,2,"2H")},91:H(a){I D.3a(a,2,"4l")},8Z:H(a){I D.4S(a,"2H")},8X:H(a){I D.4S(a,"4l")},8W:H(a){I D.5v(a.1d.1x,a)},8V:H(a){I D.5v(a.1x)},6Q:H(a){I D.Y(a,"8U")?a.8T||a.8S.S:D.2d(a.3t)}},H(c,d){D.17[c]=H(b){J a=D.2l(7,d);G(b&&1j b=="23")a=D.3g(b,a);I 7.2I(D.4r(a))}});D.P({6P:"3v",8Q:"6F",39:"6E",8P:"5q",8O:"7b"},H(c,b){D.17[c]=H(){J a=19;I 7.P(H(){R(J i=0,K=a.K;i<K;i++)D(a[i])[b](7)})}});D.P({8N:H(a){D.1K(7,a,"");G(7.16==1)7.5l(a)},8M:H(a){D.1F.1e(7,a)},8L:H(a){D.1F.21(7,a)},8K:H(a){D.1F[D.1F.3T(7,a)?"21":"1e"](7,a)},21:H(a){G(!a||D.1E(a,[7]).r.K){D("*",7).1e(7).P(H(){D.W.21(7);D.3b(7)});G(7.1d)7.1d.37(7)}},4E:H(){D(">*",7).21();1B(7.1x)7.37(7.1x)}},H(a,b){D.17[a]=H(){I 7.P(b,19)}});D.P(["6N","4b"],H(i,c){J b=c.3y();D.17[b]=H(a){I 7[0]==1b?D.14.2G&&S.1c["5t"+c]||D.14.2k&&1b["5s"+c]||S.70=="6Z"&&S.1C["5t"+c]||S.1c["5t"+c]:7[0]==S?29.2f(29.2f(S.1c["4y"+c],S.1C["4y"+c]),29.2f(S.1c["2i"+c],S.1C["2i"+c])):a==12?(7.K?D.1g(7[0],b):U):7.1g(b,a.1q==56?a:a+"2X")}});H 25(a,b){I a[0]&&3r(D.2a(a[0],b,M),10)||0}J C=D.14.2k&&3r(D.14.5B)<8H?"(?:[\\\\w*3m-]|\\\\\\\\.)":"(?:[\\\\w\\8F-\\8E*3m-]|\\\\\\\\.)",6L=2B 4v("^>\\\\s*("+C+"+)"),6J=2B 4v("^("+C+"+)(#)("+C+"+)"),6I=2B 4v("^([#.]?)("+C+"*)");D.1l({6H:{"":H(a,i,m){I m[2]=="*"||D.Y(a,m[2])},"#":H(a,i,m){I a.4G("2v")==m[2]},":":{8D:H(a,i,m){I i<m[3]-0},8C:H(a,i,m){I i>m[3]-0},3a:H(a,i,m){I m[3]-0==i},79:H(a,i,m){I m[3]-0==i},3o:H(a,i){I i==0},3S:H(a,i,m,r){I i==r.K-1},6D:H(a,i){I i%2==0},6C:H(a,i){I i%2},"3o-4u":H(a){I a.1d.3H("*")[0]==a},"3S-4u":H(a){I D.3a(a.1d.5T,1,"4l")==a},"8z-4u":H(a){I!D.3a(a.1d.5T,2,"4l")},6W:H(a){I a.1x},4E:H(a){I!a.1x},8y:H(a,i,m){I(a.6O||a.8x||D(a).1r()||"").1h(m[3])>=0},4j:H(a){I"1G"!=a.O&&D.1g(a,"18")!="2F"&&D.1g(a,"5g")!="1G"},1G:H(a){I"1G"==a.O||D.1g(a,"18")=="2F"||D.1g(a,"5g")=="1G"},8w:H(a){I!a.3R},3R:H(a){I a.3R},4J:H(a){I a.4J},2W:H(a){I a.2W||D.1K(a,"2W")},1r:H(a){I"1r"==a.O},5O:H(a){I"5O"==a.O},5L:H(a){I"5L"==a.O},5p:H(a){I"5p"==a.O},3Q:H(a){I"3Q"==a.O},5o:H(a){I"5o"==a.O},6A:H(a){I"6A"==a.O},6z:H(a){I"6z"==a.O},2s:H(a){I"2s"==a.O||D.Y(a,"2s")},4T:H(a){I/4T|2A|6y|2s/i.11(a.Y)},3T:H(a,i,m){I D.2q(m[3],a).K},8t:H(a){I/h\\d/i.11(a.Y)},8s:H(a){I D.3C(D.3O,H(b){I a==b.T}).K}}},6x:[/^(\\[) *@?([\\w-]+) *([!*$^~=]*) *(\'?"?)(.*?)\\4 *\\]/,/^(:)([\\w-]+)\\("?\'?(.*?(\\(.*?\\))?[^(]*?)"?\'?\\)/,2B 4v("^([:.#]*)("+C+"+)")],3g:H(a,c,b){J d,1t=[];1B(a&&a!=d){d=a;J f=D.1E(a,c,b);a=f.t.1o(/^\\s*,\\s*/,"");1t=b?c=f.r:D.2R(1t,f.r)}I 1t},2q:H(t,o){G(1j t!="23")I[t];G(o&&o.16!=1&&o.16!=9)I[];o=o||S;J d=[o],2o=[],3S,Y;1B(t&&3S!=t){J r=[];3S=t;t=D.3k(t);J l=Q,3j=6L,m=3j.2D(t);G(m){Y=m[1].2r();R(J i=0;d[i];i++)R(J c=d[i].1x;c;c=c.2H)G(c.16==1&&(Y=="*"||c.Y.2r()==Y))r.1p(c);d=r;t=t.1o(3j,"");G(t.1h(" ")==0)6M;l=M}N{3j=/^([>+~])\\s*(\\w*)/i;G((m=3j.2D(t))!=U){r=[];J k={};Y=m[2].2r();m=m[1];R(J j=0,3i=d.K;j<3i;j++){J n=m=="~"||m=="+"?d[j].2H:d[j].1x;R(;n;n=n.2H)G(n.16==1){J g=D.L(n);G(m=="~"&&k[g])1X;G(!Y||n.Y.2r()==Y){G(m=="~")k[g]=M;r.1p(n)}G(m=="+")1X}}d=r;t=D.3k(t.1o(3j,""));l=M}}G(t&&!l){G(!t.1h(",")){G(o==d[0])d.4s();2o=D.2R(2o,d);r=d=[o];t=" "+t.6v(1,t.K)}N{J h=6J;J m=h.2D(t);G(m){m=[0,m[2],m[3],m[1]]}N{h=6I;m=h.2D(t)}m[2]=m[2].1o(/\\\\/g,"");J f=d[d.K-1];G(m[1]=="#"&&f&&f.61&&!D.4n(f)){J p=f.61(m[2]);G((D.14.1f||D.14.2G)&&p&&1j p.2v=="23"&&p.2v!=m[2])p=D(\'[@2v="\'+m[2]+\'"]\',f)[0];d=r=p&&(!m[3]||D.Y(p,m[3]))?[p]:[]}N{R(J i=0;d[i];i++){J a=m[1]=="#"&&m[3]?m[3]:m[1]!=""||m[0]==""?"*":m[2];G(a=="*"&&d[i].Y.3y()=="49")a="3n";r=D.2R(r,d[i].3H(a))}G(m[1]==".")r=D.5m(r,m[2]);G(m[1]=="#"){J e=[];R(J i=0;r[i];i++)G(r[i].4G("2v")==m[2]){e=[r[i]];1X}r=e}d=r}t=t.1o(h,"")}}G(t){J b=D.1E(t,r);d=r=b.r;t=D.3k(b.t)}}G(t)d=[];G(d&&o==d[0])d.4s();2o=D.2R(2o,d);I 2o},5m:H(r,m,a){m=" "+m+" ";J c=[];R(J i=0;r[i];i++){J b=(" "+r[i].1F+" ").1h(m)>=0;G(!a&&b||a&&!b)c.1p(r[i])}I c},1E:H(t,r,h){J d;1B(t&&t!=d){d=t;J p=D.6x,m;R(J i=0;p[i];i++){m=p[i].2D(t);G(m){t=t.8r(m[0].K);m[2]=m[2].1o(/\\\\/g,"");1X}}G(!m)1X;G(m[1]==":"&&m[2]=="4Y")r=62.11(m[3])?D.1E(m[3],r,M).r:D(r).4Y(m[3]);N G(m[1]==".")r=D.5m(r,m[2],h);N G(m[1]=="["){J g=[],O=m[3];R(J i=0,3i=r.K;i<3i;i++){J a=r[i],z=a[D.3X[m[2]]||m[2]];G(z==U||/5Q|4d|2W/.11(m[2]))z=D.1K(a,m[2])||\'\';G((O==""&&!!z||O=="="&&z==m[5]||O=="!="&&z!=m[5]||O=="^="&&z&&!z.1h(m[5])||O=="$="&&z.6v(z.K-m[5].K)==m[5]||(O=="*="||O=="~=")&&z.1h(m[5])>=0)^h)g.1p(a)}r=g}N G(m[1]==":"&&m[2]=="3a-4u"){J e={},g=[],11=/(-?)(\\d*)n((?:\\+|-)?\\d*)/.2D(m[3]=="6D"&&"2n"||m[3]=="6C"&&"2n+1"||!/\\D/.11(m[3])&&"8q+"+m[3]||m[3]),3o=(11[1]+(11[2]||1))-0,d=11[3]-0;R(J i=0,3i=r.K;i<3i;i++){J j=r[i],1d=j.1d,2v=D.L(1d);G(!e[2v]){J c=1;R(J n=1d.1x;n;n=n.2H)G(n.16==1)n.4q=c++;e[2v]=M}J b=Q;G(3o==0){G(j.4q==d)b=M}N G((j.4q-d)%3o==0&&(j.4q-d)/3o>=0)b=M;G(b^h)g.1p(j)}r=g}N{J f=D.6H[m[1]];G(1j f=="49")f=f[m[2]];G(1j f=="23")f=6u("Q||H(a,i){I "+f+";}");r=D.3C(r,H(a,i){I f(a,i,m,r)},h)}}I{r:r,t:t}},4S:H(b,c){J a=[],1t=b[c];1B(1t&&1t!=S){G(1t.16==1)a.1p(1t);1t=1t[c]}I a},3a:H(a,e,c,b){e=e||1;J d=0;R(;a;a=a[c])G(a.16==1&&++d==e)1X;I a},5v:H(n,a){J r=[];R(;n;n=n.2H){G(n.16==1&&n!=a)r.1p(n)}I r}});D.W={1e:H(f,i,g,e){G(f.16==3||f.16==8)I;G(D.14.1f&&f.4I)f=1b;G(!g.24)g.24=7.24++;G(e!=12){J h=g;g=7.3M(h,H(){I h.1w(7,19)});g.L=e}J j=D.L(f,"3w")||D.L(f,"3w",{}),1H=D.L(f,"1H")||D.L(f,"1H",H(){G(1j D!="12"&&!D.W.5k)I D.W.1H.1w(19.3L.T,19)});1H.T=f;D.P(i.1R(/\\s+/),H(c,b){J a=b.1R(".");b=a[0];g.O=a[1];J d=j[b];G(!d){d=j[b]={};G(!D.W.2t[b]||D.W.2t[b].4p.1k(f)===Q){G(f.3K)f.3K(b,1H,Q);N G(f.6t)f.6t("4o"+b,1H)}}d[g.24]=g;D.W.26[b]=M});f=U},24:1,26:{},21:H(e,h,f){G(e.16==3||e.16==8)I;J i=D.L(e,"3w"),1L,5i;G(i){G(h==12||(1j h=="23"&&h.8p(0)=="."))R(J g 1n i)7.21(e,g+(h||""));N{G(h.O){f=h.2y;h=h.O}D.P(h.1R(/\\s+/),H(b,a){J c=a.1R(".");a=c[0];G(i[a]){G(f)2U i[a][f.24];N R(f 1n i[a])G(!c[1]||i[a][f].O==c[1])2U i[a][f];R(1L 1n i[a])1X;G(!1L){G(!D.W.2t[a]||D.W.2t[a].4A.1k(e)===Q){G(e.6p)e.6p(a,D.L(e,"1H"),Q);N G(e.6n)e.6n("4o"+a,D.L(e,"1H"))}1L=U;2U i[a]}}})}R(1L 1n i)1X;G(!1L){J d=D.L(e,"1H");G(d)d.T=U;D.3b(e,"3w");D.3b(e,"1H")}}},1P:H(h,c,f,g,i){c=D.2d(c);G(h.1h("!")>=0){h=h.3s(0,-1);J a=M}G(!f){G(7.26[h])D("*").1e([1b,S]).1P(h,c)}N{G(f.16==3||f.16==8)I 12;J b,1L,17=D.1D(f[h]||U),W=!c[0]||!c[0].32;G(W){c.6h({O:h,2J:f,32:H(){},3J:H(){},4C:1z()});c[0][E]=M}c[0].O=h;G(a)c[0].6m=M;J d=D.L(f,"1H");G(d)b=d.1w(f,c);G((!17||(D.Y(f,\'a\')&&h=="4V"))&&f["4o"+h]&&f["4o"+h].1w(f,c)===Q)b=Q;G(W)c.4s();G(i&&D.1D(i)){1L=i.1w(f,b==U?c:c.7d(b));G(1L!==12)b=1L}G(17&&g!==Q&&b!==Q&&!(D.Y(f,\'a\')&&h=="4V")){7.5k=M;1U{f[h]()}1V(e){}}7.5k=Q}I b},1H:H(b){J a,1L,38,5f,4m;b=19[0]=D.W.6l(b||1b.W);38=b.O.1R(".");b.O=38[0];38=38[1];5f=!38&&!b.6m;4m=(D.L(7,"3w")||{})[b.O];R(J j 1n 4m){J c=4m[j];G(5f||c.O==38){b.2y=c;b.L=c.L;1L=c.1w(7,19);G(a!==Q)a=1L;G(1L===Q){b.32();b.3J()}}}I a},6l:H(b){G(b[E]==M)I b;J d=b;b={8o:d};J c="8n 8m 8l 8k 2s 8j 47 5d 6j 5E 8i L 8h 8g 4K 2y 5a 59 8e 8b 58 6f 8a 88 4k 87 86 84 6d 2J 4C 6c O 82 81 35".1R(" ");R(J i=c.K;i;i--)b[c[i]]=d[c[i]];b[E]=M;b.32=H(){G(d.32)d.32();d.80=Q};b.3J=H(){G(d.3J)d.3J();d.7Z=M};b.4C=b.4C||1z();G(!b.2J)b.2J=b.6d||S;G(b.2J.16==3)b.2J=b.2J.1d;G(!b.4k&&b.4K)b.4k=b.4K==b.2J?b.6c:b.4K;G(b.58==U&&b.5d!=U){J a=S.1C,1c=S.1c;b.58=b.5d+(a&&a.2e||1c&&1c.2e||0)-(a.6b||0);b.6f=b.6j+(a&&a.2c||1c&&1c.2c||0)-(a.6a||0)}G(!b.35&&((b.47||b.47===0)?b.47:b.5a))b.35=b.47||b.5a;G(!b.59&&b.5E)b.59=b.5E;G(!b.35&&b.2s)b.35=(b.2s&1?1:(b.2s&2?3:(b.2s&4?2:0)));I b},3M:H(a,b){b.24=a.24=a.24||b.24||7.24++;I b},2t:{27:{4p:H(){55();I},4A:H(){I}},3D:{4p:H(){G(D.14.1f)I Q;D(7).2O("53",D.W.2t.3D.2y);I M},4A:H(){G(D.14.1f)I Q;D(7).4e("53",D.W.2t.3D.2y);I M},2y:H(a){G(F(a,7))I M;a.O="3D";I D.W.1H.1w(7,19)}},3N:{4p:H(){G(D.14.1f)I Q;D(7).2O("51",D.W.2t.3N.2y);I M},4A:H(){G(D.14.1f)I Q;D(7).4e("51",D.W.2t.3N.2y);I M},2y:H(a){G(F(a,7))I M;a.O="3N";I D.W.1H.1w(7,19)}}}};D.17.1l({2O:H(c,a,b){I c=="4X"?7.2V(c,a,b):7.P(H(){D.W.1e(7,c,b||a,b&&a)})},2V:H(d,b,c){J e=D.W.3M(c||b,H(a){D(7).4e(a,e);I(c||b).1w(7,19)});I 7.P(H(){D.W.1e(7,d,e,c&&b)})},4e:H(a,b){I 7.P(H(){D.W.21(7,a,b)})},1P:H(c,a,b){I 7.P(H(){D.W.1P(c,a,7,M,b)})},5C:H(c,a,b){I 7[0]&&D.W.1P(c,a,7[0],Q,b)},2m:H(b){J c=19,i=1;1B(i<c.K)D.W.3M(b,c[i++]);I 7.4V(D.W.3M(b,H(a){7.4Z=(7.4Z||0)%i;a.32();I c[7.4Z++].1w(7,19)||Q}))},7X:H(a,b){I 7.2O(\'3D\',a).2O(\'3N\',b)},27:H(a){55();G(D.2Q)a.1k(S,D);N D.3A.1p(H(){I a.1k(7,D)});I 7}});D.1l({2Q:Q,3A:[],27:H(){G(!D.2Q){D.2Q=M;G(D.3A){D.P(D.3A,H(){7.1k(S)});D.3A=U}D(S).5C("27")}}});J x=Q;H 55(){G(x)I;x=M;G(S.3K&&!D.14.2G)S.3K("69",D.27,Q);G(D.14.1f&&1b==1S)(H(){G(D.2Q)I;1U{S.1C.7V("1A")}1V(3e){3B(19.3L,0);I}D.27()})();G(D.14.2G)S.3K("69",H(){G(D.2Q)I;R(J i=0;i<S.4W.K;i++)G(S.4W[i].3R){3B(19.3L,0);I}D.27()},Q);G(D.14.2k){J a;(H(){G(D.2Q)I;G(S.3f!="68"&&S.3f!="1J"){3B(19.3L,0);I}G(a===12)a=D("V, 7A[7U=7S]").K;G(S.4W.K!=a){3B(19.3L,0);I}D.27()})()}D.W.1e(1b,"43",D.27)}D.P(("7R,7Q,43,85,4y,4X,4V,7P,"+"7O,7N,89,53,51,7M,2A,"+"5o,7L,7K,8d,3e").1R(","),H(i,b){D.17[b]=H(a){I a?7.2O(b,a):7.1P(b)}});J F=H(a,c){J b=a.4k;1B(b&&b!=c)1U{b=b.1d}1V(3e){b=c}I b==c};D(1b).2O("4X",H(){D("*").1e(S).4e()});D.17.1l({67:D.17.43,43:H(g,d,c){G(1j g!=\'23\')I 7.67(g);J e=g.1h(" ");G(e>=0){J i=g.3s(e,g.K);g=g.3s(0,e)}c=c||H(){};J f="2P";G(d)G(D.1D(d)){c=d;d=U}N{d=D.3n(d);f="6g"}J h=7;D.3Y({1a:g,O:f,1O:"2K",L:d,1J:H(a,b){G(b=="1W"||b=="7J")h.2K(i?D("<1v/>").3v(a.4U.1o(/<1m(.|\\s)*?\\/1m>/g,"")).2q(i):a.4U);h.P(c,[a.4U,b,a])}});I 7},aL:H(){I D.3n(7.7I())},7I:H(){I 7.2l(H(){I D.Y(7,"3V")?D.2d(7.aH):7}).1E(H(){I 7.34&&!7.3R&&(7.4J||/2A|6y/i.11(7.Y)||/1r|1G|3Q/i.11(7.O))}).2l(H(i,c){J b=D(7).6e();I b==U?U:b.1q==2p?D.2l(b,H(a,i){I{34:c.34,2x:a}}):{34:c.34,2x:b}}).3p()}});D.P("7H,7G,7F,7D,7C,7B".1R(","),H(i,o){D.17[o]=H(f){I 7.2O(o,f)}});J B=1z();D.1l({3p:H(d,b,a,c){G(D.1D(b)){a=b;b=U}I D.3Y({O:"2P",1a:d,L:b,1W:a,1O:c})},aE:H(b,a){I D.3p(b,U,a,"1m")},aD:H(c,b,a){I D.3p(c,b,a,"3z")},aC:H(d,b,a,c){G(D.1D(b)){a=b;b={}}I D.3Y({O:"6g",1a:d,L:b,1W:a,1O:c})},aA:H(a){D.1l(D.60,a)},60:{1a:5Z.5Q,26:M,O:"2P",2T:0,7z:"4R/x-ax-3V-aw",7x:M,31:M,L:U,5Y:U,3Q:U,4Q:{2N:"4R/2N, 1r/2N",2K:"1r/2K",1m:"1r/4t, 4R/4t",3z:"4R/3z, 1r/4t",1r:"1r/as",4w:"*/*"}},4z:{},3Y:H(s){s=D.1l(M,s,D.1l(M,{},D.60,s));J g,2Z=/=\\?(&|$)/g,1u,L,O=s.O.2r();G(s.L&&s.7x&&1j s.L!="23")s.L=D.3n(s.L);G(s.1O=="4P"){G(O=="2P"){G(!s.1a.1I(2Z))s.1a+=(s.1a.1I(/\\?/)?"&":"?")+(s.4P||"7u")+"=?"}N G(!s.L||!s.L.1I(2Z))s.L=(s.L?s.L+"&":"")+(s.4P||"7u")+"=?";s.1O="3z"}G(s.1O=="3z"&&(s.L&&s.L.1I(2Z)||s.1a.1I(2Z))){g="4P"+B++;G(s.L)s.L=(s.L+"").1o(2Z,"="+g+"$1");s.1a=s.1a.1o(2Z,"="+g+"$1");s.1O="1m";1b[g]=H(a){L=a;1W();1J();1b[g]=12;1U{2U 1b[g]}1V(e){}G(i)i.37(h)}}G(s.1O=="1m"&&s.1Y==U)s.1Y=Q;G(s.1Y===Q&&O=="2P"){J j=1z();J k=s.1a.1o(/(\\?|&)3m=.*?(&|$)/,"$ap="+j+"$2");s.1a=k+((k==s.1a)?(s.1a.1I(/\\?/)?"&":"?")+"3m="+j:"")}G(s.L&&O=="2P"){s.1a+=(s.1a.1I(/\\?/)?"&":"?")+s.L;s.L=U}G(s.26&&!D.4O++)D.W.1P("7H");J n=/^(?:\\w+:)?\\/\\/([^\\/?#]+)/;G(s.1O=="1m"&&O=="2P"&&n.11(s.1a)&&n.2D(s.1a)[1]!=5Z.al){J i=S.3H("6w")[0];J h=S.3h("1m");h.4d=s.1a;G(s.7t)h.aj=s.7t;G(!g){J l=Q;h.ah=h.ag=H(){G(!l&&(!7.3f||7.3f=="68"||7.3f=="1J")){l=M;1W();1J();i.37(h)}}}i.3U(h);I 12}J m=Q;J c=1b.7s?2B 7s("ae.ac"):2B 7r();G(s.5Y)c.6R(O,s.1a,s.31,s.5Y,s.3Q);N c.6R(O,s.1a,s.31);1U{G(s.L)c.4B("ab-aa",s.7z);G(s.5S)c.4B("a9-5R-a8",D.4z[s.1a]||"a7, a6 a5 a4 5N:5N:5N a2");c.4B("X-9Z-9Y","7r");c.4B("9W",s.1O&&s.4Q[s.1O]?s.4Q[s.1O]+", */*":s.4Q.4w)}1V(e){}G(s.7m&&s.7m(c,s)===Q){s.26&&D.4O--;c.7l();I Q}G(s.26)D.W.1P("7B",[c,s]);J d=H(a){G(!m&&c&&(c.3f==4||a=="2T")){m=M;G(f){7k(f);f=U}1u=a=="2T"&&"2T"||!D.7j(c)&&"3e"||s.5S&&D.7h(c,s.1a)&&"7J"||"1W";G(1u=="1W"){1U{L=D.6X(c,s.1O,s.9S)}1V(e){1u="5J"}}G(1u=="1W"){J b;1U{b=c.5I("7g-5R")}1V(e){}G(s.5S&&b)D.4z[s.1a]=b;G(!g)1W()}N D.5H(s,c,1u);1J();G(s.31)c=U}};G(s.31){J f=4I(d,13);G(s.2T>0)3B(H(){G(c){c.7l();G(!m)d("2T")}},s.2T)}1U{c.9P(s.L)}1V(e){D.5H(s,c,U,e)}G(!s.31)d();H 1W(){G(s.1W)s.1W(L,1u);G(s.26)D.W.1P("7C",[c,s])}H 1J(){G(s.1J)s.1J(c,1u);G(s.26)D.W.1P("7F",[c,s]);G(s.26&&!--D.4O)D.W.1P("7G")}I c},5H:H(s,a,b,e){G(s.3e)s.3e(a,b,e);G(s.26)D.W.1P("7D",[a,s,e])},4O:0,7j:H(a){1U{I!a.1u&&5Z.9O=="5p:"||(a.1u>=7e&&a.1u<9N)||a.1u==7c||a.1u==9K||D.14.2k&&a.1u==12}1V(e){}I Q},7h:H(a,c){1U{J b=a.5I("7g-5R");I a.1u==7c||b==D.4z[c]||D.14.2k&&a.1u==12}1V(e){}I Q},6X:H(a,c,b){J d=a.5I("9J-O"),2N=c=="2N"||!c&&d&&d.1h("2N")>=0,L=2N?a.9I:a.4U;G(2N&&L.1C.2j=="5J")7p"5J";G(b)L=b(L,c);G(c=="1m")D.5u(L);G(c=="3z")L=6u("("+L+")");I L},3n:H(a){J s=[];G(a.1q==2p||a.5w)D.P(a,H(){s.1p(3u(7.34)+"="+3u(7.2x))});N R(J j 1n a)G(a[j]&&a[j].1q==2p)D.P(a[j],H(){s.1p(3u(j)+"="+3u(7))});N s.1p(3u(j)+"="+3u(D.1D(a[j])?a[j]():a[j]));I s.6s("&").1o(/%20/g,"+")}});D.17.1l({1N:H(c,b){I c?7.2g({1Z:"1N",2h:"1N",1y:"1N"},c,b):7.1E(":1G").P(H(){7.V.18=7.5D||"";G(D.1g(7,"18")=="2F"){J a=D("<"+7.2j+" />").6P("1c");7.V.18=a.1g("18");G(7.V.18=="2F")7.V.18="3I";a.21()}}).3l()},1M:H(b,a){I b?7.2g({1Z:"1M",2h:"1M",1y:"1M"},b,a):7.1E(":4j").P(H(){7.5D=7.5D||D.1g(7,"18");7.V.18="2F"}).3l()},78:D.17.2m,2m:H(a,b){I D.1D(a)&&D.1D(b)?7.78.1w(7,19):a?7.2g({1Z:"2m",2h:"2m",1y:"2m"},a,b):7.P(H(){D(7)[D(7).3F(":1G")?"1N":"1M"]()})},9G:H(b,a){I 7.2g({1Z:"1N"},b,a)},9F:H(b,a){I 7.2g({1Z:"1M"},b,a)},9E:H(b,a){I 7.2g({1Z:"2m"},b,a)},9D:H(b,a){I 7.2g({1y:"1N"},b,a)},9M:H(b,a){I 7.2g({1y:"1M"},b,a)},9C:H(c,a,b){I 7.2g({1y:a},c,b)},2g:H(k,j,i,g){J h=D.77(j,i,g);I 7[h.36===Q?"P":"36"](H(){G(7.16!=1)I Q;J f=D.1l({},h),p,1G=D(7).3F(":1G"),46=7;R(p 1n k){G(k[p]=="1M"&&1G||k[p]=="1N"&&!1G)I f.1J.1k(7);G(p=="1Z"||p=="2h"){f.18=D.1g(7,"18");f.33=7.V.33}}G(f.33!=U)7.V.33="1G";f.45=D.1l({},k);D.P(k,H(c,a){J e=2B D.28(46,f,c);G(/2m|1N|1M/.11(a))e[a=="2m"?1G?"1N":"1M":a](k);N{J b=a.6r().1I(/^([+-]=)?([\\d+-.]+)(.*)$/),2b=e.1t(M)||0;G(b){J d=3d(b[2]),2M=b[3]||"2X";G(2M!="2X"){46.V[c]=(d||1)+2M;2b=((d||1)/e.1t(M))*2b;46.V[c]=2b+2M}G(b[1])d=((b[1]=="-="?-1:1)*d)+2b;e.3G(2b,d,2M)}N e.3G(2b,a,"")}});I M})},36:H(a,b){G(D.1D(a)||(a&&a.1q==2p)){b=a;a="28"}G(!a||(1j a=="23"&&!b))I A(7[0],a);I 7.P(H(){G(b.1q==2p)A(7,a,b);N{A(7,a).1p(b);G(A(7,a).K==1)b.1k(7)}})},9X:H(b,c){J a=D.3O;G(b)7.36([]);7.P(H(){R(J i=a.K-1;i>=0;i--)G(a[i].T==7){G(c)a[i](M);a.7n(i,1)}});G(!c)7.5A();I 7}});J A=H(b,c,a){G(b){c=c||"28";J q=D.L(b,c+"36");G(!q||a)q=D.L(b,c+"36",D.2d(a))}I q};D.17.5A=H(a){a=a||"28";I 7.P(H(){J q=A(7,a);q.4s();G(q.K)q[0].1k(7)})};D.1l({77:H(b,a,c){J d=b&&b.1q==a0?b:{1J:c||!c&&a||D.1D(b)&&b,2u:b,41:c&&a||a&&a.1q!=9t&&a};d.2u=(d.2u&&d.2u.1q==4L?d.2u:D.28.5K[d.2u])||D.28.5K.74;d.5M=d.1J;d.1J=H(){G(d.36!==Q)D(7).5A();G(D.1D(d.5M))d.5M.1k(7)};I d},41:{73:H(p,n,b,a){I b+a*p},5P:H(p,n,b,a){I((-29.9r(p*29.9q)/2)+0.5)*a+b}},3O:[],48:U,28:H(b,c,a){7.15=c;7.T=b;7.1i=a;G(!c.3Z)c.3Z={}}});D.28.44={4D:H(){G(7.15.2Y)7.15.2Y.1k(7.T,7.1z,7);(D.28.2Y[7.1i]||D.28.2Y.4w)(7);G(7.1i=="1Z"||7.1i=="2h")7.T.V.18="3I"},1t:H(a){G(7.T[7.1i]!=U&&7.T.V[7.1i]==U)I 7.T[7.1i];J r=3d(D.1g(7.T,7.1i,a));I r&&r>-9p?r:3d(D.2a(7.T,7.1i))||0},3G:H(c,b,d){7.5V=1z();7.2b=c;7.3l=b;7.2M=d||7.2M||"2X";7.1z=7.2b;7.2S=7.4N=0;7.4D();J e=7;H t(a){I e.2Y(a)}t.T=7.T;D.3O.1p(t);G(D.48==U){D.48=4I(H(){J a=D.3O;R(J i=0;i<a.K;i++)G(!a[i]())a.7n(i--,1);G(!a.K){7k(D.48);D.48=U}},13)}},1N:H(){7.15.3Z[7.1i]=D.1K(7.T.V,7.1i);7.15.1N=M;7.3G(0,7.1t());G(7.1i=="2h"||7.1i=="1Z")7.T.V[7.1i]="9m";D(7.T).1N()},1M:H(){7.15.3Z[7.1i]=D.1K(7.T.V,7.1i);7.15.1M=M;7.3G(7.1t(),0)},2Y:H(a){J t=1z();G(a||t>7.15.2u+7.5V){7.1z=7.3l;7.2S=7.4N=1;7.4D();7.15.45[7.1i]=M;J b=M;R(J i 1n 7.15.45)G(7.15.45[i]!==M)b=Q;G(b){G(7.15.18!=U){7.T.V.33=7.15.33;7.T.V.18=7.15.18;G(D.1g(7.T,"18")=="2F")7.T.V.18="3I"}G(7.15.1M)7.T.V.18="2F";G(7.15.1M||7.15.1N)R(J p 1n 7.15.45)D.1K(7.T.V,p,7.15.3Z[p])}G(b)7.15.1J.1k(7.T);I Q}N{J n=t-7.5V;7.4N=n/7.15.2u;7.2S=D.41[7.15.41||(D.41.5P?"5P":"73")](7.4N,n,0,1,7.15.2u);7.1z=7.2b+((7.3l-7.2b)*7.2S);7.4D()}I M}};D.1l(D.28,{5K:{9l:9j,9i:7e,74:9g},2Y:{2e:H(a){a.T.2e=a.1z},2c:H(a){a.T.2c=a.1z},1y:H(a){D.1K(a.T.V,"1y",a.1z)},4w:H(a){a.T.V[a.1i]=a.1z+a.2M}}});D.17.2i=H(){J b=0,1S=0,T=7[0],3q;G(T)ao(D.14){J d=T.1d,4a=T,1s=T.1s,1Q=T.2z,5U=2k&&3r(5B)<9c&&!/9a/i.11(v),1g=D.2a,3c=1g(T,"30")=="3c";G(T.7y){J c=T.7y();1e(c.1A+29.2f(1Q.1C.2e,1Q.1c.2e),c.1S+29.2f(1Q.1C.2c,1Q.1c.2c));1e(-1Q.1C.6b,-1Q.1C.6a)}N{1e(T.5X,T.5W);1B(1s){1e(1s.5X,1s.5W);G(42&&!/^t(98|d|h)$/i.11(1s.2j)||2k&&!5U)2C(1s);G(!3c&&1g(1s,"30")=="3c")3c=M;4a=/^1c$/i.11(1s.2j)?4a:1s;1s=1s.1s}1B(d&&d.2j&&!/^1c|2K$/i.11(d.2j)){G(!/^96|1T.*$/i.11(1g(d,"18")))1e(-d.2e,-d.2c);G(42&&1g(d,"33")!="4j")2C(d);d=d.1d}G((5U&&(3c||1g(4a,"30")=="5x"))||(42&&1g(4a,"30")!="5x"))1e(-1Q.1c.5X,-1Q.1c.5W);G(3c)1e(29.2f(1Q.1C.2e,1Q.1c.2e),29.2f(1Q.1C.2c,1Q.1c.2c))}3q={1S:1S,1A:b}}H 2C(a){1e(D.2a(a,"6V",M),D.2a(a,"6U",M))}H 1e(l,t){b+=3r(l,10)||0;1S+=3r(t,10)||0}I 3q};D.17.1l({30:H(){J a=0,1S=0,3q;G(7[0]){J b=7.1s(),2i=7.2i(),4c=/^1c|2K$/i.11(b[0].2j)?{1S:0,1A:0}:b.2i();2i.1S-=25(7,\'94\');2i.1A-=25(7,\'aF\');4c.1S+=25(b,\'6U\');4c.1A+=25(b,\'6V\');3q={1S:2i.1S-4c.1S,1A:2i.1A-4c.1A}}I 3q},1s:H(){J a=7[0].1s;1B(a&&(!/^1c|2K$/i.11(a.2j)&&D.1g(a,\'30\')==\'93\'))a=a.1s;I D(a)}});D.P([\'5e\',\'5G\'],H(i,b){J c=\'4y\'+b;D.17[c]=H(a){G(!7[0])I;I a!=12?7.P(H(){7==1b||7==S?1b.92(!i?a:D(1b).2e(),i?a:D(1b).2c()):7[c]=a}):7[0]==1b||7[0]==S?46[i?\'aI\':\'aJ\']||D.71&&S.1C[c]||S.1c[c]:7[0][c]}});D.P(["6N","4b"],H(i,b){J c=i?"5e":"5G",4f=i?"6k":"6i";D.17["5s"+b]=H(){I 7[b.3y()]()+25(7,"57"+c)+25(7,"57"+4f)};D.17["90"+b]=H(a){I 7["5s"+b]()+25(7,"2C"+c+"4b")+25(7,"2C"+4f+"4b")+(a?25(7,"6S"+c)+25(7,"6S"+4f):0)}})})();',62,669,'|||||||this|||||||||||||||||||||||||||||||||||if|function|return|var|length|data|true|else|type|each|false|for|document|elem|null|style|event||nodeName|||test|undefined||browser|options|nodeType|fn|display|arguments|url|window|body|parentNode|add|msie|css|indexOf|prop|typeof|call|extend|script|in|replace|push|constructor|text|offsetParent|cur|status|div|apply|firstChild|opacity|now|left|while|documentElement|isFunction|filter|className|hidden|handle|match|complete|attr|ret|hide|show|dataType|trigger|doc|split|top|table|try|catch|success|break|cache|height||remove|tbody|string|guid|num|global|ready|fx|Math|curCSS|start|scrollTop|makeArray|scrollLeft|max|animate|width|offset|tagName|safari|map|toggle||done|Array|find|toUpperCase|button|special|duration|id|copy|value|handler|ownerDocument|select|new|border|exec|stack|none|opera|nextSibling|pushStack|target|html|inArray|unit|xml|bind|GET|isReady|merge|pos|timeout|delete|one|selected|px|step|jsre|position|async|preventDefault|overflow|name|which|queue|removeChild|namespace|insertBefore|nth|removeData|fixed|parseFloat|error|readyState|multiFilter|createElement|rl|re|trim|end|_|param|first|get|results|parseInt|slice|childNodes|encodeURIComponent|append|events|elems|toLowerCase|json|readyList|setTimeout|grep|mouseenter|color|is|custom|getElementsByTagName|block|stopPropagation|addEventListener|callee|proxy|mouseleave|timers|defaultView|password|disabled|last|has|appendChild|form|domManip|props|ajax|orig|set|easing|mozilla|load|prototype|curAnim|self|charCode|timerId|object|offsetChild|Width|parentOffset|src|unbind|br|currentStyle|clean|float|visible|relatedTarget|previousSibling|handlers|isXMLDoc|on|setup|nodeIndex|unique|shift|javascript|child|RegExp|_default|deep|scroll|lastModified|teardown|setRequestHeader|timeStamp|update|empty|tr|getAttribute|innerHTML|setInterval|checked|fromElement|Number|jQuery|state|active|jsonp|accepts|application|dir|input|responseText|click|styleSheets|unload|not|lastToggle|outline|mouseout|getPropertyValue|mouseover|getComputedStyle|bindReady|String|padding|pageX|metaKey|keyCode|getWH|andSelf|clientX|Left|all|visibility|container|index|init|triggered|removeAttribute|classFilter|prevObject|submit|file|after|windowData|inner|client|globalEval|sibling|jquery|absolute|clone|wrapAll|dequeue|version|triggerHandler|oldblock|ctrlKey|createTextNode|Top|handleError|getResponseHeader|parsererror|speeds|checkbox|old|00|radio|swing|href|Modified|ifModified|lastChild|safari2|startTime|offsetTop|offsetLeft|username|location|ajaxSettings|getElementById|isSimple|values|selectedIndex|runtimeStyle|rsLeft|_load|loaded|DOMContentLoaded|clientTop|clientLeft|toElement|srcElement|val|pageY|POST|unshift|Bottom|clientY|Right|fix|exclusive|detachEvent|cloneNode|removeEventListener|swap|toString|join|attachEvent|eval|substr|head|parse|textarea|reset|image|zoom|odd|even|before|prepend|exclude|expr|quickClass|quickID|uuid|quickChild|continue|Height|textContent|appendTo|contents|open|margin|evalScript|borderTopWidth|borderLeftWidth|parent|httpData|setArray|CSS1Compat|compatMode|boxModel|cssFloat|linear|def|webkit|nodeValue|speed|_toggle|eq|100|replaceWith|304|concat|200|alpha|Last|httpNotModified|getAttributeNode|httpSuccess|clearInterval|abort|beforeSend|splice|styleFloat|throw|colgroup|XMLHttpRequest|ActiveXObject|scriptCharset|callback|fieldset|multiple|processData|getBoundingClientRect|contentType|link|ajaxSend|ajaxSuccess|ajaxError|col|ajaxComplete|ajaxStop|ajaxStart|serializeArray|notmodified|keypress|keydown|change|mouseup|mousedown|dblclick|focus|blur|stylesheet|hasClass|rel|doScroll|black|hover|solid|cancelBubble|returnValue|wheelDelta|view|round|shiftKey|resize|screenY|screenX|relatedNode|mousemove|prevValue|originalTarget|offsetHeight|keyup|newValue|offsetWidth|eventPhase|detail|currentTarget|cancelable|bubbles|attrName|attrChange|altKey|originalEvent|charAt|0n|substring|animated|header|noConflict|line|enabled|innerText|contains|only|weight|font|gt|lt|uFFFF|u0128|size|417|Boolean|Date|toggleClass|removeClass|addClass|removeAttr|replaceAll|insertAfter|prependTo|wrap|contentWindow|contentDocument|iframe|children|siblings|prevAll|wrapInner|nextAll|outer|prev|scrollTo|static|marginTop|next|inline|parents|able|cellSpacing|adobeair|cellspacing|522|maxLength|maxlength|readOnly|400|readonly|fast|600|class|slow|1px|htmlFor|reverse|10000|PI|cos|compatible|Function|setData|ie|ra|it|rv|getData|userAgent|navigator|fadeTo|fadeIn|slideToggle|slideUp|slideDown|ig|responseXML|content|1223|NaN|fadeOut|300|protocol|send|setAttribute|option|dataFilter|cssText|changed|be|Accept|stop|With|Requested|Object|can|GMT|property|1970|Jan|01|Thu|Since|If|Type|Content|XMLHTTP|th|Microsoft|td|onreadystatechange|onload|cap|charset|colg|host|tfoot|specified|with|1_|thead|leg|plain|attributes|opt|embed|urlencoded|www|area|hr|ajaxSetup|meta|post|getJSON|getScript|marginLeft|img|elements|pageYOffset|pageXOffset|abbr|serialize|pixelLeft'.split('|'),0,{}));var isIE=(document.all)?true:false;var isIE6=isIE&&([/MSIE (\d)\.0/i.exec(navigator.userAgent)][0][1]==6);var Class={create:function(){return function(){this.initialize.apply(this,arguments);}}}
var Extend=function(destination,source){for(var property in source){destination[property]=source[property];}}
var Bind=function(object,fun){return function(){return fun.apply(object,arguments);}}
var Each=function(list,fun){for(var i=0,len=list.length;i<len;i++){fun(list[i],i);}};var Contains=function(a,b){return a.contains?a!=b&&a.contains(b):!!(a.compareDocumentPosition(b)&16);}
var OverLay=Class.create();OverLay.prototype={initialize:function(options){this.SetOptions(options);this.Lay=document.getElementById(this.options.Lay)||document.body.insertBefore(document.createElement("div"),document.body.childNodes[0]);this.Color=this.options.Color;this.Opacity=parseInt(this.options.Opacity);this.zIndex=parseInt(this.options.zIndex);with(this.Lay.style){display="none";zIndex=this.zIndex;left=top=0;position="fixed";width=height="100%";}
if(isIE6){this.Lay.style.position="absolute";this._resize=Bind(this,function(){if(document.body.scrollWidth){this.Lay.style.width=Math.max(document.body.scrollWidth,document.body.clientWidth)+"px";this.Lay.style.height=Math.max(document.body.scrollHeight,document.body.clientHeight)+"px";}else{this.Lay.style.width=Math.max(document.documentElement.scrollWidth,document.documentElement.clientWidth)+"px";this.Lay.style.height=Math.max(document.documentElement.scrollHeight,document.documentElement.clientHeight)+"px";}});this.Lay.innerHTML='<iframe style="position:absolute;top:0;left:0;width:100%;height:100%;filter:alpha(opacity=0);"></iframe>'}},SetOptions:function(options){this.options={Lay:null,Color:"#000",Opacity:50,zIndex:1000};Extend(this.options,options||{});},Show:function(){if(isIE6){this._resize();window.attachEvent("onresize",this._resize);}
with(this.Lay.style){isIE?filter="alpha(opacity:"+this.Opacity+")":opacity=this.Opacity/100;backgroundColor=this.Color;display="block";}},Close:function(){this.Lay.style.display="none";if(isIE6){window.detachEvent("onresize",this._resize);}}};var LightBox=Class.create();LightBox.prototype={initialize:function(box,options){this.Box=document.getElementById(box);this.OverLay=new OverLay(options);this.SetOptions(options);this.Fixed=!!this.options.Fixed;this.Over=!!this.options.Over;this.Center=!!this.options.Center;this.onShow=this.options.onShow;this.Box.style.zIndex=this.OverLay.zIndex+1;this.Box.style.display="none";if(isIE6){this._top=this._left=0;this._select=[];this._fixed=Bind(this,this.SetFix);}},SetOptions:function(options){this.options={Over:true,Fixed:false,Center:false,onShow:function(){}};Extend(this.options,options||{});},SetFix:function(){if(document.body.scrollTop){var iTop=document.documentElement.scrollTop-this._top+this.Box.offsetTop,iLeft=document.documentElement.scrollLeft-this._left+this.Box.offsetLeft;}else{var iTop=document.body.scrollTop-this._top+this.Box.offsetTop,iLeft=document.body.scrollLeft-this._left+this.Box.offsetLeft;}
if(this.Center){iTop+=this.Box.offsetHeight/2;iLeft+=this.Box.offsetWidth/2;}
this.Box.style.top=iTop+"px";this.Box.style.left=iLeft+"px";if(document.body.scrollTop){this._top=document.body.scrollTop;this._left=document.body.scrollLeft;}else{this._top=document.documentElement.scrollTop;this._left=document.documentElement.scrollLeft;}},Show:function(options){this.Box.style.position=this.Fixed?"fixed":"absolute";if(this.Fixed&&isIE6){this.Box.style.position="absolute";if(document.body.scrollTop){this._top=document.body.scrollTop;this._left=document.body.scrollLeft;}else{this._top=document.documentElement.scrollTop;this._left=document.documentElement.scrollLeft;}
window.attachEvent("onscroll",this._fixed);}
if(this.Over){this.OverLay.Show();}else if(isIE6){this._select.length=0;Each(document.getElementsByTagName("select"),Bind(this,function(o){if(!Contains(this.Box,o)){o.style.visibility="hidden";this._select.push(o);}}))}
this.Box.style.display="block";if(this.Center){var iTop=-this.Box.offsetHeight/2,iLeft=-this.Box.offsetWidth/2;if(document.body.scrollTop){if(!this.Fixed||isIE6){iTop+=document.body.scrollTop;iLeft+=document.body.scrollLeft;}}else{if(!this.Fixed||isIE6){iTop+=document.documentElement.scrollTop;iLeft+=document.documentElement.scrollLeft;}}
with(this.Box.style){marginTop=iTop+"px";marginLeft=iLeft+"px";top=left="50%";}}
this.onShow();},Close:function(){this.Box.style.display="none";this.OverLay.Close();if(isIE6){window.detachEvent("onscroll",this._fixed);Each(this._select,function(o){o.style.visibility="visible";});}}};var BindAsEventListener=function(object,fun){return function(event){return fun.call(object,(event||window.event));}}
var CurrentStyle=function(element){return element.currentStyle||document.defaultView.getComputedStyle(element,null);}
function addEventHandler(oTarget,sEventType,fnHandler){if(oTarget.addEventListener){oTarget.addEventListener(sEventType,fnHandler,false);}else if(oTarget.attachEvent){oTarget.attachEvent("on"+sEventType,fnHandler);}else{oTarget["on"+sEventType]=fnHandler;}};function removeEventHandler(oTarget,sEventType,fnHandler){if(oTarget.removeEventListener){oTarget.removeEventListener(sEventType,fnHandler,false);}else if(oTarget.detachEvent){oTarget.detachEvent("on"+sEventType,fnHandler);}else{oTarget["on"+sEventType]=null;}};var Drag=Class.create();Drag.prototype={initialize:function(drag,options){this.Drag=document.getElementById(drag);this._x=this._y=0;this._marginLeft=this._marginTop=0;this._fM=BindAsEventListener(this,this.Move);this._fS=Bind(this,this.Stop);this.SetOptions(options);this.Limit=!!this.options.Limit;this.mxLeft=parseInt(this.options.mxLeft);this.mxRight=parseInt(this.options.mxRight);this.mxTop=parseInt(this.options.mxTop);this.mxBottom=parseInt(this.options.mxBottom);this.LockX=!!this.options.LockX;this.LockY=!!this.options.LockY;this.Lock=!!this.options.Lock;this.onStart=this.options.onStart;this.onMove=this.options.onMove;this.onStop=this.options.onStop;this._Handle=document.getElementById(this.options.Handle)||this.Drag;this._mxContainer=document.getElementById(this.options.mxContainer)||null;this.Drag.style.position="absolute";if(isIE&&!!this.options.Transparent){with(this._Handle.appendChild(document.createElement("div")).style){width=height="100%";backgroundColor="#fff";filter="alpha(opacity:0)";}}
this.Repair();addEventHandler(this._Handle,"mousedown",BindAsEventListener(this,this.Start));},SetOptions:function(options){this.options={Handle:"",Limit:false,mxLeft:0,mxRight:9999,mxTop:0,mxBottom:9999,mxContainer:"",LockX:false,LockY:false,Lock:false,Transparent:false,onStart:function(){},onMove:function(){},onStop:function(){}};Extend(this.options,options||{});},Start:function(oEvent){if(this.Lock){return;}
this.Repair();this._x=oEvent.clientX-this.Drag.offsetLeft;this._y=oEvent.clientY-this.Drag.offsetTop;this._marginLeft=parseInt(CurrentStyle(this.Drag).marginLeft)||0;this._marginTop=parseInt(CurrentStyle(this.Drag).marginTop)||0;addEventHandler(document,"mousemove",this._fM);addEventHandler(document,"mouseup",this._fS);if(isIE){addEventHandler(this._Handle,"losecapture",this._fS);this._Handle.setCapture();}else{addEventHandler(window,"blur",this._fS);oEvent.preventDefault();};this.onStart();},Repair:function(){if(this.Limit){this.mxRight=Math.max(this.mxRight,this.mxLeft+this.Drag.offsetWidth);this.mxBottom=Math.max(this.mxBottom,this.mxTop+this.Drag.offsetHeight);!this._mxContainer||CurrentStyle(this._mxContainer).position=="relative"||(this._mxContainer.style.position="relative");}},Move:function(oEvent){if(this.Lock){this.Stop();return;};window.getSelection?window.getSelection().removeAllRanges():document.selection.empty();var iLeft=oEvent.clientX-this._x,iTop=oEvent.clientY-this._y;if(this.Limit){var mxLeft=this.mxLeft,mxRight=this.mxRight,mxTop=this.mxTop,mxBottom=this.mxBottom;if(!!this._mxContainer){mxLeft=Math.max(mxLeft,0);mxTop=Math.max(mxTop,0);mxRight=Math.min(mxRight,this._mxContainer.clientWidth);mxBottom=Math.min(mxBottom,this._mxContainer.clientHeight);};iLeft=Math.max(Math.min(iLeft,mxRight-this.Drag.offsetWidth),mxLeft);iTop=Math.max(Math.min(iTop,mxBottom-this.Drag.offsetHeight),mxTop);}
if(!this.LockX){this.Drag.style.left=iLeft-this._marginLeft+"px";}
if(!this.LockY){this.Drag.style.top=iTop-this._marginTop+"px";}
this.onMove();},Stop:function(){removeEventHandler(document,"mousemove",this._fM);removeEventHandler(document,"mouseup",this._fS);if(isIE){removeEventHandler(this._Handle,"losecapture",this._fS);this._Handle.releaseCapture();}else{removeEventHandler(window,"blur",this._fS);};this.onStop();}};;function setHiddenCol(oTable,iCols)
{for(i=0;i<oTable.rows.length;i++)
{for(j=0;j<iCols.length;j++)
{oTable.rows[i].cells[iCols[j]].style.display="none";}}}
function setDiscoveredCol(oTable,iCols)
{try
{for(i=0;i<oTable.rows.length;i++)
{for(j=0;j<iCols.length;j++)
{oTable.rows[i].cells[iCols[j]].style.display="";}}}
catch(err)
{}}
function setHiddenRow()
{oTable=document.getElementById('Table1');for(i=0;i<oTable.rows.length;i++){if(oTable.rows[i].id=="hidd"){oTable.rows[i].style.display="none";}}}
function setDiscoveredRow()
{oTable=document.getElementById('Table1');for(i=0;i<oTable.rows.length;i++){if(oTable.rows[i].id=="hidd"){oTable.rows[i].style.display="";}}}
function jiaoji(arr1,arr2){if(arr1.length==0||arr2.length==0){return new Array();}else{return Array(arr1.concat(arr2).join(',').match(/\b(\d+)\b(?=.*?\b\1\b)/g));}}
function bingji(arr1,arr2){if(arr1.length==0&&arr2.length==0){return new Array();}else{return Array(arr1.concat(arr2).join(',').replace(/\b(\d+),(?=.*?\b\1\b)/g,''));}}
function stuYN(check_id)
{cols=document.getElementById(check_id).value;var Cols_arr=new Array();if(document.getElementById(check_id).checked==true){var arr_serise=new Array();var arr_disl=new Array();var arr_transtype=new Array();for(i=0;i<document.getElementsByTagName("input").length;i++){if(document.getElementsByTagName("input")[i].type=="checkbox"&&document.getElementsByTagName("input")[i].checked==true){if(document.getElementsByTagName("input")[i].id.split("_")[0]=="seriseCheckbox"){arr_serise=bingji(arr_serise,document.getElementsByTagName("input")[i].value.split(","));}else if(document.getElementsByTagName("input")[i].id.split("_")[0]=='dislCheckbox'){arr_disl=bingji(arr_disl,document.getElementsByTagName("input")[i].value.split(","));}else if(document.getElementsByTagName("input")[i].id.split("_")[0]=='transtypeCheckbox'){arr_transtype=bingji(arr_transtype,document.getElementsByTagName("input")[i].value.split(","));}}}
Cols_arr=String(jiaoji(jiaoji(arr_serise,arr_disl),arr_transtype)[0]).split(",");setDiscoveredCol(document.getElementById('Table1'),Cols_arr);}else{Cols_arr=cols.split(",");setHiddenCol(document.getElementById('Table1'),Cols_arr);}}
function stuYNP(check_id)
{var obj=$("#"+check_id);if(obj.val()!=""){base_arr=obj.val().split(",");var oMenu=$("#menu");var oTable=$("#Table1");if(obj.attr("checked")==true){var r=jQuery.jiaoji(obj);oTable.find("tr").each(function(i){if(r.length>0){$(this).find("td,th").each(function(j){for(z in r){if((r[z]-1)==j){$(this).show();}}})}else{$(this).find("td,th").show();}})}else{oTable.find("tr").each(function(){$(this).find("td,th").each(function(p){for(i in base_arr){if(base_arr[i]-1==p){$(this).hide();}}})})}}}
function stuYNP_m(check_id)
{var obj=$("#"+check_id);if(obj.val()!=""){base_arr=obj.val().split(",");var oMenu=$("#menu");var oTable=$("#Table1");if(obj.attr("checked")==true){var r=jQuery.jiaoji(obj);oTable.find("tr").each(function(i){if(r.length>0){$(this).find("td,th").each(function(j){for(z in r){if((r[z])==j){$(this).show();}}})}else{$(this).find("td,th").show();}})}else{oTable.find("tr").each(function(){$(this).find("td,th").each(function(p){for(i in base_arr){if(base_arr[i]==p){$(this).hide();}}})})}}}
jQuery.extend({jiaoji:function(obj){var tmpCache=new Array();var result=new Array();$(":checkbox").each(function(){if(obj.attr("id")!=$(this).attr("id")&&$(this).attr("checked")==false){tmpCache=tmpCache.concat($(this).val().split(","));}})
if(tmpCache.length>0){var arr=obj.val().split(",");for(i in arr){f=true;for(j in tmpCache){if(tmpCache[j]==arr[i]){f=false;continue;}}
if(true==f){result.push(arr[i]);}
tmpCache.push(arr[i]);}}
return result;}})


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
src="a4l_files/news_forall.js"></SCRIPT>

<SCRIPT type=text/javascript src="a4l_files/dw.js"></SCRIPT>

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
</BODY>
</HTML>
