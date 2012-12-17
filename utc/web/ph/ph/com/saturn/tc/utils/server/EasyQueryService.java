package com.saturn.tc.utils.server;

import com.saturn.tc.clientx.TCSession;
import com.teamcenter.schemas.soa._2006_03.exceptions.ServiceException;
import com.teamcenter.services.strong.query.SavedQueryService;
import com.teamcenter.services.strong.query._2006_03.SavedQuery.GetSavedQueriesResponse;
import com.teamcenter.services.strong.query._2007_06.SavedQuery.ExecuteSavedQueriesResponse;
import com.teamcenter.services.strong.query._2007_06.SavedQuery.SavedQueryInput;
import com.teamcenter.services.strong.query._2007_06.SavedQuery.SavedQueryResults;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.strong.ImanQuery;
import com.teamcenter.soa.client.model.strong.Item;

public class EasyQueryService {

	private TCSession session = null;

	public EasyQueryService(TCSession session) {
		this.session = session;
	}

	public SavedQueryService getService() {
		return SavedQueryService.getService(this.session.getConnection());
	}

	/**
	 * 获取TC中已保存的查询
	 * 
	 * @param queryName
	 * @throws Exception
	 */
	private ImanQuery getQueryObject(String queryName) {
		try {
			GetSavedQueriesResponse savedQueries = this.getService()
					.getSavedQueries();
			
			for (int i = 0; i < savedQueries.queries.length; i++) {
				if (savedQueries.queries[i].name.equals(queryName)) {
					return savedQueries.queries[i].query;
				}
			}

		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public Item queryItemByName(String name) {
		if (name == null && "".equals(name)) {
			return null;
		}
		
		ImanQuery query = getQueryObject("Item...");

		SavedQueryInput savedQueryInput[] = new SavedQueryInput[1];
		savedQueryInput[0] = new SavedQueryInput();
		savedQueryInput[0].query = query;
		savedQueryInput[0].maxNumToReturn = 10000;
		savedQueryInput[0].limitListCount = 0;
		savedQueryInput[0].limitList = new ModelObject[0];
		savedQueryInput[0].entries = new String[] { "Name" }; //$NON-NLS-1$
		savedQueryInput[0].values = new String[] { name }; //$NON-NLS-1$
		savedQueryInput[0].maxNumToInflate = 10000;

		ExecuteSavedQueriesResponse savedQueryResult = this.getService()
				.executeSavedQueries(savedQueryInput);
		SavedQueryResults found = savedQueryResult.arrayOfResults[0];
		
		if (found != null && found.numOfObjects > 0) {
			ModelObject object = found.objects[0];
			
			if (object instanceof Item) {
				return (Item) object;
			}
		}
		
		return null;
	}
}
