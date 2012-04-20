package com.satrun.data.extraction.main;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.filters.TagNameFilter;
import org.htmlparser.tags.Div;
import org.htmlparser.tags.Span;
import org.htmlparser.tags.TableColumn;
import org.htmlparser.tags.TableRow;
import org.htmlparser.tags.TableTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

import com.satrun.data.db.DBManager;
import com.satrun.data.extraction.vo.ParamterConfigration;
import com.satrun.data.extraction.vo.SubCarType;

public class ExtractParameterConfiguration {
	private static String getValueBySymbol(String symbol) {
		String result = symbol;

		if (symbol.contains("●")) {
			result = "标配";
		}
		if (symbol.contains("▲")) {
			result = "待查";
		}
		if (symbol.contains("○")) {
			result = "选装";
		}
		if (symbol.contains("--")) {
			result = "无";
		}

		return result;
	}

	public static void main(String[] args) throws Exception {
		List<SubCarType> urllist = ExtractParameterConfiguration
				.getExtractUrlList();
		
		extractHtmlDatatoDB(urllist);
		
	}

	// 读取多个车的配置参数对比页
	public static List<ParamterConfigration> getParameterConfigurationByManyCars(
			String resource) {
		Parser myParser;
		List<ParamterConfigration> result = new ArrayList<ParamterConfigration>();
		try {
			myParser = new Parser(resource);

			myParser.setEncoding("GBK");
			String filterStr = "table";
			NodeFilter titlefilter = new TagNameFilter(filterStr);
			NodeList nodeList = myParser.extractAllNodesThatMatch(titlefilter);

			Map<Integer, ParamterConfigration> carMap = new HashMap<Integer, ParamterConfigration>();
			int j = 0;
			for (int p = 0; p < nodeList.size(); p++) {
				TableTag table = (TableTag) nodeList.elementAt(p);
				String tableAttClass = table.getAttribute("class");
				if (tableAttClass != null
						&& tableAttClass.equalsIgnoreCase("main left")) {
					Parser myParser_td = new Parser(table.toHtml());
					String filterStr_td = "td";
					NodeList nodeCarTitleList_td = myParser_td
							.extractAllNodesThatMatch(new TagNameFilter(
									filterStr_td));

					for (int i = 0; i < nodeCarTitleList_td.size(); i++) {
						TableColumn column = (TableColumn) nodeCarTitleList_td
								.elementAt(i);
						String td_class = column.getAttribute("class");
						if (td_class.equalsIgnoreCase("name cell f14px")) {
							Parser myParser_a = new Parser(column.toHtml());
							NodeList nodeCarTitleList_a = myParser_a
									.extractAllNodesThatMatch(new TagNameFilter(
											"a"));
							String carTitle = nodeCarTitleList_a.elementAt(0)
									.getChildren().elementAt(0).getText();
							String carType = nodeCarTitleList_a.elementAt(1)
									.getChildren().elementAt(0).getText();

							Parser myParser_span = new Parser(column.toHtml());
							NodeList nodeCarTitleList_span = myParser_span
									.extractAllNodesThatMatch(new TagNameFilter(
											"span"));
							String price = nodeCarTitleList_span.elementAt(0)
									.getChildren().elementAt(0).getText();
							ParamterConfigration car = new ParamterConfigration();
							car.setTitle(carTitle);// 获取 奥迪A4L
							car.setCartype(carType);// 获取 2010款 1.8 TFSI 舒适型
							car.setPrice(price);// 获取 29.10万
							carMap.put(j, car);
							j++;
						}
					}
					// ///////////////////////////////////////////////////////////////////////////////////////////////

					TableRow[] rows = table.getRows();
					for (int i = 0; i < rows.length; i++) {
						TableRow row = rows[i];

						if (row.getAttributeEx("class") == null) {
							Parser parser_td = new Parser(row.toHtml());
							String tdfilterStr = "td";
							NodeFilter tdfilter = new TagNameFilter(tdfilterStr);
							NodeList nodetdList = parser_td
									.extractAllNodesThatMatch(tdfilter);
							int u = 0;
							String attributeName = "";
							for (int n = 0; n < nodetdList.size(); n++) {
								TableColumn tableColumn = (TableColumn) nodetdList
										.elementAt(n);
								String attributeValue = "";

								if (tableColumn.getAttribute("class")
										.equalsIgnoreCase("set cell")) {
									Parser parser_span = new Parser(
											tableColumn.toHtml());
									String spanfilterStr = "span";
									NodeFilter spanfilter = new TagNameFilter(
											spanfilterStr);
									NodeList nodespanList = parser_span
											.extractAllNodesThatMatch(spanfilter);

									for (int t = 0; t < nodespanList.size(); t++) {
										Span span = (Span) nodespanList
												.elementAt(t);
										String span_class = span
												.getAttribute("class");
										String span_key = span
												.getAttribute("key");
										String value = span.getChildren()
												.elementAt(0).getText()
												.replaceAll("\r", "")
												.replaceAll("\t", "")
												.replaceAll("&nbsp;", "")
												.replaceAll("\n", "");
										value = getValueBySymbol(value);
										if (span_class.equalsIgnoreCase("cell")
												&& span_key != null) {
											attributeName = value;
										}
										if (span_class.equalsIgnoreCase("cell")
												&& span_key == null) {
											attributeValue = value;
											carMap.get(u)
													.getCarParamtershtml()
													.put(attributeName,
															attributeValue);
											u++;
										}
									}
								}
							}
						}
					}
				}
			}

			int size = carMap.size();

			for (int tt = 0; tt < size; tt++) {
				Map<String, String> map = carMap.get(tt).getCarParamtershtml();
				// String title = carMap.get(tt).getTitle();
				System.out.println(carMap.get(tt).getTitle());
				System.out.println(carMap.get(tt).getCartype());
				System.out.println(carMap.get(tt).getPrice());
				carMap.get(tt).setCarParamtersdb(DataTransform(map));
				System.out.println();
				System.out.println();
				result.add(carMap.get(tt));
			}
		} catch (ParserException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static Map<String, String> DataTransform(
			Map<String, String> carhtmlMap) {
		Map<String, String> result = new HashMap<String, String>();
		Iterator<String> keys = carhtmlMap.keySet().iterator();
		while (keys.hasNext()) {
			String key = keys.next();
			if (ParamterConfigration.paramtersMap.containsKey(key)) {
				result.put(ParamterConfigration.paramtersMap.get(key),
						carhtmlMap.get(key));
			//	System.out.print(key + "      ");
			//	System.out.print(ParamterConfigration.paramtersMap.get(key)
			//			+ "      ");
			//	System.out.println(carhtmlMap.get(key));
			}
		}
		return result;
	}

	public static void extractHtmlDatatoDB(List<SubCarType> urls){
		if(urls.size() > 0){
			for(SubCarType item : urls){
				String url = ExtractAutoInfoFrom163.DOMAIN + item.getUrl();
				System.out.println(url);
				List<ParamterConfigration> list = getParameterConfigurationByManyCars(url);

				if(list.size()>0){
					for(ParamterConfigration pc : list){
						 int result = insertExtractData(pc,item);
						 if(result == 1){
							 updateTempFlag(item);
						 }
					}
				}
			}
		}
	}
	
	public static void updateTempFlag(SubCarType item){
		Statement statement = null;
		Connection conn = DBManager.getConnection();
		try {
			statement = conn.createStatement();
			String sql = "update temp set flag='yes' where id='" + item.getId() + "'";
			statement.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static int insertExtractData(ParamterConfigration param_item, SubCarType cartype_item) {
		Statement statement = null;
		Connection conn = DBManager.getConnection();
		Map<String,String> param_map = param_item.getCarParamtersdb();
		String sql = "insert into paramter_configration("
			+"title_info,"
			+"car_type,"
			+"price,"
			
			+"BRAND_ID,"
			+"BRAND,"
			+"CARTYPE_ID,"
			+"CARTYPE,"
			
			+"van,"
			+"domestic_time_to_market,"
			+"style_year,"
			+"the_vehicle_warranty_period,"
			+"routine_maintenance_intervals,"
			+"manufacturers_guide_price,"
			+"lengt,"
			+"width,"
			+"height,"
			+"front_track,"
			+"rear_track,"
			+"wheelbase,"
			+"minimum_ground_clearance,"
			+"minimum_turning_diameter,"
			+"weight,"
			+"body_structure,"
			+"roof_form_of,"
			+"hood_to_open_coway,"
			+"hood_opening_and_closing_time,"
			+"door_number,"
			+"number_of_seats,"
			+"approach_angle,"
			+"departure_angle,"
			+"drag_coefficient,"
			+"maximum_wading_depth,"
			+"fuel_tank_capacity,"
			+"luggage_compartment_capacity,"
			+"cylinder_volume,"
			+"displacement,"
			+"workway,"
			+"cylinder_arrangement_form,"
			+"number_of_cylinders,"
			+"the_number_of_valves_per_cylinder,"
			+"compression_ratio,"
			+"valve_in_the_form,"
			+"engine_power,"
			+"motor_power,"
			+"total_power,"
			+"maximum_engine_torque,"
			+"motor_maximum_torque,"
			+"torque,"
			+"engine_manufacturers_model,"
			+"unique_technology_of_the_engine,"
			+"cylinder_head_material,"
			+"cylinder_materials,"
			+"fuel_and_label,"
			+"fuel_supply,"
			+"environmental_standards,"
			+"official_fuel_consumption,"
			+"maximum_speed,"
			+"official_0to100_acceleration_time,"
			+"gear_number,"
			+"transmission_in_the_form,"
			+"four_wheel_drive_type,"
			+"the_central_differential_lock,"
			+"front_axle_differential_lock,"
			+"rear_axle_differential_lock,"
			+"driven_approach,"
			+"front_suspension_format,"
			+"rear_suspension_form,"
			+"front_brake_type,"
			+"rear_brake_type,"
			+"power_steering_type,"
			+"front_tire_specifications,"
			+"rear_tire_specifications,"
			+"rim_material,"
			+"spare_tire_specifications,"
			+"driverside_airbag,"
			+"copilot_airbag,"
			+"side_airbags,"
			+"side_curtain_airbags,"
			+"knee_airbag,"
			+"the_number_of_airbags_curtain,"
			+"parking_sensor,"
			+"visual_reverse_image,"
			+"panoramic_camera,"
			+"seat_belt_is_not_the_department_of_prompt,"
			+"electronic_antitheft,"
			+"car_central_locking,"
			+"remote_keyless_entry,"
			+"keyless_start_system,"
			+"zero_pressure_continued_line_system,"
			+"tire_pressure_monitoring_system,"
			+"automatic_parking_into_place,"
			+"characteristic_configuration_of_the_security_class,"
			+"abs_antilock,"
			+"ebd_brake_force_distribution,"
			+"tcs__asr__trc_traction,"
			+"esp__vdc__vsc__dsc_etc,"
			+"eba__ba__bas_brake_auxiliary,"
			+"cruise_control,"
			+"eds_electronic_differential_brake,"
			+"active_body_control,"
			+"electronic_automatic_parking_brake_system,"
			+"hill_assist_hac,"
			+"the_descent_hdc,"
			+"body_height_adjustable,"
			+"air_suspension,"
			+"active_steering_system,"
			+"manipulate_a_characteristic_configuration,"
			+"electric_sunroof,"
			+"panoramic_sunroof,"
			+"the_luggage_compartment_opening_and_closing_mode,"
			+"the_tank_cover_open_the_way,"
			+"wipers_before_the_rainsensing_type,"
			+"rear_wiper,"
			+"body_color,"
			+"leather_steering_wheel,"
			+"multifunction_steering_wheel,"
			+"steering_wheel_shift,"
			+"steering_wheel_adjustment,"
			+"outside_temperature_display,"
			+"instrument_display_form,"
			+"fuel_consumption_display,"
			+"hud_looked_up_display_system,"
			+"night_vision_systems,"
			+"rear_side_window_shades,"
			+"after_the_windshield_sunshade,"
			+"headlamp_type,"
			+"front_fog_lamps,"
			+"the_headlamps_interior_height_adjustment,"
			+"headlight_cleaning_function,"
			+"exterior_lights_turn_off_delay_function,"
			+"lightsensitive_autoheadlights,"
			+"headlamps_with_dynamic_steering,"
			+"former_power_windows,"
			+"after_the_electric_windows,"
			+"the_windows_fangga_hand_function,"
			+"exterior_mirror_adjustment,"
			+"exterior_mirror_heating,"
			+"electric_folding_exterior_mirrors,"
			+"automatic_antiglare_interior_mirror,"
			+"manual_airconditioning,"
			+"automatic_air_conditioning,"
			+"temperature_zone_control,"
			+"standard_rear_seat_outlet,"
			+"dust_pollen_filter,"
			+"independent_refrigeration_space,"
			+"car_refrigerator,"
			+"leather_seats,"
			+"mixedmaterial_seat,"
			+"sport_seats,"
			+"driverside_seat_adjuster,"
			+"seat_height_adjustment,"
			+"seat_lumbar_support_adjustment,"
			+"the_rear_seats_down_ratio,"
			+"rear_seat_adjuster,"
			+"electric_seat_memory,"
			+"seat_massage,"
			+"seat_ventilation,"
			+"heated_front_seats,"
			+"rear_seat_heating,"
			+"front_seat_center_armrest,"
			+"rear_center_armrest,"
			+"singledisc_cd,"
			+"multidisc_cd_system,"
			+"singledisc_dvd,"
			+"multidisc_dvd_system,"
			+"cd_compatible_with_mp3_wma_format,"
			+"an_external_audio_interface,"
			+"number_of_speakers,"
			+"audio_brand,"
			+"bluetooth_intercom_system,"
			+"gps_navigation_system,"
			+"car_tv,"
			+"rear_lcd_screen,"
			+"hard_drivebased_multimedia_systems,"
			+"car_humancomputer_interaction_systems,"
			+"multimedia_features_configuration,"
			+"other_configurations)"  
			+ " values(" 
			+"'"+param_item.getTitle()+"',"
			+"'"+param_item.getCartype()+"',"
			+"'"+param_item.getPrice()+"',"
			
			+"'"+cartype_item.getBrandId()+"',"
			+"'"+cartype_item.getBrand()+"',"
			+"'"+cartype_item.getCarTypeId()+"',"
			+"'"+cartype_item.getCarType()+"',"
			
			+"'"+param_item.getCarParamtersdb().get("van")+"',"
			+"'"+param_item.getCarParamtersdb().get("domestic_time_to_market")+"',"
			+"'"+param_item.getCarParamtersdb().get("style_year")+"',"
			+"'"+param_item.getCarParamtersdb().get("the_vehicle_warranty_period")+"',"
			+"'"+param_item.getCarParamtersdb().get("routine_maintenance_intervals")+"',"
			+"'"+param_item.getCarParamtersdb().get("manufacturers_guide_price")+"',"
			+"'"+param_item.getCarParamtersdb().get("lengt")+"',"
			+"'"+param_item.getCarParamtersdb().get("width")+"',"
			+"'"+param_item.getCarParamtersdb().get("height")+"',"
			+"'"+param_item.getCarParamtersdb().get("front_track")+"',"
			+"'"+param_item.getCarParamtersdb().get("rear_track")+"',"
			+"'"+param_item.getCarParamtersdb().get("wheelbase")+"',"
			+"'"+param_item.getCarParamtersdb().get("minimum_ground_clearance")+"',"
			+"'"+param_item.getCarParamtersdb().get("minimum_turning_diameter")+"',"
			+"'"+param_item.getCarParamtersdb().get("weight")+"',"
			+"'"+param_item.getCarParamtersdb().get("body_structure")+"',"
			+"'"+param_item.getCarParamtersdb().get("roof_form_of")+"',"
			+"'"+param_item.getCarParamtersdb().get("hood_to_open_coway")+"',"
			+"'"+param_item.getCarParamtersdb().get("hood_opening_and_closing_time")+"',"
			+"'"+param_item.getCarParamtersdb().get("door_number")+"',"
			+"'"+param_item.getCarParamtersdb().get("number_of_seats")+"',"
			+"'"+param_item.getCarParamtersdb().get("approach_angle")+"',"
			+"'"+param_item.getCarParamtersdb().get("departure_angle")+"',"
			+"'"+param_item.getCarParamtersdb().get("drag_coefficient")+"',"
			+"'"+param_item.getCarParamtersdb().get("maximum_wading_depth")+"',"
			+"'"+param_item.getCarParamtersdb().get("fuel_tank_capacity")+"',"
			+"'"+param_item.getCarParamtersdb().get("luggage_compartment_capacity")+"',"
			+"'"+param_item.getCarParamtersdb().get("cylinder_volume")+"',"
			+"'"+param_item.getCarParamtersdb().get("displacement")+"',"
			+"'"+param_item.getCarParamtersdb().get("workway")+"',"
			+"'"+param_item.getCarParamtersdb().get("cylinder_arrangement_form")+"',"
			+"'"+param_item.getCarParamtersdb().get("number_of_cylinders")+"',"
			+"'"+param_item.getCarParamtersdb().get("the_number_of_valves_per_cylinder")+"',"
			+"'"+param_item.getCarParamtersdb().get("compression_ratio")+"',"
			+"'"+param_item.getCarParamtersdb().get("valve_in_the_form")+"',"
			+"'"+param_item.getCarParamtersdb().get("engine_power")+"',"
			+"'"+param_item.getCarParamtersdb().get("motor_power")+"',"
			+"'"+param_item.getCarParamtersdb().get("total_power")+"',"
			+"'"+param_item.getCarParamtersdb().get("maximum_engine_torque")+"',"
			+"'"+param_item.getCarParamtersdb().get("motor_maximum_torque")+"',"
			+"'"+param_item.getCarParamtersdb().get("torque")+"',"
			+"'"+param_item.getCarParamtersdb().get("engine_manufacturers_model")+"',"
			+"'"+param_item.getCarParamtersdb().get("unique_technology_of_the_engine")+"',"
			+"'"+param_item.getCarParamtersdb().get("cylinder_head_material")+"',"
			+"'"+param_item.getCarParamtersdb().get("cylinder_materials")+"',"
			+"'"+param_item.getCarParamtersdb().get("fuel_and_label")+"',"
			+"'"+param_item.getCarParamtersdb().get("fuel_supply")+"',"
			+"'"+param_item.getCarParamtersdb().get("environmental_standards")+"',"
			+"'"+param_item.getCarParamtersdb().get("official_fuel_consumption")+"',"
			+"'"+param_item.getCarParamtersdb().get("maximum_speed")+"',"
			+"'"+param_item.getCarParamtersdb().get("official_0to100_acceleration_time")+"',"
			+"'"+param_item.getCarParamtersdb().get("gear_number")+"',"
			+"'"+param_item.getCarParamtersdb().get("transmission_in_the_form")+"',"
			+"'"+param_item.getCarParamtersdb().get("four_wheel_drive_type")+"',"
			+"'"+param_item.getCarParamtersdb().get("the_central_differential_lock")+"',"
			+"'"+param_item.getCarParamtersdb().get("front_axle_differential_lock")+"',"
			+"'"+param_item.getCarParamtersdb().get("rear_axle_differential_lock")+"',"
			+"'"+param_item.getCarParamtersdb().get("driven_approach")+"',"
			+"'"+param_item.getCarParamtersdb().get("front_suspension_format")+"',"
			+"'"+param_item.getCarParamtersdb().get("rear_suspension_form")+"',"
			+"'"+param_item.getCarParamtersdb().get("front_brake_type")+"',"
			+"'"+param_item.getCarParamtersdb().get("rear_brake_type")+"',"
			+"'"+param_item.getCarParamtersdb().get("power_steering_type")+"',"
			+"'"+param_item.getCarParamtersdb().get("front_tire_specifications")+"',"
			+"'"+param_item.getCarParamtersdb().get("rear_tire_specifications")+"',"
			+"'"+param_item.getCarParamtersdb().get("rim_material")+"',"
			+"'"+param_item.getCarParamtersdb().get("spare_tire_specifications")+"',"
			+"'"+param_item.getCarParamtersdb().get("driverside_airbag")+"',"
			+"'"+param_item.getCarParamtersdb().get("copilot_airbag")+"',"
			+"'"+param_item.getCarParamtersdb().get("side_airbags")+"',"
			+"'"+param_item.getCarParamtersdb().get("side_curtain_airbags")+"',"
			+"'"+param_item.getCarParamtersdb().get("knee_airbag")+"',"
			+"'"+param_item.getCarParamtersdb().get("the_number_of_airbags_curtain")+"',"
			+"'"+param_item.getCarParamtersdb().get("parking_sensor")+"',"
			+"'"+param_item.getCarParamtersdb().get("visual_reverse_image")+"',"
			+"'"+param_item.getCarParamtersdb().get("panoramic_camera")+"',"
			+"'"+param_item.getCarParamtersdb().get("seat_belt_is_not_the_department_of_prompt")+"',"
			+"'"+param_item.getCarParamtersdb().get("electronic_antitheft")+"',"
			+"'"+param_item.getCarParamtersdb().get("car_central_locking")+"',"
			+"'"+param_item.getCarParamtersdb().get("remote_keyless_entry")+"',"
			+"'"+param_item.getCarParamtersdb().get("keyless_start_system")+"',"
			+"'"+param_item.getCarParamtersdb().get("zero_pressure_continued_line_system")+"',"
			+"'"+param_item.getCarParamtersdb().get("tire_pressure_monitoring_system")+"',"
			+"'"+param_item.getCarParamtersdb().get("automatic_parking_into_place")+"',"
			+"'"+param_item.getCarParamtersdb().get("characteristic_configuration_of_the_security_class")+"',"
			+"'"+param_item.getCarParamtersdb().get("abs_antilock")+"',"
			+"'"+param_item.getCarParamtersdb().get("ebd_brake_force_distribution")+"',"
			+"'"+param_item.getCarParamtersdb().get("tcs__asr__trc_traction")+"',"
			+"'"+param_item.getCarParamtersdb().get("esp__vdc__vsc__dsc_etc")+"',"
			+"'"+param_item.getCarParamtersdb().get("eba__ba__bas_brake_auxiliary")+"',"
			+"'"+param_item.getCarParamtersdb().get("cruise_control")+"',"
			+"'"+param_item.getCarParamtersdb().get("eds_electronic_differential_brake")+"',"
			+"'"+param_item.getCarParamtersdb().get("active_body_control")+"',"
			+"'"+param_item.getCarParamtersdb().get("electronic_automatic_parking_brake_system")+"',"
			+"'"+param_item.getCarParamtersdb().get("hill_assist_hac")+"',"
			+"'"+param_item.getCarParamtersdb().get("the_descent_hdc")+"',"
			+"'"+param_item.getCarParamtersdb().get("body_height_adjustable")+"',"
			+"'"+param_item.getCarParamtersdb().get("air_suspension")+"',"
			+"'"+param_item.getCarParamtersdb().get("active_steering_system")+"',"
			+"'"+param_item.getCarParamtersdb().get("manipulate_a_characteristic_configuration")+"',"
			+"'"+param_item.getCarParamtersdb().get("electric_sunroof")+"',"
			+"'"+param_item.getCarParamtersdb().get("panoramic_sunroof")+"',"
			+"'"+param_item.getCarParamtersdb().get("the_luggage_compartment_opening_and_closing_mode")+"',"
			+"'"+param_item.getCarParamtersdb().get("the_tank_cover_open_the_way")+"',"
			+"'"+param_item.getCarParamtersdb().get("wipers_before_the_rainsensing_type")+"',"
			+"'"+param_item.getCarParamtersdb().get("rear_wiper")+"',"
			+"'"+param_item.getCarParamtersdb().get("body_color")+"',"
			+"'"+param_item.getCarParamtersdb().get("leather_steering_wheel")+"',"
			+"'"+param_item.getCarParamtersdb().get("multifunction_steering_wheel")+"',"
			+"'"+param_item.getCarParamtersdb().get("steering_wheel_shift")+"',"
			+"'"+param_item.getCarParamtersdb().get("steering_wheel_adjustment")+"',"
			+"'"+param_item.getCarParamtersdb().get("outside_temperature_display")+"',"
			+"'"+param_item.getCarParamtersdb().get("instrument_display_form")+"',"
			+"'"+param_item.getCarParamtersdb().get("fuel_consumption_display")+"',"
			+"'"+param_item.getCarParamtersdb().get("hud_looked_up_display_system")+"',"
			+"'"+param_item.getCarParamtersdb().get("night_vision_systems")+"',"
			+"'"+param_item.getCarParamtersdb().get("rear_side_window_shades")+"',"
			+"'"+param_item.getCarParamtersdb().get("after_the_windshield_sunshade")+"',"
			+"'"+param_item.getCarParamtersdb().get("headlamp_type")+"',"
			+"'"+param_item.getCarParamtersdb().get("front_fog_lamps")+"',"
			+"'"+param_item.getCarParamtersdb().get("the_headlamps_interior_height_adjustment")+"',"
			+"'"+param_item.getCarParamtersdb().get("headlight_cleaning_function")+"',"
			+"'"+param_item.getCarParamtersdb().get("exterior_lights_turn_off_delay_function")+"',"
			+"'"+param_item.getCarParamtersdb().get("lightsensitive_autoheadlights")+"',"
			+"'"+param_item.getCarParamtersdb().get("headlamps_with_dynamic_steering")+"',"
			+"'"+param_item.getCarParamtersdb().get("former_power_windows")+"',"
			+"'"+param_item.getCarParamtersdb().get("after_the_electric_windows")+"',"
			+"'"+param_item.getCarParamtersdb().get("the_windows_fangga_hand_function")+"',"
			+"'"+param_item.getCarParamtersdb().get("exterior_mirror_adjustment")+"',"
			+"'"+param_item.getCarParamtersdb().get("exterior_mirror_heating")+"',"
			+"'"+param_item.getCarParamtersdb().get("electric_folding_exterior_mirrors")+"',"
			+"'"+param_item.getCarParamtersdb().get("automatic_antiglare_interior_mirror")+"',"
			+"'"+param_item.getCarParamtersdb().get("manual_airconditioning")+"',"
			+"'"+param_item.getCarParamtersdb().get("automatic_air_conditioning")+"',"
			+"'"+param_item.getCarParamtersdb().get("temperature_zone_control")+"',"
			+"'"+param_item.getCarParamtersdb().get("standard_rear_seat_outlet")+"',"
			+"'"+param_item.getCarParamtersdb().get("dust_pollen_filter")+"',"
			+"'"+param_item.getCarParamtersdb().get("independent_refrigeration_space")+"',"
			+"'"+param_item.getCarParamtersdb().get("car_refrigerator")+"',"
			+"'"+param_item.getCarParamtersdb().get("leather_seats")+"',"
			+"'"+param_item.getCarParamtersdb().get("mixedmaterial_seat")+"',"
			+"'"+param_item.getCarParamtersdb().get("sport_seats")+"',"
			+"'"+param_item.getCarParamtersdb().get("driverside_seat_adjuster")+"',"
			+"'"+param_item.getCarParamtersdb().get("seat_height_adjustment")+"',"
			+"'"+param_item.getCarParamtersdb().get("seat_lumbar_support_adjustment")+"',"
			+"'"+param_item.getCarParamtersdb().get("the_rear_seats_down_ratio")+"',"
			+"'"+param_item.getCarParamtersdb().get("rear_seat_adjuster")+"',"
			+"'"+param_item.getCarParamtersdb().get("electric_seat_memory")+"',"
			+"'"+param_item.getCarParamtersdb().get("seat_massage")+"',"
			+"'"+param_item.getCarParamtersdb().get("seat_ventilation")+"',"
			+"'"+param_item.getCarParamtersdb().get("heated_front_seats")+"',"
			+"'"+param_item.getCarParamtersdb().get("rear_seat_heating")+"',"
			+"'"+param_item.getCarParamtersdb().get("front_seat_center_armrest")+"',"
			+"'"+param_item.getCarParamtersdb().get("rear_center_armrest")+"',"
			+"'"+param_item.getCarParamtersdb().get("singledisc_cd")+"',"
			+"'"+param_item.getCarParamtersdb().get("multidisc_cd_system")+"',"
			+"'"+param_item.getCarParamtersdb().get("singledisc_dvd")+"',"
			+"'"+param_item.getCarParamtersdb().get("multidisc_dvd_system")+"',"
			+"'"+param_item.getCarParamtersdb().get("cd_compatible_with_mp3_wma_format")+"',"
			+"'"+param_item.getCarParamtersdb().get("an_external_audio_interface")+"',"
			+"'"+param_item.getCarParamtersdb().get("number_of_speakers")+"',"
			+"'"+param_item.getCarParamtersdb().get("audio_brand")+"',"
			+"'"+param_item.getCarParamtersdb().get("bluetooth_intercom_system")+"',"
			+"'"+param_item.getCarParamtersdb().get("gps_navigation_system")+"',"
			+"'"+param_item.getCarParamtersdb().get("car_tv")+"',"
			+"'"+param_item.getCarParamtersdb().get("rear_lcd_screen")+"',"
			+"'"+param_item.getCarParamtersdb().get("hard_drivebased_multimedia_systems")+"',"
			+"'"+param_item.getCarParamtersdb().get("car_humancomputer_interaction_systems")+"',"
			+"'"+param_item.getCarParamtersdb().get("multimedia_features_configuration")+"',"
			+"'"+param_item.getCarParamtersdb().get("other_configurations")+"'"

			+ ")";
		
		int result = -1;
		System.out.println(sql);
		
		try {
			statement = conn.createStatement();
			result = statement.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return result;
	}

	public static List<SubCarType> getExtractUrlList() {
		Statement statement = null;
		Connection conn = DBManager.getConnection();

		List<SubCarType> urllist = new ArrayList<SubCarType>();
		try {
			statement = conn.createStatement();
			String sql = "select * from temp where flag='no'";
		//	String sql = "select * from temp where id='8'";
			ResultSet resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {
				SubCarType item = new SubCarType();
				int id = resultSet.getInt("ID");
				String brand_id = resultSet.getString("BRAND_ID");
				String brand = resultSet.getString("BRAND");
				String cartype_id = resultSet.getString("CARTYPE_ID");
				String cartype = resultSet.getString("CARTYPE");
				String url = resultSet.getString("DISPLACEMENT_URL");

				item.setId(id);
				item.setBrandId(brand_id);
				item.setBrand(brand);
				item.setCarType(cartype);
				item.setCarTypeId(cartype_id);
				item.setUrl(url);

				urllist.add(item);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				statement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return urllist;
	}

	// 读取一个车的配置参数页
	public static void getParameterConfigurationByOneCarUrl(String resource)
			throws Exception {
		int count = 0;
		String title = "";
		Parser titleParser = new Parser(resource);
		titleParser.setEncoding("GBK");
		String titlefilterStr = "div";
		NodeFilter titlefilter = new TagNameFilter(titlefilterStr);
		NodeList nodetitleList = titleParser
				.extractAllNodesThatMatch(titlefilter);
		/*
		 * <div id="xxpeizhi" class="mod"> <div class="hd"><h4>奥迪Q7 2012款
		 * 柴油6.0TDI AT四驱旗舰型 详细参数配置</h4>
		 */
		for (int p = 0; p < nodetitleList.size(); p++) {
			Div div = (Div) nodetitleList.elementAt(p);
			String divid = div.getAttribute("id");
			String divclass = div.getAttribute("class");
			if (divid == null) {
				divid = "";
			}
			if (divclass == null) {
				divclass = "";
			}
			if (divid.equalsIgnoreCase("xxpeizhi")
					&& divclass.equalsIgnoreCase("mod")) {
				Parser divParser = new Parser(div.getChildrenHTML());
				NodeList nodethList = divParser
						.extractAllNodesThatMatch(titlefilter);
				title = nodethList.elementAt(0).getChildren().elementAt(0)
						.getChildren().elementAt(0).getText();
				System.out.println(title);
			}
		}

		Parser myParser = new Parser(resource);
		myParser.setEncoding("GBK");
		String filterStr = "table";
		NodeFilter filter = new TagNameFilter(filterStr);
		NodeList nodeList = myParser.extractAllNodesThatMatch(filter);
		for (int i = 0; i < nodeList.size(); i++) {
			TableTag tabletag = (TableTag) nodeList.elementAt(i);
			// 标签名称
			TableRow[] rows = tabletag.getRows();
			String header = "";
			for (int j = 0; j < rows.length; j++) {
				TableRow tr = (TableRow) rows[j];
				// 获取 <tr class="header"> <th><p>发动机类参数</p></th>
				if (tr.getAttributeEx("class") != null) {
					if (tr.getAttribute("class").equalsIgnoreCase("header")) {
						Parser thParser = new Parser(tr.toHtml());
						String thfilterStr = "th";
						NodeFilter thfilter = new TagNameFilter(thfilterStr);
						NodeList nodethList = thParser
								.extractAllNodesThatMatch(thfilter);
						header = nodethList.elementAt(0).getChildren()
								.elementAt(0).getChildren().elementAt(0)
								.getText();
						System.out.println("==============" + header
								+ "==============");
					}
				}
				/*
				 * <tr> <td class="odd">排气量(L)</td> <td class="dataset">5.9</td>
				 * <td class="odd">气缸排列形式</td> <td class="dataset">V型</td> <td
				 * class="odd">气缸数(个)</td> <td class="dataset">12</td> </tr>
				 */
				TableColumn[] td = tr.getColumns();
				for (int k = 0; k < td.length; k++) {
					if (td[k].getAttribute("class").equalsIgnoreCase("odd")) {
						System.out.print(td[k].toPlainTextString() + "   ");
						count = count + 1;
					} else if (td[k].getAttribute("class").equalsIgnoreCase(
							"dataset")) {
						String value = td[k].toPlainTextString();
						System.out.println(getValueBySymbol(value));
					}
				}
			}
		}
		System.out.println(count);
	}

}
