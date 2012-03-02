package com.saturn.tc.utils;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import com.saturn.ph.PH;
import com.saturn.tc.utils.server.EasyDataManagementService;
import com.saturn.tc.utils.server.EasyFileManagementService;
import com.teamcenter.soa.client.FileManagementUtility;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.strong.Dataset;
import com.teamcenter.soa.client.model.strong.ImanFile;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class DatasetUtils {
	
	public static String getDatasetByUid(String uid, HttpServletRequest request){
		Dataset dataset = (Dataset)PH.getDataService().loadModelObject(uid);
		String date =  DateUtils.getSysDate();
		String datasetpath = "attachment" + File.separator + date +File.separator;
		String path = request.getRealPath("/") ;
		
		if( path != null   && !"".equals(path)){
			if(path.split("ph")[1]!= File.separator){
				path = path + File.separator;
				System.out.println("path: " + path);
			}
		}
		path = path + datasetpath;
		
		String src = request.getContextPath()+ File.separator + datasetpath + downloadDatasetFromTc(dataset ,path);
		
		if(!src.contains(".jpg")){
			src = "/ph/app/pep/7/FV9_72Beschluss.jpg";
		}
		
		return src ;
	}

	public static String downloadDatasetFromTc( Dataset dataset, String directory) {
		EasyDataManagementService dms = PH.getDataService();
		EasyFileManagementService fms = PH.getFileService();
		FileManagementUtility fileUtility = fms.newUtility();
		
		try {
			dms.getProperties(dataset, "ref_list");
			ModelObject refs[] = dataset.get_ref_list();
			
			if (refs.length > 0) {
				dms.getProperties(refs, "file_name", "original_file_name");
				
				ImanFile file = null;
				for (int i = 0; i < refs.length; ++i) {
					if (refs[i] instanceof ImanFile) {
						file = (ImanFile)refs[i];
						break;
					}
				}
				
				if (file != null) {
					String location = directory + File.separator + file.get_original_file_name();
					File f = new File(location);
					if(!f.exists()){
						fileUtility.getFileToLocation(file, location, null, null);
					}
					
					return file.get_original_file_name();
				}
			}
		} catch (NotLoadedException e) {
			e.printStackTrace();
		}
		
		return "";
	}
	
	
}
