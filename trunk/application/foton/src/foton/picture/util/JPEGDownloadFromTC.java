package foton.picture.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import com.teamcenter.clientx.Session;
import com.teamcenter.services.strong.core.DataManagementService;
import com.teamcenter.services.strong.core.FileManagementService;
import com.teamcenter.services.strong.core._2006_03.FileManagement.FileTicketsResponse;
import com.teamcenter.soa.client.FileManagementUtility;
import com.teamcenter.soa.client.GetFileResponse;
import com.teamcenter.soa.client.model.ModelObject;
import com.teamcenter.soa.client.model.strong.Dataset;
import com.teamcenter.soa.client.model.strong.ImanFile;
import com.teamcenter.soa.exceptions.NotLoadedException;

import foton.picture.vo.PictureVO;

/**
 * 
 * @author emily
 * 
 */
public class JPEGDownloadFromTC {

	public static File[] downloadDatasets(Dataset dataSet, String directory,
			PictureVO pictureVO) throws NotLoadedException, IOException,
			FileNotFoundException {
		File[] fileObjects = null;
		DataManagementService dmService = DataManagementService
				.getService(Session.getConnection());
		FileManagementUtility fMSFileManagement = new FileManagementUtility(
				Session.getConnection());
		dmService.getProperties(new ModelObject[] { dataSet },
				new String[] { "ref_list" });
		ModelObject refs[] = dataSet.get_ref_list();
		if (refs.length > 0) {
			ImanFile[] files = new ImanFile[refs.length];
			for (int i = 0; i < refs.length; i++) {
				ImanFile file = (ImanFile) refs[i];
				dmService.getProperties(new ModelObject[] { file },
						new String[] { "file_name", "original_file_name" });
				files[i] = file;
			}
			FileManagementService fileService = FileManagementService
					.getService(Session.getConnection());
			FileTicketsResponse readResponse = fileService
					.getFileReadTickets(files);
			Map ticketMap = readResponse.tickets;
			Iterator itr = ticketMap.values().iterator();
			while (itr.hasNext()) {
				String ticket = (String) itr.next();
			}
			GetFileResponse gfResponse = fMSFileManagement.getFiles(files);
			fileObjects = gfResponse.getFiles();
			for (int x = 0; x < fileObjects.length; x++) {
				File f = fileObjects[x];
			}
			for (int i = 0; i < files.length; i++) {
				ImanFile file = (ImanFile) files[i];

				String location = directory + File.separator
						+ pictureVO.getKey() + file.get_file_name();// +
												// file.get_original_file_name();
				GetFileResponse gftlResponse = fMSFileManagement
						.getFileToLocation(file, location, null, null);
			//	System.out.println(file.get_file_name());
			//	System.out.println(file.get_original_file_name());
			//	System.out.println(location);
				pictureVO.setJpgPath(location);
				pictureVO.setJpgName(pictureVO.getKey() + file.get_file_name());
			}
		}
		return fileObjects;

	}
	
	public static File[] downloadSPDatasets(Dataset dataSet, String directory,
			PictureVO pictureVO) throws NotLoadedException, IOException,
			FileNotFoundException {
		File[] fileObjects = null;
		DataManagementService dmService = DataManagementService
				.getService(Session.getConnection());
		FileManagementUtility fMSFileManagement = new FileManagementUtility(
				Session.getConnection());
		dmService.getProperties(new ModelObject[] { dataSet },
				new String[] { "ref_list" });
		ModelObject refs[] = dataSet.get_ref_list();
		if (refs.length > 0) {
			ImanFile[] files = new ImanFile[refs.length];
			for (int i = 0; i < refs.length; i++) {
				ImanFile file = (ImanFile) refs[i];
				dmService.getProperties(new ModelObject[] { file },
						new String[] { "file_name", "original_file_name" });
				files[i] = file;
			}
			FileManagementService fileService = FileManagementService
					.getService(Session.getConnection());
			FileTicketsResponse readResponse = fileService
					.getFileReadTickets(files);
			Map ticketMap = readResponse.tickets;
			Iterator itr = ticketMap.values().iterator();
			while (itr.hasNext()) {
				String ticket = (String) itr.next();
			}
			GetFileResponse gfResponse = fMSFileManagement.getFiles(files);
			fileObjects = gfResponse.getFiles();
			for (int x = 0; x < fileObjects.length; x++) {
				File f = fileObjects[x];
			}
			for (int i = 0; i < files.length; i++) {
				ImanFile file = (ImanFile) files[i];

				String location = directory + File.separator
						+ pictureVO.getKey() + file.get_file_name();// +
												// file.get_original_file_name();
				GetFileResponse gftlResponse = fMSFileManagement
						.getFileToLocation(file, location, null, null);
				
				//System.out.println(file.get_file_name());
				//System.out.println(file.get_original_file_name());
				//System.out.println(file.getUid());
				pictureVO.setSp_jpgPath(location);
				pictureVO.setSp_jpgName(pictureVO.getKey() + file.get_file_name());
			}
		}
		return fileObjects;

	}

}
