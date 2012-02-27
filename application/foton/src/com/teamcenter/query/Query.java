package com.teamcenter.query;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.teamcenter.clientx.Session;
import com.teamcenter.schemas.soa._2006_03.exceptions.ServiceException;
import com.teamcenter.services.strong.core.DataManagementService;
import com.teamcenter.services.strong.core.LOVService;
import com.teamcenter.services.strong.core._2007_06.LOV.AttachedLOVsResponse;
import com.teamcenter.services.strong.core._2007_06.LOV.LOVInfo;
import com.teamcenter.services.strong.query.SavedQueryService;
import com.teamcenter.services.strong.query._2006_03.SavedQuery.GetSavedQueriesResponse;
import com.teamcenter.services.strong.query._2007_06.SavedQuery.ExecuteSavedQueriesResponse;
import com.teamcenter.services.strong.query._2007_06.SavedQuery.SavedQueryInput;
import com.teamcenter.services.strong.query._2007_06.SavedQuery.SavedQueryResults;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.Property;
import com.teamcenter.soa.client.model.strong.Dataset;
import com.teamcenter.soa.client.model.strong.ImanQuery;
import com.teamcenter.soa.client.model.strong.Item;
import com.teamcenter.soa.client.model.strong.ItemRevision;
import com.teamcenter.soa.client.model.strong.ListOfValuesString;
import com.teamcenter.soa.exceptions.NotLoadedException;

import foton.picture.exception.FutianTCQueryException;
import foton.picture.vo.PictureVO;
import foton.picture.util.IConstants;
import foton.picture.util.JPEGDownloadFromTC;
import foton.picture.util.PropertiesService;

public class Query {

	private SavedQueryService queryService = null;

	private ImanQuery query = null;

	private final static String QUERY_STYLE_PICTURE = Messages
			.getString("Query.stylePicture"); //$NON-NLS-1$

	private final static String QUERY_ITEM = "Item..."; //$NON-NLS-1$

	public Query() {
		if (Session.getConnection() != null) {
			this.queryService = SavedQueryService.getService(Session
					.getConnection());
		}
	}

	/**
	 * 调用TC中的“造型图片查询” 以“F6_PictureRevision”的属性值作为查询条件，查询所有符合条件的Item 返回List<PictureVO>
	 * 输入查询条件Map ：attributeMap 如果查询条件中没有输入值调用queryItemRevisionByType()
	 */
	public SavedQueryResults queryAllItemRevisionByAttribute(
			Map<String, Object> attributeMap) throws Exception {
		if (attributeMap == null) {
			return this.queryAllItemRevisionByType();
		}

		initQueryObject(QUERY_STYLE_PICTURE);
		List<String[]> list = initQueryAttributes(attributeMap);

		if (list == null) {
			return this.queryAllItemRevisionByType();
		}

		SavedQueryInput savedQueryInput[] = new SavedQueryInput[1];
		savedQueryInput[0] = new SavedQueryInput();
		savedQueryInput[0].query = this.query;
		// savedQueryInput[0].maxNumToReturn = 10000;
		// savedQueryInput[0].limitListCount = 0;
		savedQueryInput[0].limitList = new ModelObject[0];
		savedQueryInput[0].entries = list.get(0);
		savedQueryInput[0].values = list.get(1);
		// savedQueryInput[0].maxNumToInflate = 10000;

		ExecuteSavedQueriesResponse savedQueryResult = this.queryService
				.executeSavedQueries(savedQueryInput);
		SavedQueryResults found = savedQueryResult.arrayOfResults[0];
		return found;
	}

	/**
	 * 调用TC中的“零组件...” 查询类型是“F6_Picture”的所有Item， 返回SavedQueryResults
	 */
	public SavedQueryResults queryAllItemRevisionByType() throws Exception {
		initQueryObject(QUERY_ITEM);

		SavedQueryInput savedQueryInput[] = new SavedQueryInput[1];
		savedQueryInput[0] = new SavedQueryInput();
		savedQueryInput[0].query = this.query;
		// savedQueryInput[0].maxNumToReturn = 10000;
		// savedQueryInput[0].limitListCount = 0;
		savedQueryInput[0].limitList = new ModelObject[0];
		savedQueryInput[0].entries = new String[] { "Type" }; //$NON-NLS-1$
		savedQueryInput[0].values = new String[] { "F6_Picture" }; //$NON-NLS-1$
		// savedQueryInput[0].maxNumToInflate = 10000;

		ExecuteSavedQueriesResponse savedQueryResult = this.queryService
				.executeSavedQueries(savedQueryInput);
		SavedQueryResults found = savedQueryResult.arrayOfResults[0];
		return found;
	}

	/**
	 * 分页下载图片，
	 * 
	 * @param found
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PictureVO> getPictureVOByPage(SavedQueryResults found,
			int page, int perCount, HttpSession session) throws Exception {
		// System.out.println("found items:" + found.objects.length);
		// //$NON-NLS-1$
		SavedQueryResults foundResult = new SavedQueryResults();
		ModelObject[] modelObjects = new ModelObject[perCount];

		int begin = (page - 1) * perCount;
		int end = page * perCount - 1;

		if (found.numOfObjects - 1 < end) {
			end = found.numOfObjects - 1;
		}

		int i = 0;

		for (begin = (page - 1) * perCount; begin <= end; begin++) {
			modelObjects[i] = found.objects[begin];
			i++;
		}

		foundResult.objects = modelObjects;

		List<PictureVO> pictures = getPictureVOList(foundResult, session);
		return pictures;
	}

	/**
	 * 被queryItemRevisionByAttribute()和queryItemRevisionByType()调用
	 * 
	 * @param SavedQueryResults
	 * @return List<PictureVO>
	 * @throws Exception
	 */
	private List<PictureVO> getPictureVOList(SavedQueryResults found,
			HttpSession session) throws Exception {
		List<PictureVO> pictures = new ArrayList<PictureVO>();
		Map<String, PictureVO> sessionmap = (Map<String, PictureVO>) session
				.getAttribute("map");

		for (int i = 0; i < found.objects.length; i++) {
			if (!(found.objects[i] instanceof Item))
				continue;
			DataManagementService dataService = DataManagementService
					.getService(Session.getConnection());
			dataService
					.getProperties(found.objects, new String[] { "item_id",
							"item_revision", "revision_list",
							"displayable_revisions" });

			PictureVO pictureVO = new PictureVO();
			Item f6Item = (Item) found.objects[i];
			String itemKey = f6Item.get_item_id();

			if (session != null && sessionmap != null) {
				if (sessionmap.containsKey(itemKey)) {
					pictures.add(sessionmap.get(itemKey));
					continue;
				}
			}

			// 获取最后修改的版本

			ItemRevision f6_pictureRev = (ItemRevision) f6Item
					.get_revision_list()[f6Item.get_displayable_revisions().length - 1];
			dataService.getProperties(new ModelObject[] { f6_pictureRev },
					new String[] { "f6_Country", "f6_Band", "f6_SubBand",
							"f6_Year", "f6_InterOunter", "f6_Outer",
							"f6_Inter", "f6_CarType", "f6_Angle",
							"IMAN_reference", "IMAN_specification" });
			try {
				pictureVO.setCountry(f6_pictureRev
						.getPropertyDisplayableValue(IConstants.F6_COUNTRY));
				pictureVO.setAngle(f6_pictureRev
						.getPropertyDisplayableValue(IConstants.F6_ANGLE));
				pictureVO.setBand(f6_pictureRev
						.getPropertyDisplayableValue(IConstants.F6_BAND));
				pictureVO.setCarType(f6_pictureRev
						.getPropertyDisplayableValue(IConstants.F6_CAR_TYPE));
				pictureVO.setInter(f6_pictureRev
						.getPropertyDisplayableValue(IConstants.F6_INTER));
				pictureVO
						.setInterOunter(f6_pictureRev
								.getPropertyDisplayableValue(IConstants.F6_INTER_OUNTER));
				pictureVO.setOuter(f6_pictureRev
						.getPropertyDisplayableValue(IConstants.F6_OUTER));
				pictureVO.setYear(f6_pictureRev
						.getPropertyDisplayableValue(IConstants.F6_YEAR));
				pictureVO.setSubBand(f6_pictureRev
						.getPropertyDisplayableValue(IConstants.F6_SUB_BAND));
				pictureVO.setKey(itemKey);

				pictureVO.setJpg(null);
				pictureVO.setJpgName(IConstants.ERROR_PAGE_NAME);
				pictureVO.setSp_jpgName(IConstants.ERROR_PAGE_NAME);

				if (f6_pictureRev.get_IMAN_specification() != null) {
					if (f6_pictureRev.get_IMAN_specification().length > 0) {

						for (int p = 0; p < f6_pictureRev
								.get_IMAN_specification().length; p++) {
							ModelObject bom = f6_pictureRev
									.get_IMAN_specification()[p];
							if ("F6_StylePicture".equals(bom.getType()
									.getName())) {
								Dataset jpg = (Dataset) bom;
								dataService.getProperties(
										new ModelObject[] { jpg },
										new String[] { "object_name" });
								String name = jpg.get_object_name();
								if (name.startsWith("sp_")) {
									pictureVO.setSp_jpg(jpg);
									JPEGDownloadFromTC
											.downloadSPDatasets(
													jpg,
													(String) PropertiesService
															.getInstance()
															.getPropertyObject(
																	IConstants.DOWNLOAD_SP_JPEG_PATH),
													pictureVO);
								} else {
									pictureVO.setJpg(jpg);
									JPEGDownloadFromTC
											.downloadDatasets(
													jpg,
													(String) PropertiesService
															.getInstance()
															.getPropertyObject(
																	IConstants.DOWNLOAD_JPEG_PATH),
													pictureVO);
								}
							}
						}

					}
				} else {
					pictureVO.setJpg(null);
					pictureVO.setJpgName(IConstants.ERROR_PAGE_NAME);
					pictureVO.setSp_jpgName(IConstants.ERROR_PAGE_NAME);
				}
				// if(pictureVO.getJpg()!= null) {
				pictures.add(pictureVO);
				// }
				/*
				 * pictureVO.setCreateDateBefore(createDateBefore)
				 * pictureVO.setCreateDateAfter(createDateAfter)
				 * pictureVO.setOfferDateBefore(offerDateBefore)
				 * pictureVO.setOfferDateAfter(offerDateAfter)
				 * pictureVO.setUpdateDateBefore(updateDateBefore)
				 * pictureVO.setUpdateDateAfter(updateDateAfter)
				 */
			} catch (NotLoadedException e) {
				e.printStackTrace();
				throw new FutianTCQueryException(e.getMessage());
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				throw new FutianTCQueryException(e.getMessage());
			} catch (IOException e) {
				e.printStackTrace();
				throw new FutianTCQueryException(e.getMessage());
			}
		}
		return pictures;
	}

	/**
	 * 获取TC中已保存的查询
	 * 
	 * @param queryName
	 * @throws Exception
	 */
	private void initQueryObject(String queryName) throws Exception {
		try {
			if (this.queryService != null) {
				GetSavedQueriesResponse savedQueries = this.queryService
						.getSavedQueries();
				if (savedQueries.queries.length == 0) {
					throw new FutianTCQueryException(
							"There are no saved queries in the system."); //$NON-NLS-1$
				}

				for (int i = 0; i < savedQueries.queries.length; i++) {
					if (savedQueries.queries[i].name.equals(queryName)) {
						this.query = savedQueries.queries[i].query;
						break;
					}
				}

				if (this.query == null) {
					throw new FutianTCQueryException(
							"There is not an " + queryName //$NON-NLS-1$
									+ " query"); //$NON-NLS-1$
				}
			} else {
				throw new FutianTCQueryException(
						"TCSession Timedout. please relogin!"); //$NON-NLS-1$
			}
		} catch (ServiceException e) {
			throw new FutianTCQueryException(
					"GetSavedQueries service request failed." + e.getMessage()); //$NON-NLS-1$
		}
	}

	/**
	 * 被“造型图片查询”类调用，用于设置查询条件参数 去除值为NULL的和“”的查询条件
	 * 
	 * @param attributeMap
	 * @throws Exception
	 */
	private List<String[]> initQueryAttributes(Map<String, Object> attributeMap) {
		List<String[]> list = null;

		if (attributeMap.size() > 0) {
			Iterator<String> iter = attributeMap.keySet().iterator();
			Map<String, String> condition = new HashMap<String, String>();

			while (iter.hasNext()) {
				String key = iter.next();
				Object value = attributeMap.get(key);
				if (value != null && !"".equals(value)) { //$NON-NLS-1$
					condition.put(key, (String) value);
				}
			}

			if (condition.size() > 0) {
				Iterator<String> conditionIter = condition.keySet().iterator();

				String[] entries = new String[condition.size()];
				String[] values = new String[condition.size()];
				int i = 0;
				while (conditionIter.hasNext()) {
					String key = conditionIter.next();
					entries[i] = key;
					values[i] = condition.get(key);
					i++;
				}
				list = new ArrayList<String[]>();
				list.add(entries);
				list.add(values);
			}
		}
		return list;
	}

	/**
	 * soa读取lov方法
	 * 
	 * @param tcSession
	 *            登录TC后获得的TCSession
	 * @param className
	 *            在这里指的是 F6_PictureRevision
	 * @param attributeName
	 *            在这里指的是 F6_PictureRevision的属性名称 如f6_Year
	 * @return 数组 String类型的lov名称集合
	 * @throws ServiceException
	 * @throws NotLoadedException
	 */
	public String[] getLovListValue(Session tcSession, String className,
			String attributeName) throws ServiceException, NotLoadedException {
		LOVService lovService = LOVService
				.getService(tcSession.getConnection());

		LOVInfo lovinfo = new LOVInfo();
		String arg[] = new String[] { attributeName };
		lovinfo.typeName = className;
		lovinfo.propNames = arg;
		LOVInfo[] lov = { lovinfo };

		AttachedLOVsResponse lovResponse = lovService.getAttachedLOVs(lov);
		ListOfValuesString lovStr = (ListOfValuesString) lovResponse.serviceData
				.getPlainObject(0);

		String tp[] = getItemAttributeValue(tcSession, lovStr, "lov_values");

		return tp;
	}

	// 获取业务对象上的字符串数组函数
	private String[] getItemAttributeValue(Session session,
			ModelObject modelObject, String attributeName)
			throws NotLoadedException {

		DataManagementService dmService = DataManagementService
				.getService(session.getConnection());

		ModelObject queryObjects[] = new ModelObject[] { modelObject };
		String qryProps[] = new String[] { attributeName };

		dmService.getProperties(queryObjects, qryProps);
		Property fileTag = modelObject.getProperty(attributeName);
		String setobjs[] = fileTag.getStringArrayValue();

		return setobjs;
	}

}
