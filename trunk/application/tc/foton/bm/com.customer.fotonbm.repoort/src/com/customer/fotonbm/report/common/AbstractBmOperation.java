package com.customer.fotonbm.report.common;

import java.util.HashMap;
import java.util.Map;

import com.customer.fotonbm.report.exception.BmModelException;
import com.customer.fotonbm.report.form.FormManager;
import com.customer.fotonbm.report.utils.PrintLog;
import com.customer.fotonbm.report.utils.tc.ComponentUtils;
import com.teamcenter.rac.aif.AbstractAIFOperation;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.kernel.TCComponent;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCSession;

/**
 * 竞品车业务模型抽象类,完成以下任务: <li>完成对所有竞品车组件的搜索; <li>提供根据条件查询子组件信息的功能;
 */
public abstract class AbstractBmOperation extends AbstractAIFOperation {

	private TCSession session = null;

	private Map<String, InterfaceAIFComponent> bmVehicleCompetes = new HashMap<String, InterfaceAIFComponent>();//  竞品车列表

	public static final String BM_ITEM_TYPE_VEHICLE_COMPETE = "FV9FAWBMVehC";//  竞品车Item类型

	public PrintLog printlog;
	
	public AbstractBmOperation(TCSession session, PrintLog printlog) {
		this.session = session;
		this.printlog = printlog;
		this.findBmItems();
	}
	
	public void findBmItems() {
		try {
			TCComponent[] components = ComponentUtils
					.findTCComponentItemByType(this.session,
							BM_ITEM_TYPE_VEHICLE_COMPETE);
			if (components != null) {
				for (TCComponent component : components) {
					String itemId = component.getProperty("item_id");
					String name = component.getProperty("object_name");
					String key = itemId + "-" + name;

					getBmVehicleCompetes().put(key, component);
				}
			}
		} catch (TCException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void executeOperation() throws Exception {
		this.generateExcel();
	}

	/**
	 * 生成对应业务的Excel
	 */
	public abstract void generateExcel() throws Exception;

	/**
	 * Excel模版路径
	 */
	public String getImportFileName() {
		return this.getImportFilePath() + this.getFileName();
	}

	/**
	 * Excel模版名称
	 */
	public abstract String getFileName();

	/**
	 * 把生成的excel放在当前系统默认缓存下
	 */
	private String getImportFilePath() {
		return System.getProperty("java.io.tmpdir"); //$NON-NLS-1$
	}

	/**
	 * 根据用户选择组件信息,解析业务数据
	 * @param args用户输入参数列表
	 * @return 生成key-value的业务数据
	 */
	public abstract Map<String, Object> getModuleData(Object[] args)
			throws Exception;

	public InterfaceAIFComponent getChildComponent(
			InterfaceAIFComponent parentComponent, String type,
			String propertyKey, String propertyValue) throws Exception {

		return ComponentUtils.getChildComponent(parentComponent, type,
				propertyKey, propertyValue);
	}

	/**
	 * 获取竞品车compete对象下 类型是type的Form表单数据 
	 * @param compete 竞品车 
	 * @param type Form表单类型名称  
	 * @param notFoundMessage 自定义找不到表单的弹出对话框显示信息
	 * @return 生成key-value的业务数据
	 */

	public Map<String, Object> getChildComponentValue(
			InterfaceAIFComponent compete, String type, String notFoundMessage) throws Exception, BmModelException {

		InterfaceAIFComponent component = this.getChildComponent(compete, type,
				null, null);
		String componetName = compete.getProperty("object_name");

		if (component == null && notFoundMessage != null) {
			printlog.println(notFoundMessage + componetName);
			throw new BmModelException(notFoundMessage + componetName);
		}

		Map<String, Object> componentValues = FormManager.getInstance()
				.loadForm(type, component);
		
		componentValues.put("object_name", componetName);

		return componentValues;
	}

	public Map<String, InterfaceAIFComponent> getBmVehicleCompetes(
			String bomType) {
		Map<String, InterfaceAIFComponent> competes = new HashMap<String, InterfaceAIFComponent>();

		for (String key : this.bmVehicleCompetes.keySet()) {
			try {
				InterfaceAIFComponent component = this.bmVehicleCompetes
						.get(key);
				if (component != null) {
					String itemId = component.getProperty("item_id");
					if (itemId.endsWith(bomType)) {
						competes.put(key, this.bmVehicleCompetes.get(key));
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return competes;
	}

	public Map<String, InterfaceAIFComponent> getBmVehicleCompetes() {
		return bmVehicleCompetes;
	}

}
