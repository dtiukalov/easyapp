package foton.picture.servlet;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import foton.picture.vo.PictureVO;
import foton.picture.util.DownLoadPicturesUtil;
import foton.picture.util.IConstants;
import foton.picture.util.PropertiesService;

/**
 * Servlet implementation class for Servlet: DownLoadPicturesServlet
 * 
 */
public class DownLoadPicturesServlet extends javax.servlet.http.HttpServlet
		implements javax.servlet.Servlet {
	static final long serialVersionUID = 1L;

	/*
	 * (non-Java-doc)
	 * 
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public DownLoadPicturesServlet() {
		super();
	}

	/*
	 * (non-Java-doc)
	 * 
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request,
	 *      HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/*
	 * (non-Java-doc)
	 * 
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request,
	 *      HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//设置浏览器显示的内容类型为Zip   
        response.setContentType("application/zip");   
        //设置内容作为附件下载，并且名字为：export.zip   
        response.setHeader("Content-Disposition", "attachment; filename= downloadFotonPictures.zip");   
		
        //装饰输出流为Zip输出流   
      //  ZipOutputStream zos = new ZipOutputStream(response.getOutputStream());   
        
		OutputStream out = response.getOutputStream();
		BufferedInputStream bin = null;
		try {
			String pics = (String) request.getParameter("pics");
			String sessionTime = (String)request.getParameter("sessionTime");

			List<PictureVO> pictures = getDownLoadPictureVOList(request, pics,sessionTime);

			String zipName = "downloadPictures_" + System.currentTimeMillis();
			String zipFolderPath = (String) PropertiesService.getInstance()
					.getPropertyObject(IConstants.DOWNLOAD_ZIP_PICTURES_PATH)
					+ File.separator + zipName;
			String zipPath = (String) PropertiesService.getInstance()
					.getPropertyObject(IConstants.DOWNLOAD_ZIP_PICTURES_PATH)
					+ File.separator + zipName + ".zip";

			doZip(zipName, zipFolderPath, zipPath, pictures);

			bin = new BufferedInputStream(new FileInputStream(zipPath));
			byte[] buf = new byte[1024];
			int len = 0;
			while ((len = bin.read(buf)) > 0)
				out.write(buf, 0, len);
			out.close();
			bin.close();

			// **最后的操作是把创建的临时文件删除*//*
			DownLoadPicturesUtil.deleteFile(zipFolderPath);
			DownLoadPicturesUtil.deleteFile(zipPath);
			return;
		} catch (Exception e) {
			e.printStackTrace();
			request.getSession().setAttribute("message", "error");
			request.setAttribute("messageError", e.getMessage());
			request.getRequestDispatcher(IConstants.RIGHT_PAGE).forward(
					request, response);
		} finally {
			if (out != null) {
				out.close();
			}
			if (bin != null) {
				bin.close();
			}
		}
	}

	/**
	 * 图片打zip包
	 * 
	 * @param pictures
	 * @return zipPath 生成的zip路径
	 * @throws Exception
	 */
	private String doZip(String zipName, String zipFolderPath, String zipPath,
			List<PictureVO> pictures) throws Exception {

		DownLoadPicturesUtil.createFolder((String) PropertiesService
				.getInstance().getPropertyObject(
						IConstants.DOWNLOAD_ZIP_PICTURES_PATH)
				+ File.separator + zipName);

		DownLoadPicturesUtil.copyPictures(pictures, zipFolderPath);

		DownLoadPicturesUtil.zip(zipFolderPath, zipPath);
		return zipPath;
	}

	/**
	 * 获取待下载的图片VO集合
	 * 
	 * @param request
	 * @param pics
	 * @return List<PictureVO>
	 * @throws NumberFormatException
	 */
	private List<PictureVO> getDownLoadPictureVOList(
			HttpServletRequest request, String pics,String sessionTime) {
		pics = pics.substring(0, pics.length() - 1);
		String[] indexs = pics.split("%");

		List<PictureVO> pictures = new ArrayList<PictureVO>();
		List<PictureVO> resultList = (List<PictureVO>) request.getSession()
				.getAttribute("resultList" + sessionTime);

		for (String index : indexs) {
			pictures.add((resultList.get(Integer.parseInt(index))));
		}

		return pictures;
	}

}