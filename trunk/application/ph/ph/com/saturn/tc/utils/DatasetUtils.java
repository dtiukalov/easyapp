package com.saturn.tc.utils;

import java.io.File;

import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.utils.server.EasyDataManagementService;
import com.saturn.tc.utils.server.EasyFileManagementService;
import com.teamcenter.soa.client.FileManagementUtility;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.strong.Dataset;
import com.teamcenter.soa.client.model.strong.ImanFile;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class DatasetUtils {

	public static String downloadDatasetFromTc(TCSession session, Dataset dataset, String directory) {
		EasyDataManagementService dms = new EasyDataManagementService(session);
		EasyFileManagementService fms = new EasyFileManagementService(session);
		FileManagementUtility fileUtility = fms.newUtility();
		
		try {
			dms.getProperties(dataset, "ref_list");
			ModelObject refs[] = dataset.get_ref_list();
			
			if (refs.length > 0) {
				dms.getProperties(refs, "file_name", "original_file_name");
				ImanFile[] files = new ImanFile[refs.length];
				for (int i = 0; i < refs.length; ++i) {
					files[i] = (ImanFile)refs[i];
				}
				
				if (files.length > 0) {
					ImanFile file = (ImanFile) files[0];

					String fileName = file.get_file_name();
					int index = fileName.lastIndexOf("_");
					if (index >= 0 && index < fileName.length() - 1) {
						fileName = fileName.substring(index+1);
					}
					String location = directory + File.separator + fileName;
					fileUtility.getFileToLocation(file, location, null, null);
					
					String realname = directory + File.separator + file.get_original_file_name();
					File f = new File(location);
					f.renameTo(new File(realname));
					
					return file.get_original_file_name();
				}
			}
		} catch (NotLoadedException e) {
			e.printStackTrace();
		}
		
		return "";
	}
}
