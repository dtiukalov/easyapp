package com.saturn.tc.utils;

import java.util.Map;

import org.apache.commons.collections.StaticBucketMap;

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

public class QueryUtils {

	/**
	 * 调用自定义查询
	 * @author liule
	 * @param entries
	 * @param values
	 * @param queryName
	 * @throws Exception
	 */
	public static SavedQueryResults queryCustom(TCSession tcSession,
			String[] entries, String[] values, String queryName) throws Exception {
		
		SavedQueryService queryService = SavedQueryService.getService(tcSession
				.getConnection());;

		ImanQuery query = null;

		try {
			if (queryService != null) {
				GetSavedQueriesResponse savedQueries = queryService
						.getSavedQueries();

				for (int i = 0; i < savedQueries.queries.length; i++) {
					if (savedQueries.queries[i].name.equals(queryName)) {
						query = savedQueries.queries[i].query;
						break;
					}
				}
			} 
			
			SavedQueryInput savedQueryInput[] = new SavedQueryInput[1];
			savedQueryInput[0] = new SavedQueryInput();
			savedQueryInput[0].query = query;
			// savedQueryInput[0].maxNumToReturn = 10000;
			// savedQueryInput[0].limitListCount = 0;
			savedQueryInput[0].limitList = new ModelObject[0];
			savedQueryInput[0].entries = entries;
			savedQueryInput[0].values = values;
			// savedQueryInput[0].maxNumToInflate = 10000;

			ExecuteSavedQueriesResponse savedQueryResult = queryService
					.executeSavedQueries(savedQueryInput);
			SavedQueryResults found = savedQueryResult.arrayOfResults[0];
			return found;
		} catch (ServiceException e) {
			e.printStackTrace();
		}

		return null;
	}
//	savedQueryInput[0].values = new String[1] ;
//	 savedQueryInput[0].entries = new String[1] ;
//    savedQueryInput[0].entries[0] = attrname ;
//    savedQueryInput[0].values[0] = attrvalue;
	
	public static ModelObject[] queryModelObjectsByAttr(TCSession session, String type, 
			String attrname, String attrvalue)
    {
		ModelObject[] item = null;
    	ImanQuery query = null;
    	
    	SavedQueryService queryService = SavedQueryService.getService(session.getConnection());
    	
    	try {
			GetSavedQueriesResponse savedQueries = queryService.getSavedQueries();
			for (int i = 0; i < savedQueries.queries.length; i++) {
				if (savedQueries.queries[i].name.equals(type)) {
                    query = savedQueries.queries[i].query;
                   // refreshObject(query);
                    break;
                }
			}
			if (query == null) {
	            System.out.println("There is not an " + type + " query.");
	            return null;
	        } else {
	        	System.out.println("There is  an "+type+" query.");
	        }
			
			 SavedQueryInput savedQueryInput[] = new SavedQueryInput[1];
			 savedQueryInput[0] = new SavedQueryInput();
			 savedQueryInput[0].query = query ;
			 savedQueryInput[0].limitList = new ModelObject[0];
			 savedQueryInput[0].values = new String[1] ;
			 savedQueryInput[0].entries = new String[1] ;
		     savedQueryInput[0].entries[0] = attrname ;
		     savedQueryInput[0].values[0] = attrvalue;
		     
		     ExecuteSavedQueriesResponse found = queryService.executeSavedQueries(savedQueryInput);
		     SavedQueryResults found1 = found.arrayOfResults[0]; 
	         item = found1.objects;


		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
    	return item;
    }
}
