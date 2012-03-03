package foton.picture.listener;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import foton.picture.util.IConstants;
import foton.picture.util.PropertiesService;
import foton.picture.xml.DictionaryLoader;
import foton.picture.xml.DictionaryManager;

public class FotonContextListener implements ServletContextListener {

	public void contextInitialized(ServletContextEvent event) {

		String prefix = event.getServletContext().getRealPath("/");

		if (prefix == null || prefix.equals("")) {
			java.net.URL url = this.getClass().getResource("/");
			String mSchemaPath = url.getFile();
			//System.out.println("mSchemaPath : " + mSchemaPath);
			if (mSchemaPath != null || !mSchemaPath.equals("")) {
				String separator = "/";
				int lastSlash = mSchemaPath.lastIndexOf(separator);
				if (lastSlash == -1) {
					separator = "\\";
					lastSlash = mSchemaPath.lastIndexOf(separator);
				}
				prefix = mSchemaPath.substring(0, lastSlash);
				prefix = prefix.substring(0, prefix.lastIndexOf(separator));
				prefix = prefix.substring(0, prefix.lastIndexOf(separator) + 1);

			}
		}

		String path = prefix + "downloadImgs";
		String sp_path = prefix + "downloadImgs" + File.separator + "sp";
		String downloadPicturesPath = prefix + "picturesZip";
		String dicts_xml_path = prefix + "xml";

		PropertiesService.getInstance().setPropertyObject(
				IConstants.DOWNLOAD_JPEG_PATH, path);
		PropertiesService.getInstance().setPropertyObject(
				IConstants.DOWNLOAD_SP_JPEG_PATH, sp_path);
		PropertiesService.getInstance().setPropertyObject(
				IConstants.DOWNLOAD_ZIP_PICTURES_PATH, downloadPicturesPath);
		PropertiesService.getInstance().setPropertyObject(
				IConstants.DICTS_XML_PATH, dicts_xml_path);

		loadDictionary();
	}
	
	private void initFolder() {
		String folderpath = "E:/test1/";
		Map<String, List<String>> dicts = DictionaryManager.getInstance()
				.getDicts();
		for (String cartype : DictionaryManager.getInstance().getCarTypeList()) {
			for (String country : dicts.get(DictionaryLoader.COUNTRY)) {
				for (String band : dicts.get(country)) {
					for (String subband : dicts.get(band)) {
						/*generateFolder(folderpath + cartype
								+ "/" + country + "/" + band
								+ "/" + subband);*/
						for (String year : DictionaryManager.getInstance()
								.getYearList()) {
							for (String interouter : DictionaryManager
									.getInstance().getInterOuterList()) {
								if ("内饰".equals(interouter)) {
									for (String inter : DictionaryManager
											.getInstance().getInterList()) {
										generateFolder(folderpath + cartype
												+ "/" + country + "/" + band
												+ "/" + subband + "/" + year
												+ "/" + interouter + "/局部/"
												+ inter);

									}
									for (String angle : DictionaryManager
											.getInstance().getAngleInterList()) {
										generateFolder(folderpath + cartype
												+ "/" + country + "/" + band
												+ "/" + subband + "/" + year
												+ "/" + interouter + "/角度"
												);

									}
								} else if ("外饰".equals(interouter)) {
									for (String outer : DictionaryManager
											.getInstance().getOuterList()) {
										generateFolder(folderpath + cartype
												+ "/" + country + "/" + band
												+ "/" + subband + "/" + year
												+ "/" + interouter + "/局部/"
												+ outer);

									}
									for (String angle : DictionaryManager
											.getInstance().getAngleOuterList()) {
										generateFolder(folderpath + cartype
												+ "/" + country + "/" + band
												+ "/" + subband + "/" + year
												+ "/" + interouter + "/角度/"
												+ angle);

									}

								}
							}
						}
					}
				}

			}
		}
	}

	private void generateFolder(String path) {

		File file = new File(path);
		try {
			file.mkdirs();
		} catch (RuntimeException e) {
			e.printStackTrace();
		}

	}

	private void loadDictionary() {

		DictionaryLoader.loadDictsFromXML();
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {

	}
}
