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
  onclick="chg_checkbox('seriseCheckbox','1','0','一个子车系')" value=1,2,3,4,5,6 
  CHECKED type=checkbox>2011款爱唯欧三厢</LI></UL><EM class=b>排量：</EM> 
<UL class=x>
  <LI><INPUT id=dislCheckbox_0 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','2','0','一种发动机')" value=1,2,3,4 CHECKED 
  type=checkbox>1.4L</LI>
  <LI><INPUT id=dislCheckbox_1 class=t1126_teys 
  onclick="chg_checkbox('dislCheckbox','2','1','一种发动机')" value=5,6 CHECKED 
  type=checkbox>1.6L</LI></UL><EM class=c>变速箱：</EM> 
<UL class=y>
  <LI><INPUT id=transtypeCheckbox_0 class=t1126_teys 
  onclick="chg_checkbox('transtypeCheckbox','2','0','一种变速箱')" value=1,2,5 
  CHECKED type=checkbox>手动变速箱</LI>
  <LI><INPUT id=transtypeCheckbox_1 class=t1126_teys 
  onclick="chg_checkbox('transtypeCheckbox','2','1','一种变速箱')" value=3,4,6 
  CHECKED type=checkbox>自动变速箱</LI></UL></DIV>
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
            src="【爱唯欧三厢】爱唯欧三厢%20汽车配置_参数%20上海通用雪佛兰_爱卡汽车网_files/t1125arr_e.gif" 
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
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"></TH>
          <TH 
          style="PADDING-BOTTOM: 0px; BACKGROUND-COLOR: #fff; PADDING-LEFT: 0px; PADDING-RIGHT: 0px; HEIGHT: 6px; OVERFLOW: hidden; PADDING-TOP: 0px"></TH></TR>
        <TR id=base_1>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9335 scope=col><B href="#/m9335/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL MT </A><I id=base_1_img_9335></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9337 scope=col><B href="#/m9337/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE MT </A><I id=base_1_img_9337></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9336 scope=col><B href="#/m9336/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL AT </A><I id=base_1_img_9336></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9338 scope=col><B href="#/m9338/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE AT </A><I id=base_1_img_9338></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9339 scope=col><B href="#/m9339/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX MT </A><I id=base_1_img_9339></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9340 scope=col><B href="#/m9340/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX AT </A><I id=base_1_img_9340></I> </TH></TR>
        <TR class=disc>
          <TD id=min_price_9335>8.18万</TD>
          <TD id=min_price_9337>8.78万</TD>
          <TD id=min_price_9336>9.38万</TD>
          <TD id=min_price_9338>10.18万</TD>
          <TD id=min_price_9339>9.98万</TD>
          <TD id=min_price_9340>11.18万</TD></TR>
        <TR class=hidd>
          <TD id=bname_9335><B title=上海通用雪佛兰 
            href="#/price/b135/" 
            target=_blank>上海通用雪佛兰</A></TD>
          <TD id=bname_9337><B title=上海通用雪佛兰 
            href="#/price/b135/" 
            target=_blank>上海通用雪佛兰</A></TD>
          <TD id=bname_9336><B title=上海通用雪佛兰 
            href="#/price/b135/" 
            target=_blank>上海通用雪佛兰</A></TD>
          <TD id=bname_9338><B title=上海通用雪佛兰 
            href="#/price/b135/" 
            target=_blank>上海通用雪佛兰</A></TD>
          <TD id=bname_9339><B title=上海通用雪佛兰 
            href="#/price/b135/" 
            target=_blank>上海通用雪佛兰</A></TD>
          <TD id=bname_9340><B title=上海通用雪佛兰 
            href="#/price/b135/" 
            target=_blank>上海通用雪佛兰</A></TD></TR>
        <TR class=hidd>
          <TD id=type2_9335><B 
            href="#/car/0-0-0-0-0-0-1-0-0-0-0-0/">小型车</A></TD>
          <TD id=type2_9337><B 
            href="#/car/0-0-0-0-0-0-1-0-0-0-0-0/">小型车</A></TD>
          <TD id=type2_9336><B 
            href="#/car/0-0-0-0-0-0-1-0-0-0-0-0/">小型车</A></TD>
          <TD id=type2_9338><B 
            href="#/car/0-0-0-0-0-0-1-0-0-0-0-0/">小型车</A></TD>
          <TD id=type2_9339><B 
            href="#/car/0-0-0-0-0-0-1-0-0-0-0-0/">小型车</A></TD>
          <TD id=type2_9340><B 
            href="#/car/0-0-0-0-0-0-1-0-0-0-0-0/">小型车</A></TD></TR>
        <TR class=disc>
          <TD id=m_disl_9335>1.4L 76kW </TD>
          <TD id=m_disl_9337>1.4L 76kW </TD>
          <TD id=m_disl_9336>1.4L 76kW </TD>
          <TD id=m_disl_9338>1.4L 76kW </TD>
          <TD id=m_disl_9339>1.6L 89kW </TD>
          <TD id=m_disl_9340>1.6L 89kW </TD></TR>
        <TR class=disc>
          <TD id=m_transtype_9335>5挡手动</TD>
          <TD id=m_transtype_9337>5挡手动</TD>
          <TD id=m_transtype_9336>6挡自动</TD>
          <TD id=m_transtype_9338>6挡自动</TD>
          <TD id=m_transtype_9339>5挡手动</TD>
          <TD id=m_transtype_9340>6挡自动</TD></TR>
        <TR class=hidd>
          <TD id=m_length_width_height_9335><!---->4399×1735×1517 <!----></TD>
          <TD id=m_length_width_height_9337><!---->4399×1735×1517 <!----></TD>
          <TD id=m_length_width_height_9336><!---->4399×1735×1517 <!----></TD>
          <TD id=m_length_width_height_9338><!---->4399×1735×1517 <!----></TD>
          <TD id=m_length_width_height_9339><!---->4399×1735×1517 <!----></TD>
          <TD id=m_length_width_height_9340><!---->4399×1735×1517 
<!----></TD></TR>
        <TR class=hidd>
          <TD id=m_frame_9335>4门 5座 三厢轿车</TD>
          <TD id=m_frame_9337>4门 5座 三厢轿车</TD>
          <TD id=m_frame_9336>4门 5座 三厢轿车</TD>
          <TD id=m_frame_9338>4门 5座 三厢轿车</TD>
          <TD id=m_frame_9339>4门 5座 三厢轿车</TD>
          <TD id=m_frame_9340>4门 5座 三厢轿车</TD></TR>
        <TR class=hidd>
          <TD id=syear_9335>2011</TD>
          <TD id=syear_9337>2011</TD>
          <TD id=syear_9336>2011</TD>
          <TD id=syear_9338>2011</TD>
          <TD id=syear_9339>2011</TD>
          <TD id=syear_9340>2011</TD></TR>
        <TR class=disc>
          <TD id=m_mspeed_9335>176</TD>
          <TD id=m_mspeed_9337>176</TD>
          <TD id=m_mspeed_9336>168</TD>
          <TD id=m_mspeed_9338>168</TD>
          <TD id=m_mspeed_9339>178</TD>
          <TD id=m_mspeed_9340>178</TD></TR>
        <TR class=disc>
          <TD id=m_hatime_9335>12.3</TD>
          <TD id=m_hatime_9337>12.3</TD>
          <TD id=m_hatime_9336>12.8</TD>
          <TD id=m_hatime_9338>12.8</TD>
          <TD id=m_hatime_9339>11.9</TD>
          <TD id=m_hatime_9340>11.3</TD></TR>
        <TR class=disc>
          <TD id=m_comfuel_9335>6</TD>
          <TD id=m_comfuel_9337>6</TD>
          <TD id=m_comfuel_9336>7.1</TD>
          <TD id=m_comfuel_9338>7.1</TD>
          <TD id=m_comfuel_9339>6.8</TD>
          <TD id=m_comfuel_9340>7.2</TD></TR>
        <TR class=disc>
          <TD id=m_lkmfuel_9335>5.7</TD>
          <TD id=m_lkmfuel_9337>5.7</TD>
          <TD id=m_lkmfuel_9336>6.1</TD>
          <TD id=m_lkmfuel_9338>6.1</TD>
          <TD id=m_lkmfuel_9339>5.9</TD>
          <TD id=m_lkmfuel_9340>6.1</TD></TR>
        <TR class=hidd>
          <TD id=m_hkmfuel_9335>90</TD>
          <TD id=m_hkmfuel_9337>90</TD>
          <TD id=m_hkmfuel_9336>90</TD>
          <TD id=m_hkmfuel_9338>90</TD>
          <TD id=m_hkmfuel_9339>90</TD>
          <TD id=m_hkmfuel_9340>90</TD></TR>
        <TR class=hidd>
          <TD id=m_ypolicy_9335>2年6万公里 </TD>
          <TD id=m_ypolicy_9337>2年6万公里 </TD>
          <TD id=m_ypolicy_9336>2年6万公里 </TD>
          <TD id=m_ypolicy_9338>2年6万公里 </TD>
          <TD id=m_ypolicy_9339>2年6万公里 </TD>
          <TD id=m_ypolicy_9340>2年6万公里 </TD></TR>
        <TR id=base_2>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9335 scope=col><B href="#/m9335/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL MT</A> <I id=base_2_img_9335></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9337 scope=col><B href="#/m9337/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE MT</A> <I id=base_2_img_9337></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9336 scope=col><B href="#/m9336/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL AT </A><I id=base_2_img_9336></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9338 scope=col><B href="#/m9338/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE AT</A> <I id=base_2_img_9338></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9339 scope=col><B href="#/m9339/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX MT</A> <I id=base_2_img_9339></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9340 scope=col><B href="#/m9340/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX AT</A> <I id=base_2_img_9340></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_length_9335>4399</TD>
          <TD id=m_length_9337>4399</TD>
          <TD id=m_length_9336>4399</TD>
          <TD id=m_length_9338>4399</TD>
          <TD id=m_length_9339>4399</TD>
          <TD id=m_length_9340>4399</TD></TR>
        <TR class=hidd>
          <TD id=m_width_9335>1735</TD>
          <TD id=m_width_9337>1735</TD>
          <TD id=m_width_9336>1735</TD>
          <TD id=m_width_9338>1735</TD>
          <TD id=m_width_9339>1735</TD>
          <TD id=m_width_9340>1735</TD></TR>
        <TR class=hidd>
          <TD id=m_height_9335>1517</TD>
          <TD id=m_height_9337>1517</TD>
          <TD id=m_height_9336>1517</TD>
          <TD id=m_height_9338>1517</TD>
          <TD id=m_height_9339>1517</TD>
          <TD id=m_height_9340>1517</TD></TR>
        <TR class=hidd>
          <TD id=m_wheelbase_9335>2525</TD>
          <TD id=m_wheelbase_9337>2525</TD>
          <TD id=m_wheelbase_9336>2525</TD>
          <TD id=m_wheelbase_9338>2525</TD>
          <TD id=m_wheelbase_9339>2525</TD>
          <TD id=m_wheelbase_9340>2525</TD></TR>
        <TR class=disc>
          <TD id=m_weight_9335>1190</TD>
          <TD id=m_weight_9337>1190</TD>
          <TD id=m_weight_9336>1220</TD>
          <TD id=m_weight_9338>1220</TD>
          <TD id=m_weight_9339>1215</TD>
          <TD id=m_weight_9340>1230</TD></TR>
        <TR class=hidd>
          <TD id=m_clearance_9335>- </TD>
          <TD id=m_clearance_9337>- </TD>
          <TD id=m_clearance_9336>- </TD>
          <TD id=m_clearance_9338>- </TD>
          <TD id=m_clearance_9339>- </TD>
          <TD id=m_clearance_9340>- </TD></TR>
        <TR class=hidd>
          <TD id=m_frame2_9335>三厢轿车</TD>
          <TD id=m_frame2_9337>三厢轿车</TD>
          <TD id=m_frame2_9336>三厢轿车</TD>
          <TD id=m_frame2_9338>三厢轿车</TD>
          <TD id=m_frame2_9339>三厢轿车</TD>
          <TD id=m_frame2_9340>三厢轿车</TD></TR>
        <TR class=hidd>
          <TD id=m_door_9335>4</TD>
          <TD id=m_door_9337>4</TD>
          <TD id=m_door_9336>4</TD>
          <TD id=m_door_9338>4</TD>
          <TD id=m_door_9339>4</TD>
          <TD id=m_door_9340>4</TD></TR>
        <TR class=hidd>
          <TD id=m_seat_9335>5</TD>
          <TD id=m_seat_9337>5</TD>
          <TD id=m_seat_9336>5</TD>
          <TD id=m_seat_9338>5</TD>
          <TD id=m_seat_9339>5</TD>
          <TD id=m_seat_9340>5</TD></TR>
        <TR class=hidd>
          <TD id=m_oilbox_9335>46.00</TD>
          <TD id=m_oilbox_9337>46.00</TD>
          <TD id=m_oilbox_9336>46.00</TD>
          <TD id=m_oilbox_9338>46.00</TD>
          <TD id=m_oilbox_9339>46.00</TD>
          <TD id=m_oilbox_9340>46.00</TD></TR>
        <TR class=hidd>
          <TD id=m_trunk_9335>458</TD>
          <TD id=m_trunk_9337>458</TD>
          <TD id=m_trunk_9336>458</TD>
          <TD id=m_trunk_9338>458</TD>
          <TD id=m_trunk_9339>458</TD>
          <TD id=m_trunk_9340>458</TD></TR>
        <TR class=hidd>
          <TD id=m_mtrunk_9335>- </TD>
          <TD id=m_mtrunk_9337>- </TD>
          <TD id=m_mtrunk_9336>- </TD>
          <TD id=m_mtrunk_9338>- </TD>
          <TD id=m_mtrunk_9339>- </TD>
          <TD id=m_mtrunk_9340>- </TD></TR>
        <TR id=base_3>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9335 scope=col><B href="#/m9335/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL MT </A><I id=base_3_img_9335></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9337 scope=col><B href="#/m9337/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE MT </A><I id=base_3_img_9337></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9336 scope=col><B href="#/m9336/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL AT </A><I id=base_3_img_9336></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9338 scope=col><B href="#/m9338/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE AT </A><I id=base_3_img_9338></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9339 scope=col><B href="#/m9339/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX MT </A><I id=base_3_img_9339></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9340 scope=col><B href="#/m9340/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX AT </A><I id=base_3_img_9340></I> </TH></TR>
        <TR class=disc>
          <TD id=m_disl2_9335>1.4</TD>
          <TD id=m_disl2_9337>1.4</TD>
          <TD id=m_disl2_9336>1.4</TD>
          <TD id=m_disl2_9338>1.4</TD>
          <TD id=m_disl2_9339>1.6</TD>
          <TD id=m_disl2_9340>1.6</TD></TR>
        <TR class=hidd>
          <TD id=m_working_9335>自然吸气</TD>
          <TD id=m_working_9337>自然吸气</TD>
          <TD id=m_working_9336>自然吸气</TD>
          <TD id=m_working_9338>自然吸气</TD>
          <TD id=m_working_9339>自然吸气</TD>
          <TD id=m_working_9340>自然吸气</TD></TR>
        <TR class=disc>
          <TD id=m_mpower_9335>76</TD>
          <TD id=m_mpower_9337>76</TD>
          <TD id=m_mpower_9336>76</TD>
          <TD id=m_mpower_9338>76</TD>
          <TD id=m_mpower_9339>89</TD>
          <TD id=m_mpower_9340>89</TD></TR>
        <TR class=hidd>
          <TD id=m_mpowersp_9335>6000</TD>
          <TD id=m_mpowersp_9337>6000</TD>
          <TD id=m_mpowersp_9336>6000</TD>
          <TD id=m_mpowersp_9338>6000</TD>
          <TD id=m_mpowersp_9339>6000</TD>
          <TD id=m_mpowersp_9340>6000</TD></TR>
        <TR class=disc>
          <TD id=m_mtorque_9335>131</TD>
          <TD id=m_mtorque_9337>131</TD>
          <TD id=m_mtorque_9336>131</TD>
          <TD id=m_mtorque_9338>131</TD>
          <TD id=m_mtorque_9339>155</TD>
          <TD id=m_mtorque_9340>155</TD></TR>
        <TR class=disc>
          <TD id=m_mtorsp_9335>4200</TD>
          <TD id=m_mtorsp_9337>4200</TD>
          <TD id=m_mtorsp_9336>4200</TD>
          <TD id=m_mtorsp_9338>4200</TD>
          <TD id=m_mtorsp_9339>4000</TD>
          <TD id=m_mtorsp_9340>4000</TD></TR>
        <TR class=hidd>
          <TD id=m_fuel_9335>汽油</TD>
          <TD id=m_fuel_9337>汽油</TD>
          <TD id=m_fuel_9336>汽油</TD>
          <TD id=m_fuel_9338>汽油</TD>
          <TD id=m_fuel_9339>汽油</TD>
          <TD id=m_fuel_9340>汽油</TD></TR>
        <TR class=hidd>
          <TD id=m_fuelno_9335>93</TD>
          <TD id=m_fuelno_9337>93</TD>
          <TD id=m_fuelno_9336>93</TD>
          <TD id=m_fuelno_9338>93</TD>
          <TD id=m_fuelno_9339>93</TD>
          <TD id=m_fuelno_9340>93</TD></TR>
        <TR class=hidd>
          <TD id=m_envstand_9335>国IV </TD>
          <TD id=m_envstand_9337>国IV </TD>
          <TD id=m_envstand_9336>国IV </TD>
          <TD id=m_envstand_9338>国IV </TD>
          <TD id=m_envstand_9339>国IV </TD>
          <TD id=m_envstand_9340>国IV </TD></TR>
        <TR id=base_4>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9335 scope=col><B href="#/m9335/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL MT </A><I id=base_4_img_9335></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9337 scope=col><B href="#/m9337/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE MT </A><I id=base_4_img_9337></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9336 scope=col><B href="#/m9336/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL AT </A><I id=base_4_img_9336></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9338 scope=col><B href="#/m9338/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE AT </A><I id=base_4_img_9338></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9339 scope=col><B href="#/m9339/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX MT </A><I id=base_4_img_9339></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9340 scope=col><B href="#/m9340/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX AT </A><I id=base_4_img_9340></I> </TH></TR>
        <TR class=disc>
          <TD id=m_speed_9335>5</TD>
          <TD id=m_speed_9337>5</TD>
          <TD id=m_speed_9336>6</TD>
          <TD id=m_speed_9338>6</TD>
          <TD id=m_speed_9339>5</TD>
          <TD id=m_speed_9340>6</TD></TR>
        <TR class=disc>
          <TD id=m_transtype2_9335>MT</TD>
          <TD id=m_transtype2_9337>MT</TD>
          <TD id=m_transtype2_9336>AT</TD>
          <TD id=m_transtype2_9338>AT</TD>
          <TD id=m_transtype2_9339>MT</TD>
          <TD id=m_transtype2_9340>AT</TD></TR>
        <TR id=base_5>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9335 scope=col><B href="#/m9335/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL MT </A><I id=base_5_img_9335></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9337 scope=col><B href="#/m9337/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE MT </A><I id=base_5_img_9337></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9336 scope=col><B href="#/m9336/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL AT </A><I id=base_5_img_9336></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9338 scope=col><B href="#/m9338/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE AT </A><I id=base_5_img_9338></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9339 scope=col><B href="#/m9339/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX MT </A><I id=base_5_img_9339></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9340 scope=col><B href="#/m9340/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX AT </A><I id=base_5_img_9340></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_drivetype_9335>前置前驱</TD>
          <TD id=m_drivetype_9337>前置前驱</TD>
          <TD id=m_drivetype_9336>前置前驱</TD>
          <TD id=m_drivetype_9338>前置前驱</TD>
          <TD id=m_drivetype_9339>前置前驱</TD>
          <TD id=m_drivetype_9340>前置前驱</TD></TR>
        <TR class=hidd height=60>
          <TD id=m_fsustype_text_9335>麦弗逊</TD>
          <TD id=m_fsustype_text_9337>麦弗逊</TD>
          <TD id=m_fsustype_text_9336>麦弗逊</TD>
          <TD id=m_fsustype_text_9338>麦弗逊</TD>
          <TD id=m_fsustype_text_9339>麦弗逊</TD>
          <TD id=m_fsustype_text_9340>麦弗逊</TD></TR>
        <TR class=hidd height=60>
          <TD id=m_bsustype_text_9335>扭力梁</TD>
          <TD id=m_bsustype_text_9337>扭力梁</TD>
          <TD id=m_bsustype_text_9336>扭力梁</TD>
          <TD id=m_bsustype_text_9338>扭力梁</TD>
          <TD id=m_bsustype_text_9339>扭力梁</TD>
          <TD id=m_bsustype_text_9340>扭力梁</TD></TR>
        <TR id=base_6>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9335 scope=col><B href="#/m9335/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL MT </A><I id=base_6_img_9335></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9337 scope=col><B href="#/m9337/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE MT </A><I id=base_6_img_9337></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9336 scope=col><B href="#/m9336/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL AT </A><I id=base_6_img_9336></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9338 scope=col><B href="#/m9338/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE AT </A><I id=base_6_img_9338></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9339 scope=col><B href="#/m9339/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX MT </A><I id=base_6_img_9339></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9340 scope=col><B href="#/m9340/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX AT </A><I id=base_6_img_9340></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_fbraketype_9335>通风盘式</TD>
          <TD id=m_fbraketype_9337>通风盘式</TD>
          <TD id=m_fbraketype_9336>通风盘式</TD>
          <TD id=m_fbraketype_9338>通风盘式</TD>
          <TD id=m_fbraketype_9339>通风盘式</TD>
          <TD id=m_fbraketype_9340>通风盘式</TD></TR>
        <TR class=hidd>
          <TD id=m_bbraketype_9335>鼓式</TD>
          <TD id=m_bbraketype_9337>鼓式</TD>
          <TD id=m_bbraketype_9336>鼓式</TD>
          <TD id=m_bbraketype_9338>鼓式</TD>
          <TD id=m_bbraketype_9339>鼓式</TD>
          <TD id=m_bbraketype_9340>鼓式</TD></TR>
        <TR class=disc>
          <TD id=m_ftiresize_9335>195/65R15</TD>
          <TD id=m_ftiresize_9337>195/65R15</TD>
          <TD id=m_ftiresize_9336>195/65R15</TD>
          <TD id=m_ftiresize_9338>195/65R15</TD>
          <TD id=m_ftiresize_9339>205/55R16</TD>
          <TD id=m_ftiresize_9340>205/55R16</TD></TR>
        <TR class=disc>
          <TD id=m_btiresize_9335>195/65R15</TD>
          <TD id=m_btiresize_9337>195/65R15</TD>
          <TD id=m_btiresize_9336>195/65R15</TD>
          <TD id=m_btiresize_9338>195/65R15</TD>
          <TD id=m_btiresize_9339>205/55R16</TD>
          <TD id=m_btiresize_9340>205/55R16</TD></TR>
        <TR class=disc>
          <TD id=m_sparetire_9335>无 </TD>
          <TD id=m_sparetire_9337>非全尺寸</TD>
          <TD id=m_sparetire_9336>无 </TD>
          <TD id=m_sparetire_9338>非全尺寸</TD>
          <TD id=m_sparetire_9339>非全尺寸</TD>
          <TD id=m_sparetire_9340>非全尺寸</TD></TR>
        <TR id=base_7>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9335 scope=col><B href="#/m9335/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL MT </A><I id=base_7_img_9335></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9337 scope=col><B href="#/m9337/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE MT </A><I id=base_7_img_9337></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9336 scope=col><B href="#/m9336/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL AT </A><I id=base_7_img_9336></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9338 scope=col><B href="#/m9338/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE AT </A><I id=base_7_img_9338></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9339 scope=col><B href="#/m9339/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX MT </A><I id=base_7_img_9339></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9340 scope=col><B href="#/m9340/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX AT </A><I id=base_7_img_9340></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isdairbag_9335>●</TD>
          <TD id=m_isdairbag_9337>●</TD>
          <TD id=m_isdairbag_9336>●</TD>
          <TD id=m_isdairbag_9338>●</TD>
          <TD id=m_isdairbag_9339>●</TD>
          <TD id=m_isdairbag_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isadairbag_9335>●</TD>
          <TD id=m_isadairbag_9337>●</TD>
          <TD id=m_isadairbag_9336>●</TD>
          <TD id=m_isadairbag_9338>●</TD>
          <TD id=m_isadairbag_9339>●</TD>
          <TD id=m_isadairbag_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isfhairbag_9335>-</TD>
          <TD id=m_isfhairbag_9337>-</TD>
          <TD id=m_isfhairbag_9336>-</TD>
          <TD id=m_isfhairbag_9338>-</TD>
          <TD id=m_isfhairbag_9339>-</TD>
          <TD id=m_isfhairbag_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isbhairbag_9335>-</TD>
          <TD id=m_isbhairbag_9337>-</TD>
          <TD id=m_isbhairbag_9336>-</TD>
          <TD id=m_isbhairbag_9338>-</TD>
          <TD id=m_isbhairbag_9339>-</TD>
          <TD id=m_isbhairbag_9340>-</TD></TR>
        <TR class=disc>
          <TD id=m_isfsairbag_9335>-</TD>
          <TD id=m_isfsairbag_9337>●</TD>
          <TD id=m_isfsairbag_9336>●</TD>
          <TD id=m_isfsairbag_9338>●</TD>
          <TD id=m_isfsairbag_9339>●</TD>
          <TD id=m_isfsairbag_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbsairbag_9335>-</TD>
          <TD id=m_isbsairbag_9337>-</TD>
          <TD id=m_isbsairbag_9336>-</TD>
          <TD id=m_isbsairbag_9338>-</TD>
          <TD id=m_isbsairbag_9339>-</TD>
          <TD id=m_isbsairbag_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_iskairbag_9335>-</TD>
          <TD id=m_iskairbag_9337>-</TD>
          <TD id=m_iskairbag_9336>-</TD>
          <TD id=m_iskairbag_9338>-</TD>
          <TD id=m_iskairbag_9339>-</TD>
          <TD id=m_iskairbag_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatbeltti_9335>●</TD>
          <TD id=m_isseatbeltti_9337>●</TD>
          <TD id=m_isseatbeltti_9336>●</TD>
          <TD id=m_isseatbeltti_9338>●</TD>
          <TD id=m_isseatbeltti_9339>●</TD>
          <TD id=m_isseatbeltti_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iseanti_9335>●</TD>
          <TD id=m_iseanti_9337>●</TD>
          <TD id=m_iseanti_9336>●</TD>
          <TD id=m_iseanti_9338>●</TD>
          <TD id=m_iseanti_9339>●</TD>
          <TD id=m_iseanti_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscclock_9335>●</TD>
          <TD id=m_iscclock_9337>●</TD>
          <TD id=m_iscclock_9336>●</TD>
          <TD id=m_iscclock_9338>●</TD>
          <TD id=m_iscclock_9339>●</TD>
          <TD id=m_iscclock_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isrekey_9335>●</TD>
          <TD id=m_isrekey_9337>●</TD>
          <TD id=m_isrekey_9336>●</TD>
          <TD id=m_isrekey_9338>●</TD>
          <TD id=m_isrekey_9339>●</TD>
          <TD id=m_isrekey_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isnokeysys_9335>-</TD>
          <TD id=m_isnokeysys_9337>-</TD>
          <TD id=m_isnokeysys_9336>-</TD>
          <TD id=m_isnokeysys_9338>-</TD>
          <TD id=m_isnokeysys_9339>-</TD>
          <TD id=m_isnokeysys_9340>-</TD></TR>
        <TR id=base_8>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9335 scope=col><B href="#/m9335/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL MT </A><I id=base_8_img_9335></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9337 scope=col><B href="#/m9337/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE MT </A><I id=base_8_img_9337></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9336 scope=col><B href="#/m9336/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL AT </A><I id=base_8_img_9336></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9338 scope=col><B href="#/m9338/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE AT </A><I id=base_8_img_9338></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9339 scope=col><B href="#/m9339/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX MT </A><I id=base_8_img_9339></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9340 scope=col><B href="#/m9340/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX AT </A><I id=base_8_img_9340></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isabs_9335>●</TD>
          <TD id=m_isabs_9337>●</TD>
          <TD id=m_isabs_9336>●</TD>
          <TD id=m_isabs_9338>●</TD>
          <TD id=m_isabs_9339>●</TD>
          <TD id=m_isabs_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isesp_9335>-</TD>
          <TD id=m_isesp_9337>-</TD>
          <TD id=m_isesp_9336>-</TD>
          <TD id=m_isesp_9338>-</TD>
          <TD id=m_isesp_9339>-</TD>
          <TD id=m_isesp_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isadsus_9335>-</TD>
          <TD id=m_isadsus_9337>-</TD>
          <TD id=m_isadsus_9336>-</TD>
          <TD id=m_isadsus_9338>-</TD>
          <TD id=m_isadsus_9339>-</TD>
          <TD id=m_isadsus_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_istpmonitor_9335>-</TD>
          <TD id=m_istpmonitor_9337>-</TD>
          <TD id=m_istpmonitor_9336>-</TD>
          <TD id=m_istpmonitor_9338>-</TD>
          <TD id=m_istpmonitor_9339>-</TD>
          <TD id=m_istpmonitor_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_istpruning_9335>-</TD>
          <TD id=m_istpruning_9337>-</TD>
          <TD id=m_istpruning_9336>-</TD>
          <TD id=m_istpruning_9338>-</TD>
          <TD id=m_istpruning_9339>-</TD>
          <TD id=m_istpruning_9340>-</TD></TR>
        <TR class=disc>
          <TD id=m_isfsteering_9335>●</TD>
          <TD id=m_isfsteering_9337>●</TD>
          <TD id=m_isfsteering_9336>●</TD>
          <TD id=m_isfsteering_9338>●</TD>
          <TD id=m_isfsteering_9339>●</TD>
          <TD id=m_isfsteering_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_issteesys_9335>-</TD>
          <TD id=m_issteesys_9337>-</TD>
          <TD id=m_issteesys_9336>-</TD>
          <TD id=m_issteesys_9338>-</TD>
          <TD id=m_issteesys_9339>-</TD>
          <TD id=m_issteesys_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isuphillassist_9335>-</TD>
          <TD id=m_isuphillassist_9337>-</TD>
          <TD id=m_isuphillassist_9336>-</TD>
          <TD id=m_isuphillassist_9338>-</TD>
          <TD id=m_isuphillassist_9339>-</TD>
          <TD id=m_isuphillassist_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isandstitch_9335>-</TD>
          <TD id=m_isandstitch_9337>-</TD>
          <TD id=m_isandstitch_9336>-</TD>
          <TD id=m_isandstitch_9338>-</TD>
          <TD id=m_isandstitch_9339>-</TD>
          <TD id=m_isandstitch_9340>-</TD></TR>
        <TR id=base_9>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9335 scope=col><B href="#/m9335/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL MT </A><I id=base_9_img_9335></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9337 scope=col><B href="#/m9337/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE MT </A><I id=base_9_img_9337></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9336 scope=col><B href="#/m9336/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL AT </A><I id=base_9_img_9336></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9338 scope=col><B href="#/m9338/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE AT </A><I id=base_9_img_9338></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9339 scope=col><B href="#/m9339/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX MT </A><I id=base_9_img_9339></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9340 scope=col><B href="#/m9340/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX AT </A><I id=base_9_img_9340></I> </TH></TR>
        <TR class=disc>
          <TD id=m_iswindow_9335>-</TD>
          <TD id=m_iswindow_9337>●</TD>
          <TD id=m_iswindow_9336>●</TD>
          <TD id=m_iswindow_9338>●</TD>
          <TD id=m_iswindow_9339>●</TD>
          <TD id=m_iswindow_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isarwindow_9335>-</TD>
          <TD id=m_isarwindow_9337>-</TD>
          <TD id=m_isarwindow_9336>-</TD>
          <TD id=m_isarwindow_9338>-</TD>
          <TD id=m_isarwindow_9339>-</TD>
          <TD id=m_isarwindow_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isspround_9335>○</TD>
          <TD id=m_isspround_9337>○</TD>
          <TD id=m_isspround_9336>○</TD>
          <TD id=m_isspround_9338>○</TD>
          <TD id=m_isspround_9339>○</TD>
          <TD id=m_isspround_9340>○</TD></TR>
        <TR class=disc>
          <TD id=m_isaluhub_9335>-</TD>
          <TD id=m_isaluhub_9337>●</TD>
          <TD id=m_isaluhub_9336>-</TD>
          <TD id=m_isaluhub_9338>●</TD>
          <TD id=m_isaluhub_9339>●</TD>
          <TD id=m_isaluhub_9340>●</TD></TR>
        <TR id=base_10>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9335 scope=col><B href="#/m9335/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL MT </A><I id=base_10_img_9335></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9337 scope=col><B href="#/m9337/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE MT </A><I id=base_10_img_9337></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9336 scope=col><B href="#/m9336/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL AT </A><I id=base_10_img_9336></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9338 scope=col><B href="#/m9338/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE AT </A><I id=base_10_img_9338></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9339 scope=col><B href="#/m9339/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX MT </A><I id=base_10_img_9339></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9340 scope=col><B href="#/m9340/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX AT </A><I id=base_10_img_9340></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isleasw_9335>-</TD>
          <TD id=m_isleasw_9337>-</TD>
          <TD id=m_isleasw_9336>-</TD>
          <TD id=m_isleasw_9338>-</TD>
          <TD id=m_isleasw_9339>●</TD>
          <TD id=m_isleasw_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswud_9335>●</TD>
          <TD id=m_isswud_9337>●</TD>
          <TD id=m_isswud_9336>●</TD>
          <TD id=m_isswud_9338>●</TD>
          <TD id=m_isswud_9339>●</TD>
          <TD id=m_isswud_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswfb_9335>●</TD>
          <TD id=m_isswfb_9337>●</TD>
          <TD id=m_isswfb_9336>●</TD>
          <TD id=m_isswfb_9338>●</TD>
          <TD id=m_isswfb_9339>●</TD>
          <TD id=m_isswfb_9340>●</TD></TR>
        <TR class=disc>
          <TD id=m_ismultisw_9335>-</TD>
          <TD id=m_ismultisw_9337>●</TD>
          <TD id=m_ismultisw_9336>-</TD>
          <TD id=m_ismultisw_9338>●</TD>
          <TD id=m_ismultisw_9339>●</TD>
          <TD id=m_ismultisw_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isswshift_9335>-</TD>
          <TD id=m_isswshift_9337>-</TD>
          <TD id=m_isswshift_9336>-</TD>
          <TD id=m_isswshift_9338>-</TD>
          <TD id=m_isswshift_9339>-</TD>
          <TD id=m_isswshift_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isascd_9335>-</TD>
          <TD id=m_isascd_9337>-</TD>
          <TD id=m_isascd_9336>-</TD>
          <TD id=m_isascd_9338>-</TD>
          <TD id=m_isascd_9339>-</TD>
          <TD id=m_isascd_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isassibc_9335>-</TD>
          <TD id=m_isassibc_9337>-</TD>
          <TD id=m_isassibc_9336>-</TD>
          <TD id=m_isassibc_9338>-</TD>
          <TD id=m_isassibc_9339>-</TD>
          <TD id=m_isassibc_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isparkvideo_9335>-</TD>
          <TD id=m_isparkvideo_9337>-</TD>
          <TD id=m_isparkvideo_9336>-</TD>
          <TD id=m_isparkvideo_9338>-</TD>
          <TD id=m_isparkvideo_9339>-</TD>
          <TD id=m_isparkvideo_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ispark_9335>-</TD>
          <TD id=m_ispark_9337>-</TD>
          <TD id=m_ispark_9336>-</TD>
          <TD id=m_ispark_9338>-</TD>
          <TD id=m_ispark_9339>-</TD>
          <TD id=m_ispark_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ishud_9335>-</TD>
          <TD id=m_ishud_9337>-</TD>
          <TD id=m_ishud_9336>-</TD>
          <TD id=m_ishud_9338>-</TD>
          <TD id=m_ishud_9339>-</TD>
          <TD id=m_ishud_9340>-</TD></TR>
        <TR id=base_11>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9335 scope=col><B href="#/m9335/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL MT </A><I id=base_11_img_9335></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9337 scope=col><B href="#/m9337/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE MT </A><I id=base_11_img_9337></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9336 scope=col><B href="#/m9336/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL AT </A><I id=base_11_img_9336></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9338 scope=col><B href="#/m9338/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE AT </A><I id=base_11_img_9338></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9339 scope=col><B href="#/m9339/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX MT </A><I id=base_11_img_9339></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9340 scope=col><B href="#/m9340/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX AT </A><I id=base_11_img_9340></I> </TH></TR>
        <TR class=disc>
          <TD id=m_isleaseat_9335>-</TD>
          <TD id=m_isleaseat_9337>-</TD>
          <TD id=m_isleaseat_9336>-</TD>
          <TD id=m_isleaseat_9338>-</TD>
          <TD id=m_isleaseat_9339>●</TD>
          <TD id=m_isleaseat_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatadj_9335>●</TD>
          <TD id=m_isseatadj_9337>●</TD>
          <TD id=m_isseatadj_9336>●</TD>
          <TD id=m_isseatadj_9338>●</TD>
          <TD id=m_isseatadj_9339>●</TD>
          <TD id=m_isseatadj_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iswaistadj_9335>-</TD>
          <TD id=m_iswaistadj_9337>-</TD>
          <TD id=m_iswaistadj_9336>-</TD>
          <TD id=m_iswaistadj_9338>-</TD>
          <TD id=m_iswaistadj_9339>-</TD>
          <TD id=m_iswaistadj_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isfseatadj_9335>-</TD>
          <TD id=m_isfseatadj_9337>-</TD>
          <TD id=m_isfseatadj_9336>-</TD>
          <TD id=m_isfseatadj_9338>-</TD>
          <TD id=m_isfseatadj_9339>-</TD>
          <TD id=m_isfseatadj_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_iseseatmem_9335>-</TD>
          <TD id=m_iseseatmem_9337>-</TD>
          <TD id=m_iseseatmem_9336>-</TD>
          <TD id=m_iseseatmem_9338>-</TD>
          <TD id=m_iseseatmem_9339>-</TD>
          <TD id=m_iseseatmem_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isseathot_9335>-</TD>
          <TD id=m_isseathot_9337>-</TD>
          <TD id=m_isseathot_9336>-</TD>
          <TD id=m_isseathot_9338>-</TD>
          <TD id=m_isseathot_9339>-</TD>
          <TD id=m_isseathot_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isseatknead_9335>-</TD>
          <TD id=m_isseatknead_9337>-</TD>
          <TD id=m_isseatknead_9336>-</TD>
          <TD id=m_isseatknead_9338>-</TD>
          <TD id=m_isseatknead_9339>-</TD>
          <TD id=m_isseatknead_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isbseatlay_9335>-</TD>
          <TD id=m_isbseatlay_9337>-</TD>
          <TD id=m_isbseatlay_9336>-</TD>
          <TD id=m_isbseatlay_9338>-</TD>
          <TD id=m_isbseatlay_9339>-</TD>
          <TD id=m_isbseatlay_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isbseatplay_9335>●</TD>
          <TD id=m_isbseatplay_9337>●</TD>
          <TD id=m_isbseatplay_9336>●</TD>
          <TD id=m_isbseatplay_9338>●</TD>
          <TD id=m_isbseatplay_9339>●</TD>
          <TD id=m_isbseatplay_9340>●</TD></TR>
        <TR id=base_12>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9335 scope=col><B href="#/m9335/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL MT </A><I id=base_12_img_9335></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9337 scope=col><B href="#/m9337/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE MT </A><I id=base_12_img_9337></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9336 scope=col><B href="#/m9336/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL AT </A><I id=base_12_img_9336></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9338 scope=col><B href="#/m9338/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE AT </A><I id=base_12_img_9338></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9339 scope=col><B href="#/m9339/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX MT </A><I id=base_12_img_9339></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9340 scope=col><B href="#/m9340/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX AT </A><I id=base_12_img_9340></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isgps_9335>-</TD>
          <TD id=m_isgps_9337>-</TD>
          <TD id=m_isgps_9336>-</TD>
          <TD id=m_isgps_9338>-</TD>
          <TD id=m_isgps_9339>-</TD>
          <TD id=m_isgps_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isbluetooth_9335>-</TD>
          <TD id=m_isbluetooth_9337>-</TD>
          <TD id=m_isbluetooth_9336>-</TD>
          <TD id=m_isbluetooth_9338>-</TD>
          <TD id=m_isbluetooth_9339>-</TD>
          <TD id=m_isbluetooth_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_istv_9335>-</TD>
          <TD id=m_istv_9337>-</TD>
          <TD id=m_istv_9336>-</TD>
          <TD id=m_istv_9338>-</TD>
          <TD id=m_istv_9339>-</TD>
          <TD id=m_istv_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_iscclcd_9335>-</TD>
          <TD id=m_iscclcd_9337>-</TD>
          <TD id=m_iscclcd_9336>-</TD>
          <TD id=m_iscclcd_9338>-</TD>
          <TD id=m_iscclcd_9339>-</TD>
          <TD id=m_iscclcd_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isblcd_9335>-</TD>
          <TD id=m_isblcd_9337>-</TD>
          <TD id=m_isblcd_9336>-</TD>
          <TD id=m_isblcd_9338>-</TD>
          <TD id=m_isblcd_9339>-</TD>
          <TD id=m_isblcd_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ismp3_9335>●</TD>
          <TD id=m_ismp3_9337>●</TD>
          <TD id=m_ismp3_9336>●</TD>
          <TD id=m_ismp3_9338>●</TD>
          <TD id=m_ismp3_9339>●</TD>
          <TD id=m_ismp3_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscd_9335>●</TD>
          <TD id=m_iscd_9337>●</TD>
          <TD id=m_iscd_9336>●</TD>
          <TD id=m_iscd_9338>●</TD>
          <TD id=m_iscd_9339>●</TD>
          <TD id=m_iscd_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_iscd_9335>1 </TD>
          <TD id=m_iscd_9337>1 </TD>
          <TD id=m_iscd_9336>1 </TD>
          <TD id=m_iscd_9338>1 </TD>
          <TD id=m_iscd_9339>1 </TD>
          <TD id=m_iscd_9340>1 </TD></TR>
        <TR class=hidd>
          <TD id=9335>-</TD>
          <TD id=9337>-</TD>
          <TD id=9336>-</TD>
          <TD id=9338>-</TD>
          <TD id=9339>-</TD>
          <TD id=9340>-</TD></TR>
        <TR class=hidd>
          <TD id=9335>- </TD>
          <TD id=9337>- </TD>
          <TD id=9336>- </TD>
          <TD id=9338>- </TD>
          <TD id=9339>- </TD>
          <TD id=9340>- </TD></TR>
        <TR class=hidd>
          <TD id=m_is2audio_9335>-</TD>
          <TD id=m_is2audio_9337>-</TD>
          <TD id=m_is2audio_9336>-</TD>
          <TD id=m_is2audio_9338>-</TD>
          <TD id=m_is2audio_9339>-</TD>
          <TD id=m_is2audio_9340>-</TD></TR>
        <TR class=disc>
          <TD id=m_is4audio_9335>●</TD>
          <TD id=m_is4audio_9337>●</TD>
          <TD id=m_is4audio_9336>●</TD>
          <TD id=m_is4audio_9338>●</TD>
          <TD id=m_is4audio_9339>-</TD>
          <TD id=m_is4audio_9340>-</TD></TR>
        <TR class=disc>
          <TD id=m_is6audio_9335>-</TD>
          <TD id=m_is6audio_9337>-</TD>
          <TD id=m_is6audio_9336>-</TD>
          <TD id=m_is6audio_9338>-</TD>
          <TD id=m_is6audio_9339>●</TD>
          <TD id=m_is6audio_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_is8audio_9335>-</TD>
          <TD id=m_is8audio_9337>-</TD>
          <TD id=m_is8audio_9336>-</TD>
          <TD id=m_is8audio_9338>-</TD>
          <TD id=m_is8audio_9339>-</TD>
          <TD id=m_is8audio_9340>-</TD></TR>
        <TR id=base_13>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9335 scope=col><B href="#/m9335/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL MT </A><I id=base_13_img_9335></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9337 scope=col><B href="#/m9337/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE MT </A><I id=base_13_img_9337></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9336 scope=col><B href="#/m9336/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL AT </A><I id=base_13_img_9336></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9338 scope=col><B href="#/m9338/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE AT </A><I id=base_13_img_9338></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9339 scope=col><B href="#/m9339/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX MT </A><I id=base_13_img_9339></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9340 scope=col><B href="#/m9340/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX AT </A><I id=base_13_img_9340></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isxelamp_9335>-</TD>
          <TD id=m_isxelamp_9337>-</TD>
          <TD id=m_isxelamp_9336>-</TD>
          <TD id=m_isxelamp_9338>-</TD>
          <TD id=m_isxelamp_9339>-</TD>
          <TD id=m_isxelamp_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isautohlamp_9335>-</TD>
          <TD id=m_isautohlamp_9337>-</TD>
          <TD id=m_isautohlamp_9336>-</TD>
          <TD id=m_isautohlamp_9338>-</TD>
          <TD id=m_isautohlamp_9339>-</TD>
          <TD id=m_isautohlamp_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isturnhlamp_9335>-</TD>
          <TD id=m_isturnhlamp_9337>-</TD>
          <TD id=m_isturnhlamp_9336>-</TD>
          <TD id=m_isturnhlamp_9338>-</TD>
          <TD id=m_isturnhlamp_9339>-</TD>
          <TD id=m_isturnhlamp_9340>-</TD></TR>
        <TR class=disc>
          <TD id=m_ishfoglamp_9335>-</TD>
          <TD id=m_ishfoglamp_9337>●</TD>
          <TD id=m_ishfoglamp_9336>-</TD>
          <TD id=m_ishfoglamp_9338>●</TD>
          <TD id=m_ishfoglamp_9339>●</TD>
          <TD id=m_ishfoglamp_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbfoglamp_9335>●</TD>
          <TD id=m_isbfoglamp_9337>●</TD>
          <TD id=m_isbfoglamp_9336>●</TD>
          <TD id=m_isbfoglamp_9338>●</TD>
          <TD id=m_isbfoglamp_9339>●</TD>
          <TD id=m_isbfoglamp_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_islampheiadj_9335>-</TD>
          <TD id=m_islampheiadj_9337>-</TD>
          <TD id=m_islampheiadj_9336>-</TD>
          <TD id=m_islampheiadj_9338>-</TD>
          <TD id=m_islampheiadj_9339>-</TD>
          <TD id=m_islampheiadj_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_islampclset_9335>-</TD>
          <TD id=m_islampclset_9337>-</TD>
          <TD id=m_islampclset_9336>-</TD>
          <TD id=m_islampclset_9338>-</TD>
          <TD id=m_islampclset_9339>-</TD>
          <TD id=m_islampclset_9340>-</TD></TR>
        <TR id=base_14>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9335 scope=col><B href="#/m9335/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL MT </A><I id=base_14_img_9335></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9337 scope=col><B href="#/m9337/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE MT </A><I id=base_14_img_9337></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9336 scope=col><B href="#/m9336/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL AT </A><I id=base_14_img_9336></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9338 scope=col><B href="#/m9338/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE AT </A><I id=base_14_img_9338></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9339 scope=col><B href="#/m9339/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX MT </A><I id=base_14_img_9339></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9340 scope=col><B href="#/m9340/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX AT </A><I id=base_14_img_9340></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isfewindow_9335>●</TD>
          <TD id=m_isfewindow_9337>●</TD>
          <TD id=m_isfewindow_9336>●</TD>
          <TD id=m_isfewindow_9338>●</TD>
          <TD id=m_isfewindow_9339>●</TD>
          <TD id=m_isfewindow_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbewindow_9335>●</TD>
          <TD id=m_isbewindow_9337>●</TD>
          <TD id=m_isbewindow_9336>●</TD>
          <TD id=m_isbewindow_9338>●</TD>
          <TD id=m_isbewindow_9339>●</TD>
          <TD id=m_isbewindow_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isgnhand_9335>-</TD>
          <TD id=m_isgnhand_9337>-</TD>
          <TD id=m_isgnhand_9336>-</TD>
          <TD id=m_isgnhand_9338>-</TD>
          <TD id=m_isgnhand_9339>-</TD>
          <TD id=m_isgnhand_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ispreventionuv_9335>-</TD>
          <TD id=m_ispreventionuv_9337>-</TD>
          <TD id=m_ispreventionuv_9336>-</TD>
          <TD id=m_ispreventionuv_9338>-</TD>
          <TD id=m_ispreventionuv_9339>-</TD>
          <TD id=m_ispreventionuv_9340>-</TD></TR>
        <TR class=disc>
          <TD id=m_isermirror_9335>-</TD>
          <TD id=m_isermirror_9337>●</TD>
          <TD id=m_isermirror_9336>-</TD>
          <TD id=m_isermirror_9338>●</TD>
          <TD id=m_isermirror_9339>●</TD>
          <TD id=m_isermirror_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_ishotrmirror_9335>-</TD>
          <TD id=m_ishotrmirror_9337>-</TD>
          <TD id=m_ishotrmirror_9336>-</TD>
          <TD id=m_ishotrmirror_9338>-</TD>
          <TD id=m_ishotrmirror_9339>-</TD>
          <TD id=m_ishotrmirror_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_ismemorymirror_9335>-</TD>
          <TD id=m_ismemorymirror_9337>-</TD>
          <TD id=m_ismemorymirror_9336>-</TD>
          <TD id=m_ismemorymirror_9338>-</TD>
          <TD id=m_ismemorymirror_9339>-</TD>
          <TD id=m_ismemorymirror_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_iseprmirror_9335>-</TD>
          <TD id=m_iseprmirror_9337>-</TD>
          <TD id=m_iseprmirror_9336>-</TD>
          <TD id=m_iseprmirror_9338>-</TD>
          <TD id=m_iseprmirror_9339>-</TD>
          <TD id=m_iseprmirror_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_isrmirrorge_9335>-</TD>
          <TD id=m_isrmirrorge_9337>-</TD>
          <TD id=m_isrmirrorge_9336>-</TD>
          <TD id=m_isrmirrorge_9338>-</TD>
          <TD id=m_isrmirrorge_9339>-</TD>
          <TD id=m_isrmirrorge_9340>-</TD></TR>
        <TR class=disc>
          <TD id=m_isbsvisor_9335>- </TD>
          <TD id=m_isbsvisor_9337>- </TD>
          <TD id=m_isbsvisor_9336>- </TD>
          <TD id=m_isbsvisor_9338>- </TD>
          <TD id=m_isbsvisor_9339>- </TD>
          <TD id=m_isbsvisor_9340>- </TD></TR><!--	



			<tr class="hidd" >



				



				


					


						<td id="m_ishbsvisor_9335">-</td>



					


						<td id="m_ishbsvisor_9337">-</td>



					


						<td id="m_ishbsvisor_9336">-</td>



					


						<td id="m_ishbsvisor_9338">-</td>



					


						<td id="m_ishbsvisor_9339">-</td>



					


						<td id="m_ishbsvisor_9340">-</td>



					


							</tr>







			<tr class="hidd" >



				



				


					


						<td id="m_isebsvisor_9335"> - </td>



					


						<td id="m_isebsvisor_9337"> - </td>



					


						<td id="m_isebsvisor_9336"> - </td>



					


						<td id="m_isebsvisor_9338"> - </td>



					


						<td id="m_isebsvisor_9339"> - </td>



					


						<td id="m_isebsvisor_9340"> - </td>



					


							</tr>



-->
        <TR class=hidd>
          <TD id=m_isbssvisor_9335>-</TD>
          <TD id=m_isbssvisor_9337>-</TD>
          <TD id=m_isbssvisor_9336>-</TD>
          <TD id=m_isbssvisor_9338>-</TD>
          <TD id=m_isbssvisor_9339>-</TD>
          <TD id=m_isbssvisor_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_issvisordr_9335>●</TD>
          <TD id=m_issvisordr_9337>●</TD>
          <TD id=m_issvisordr_9336>●</TD>
          <TD id=m_issvisordr_9338>●</TD>
          <TD id=m_issvisordr_9339>●</TD>
          <TD id=m_issvisordr_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isinswiper_9335>-</TD>
          <TD id=m_isinswiper_9337>-</TD>
          <TD id=m_isinswiper_9336>-</TD>
          <TD id=m_isinswiper_9338>-</TD>
          <TD id=m_isinswiper_9339>-</TD>
          <TD id=m_isinswiper_9340>-</TD></TR>
        <TR id=base_15>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9335 scope=col><B href="#/m9335/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL MT </A><I id=base_15_img_9335></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9337 scope=col><B href="#/m9337/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE MT </A><I id=base_15_img_9337></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9336 scope=col><B href="#/m9336/" 
            target=_blank>2011款爱唯欧三厢 1.4 SL AT </A><I id=base_15_img_9336></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9338 scope=col><B href="#/m9338/" 
            target=_blank>2011款爱唯欧三厢 1.4 SE AT </A><I id=base_15_img_9338></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9339 scope=col><B href="#/m9339/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX MT </A><I id=base_15_img_9339></I> </TH>
          <TH 
          style="TEXT-ALIGN: center; PADDING-BOTTOM: 0px; HEIGHT: 105px; OVERFLOW: hidden; PADDING-TOP: 0px" 
          id=mod_9340 scope=col><B href="#/m9340/" 
            target=_blank>2011款爱唯欧三厢 1.6 SX AT </A><I id=base_15_img_9340></I> </TH></TR>
        <TR class=hidd>
          <TD id=m_isairc_9335>●</TD>
          <TD id=m_isairc_9337>●</TD>
          <TD id=m_isairc_9336>●</TD>
          <TD id=m_isairc_9338>●</TD>
          <TD id=m_isairc_9339>●</TD>
          <TD id=m_isairc_9340>●</TD></TR>
        <TR class=hidd>
          <TD id=m_isbsairo_9335>-</TD>
          <TD id=m_isbsairo_9337>-</TD>
          <TD id=m_isbsairo_9336>-</TD>
          <TD id=m_isbsairo_9338>-</TD>
          <TD id=m_isbsairo_9339>-</TD>
          <TD id=m_isbsairo_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_istempdct_9335>-</TD>
          <TD id=m_istempdct_9337>-</TD>
          <TD id=m_istempdct_9336>-</TD>
          <TD id=m_istempdct_9338>-</TD>
          <TD id=m_istempdct_9339>-</TD>
          <TD id=m_istempdct_9340>-</TD></TR>
        <TR class=hidd>
          <TD id=m_iscaricebox_9335>-</TD>
          <TD id=m_iscaricebox_9337>-</TD>
          <TD id=m_iscaricebox_9336>-</TD>
          <TD id=m_iscaricebox_9338>-</TD>
          <TD id=m_iscaricebox_9339>-</TD>
          <TD 
id=m_iscaricebox_9340>-</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
<DIV class=clear></DIV></DIV>
<SCRIPT type=text/javascript 
src="【爱唯欧三厢】爱唯欧三厢%20汽车配置_参数%20上海通用雪佛兰_爱卡汽车网_files/analytics.htm"></SCRIPT>
<!--登陆js-->
<SCRIPT 
src="【爱唯欧三厢】爱唯欧三厢%20汽车配置_参数%20上海通用雪佛兰_爱卡汽车网_files/new_login2011_newcar.htm"></SCRIPT>

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
    <OPTION selected value=9335>2011款爱唯欧三厢 1.4 SL MT</OPTION> <OPTION 
    value=9337>2011款爱唯欧三厢 1.4 SE MT</OPTION> <OPTION value=9336>2011款爱唯欧三厢 1.4 
    SL AT</OPTION> <OPTION value=9338>2011款爱唯欧三厢 1.4 SE AT</OPTION> <OPTION 
    value=9339>2011款爱唯欧三厢 1.6 SX MT</OPTION> <OPTION value=9340>2011款爱唯欧三厢 1.6 
    SX AT</OPTION></SELECT></LI>
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
src="【爱唯欧三厢】爱唯欧三厢%20汽车配置_参数%20上海通用雪佛兰_爱卡汽车网_files/news_forall.js"></SCRIPT>

<SCRIPT type=text/javascript 
src="【爱唯欧三厢】爱唯欧三厢%20汽车配置_参数%20上海通用雪佛兰_爱卡汽车网_files/dw.js"></SCRIPT>

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
