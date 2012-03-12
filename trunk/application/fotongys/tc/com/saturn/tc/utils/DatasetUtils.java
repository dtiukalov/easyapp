package com.saturn.tc.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.saturn.tc.clientx.TCSession;
import com.saturn.tc.utils.server.EasyDataManagementService;
import com.saturn.tc.utils.server.EasyFileManagementService;
import com.teamcenter.soa.client.FileManagementUtility;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.strong.Dataset;
import com.teamcenter.soa.client.model.strong.ImanFile;
import com.teamcenter.soa.exceptions.NotLoadedException;

public class DatasetUtils {

	
/*	  public static void downloadDatasetFromTc(TCSession session, Dataset
	      dataset, String directory) { 
		  EasyDataManagementService dms = new EasyDataManagementService(session); 
		  EasyFileManagementService fms = new EasyFileManagementService(session); 
		  FileManagementUtility fileUtility = fms.newUtility();
	  
		  List<String> fileNames = new ArrayList<String>();
	  
	  try { dms.getProperties(dataset, "ref_list"); ModelObject refs[] =
	  dataset.get_ref_list();
	  
	  if (refs.length > 0) { dms.getProperties(refs, "file_name",
	  "original_file_name"); List<ImanFile> files = new ArrayList<ImanFile>();
	  
	  for (int i = 0; i < refs.length; ++i) { if (refs[i] instanceof ImanFile) {
	  files.add((ImanFile) refs[i]); } }
	  
	  if (files.size() > 0) {
	  
	  for (ImanFile file : files) {
	  
	  String fileName = file.get_file_name(); int index =
	  fileName.lastIndexOf("_"); if (index >= 0 && index < fileName.length() -
	  1) { fileName = fileName.substring(index + 1); } String location =
	  directory + File.separator + fileName;
	  fileUtility.getFileToLocation(file, location, null, null);
	  
	  String realname = directory + File.separator +
	  file.get_original_file_name(); File f = new File(location);
	  f.renameTo(new File(realname));
	  fileNames.add(file.get_original_file_name()); } } } } catch
	  (NotLoadedException e) { e.printStackTrace(); } 
	  }*/
	 

	public static String downloadDatasetFromTc(TCSession session,
			ImanFile file, String directory) {
		EasyFileManagementService fms = new EasyFileManagementService(session);
		FileManagementUtility fileUtility = fms.newUtility();
		try {
			String fileName = file.get_file_name();
			int index = fileName.lastIndexOf("_");
			if (index >= 0 && index < fileName.length() - 1) {
				fileName = fileName.substring(index + 1);
			}
			String location = directory + File.separator + fileName;
			fileUtility.getFileToLocation(file, location, null, null);

			String realname = directory
					+ file.get_original_file_name();
			File f = new File(location);
			f.renameTo(new File(realname));
			return realname;
		} catch (NotLoadedException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static List<ImanFile> getdownloadDatasetFromTc(TCSession session,
			Dataset dataset) {
		EasyDataManagementService dms = new EasyDataManagementService(session);
		// EasyFileManagementService fms = new
		// EasyFileManagementService(session);
		// FileManagementUtility fileUtility = fms.newUtility();

		// List<String> fileNames = new ArrayList<String>();

		try {
			dms.getProperties(dataset, "ref_list");
			ModelObject refs[] = dataset.get_ref_list();

			if (refs.length > 0) {
				dms.getProperties(refs, "file_name", "original_file_name");
				List<ImanFile> files = new ArrayList<ImanFile>();

				for (int i = 0; i < refs.length; ++i) {
					if (refs[i] instanceof ImanFile) {
						files.add((ImanFile) refs[i]);
					}
				}

				if (files.size() > 0) {
					/*
					 * for (ImanFile file : files) {
					 * 
					 * String fileName = file.get_file_name(); int index =
					 * fileName.lastIndexOf("_"); if (index >= 0 && index <
					 * fileName.length() - 1) { fileName =
					 * fileName.substring(index + 1); } String location =
					 * directory + File.separator + fileName;
					 * fileUtility.getFileToLocation(file, location, null,
					 * null);
					 * 
					 * String realname = directory + File.separator +
					 * file.get_original_file_name(); File f = new
					 * File(location); f.renameTo(new File(realname));
					 * fileNames.add(file.get_original_file_name()); }
					 */

					return files;
				}
			}
		} catch (NotLoadedException e) {
			e.printStackTrace();
		}

		return null;
	}

}
