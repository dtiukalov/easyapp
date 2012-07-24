package com.customer.foton.picture.stylepicture;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.customer.foton.picture.exception.FotonOperationException;
import com.customer.foton.picture.util.ComponentUtils;
import com.customer.foton.picture.util.PictureItemInfo;
import com.customer.foton.picture.util.PictureUploadUtil;
import com.customer.foton.picture.util.LogUtil;
import com.teamcenter.rac.aif.AIFDesktop;
import com.teamcenter.rac.aif.kernel.InterfaceAIFComponent;
import com.teamcenter.rac.commands.newdataset.NewDatasetOperation;
import com.teamcenter.rac.commands.newitem.IdUtils;
import com.teamcenter.rac.kernel.TCComponentDataset;
import com.teamcenter.rac.kernel.TCComponentDatasetType;
import com.teamcenter.rac.kernel.TCComponentItem;
import com.teamcenter.rac.kernel.TCComponentItemRevision;
import com.teamcenter.rac.kernel.TCComponentItemType;
import com.teamcenter.rac.kernel.TCException;
import com.teamcenter.rac.kernel.TCSession;

public class StylePictureOperation {

	private static final String ITEM_PREFIX = "f6_"; //$NON-NLS-1$

	private static final String ITEM_TYPE_F6_PICTURE = "F6_Picture"; //$NON-NLS-1$

	private static final String ITEM_REVISION = "A"; //$NON-NLS-1$

	private static final String LOV_COUNTRY = ITEM_PREFIX + "Country"; //$NON-NLS-1$

	private static final String LOV_BAND = ITEM_PREFIX + "Band"; //$NON-NLS-1$

	private static final String LOV_SUB_BAND = ITEM_PREFIX + "SubBand"; //$NON-NLS-1$

	private static final String LOV_YEAR = ITEM_PREFIX + "Year"; //$NON-NLS-1$

	private static final String LOV_INTER_OUTER = ITEM_PREFIX + "InterOunter"; //$NON-NLS-1$

	private static final String LOV_ANGLE = ITEM_PREFIX + "Angle"; //$NON-NLS-1$

	private static final String LOV_OUTER = ITEM_PREFIX + "Outer"; //$NON-NLS-1$

	private static final String LOV_INTER = ITEM_PREFIX + "Inter"; //$NON-NLS-1$

	private static final String LOV_CAR_TYPE = ITEM_PREFIX + "CarType"; //$NON-NLS-1$

	private static final String BLANK = ""; //$NON-NLS-1$

	private static StringBuffer logInfo = new StringBuffer();

	public StylePictureOperation() {

	}

	public static void execute(HashMap<String, Object> parameters)
			throws FotonOperationException {
		Map<TCComponentItem, NewDatasetOperation[]> itemMap = new HashMap<TCComponentItem, NewDatasetOperation[]>();
		List<TCComponentItem> itemList = new LinkedList<TCComponentItem>();
		TCSession session = (TCSession) parameters.get("session"); //$NON-NLS-1$
		InterfaceAIFComponent pasteTargets[] = (InterfaceAIFComponent[]) parameters
				.get("pasteTargets"); //$NON-NLS-1$
		AIFDesktop desktop = (AIFDesktop) parameters.get("desktop"); //$NON-NLS-1$
		String picturePath = (String) parameters.get("picturePath"); //$NON-NLS-1$
		int count = 0;
		try {
			IdUtils idutils = new IdUtils(session);

			List<PictureItemInfo> list = PictureUploadUtil
					.getPictureItemInfo(picturePath);
			for(PictureItemInfo item: list) {
				System.out.println(item.getInfoString());
			}
			logInfo.append(LogUtil.initLogHead());
			logInfo
					.append("[info ] : " + Messages.getString("StylePictureOperation.getJPG") + list.size() + Messages.getString("StylePictureOperation.ge") + LogUtil.enter); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$

			for (PictureItemInfo itemInfo : list) {

				String itemId = idutils.generateId(ITEM_TYPE_F6_PICTURE); // 生成itemId流水号

				TCComponentItem componentItem = ((TCComponentItemType) session
						.getTypeComponent(ITEM_TYPE_F6_PICTURE)).create(itemId,
						ITEM_REVISION, ITEM_TYPE_F6_PICTURE, itemInfo
								.getJpgName().substring(0,
										itemInfo.getJpgName().length() - 4),
						BLANK, null);
				try {

					TCComponentItemRevision itemRevision = componentItem
							.getLatestItemRevision();

					// InterfaceAIFComponent[] target =
					// (InterfaceAIFComponent[]) new InterfaceAIFComponent[] {
					// itemRevision };

					// TCComponentDatasetType dataSetType
					// =(TCComponentDatasetType)
					// session.getTypeComponent("Dataset");

					// TCComponentDataset newDrawingDs =
					// dataSetType.create(itemId,"upload " +
					// itemInfo.getJpgName(),"JPEG");

					TCComponentDatasetType datasettype = (TCComponentDatasetType) session
							.getTypeComponent("Dataset"); //$NON-NLS-1$
					TCComponentDataset dateSet = datasettype.create(itemId,
							"upload " + itemInfo.getJpgName(), "F6_StylePicture"); //$NON-NLS-1$ //$NON-NLS-2$  F6_StylePicture
					
					String[] filePath = new String[1];
					String[] fileType = new String[1];
					filePath[0] = itemInfo.getJpgPath();
					fileType[0] = "F6_StylePicture"; // 这个地方要写数据集打开的格式JPEG_Reference
					// //$NON-NLS-1$					
					dateSet.setFiles(filePath, fileType);
					itemRevision.add("IMAN_specification", dateSet); //$NON-NLS-1$

					TCComponentDataset spdateSet = datasettype
							.create(
									"sp_" + itemId, "upload " + itemInfo.getSp_jpgName(), "F6_StylePicture"); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$  F6_StylePicture
					String[] spfilePath = new String[1];
					String[] spfileType = new String[1];
					spfilePath[0] = itemInfo.getSp_jpgPath();
					spfileType[0] = "F6_StylePicture"; // 这个地方要写数据集打开的格式
					// //$NON-NLS-1$

					spdateSet.setFiles(spfilePath, spfileType);
					itemRevision.add("IMAN_specification", spdateSet); //$NON-NLS-1$
					// newDrawingDs.setDefaultTool()
					// TCComponentTcFile tcFile =
					// newDrawingDs.setFiles(arg0, arg1);

					/*
					 * NewDatasetOperation newDatasetOp = new
					 * NewDatasetOperation( session, desktop, itemId, "upload " +
					 * itemInfo.getJpgName(), null, null, "JPEG", "JPEG_Tool",
					 * false, itemInfo.getJpgPath(), "Binary", "JPEG_Reference",
					 * false, target);
					 * 
					 * NewDatasetOperation sp_newDatasetOp = new
					 * NewDatasetOperation( session, desktop, "sp_" + itemId,
					 * "upload " + itemInfo.getSp_jpgName(), null, null, "JPEG",
					 * "JPEG_Tool", false, itemInfo .getSp_jpgPath(), "Binary",
					 * "JPEG_Reference", false, target);
					 */

					/*
					 * NewDatasetOperation[] jpgs = { newDatasetOp,
					 * sp_newDatasetOp };
					 */

					itemRevision.setProperty(LOV_CAR_TYPE, itemInfo
							.getCarType());
					itemRevision
							.setProperty(LOV_COUNTRY, itemInfo.getCountry());
					itemRevision.setProperty(LOV_BAND, itemInfo.getBand());
					itemRevision.setProperty(LOV_SUB_BAND, itemInfo
							.getSubBand());
					itemRevision.setProperty(LOV_YEAR, itemInfo.getYear());
					itemRevision.setProperty(LOV_INTER_OUTER, itemInfo
							.getInterOunter());
					// itemRevision.add("IMAN_reference",ComponentUtils.findDatasetJPEGByName(session,itemId));
					if (PictureUploadUtil.INNTER.equals(itemInfo
							.getInterOunter())) {
						if (!"".equals(itemInfo.getInter())) {
							itemRevision.setProperty(LOV_INTER, itemInfo
									.getInter());
						}
					}

					if (PictureUploadUtil.OUTER.equals(itemInfo
							.getInterOunter())) {
						if (!"".equals(itemInfo.getOuter())) {
							itemRevision.setProperty(LOV_OUTER, itemInfo
									.getOuter());
						}
					}
					if (!"".equals(itemInfo.getAngle())) {
						itemRevision
								.setProperty(LOV_ANGLE, itemInfo.getAngle());
					}
					// itemMap.put(componentItem, jpgs);
					itemList.add(componentItem);
					count++;
					logInfo
							.append("[info ] : " + itemInfo.getInfoString() + LogUtil.enter); //$NON-NLS-1$
				} catch (TCException e) {
					logInfo.append("[error] : " + "can not set value  " //$NON-NLS-1$ //$NON-NLS-2$
							+ itemInfo.getInfoString()
							+ "  please check the data is right!" //$NON-NLS-1$
							+ e.getMessage() + LogUtil.enter);
					System.out.println("can not set value : " //$NON-NLS-1$
							+ itemInfo.getInfoString()
							+ " please check the data is right!" //$NON-NLS-1$
							+ e.getMessage());
					e.printStackTrace();
					componentItem.delete();
					continue;
				}
			}
			logInfo
					.append("[info ] : " + Messages.getString("StylePictureOperation.uploadJPG") + count + Messages.getString("StylePictureOperation.ge") + LogUtil.enter); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
			for (TCComponentItem key : itemList) {
				ComponentUtils.paste(key, pasteTargets, desktop);
				/*
				 * session .queueOperation((NewDatasetOperation)
				 * itemMap.get(key)[0]); session
				 * .queueOperation((NewDatasetOperation) itemMap.get(key)[1]);
				 */
			}
			LogUtil.writeTxtFile(LogUtil.creatTxtFile(LogUtil.loggerPath),
					logInfo.toString());
		} catch (Exception e) {
			throw new FotonOperationException(Messages
					.getString("StylePictureOperation.conform"));
			// MessageBox.post(Messages.getString("StylePictureOperation.conform"),
			// "error", MessageBox.ERROR); //$NON-NLS-1$ //$NON-NLS-2$
			// e.printStackTrace();
		}

	}
}
