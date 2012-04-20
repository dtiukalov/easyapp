package com.satrun.data.extraction.vo;

import java.util.HashMap;
import java.util.Map;

public class ParamterConfigration {
	
	public static Map<String, String> paramtersMap = new HashMap<String, String>();
	
	Map<String, String> carParamtershtml = new HashMap<String, String>();
	
	Map<String, String> carParamtersdb = new HashMap<String, String>();
	
	private String title = "";
	
	private String cartype = "";
	
	private String price = "";
	
	
	public static Map<String, String> getParamtersMap() {
		return paramtersMap;
	}

	public static void setParamtersMap(Map<String, String> paramtersMap) {
		ParamterConfigration.paramtersMap = paramtersMap;
	}

	public String getCartype() {
		return cartype;
	}

	public void setCartype(String cartype) {
		this.cartype = cartype;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	static {
		paramtersMap.put("厢式", "van");
		paramtersMap.put("国内上市时间", "domestic_time_to_market");
		paramtersMap.put("款式年份", "style_year");
		paramtersMap.put("整车保修期限", "the_vehicle_warranty_period");
		paramtersMap.put("常规保养间隔", "routine_maintenance_intervals");
		paramtersMap.put("厂家指导价", "manufacturers_guide_price");
		paramtersMap.put("长(mm)", "lengt");
		paramtersMap.put("宽(mm)", "width");
		paramtersMap.put("高(mm)", "height");
		paramtersMap.put("前轮距(mm)", "front_track");
		paramtersMap.put("后轮距(mm)", "rear_track");
		paramtersMap.put("轴距(mm)", "wheelbase");
		paramtersMap.put("最小离地间隙(mm)", "minimum_ground_clearance");
		paramtersMap.put("最小转弯直径(m)", "minimum_turning_diameter");
		paramtersMap.put("整备质量(Kg)", "weight");
		paramtersMap.put("车体结构", "body_structure");
		paramtersMap.put("车顶形式", "roof_form_of");
		paramtersMap.put("车篷开合方式", "hood_to_open_coway");
		paramtersMap.put("车篷开合时间(s)", "hood_opening_and_closing_time");
		paramtersMap.put("车门数(个)", "door_number");
		paramtersMap.put("座位数(个)", "number_of_seats");
		paramtersMap.put("接近角(°)", "approach_angle");
		paramtersMap.put("离去角(°)", "departure_angle");
		paramtersMap.put("风阻系数(Cd) ", "drag_coefficient");
		paramtersMap.put("最大涉水深度(m) ", "maximum_wading_depth");
		paramtersMap.put("油箱容积(L) ", "fuel_tank_capacity");
		paramtersMap.put("行李舱容积(L) ", "luggage_compartment_capacity");
		paramtersMap.put("气缸容积(ml)", "cylinder_volume");
		paramtersMap.put("排气量(L)", "displacement");
		paramtersMap.put("工作方式", "workway");
		paramtersMap.put("气缸排列形式", "cylinder_arrangement_form");
		paramtersMap.put("气缸数(个)", "number_of_cylinders");
		paramtersMap.put("每缸气门数(个)", "the_number_of_valves_per_cylinder");
		paramtersMap.put("压缩比", "compression_ratio");
		paramtersMap.put("气门形式", "valve_in_the_form");
		paramtersMap.put("发动机功率(Kw/rpm)", "engine_power");
		paramtersMap.put("电动机功率(Kw/rpm)", "motor_power");
		paramtersMap.put("总功率(Kw/rpm)", "total_power");
		paramtersMap.put("发动机最大扭矩(Nm/rp..", "maximum_engine_torque");
		paramtersMap.put("电动机最大扭矩(Nm/rp..", "motor_maximum_torque");
		paramtersMap.put("总扭矩(Nm/rpm)", "torque");
		paramtersMap.put("发动机厂家型号", "engine_manufacturers_model");
		paramtersMap.put("发动机特有技术", "unique_technology_of_the_engine");
		paramtersMap.put("缸盖材料", "cylinder_head_material");
		paramtersMap.put("缸体材料", "cylinder_materials");
		paramtersMap.put("燃油及标号", "fuel_and_label");
		paramtersMap.put("供油方式", "fuel_supply");
		paramtersMap.put("环保标准", "environmental_standards");
		paramtersMap.put("官方油耗(L)", "official_fuel_consumption");
		paramtersMap.put("最高车速(Km/h)", "maximum_speed");
		paramtersMap.put("官方0—100加速时间(s..", "official_0to100_acceleration_time");
		paramtersMap.put("挡位数", "gear_number");
		paramtersMap.put("变速器形式", "transmission_in_the_form");
		paramtersMap.put("四驱类型", "four_wheel_drive_type");
		paramtersMap.put("中央差速器锁", "the_central_differential_lock");
		paramtersMap.put("前桥差速器锁", "front_axle_differential_lock");
		paramtersMap.put("后桥差速器锁", "rear_axle_differential_lock");
		paramtersMap.put("驱动方式", "driven_approach");
		paramtersMap.put("前悬挂形式", "front_suspension_format");
		paramtersMap.put("后悬挂形式", "rear_suspension_form");
		paramtersMap.put("前制动器类型", "front_brake_type");
		paramtersMap.put("后制动器类型", "rear_brake_type");
		paramtersMap.put("助力转向类型", "power_steering_type");
		paramtersMap.put("前轮胎规格", "front_tire_specifications");
		paramtersMap.put("后轮胎规格", "rear_tire_specifications");
		paramtersMap.put("轮辋材质", "rim_material");
		paramtersMap.put("备胎规格", "spare_tire_specifications");
		paramtersMap.put("驾驶位安全气囊", "driverside_airbag");
		paramtersMap.put("副驾驶位安全气囊", "copilot_airbag");
		paramtersMap.put("侧安全气囊", "side_airbags");
		paramtersMap.put("侧安全气帘", "side_curtain_airbags");
		paramtersMap.put("膝部气囊", "knee_airbag");
		paramtersMap.put("气囊(帘)个数(个)", "the_number_of_airbags_curtain");
		paramtersMap.put("倒车雷达", "parking_sensor");
		paramtersMap.put("可视倒车影像", "visual_reverse_image");
		paramtersMap.put("全景摄像头", "panoramic_camera");
		paramtersMap.put("安全带未系提示", "seat_belt_is_not_the_department_of_prompt");
		paramtersMap.put("电子防盗", "electronic_antitheft");
		paramtersMap.put("车内中控锁", "car_central_locking");
		paramtersMap.put("遥控钥匙", "remote_keyless_entry");
		paramtersMap.put("无钥匙启动系统", "keyless_start_system");
		paramtersMap.put("零压续行系统", "zero_pressure_continued_line_system");
		paramtersMap.put("胎压监测系统", "tire_pressure_monitoring_system");
		paramtersMap.put("自动泊车入位", "automatic_parking_into_place");
		paramtersMap.put("安全类特色配置", "characteristic_configuration_of_the_security_class");
		paramtersMap.put("ABS防抱死", "abs_antilock");
		paramtersMap.put("EBD制动力分配", "ebd_brake_force_distribution");
		paramtersMap.put("(TCS/ASR/TRC等)牵引..", "tcs__asr__trc_traction");
		paramtersMap.put("(ESP/VDC/VSC/DSC等)..", "esp__vdc__vsc__dsc_etc");
		paramtersMap.put("(EBA/BA/BAS等)刹车辅..", "eba__ba__bas_brake_auxiliary");
		paramtersMap.put("定速巡航系统", "cruise_control");
		paramtersMap.put("EDS电子差速制动", "eds_electronic_differential_brake");
		paramtersMap.put("主动车身控制", "active_body_control");
		paramtersMap.put("电子自动驻车制动系统", "electronic_automatic_parking_brake_system");
		paramtersMap.put("上坡辅助(HAC)", "hill_assist_hac");
		paramtersMap.put("陡坡缓降(HDC)", "the_descent_hdc");
		paramtersMap.put("车身高度可调", "body_height_adjustable");
		paramtersMap.put("空气悬挂", "air_suspension");
		paramtersMap.put("主动转向系统", "active_steering_system");
		paramtersMap.put("操控类特色配置", "manipulate_a_characteristic_configuration");
		paramtersMap.put("电动天窗", "electric_sunroof");
		paramtersMap.put("全景天窗", "panoramic_sunroof");
		paramtersMap.put("行李舱开合方式", "the_luggage_compartment_opening_and_closing_mode");
		paramtersMap.put("油箱盖开启方式", "the_tank_cover_open_the_way");
		paramtersMap.put("雨量感应式前雨刷", "wipers_before_the_rainsensing_type");
		paramtersMap.put("后雨刷", "rear_wiper");
		paramtersMap.put("车身颜色", "body_color");
		paramtersMap.put("皮质方向盘", "leather_steering_wheel");
		paramtersMap.put("多功能方向盘", "multifunction_steering_wheel");
		paramtersMap.put("方向盘换挡", "steering_wheel_shift");
		paramtersMap.put("方向盘调节", "steering_wheel_adjustment");
		paramtersMap.put("车外温度显示", "outside_temperature_display");
		paramtersMap.put("仪表显示形式", "instrument_display_form");
		paramtersMap.put("油耗显示", "fuel_consumption_display");
		paramtersMap.put("HUD抬头显示系统", "hud_looked_up_display_system");
		paramtersMap.put("夜视系统", "night_vision_systems");
		paramtersMap.put("后排侧遮阳帘", "rear_side_window_shades");
		paramtersMap.put("后风挡遮阳帘", "after_the_windshield_sunshade");
		paramtersMap.put("前照灯类型", "headlamp_type");
		paramtersMap.put("前雾灯", "front_fog_lamps");
		paramtersMap.put("大灯车内高度调节", "the_headlamps_interior_height_adjustment");
		paramtersMap.put("大灯清洗功能", "headlight_cleaning_function");
		paramtersMap.put("车外灯光关闭延时功能", "exterior_lights_turn_off_delay_function");
		paramtersMap.put("光感式自动大灯", "lightsensitive_autoheadlights");
		paramtersMap.put("大灯随动转向", "headlamps_with_dynamic_steering");
		paramtersMap.put("前电动车窗", "former_power_windows");
		paramtersMap.put("后电动车窗", "after_the_electric_windows");
		paramtersMap.put("车窗防夹手功能", "the_windows_fangga_hand_function");
		paramtersMap.put("车外后视镜调节", "exterior_mirror_adjustment");
		paramtersMap.put("车外后视镜加热", "exterior_mirror_heating");
		paramtersMap.put("车外后视镜电动折叠", "electric_folding_exterior_mirrors");
		paramtersMap.put("车内后视镜自动防炫目", "automatic_antiglare_interior_mirror");
		paramtersMap.put("手动空调", "manual_airconditioning");
		paramtersMap.put("自动空调", "automatic_air_conditioning");
		paramtersMap.put("温度分区控制", "temperature_zone_control");
		paramtersMap.put("标准后座出风口", "standard_rear_seat_outlet");
		paramtersMap.put("灰尘花粉过滤器", "dust_pollen_filter");
		paramtersMap.put("独立冷藏空间", "independent_refrigeration_space");
		paramtersMap.put("车载冰箱", "car_refrigerator");
		paramtersMap.put("皮质座椅", "leather_seats");
		paramtersMap.put("混合材质座椅", "mixedmaterial_seat");
		paramtersMap.put("运动座椅", "sport_seats");
		paramtersMap.put("驾驶位座椅调节", "driverside_seat_adjuster");
		paramtersMap.put("座椅高低调节", "seat_height_adjustment");
		paramtersMap.put("座椅腰部支撑调节", "seat_lumbar_support_adjustment");
		paramtersMap.put("后排座椅放倒比例", "the_rear_seats_down_ratio");
		paramtersMap.put("后排座椅调节", "rear_seat_adjuster");
		paramtersMap.put("电动座椅记忆", "electric_seat_memory");
		paramtersMap.put("座椅按摩", "seat_massage");
		paramtersMap.put("座椅通风", "seat_ventilation");
		paramtersMap.put("前排座椅加热", "heated_front_seats");
		paramtersMap.put("后排座椅加热", "rear_seat_heating");
		paramtersMap.put("前座中央扶手", "front_seat_center_armrest");
		paramtersMap.put("后座中央扶手", "rear_center_armrest");
		paramtersMap.put("单碟CD", "singledisc_cd");
		paramtersMap.put("多碟CD系统", "multidisc_cd_system");
		paramtersMap.put("单碟DVD", "singledisc_dvd");
		paramtersMap.put("多碟DVD系统", "multidisc_dvd_system");
		paramtersMap.put("CD兼容MP3/WMA格式", "cd_compatible_with_mp3_wma_format");
		paramtersMap.put("外接音源接口(AUX/USB..", "an_external_audio_interface");
		paramtersMap.put("扬声器数量(个)", "number_of_speakers");
		paramtersMap.put("音响品牌", "audio_brand");
		paramtersMap.put("车载蓝牙通话系统", "bluetooth_intercom_system");
		paramtersMap.put("GPS导航系统", "gps_navigation_system");
		paramtersMap.put("车载电视", "car_tv");
		paramtersMap.put("后排液晶屏", "rear_lcd_screen");
		paramtersMap.put("硬盘式多媒体系统", "hard_drivebased_multimedia_systems");
		paramtersMap.put("车载人机交互系统", "car_humancomputer_interaction_systems");
		paramtersMap.put("多媒体类特色配置", "multimedia_features_configuration");
		paramtersMap.put("其他配置", "other_configurations");
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	

	public Map<String, String> getCarParamtershtml() {
		return carParamtershtml;
	}

	public void setCarParamtershtml(Map<String, String> carParamtershtml) {
		this.carParamtershtml = carParamtershtml;
	}

	public Map<String, String> getCarParamtersdb() {
		return carParamtersdb;
	}

	public void setCarParamtersdb(Map<String, String> carParamtersdb) {
		this.carParamtersdb = carParamtersdb;
	}
	
	public static void main(String[] args) {
		String test = "CREATE TABLE [IF NOT EXISTS] paramter_configration("
			+"van  varchar(100),"+"\n"
			+"domestic_time_to_market  varchar(100),"+"\n"
			+"style_year  varchar(100),"+"\n"
			+"the_vehicle_warranty_period  varchar(100),"+"\n"
			+"routine_maintenance_intervals  varchar(100),"+"\n"
			+"manufacturers_guide_price  varchar(100),"+"\n"
			+"length  varchar(100),"+"\n"
			+"width  varchar(100),"+"\n"
			+"height  varchar(100),"+"\n"
			+"front_track  varchar(100),"+"\n"
			+"rear_track  varchar(100),"+"\n"
			+"wheelbase  varchar(100),"+"\n"
			+"minimum_ground_clearance  varchar(100),"+"\n"
			+"minimum_turning_diameter  varchar(100),"+"\n"
			+"weight  varchar(100),"+"\n"
			+"body_structure  varchar(100),"+"\n"
			+"roof_form_of  varchar(100),"+"\n"
			+"hood_to_open_coway  varchar(100),"+"\n"
			+"hood_opening_and_closing_time  varchar(100),"+"\n"
			+"door_number  varchar(100),"+"\n"
			+"number_of_seats  varchar(100),"+"\n"
			+"approach_angle  varchar(100),"+"\n"
			+"departure_angle  varchar(100),"+"\n"
			+"drag_coefficient  varchar(100),"+"\n"
			+"maximum_wading_depth  varchar(100),"+"\n"
			+"fuel_tank_capacity  varchar(100),"+"\n"
			+"luggage_compartment_capacity  varchar(100),"+"\n"
			+"cylinder_volume  varchar(100),"+"\n"
			+"displacement  varchar(100),"+"\n"
			+"work  varchar(100),"+"\n"
			+"cylinder_arrangement_form  varchar(100),"+"\n"
			+"number_of_cylinders  varchar(100),"+"\n"
			+"the_number_of_valves_per_cylinder  varchar(100),"+"\n"
			+"compression_ratio  varchar(100),"+"\n"
			+"valve_in_the_form  varchar(100),"+"\n"
			+"engine_power  varchar(100),"+"\n"
			+"motor_power  varchar(100),"+"\n"
			+"total_power  varchar(100),"+"\n"
			+"maximum_engine_torque  varchar(100),"+"\n"
			+"motor_maximum_torque  varchar(100),"+"\n"
			+"torque  varchar(100),"+"\n"
			+"engine_manufacturers_model  varchar(100),"+"\n"
			+"unique_technology_of_the_engine  varchar(100),"+"\n"
			+"cylinder_head_material  varchar(100),"+"\n"
			+"cylinder_materials  varchar(100),"+"\n"
			+"fuel_and_label  varchar(100),"+"\n"
			+"fuel_supply  varchar(100),"+"\n"
			+"environmental_standards  varchar(100),"+"\n"
			+"official_fuel_consumption  varchar(100),"+"\n"
			+"maximum_speed  varchar(100),"+"\n"
			+"official_0to100_acceleration_time  varchar(100),"+"\n"
			+"gear_number  varchar(100),"+"\n"
			+"transmission_in_the_form  varchar(100),"+"\n"
			+"four_wheel_drive_type  varchar(100),"+"\n"
			+"the_central_differential_lock  varchar(100),"+"\n"
			+"front_axle_differential_lock  varchar(100),"+"\n"
			+"rear_axle_differential_lock  varchar(100),"+"\n"
			+"driven_approach  varchar(100),"+"\n"
			+"front_suspension_format  varchar(100),"+"\n"
			+"rear_suspension_form  varchar(100),"+"\n"
			+"front_brake_type  varchar(100),"+"\n"
			+"rear_brake_type  varchar(100),"+"\n"
			+"power_steering_type  varchar(100),"+"\n"
			+"front_tire_specifications  varchar(100),"+"\n"
			+"rear_tire_specifications  varchar(100),"+"\n"
			+"rim_material  varchar(100),"+"\n"
			+"spare_tire_specifications  varchar(100),"+"\n"
			+"driverside_airbag  varchar(100),"+"\n"
			+"copilot_airbag  varchar(100),"+"\n"
			+"side_airbags  varchar(100),"+"\n"
			+"side_curtain_airbags  varchar(100),"+"\n"
			+"knee_airbag  varchar(100),"+"\n"
			+"the_number_of_airbags_curtain  varchar(100),"+"\n"
			+"parking_sensor  varchar(100),"+"\n"
			+"visual_reverse_image  varchar(100),"+"\n"
			+"panoramic_camera  varchar(100),"+"\n"
			+"seat_belt_is_not_the_department_of_prompt  varchar(100),"+"\n"
			+"electronic_antitheft  varchar(100),"+"\n"
			+"car_central_locking  varchar(100),"+"\n"
			+"remote_keyless_entry  varchar(100),"+"\n"
			+"keyless_start_system  varchar(100),"+"\n"
			+"zero_pressure_continued_line_system  varchar(100),"+"\n"
			+"tire_pressure_monitoring_system  varchar(100),"+"\n"
			+"automatic_parking_into_place  varchar(100),"+"\n"
			+"characteristic_configuration_of_the_security_class  varchar(100),"+"\n"
			+"abs_antilock  varchar(100),"+"\n"
			+"ebd_brake_force_distribution  varchar(100),"+"\n"
			+"tcs__asr__trc_traction  varchar(100),"+"\n"
			+"esp__vdc__vsc__dsc,_etc  varchar(100),"+"\n"
			+"eba__ba__bas_brake_auxiliary  varchar(100),"+"\n"
			+"cruise_control  varchar(100),"+"\n"
			+"eds_electronic_differential_brake  varchar(100),"+"\n"
			+"active_body_control  varchar(100),"+"\n"
			+"electronic_automatic_parking_brake_system  varchar(100),"+"\n"
			+"hill_assist_hac  varchar(100),"+"\n"
			+"the_descent_hdc  varchar(100),"+"\n"
			+"body_height_adjustable  varchar(100),"+"\n"
			+"air_suspension  varchar(100),"+"\n"
			+"active_steering_system  varchar(100),"+"\n"
			+"manipulate_a_characteristic_configuration  varchar(100),"+"\n"
			+"electric_sunroof  varchar(100),"+"\n"
			+"panoramic_sunroof  varchar(100),"+"\n"
			+"the_luggage_compartment_opening_and_closing_mode  varchar(100),"+"\n"
			+"the_tank_cover_open_the_way  varchar(100),"+"\n"
			+"wipers_before_the_rainsensing_type  varchar(100),"+"\n"
			+"rear_wiper  varchar(100),"+"\n"
			+"body_color  varchar(100),"+"\n"
			+"leather_steering_wheel  varchar(100),"+"\n"
			+"multifunction_steering_wheel  varchar(100),"+"\n"
			+"steering_wheel_shift  varchar(100),"+"\n"
			+"steering_wheel_adjustment  varchar(100),"+"\n"
			+"outside_temperature_display  varchar(100),"+"\n"
			+"instrument_display_form  varchar(100),"+"\n"
			+"fuel_consumption_display  varchar(100),"+"\n"
			+"hud_looked_up_display_system  varchar(100),"+"\n"
			+"night_vision_systems  varchar(100),"+"\n"
			+"rear_side_window_shades  varchar(100),"+"\n"
			+"after_the_windshield_sunshade  varchar(100),"+"\n"
			+"headlamp_type  varchar(100),"+"\n"
			+"front_fog_lamps  varchar(100),"+"\n"
			+"the_headlamps_interior_height_adjustment  varchar(100),"+"\n"
			+"headlight_cleaning_function  varchar(100),"+"\n"
			+"exterior_lights_turn_off_delay_function  varchar(100),"+"\n"
			+"lightsensitive_autoheadlights  varchar(100),"+"\n"
			+"headlamps_with_dynamic_steering  varchar(100),"+"\n"
			+"former_power_windows  varchar(100),"+"\n"
			+"after_the_electric_windows  varchar(100),"+"\n"
			+"the_windows_fangga_hand_function  varchar(100),"+"\n"
			+"exterior_mirror_adjustment  varchar(100),"+"\n"
			+"exterior_mirror_heating  varchar(100),"+"\n"
			+"electric_folding_exterior_mirrors  varchar(100),"+"\n"
			+"automatic_antiglare_interior_mirror  varchar(100),"+"\n"
			+"manual_airconditioning  varchar(100),"+"\n"
			+"automatic_air_conditioning  varchar(100),"+"\n"
			+"temperature_zone_control  varchar(100),"+"\n"
			+"standard_rear_seat_outlet  varchar(100),"+"\n"
			+"dust_pollen_filter  varchar(100),"+"\n"
			+"independent_refrigeration_space  varchar(100),"+"\n"
			+"car_refrigerator  varchar(100),"+"\n"
			+"leather_seats  varchar(100),"+"\n"
			+"mixedmaterial_seat  varchar(100),"+"\n"
			+"sport_seats  varchar(100),"+"\n"
			+"driverside_seat_adjuster  varchar(100),"+"\n"
			+"seat_height_adjustment  varchar(100),"+"\n"
			+"seat_lumbar_support_adjustment  varchar(100),"+"\n"
			+"the_rear_seats_down_ratio  varchar(100),"+"\n"
			+"rear_seat_adjuster  varchar(100),"+"\n"
			+"electric_seat_memory  varchar(100),"+"\n"
			+"seat_massage  varchar(100),"+"\n"
			+"seat_ventilation  varchar(100),"+"\n"
			+"heated_front_seats  varchar(100),"+"\n"
			+"rear_seat_heating  varchar(100),"+"\n"
			+"front_seat_center_armrest  varchar(100),"+"\n"
			+"rear_center_armrest  varchar(100),"+"\n"
			+"singledisc_cd  varchar(100),"+"\n"
			+"multidisc_cd_system  varchar(100),"+"\n"
			+"singledisc_dvd  varchar(100),"+"\n"
			+"multidisc_dvd_system  varchar(100),"+"\n"
			+"cd_compatible_with_mp3_wma_format  varchar(100),"+"\n"
			+"an_external_audio_interface  varchar(100),"+"\n"
			+"number_of_speakers  varchar(100),"+"\n"
			+"audio_brand  varchar(100),"+"\n"
			+"bluetooth_intercom_system  varchar(100),"+"\n"
			+"gps_navigation_system  varchar(100),"+"\n"
			+"car_tv  varchar(100),"+"\n"
			+"rear_lcd_screen  varchar(100),"+"\n"
			+"hard_drivebased_multimedia_systems  varchar(100),"+"\n"
			+"car_humancomputer_interaction_systems  varchar(100),"+"\n"
			+"multimedia_features_configuration  varchar(100),"+"\n"
			+"other_configurations  varchar(100),"+"\n" + ")";
		
		test = test.toLowerCase();
		System.out.println(test);
	}
	
}
