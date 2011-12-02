package com.saturn.action.sldb.dbimport;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.saturn.app.db.ListData;
import com.saturn.app.utils.BeanUtils;
import com.saturn.app.utils.DateUtils;
import com.saturn.app.web.IAction;
import com.saturn.app.web.IView;
import com.saturn.app.web.view.JsonView;
import com.saturn.auth.User;
import com.saturn.sldb.Import;

public class AddAction implements IAction {

	@SuppressWarnings("rawtypes")
	public IView execute(HttpServletRequest request,
			HttpServletResponse response) {

		Import vo = BeanUtils.getBean(request, Import.class);
		User user = (User)request.getSession().getAttribute("authUser");
		
		String type = request.getParameter("type");
		String importDate = DateUtils.getSystemDate().substring(0, 7);
		
		long current = System.currentTimeMillis();
		
		vo.setType(type);
		vo.setImportDate(importDate);
////可以一个月上传多个excel文件
//		ListData<Import> imports = Import.getAll(vo, null, null, null, null);
//		if (imports.getTotal() > 0) {
//			return new JsonView(getInfo(importDate +"的数据已经上传，若想重新上传请删除当月老数据!"));
//		}
		
		vo.setId(user.getId()+current);
		vo.setCreaterName(user.getName());
		vo.setCreateTime(DateUtils.getSystemTime());
		vo.setCreater(user.getId());
		
		String savePath = request.getSession().getServletContext()
				.getRealPath("/")
				+ "sldb"
				+ File.separator
				+ vo.getType()
				+ File.separator
				+ vo.getImportDate() + File.separator;

		// 最大文件大小
		long maxSize = 10000000;// 最大文件10M

		if (!ServletFileUpload.isMultipartContent(request)) {
			return new JsonView(getInfo("请选择文件。"));
		}
		
		File saveDirFile = new File(savePath);
		if (!saveDirFile.exists()) {
			saveDirFile.mkdirs();
		}

		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");

		try {
			List items = upload.parseRequest(request);
			Iterator itr = items.iterator();
			while (itr.hasNext()) {
				FileItem item = (FileItem) itr.next();
				String fileName = item.getName();
				long fileSize = item.getSize();
				if (!item.isFormField()) {
					// 检查文件大小
					if (fileSize > maxSize) {
						return new JsonView(getInfo("上传文件大小超过限制。"));
					}
					String fileExt = fileName.substring(
							fileName.lastIndexOf(".") + 1).toLowerCase();
					
					if (!fileName.endsWith(".xls")) {
						return new JsonView(getInfo("上传文件(" + fileName + ")扩展名是不允许的扩展名。\n只允许.xls格式。"));
					}

					SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
					String newFileName = df.format(new Date()) + "_"
							+ vo.getCreater() + "." + fileExt;
					
					savePath += File.separator + newFileName;
					try {
						File uploadedFile = new File(savePath);
						item.write(uploadedFile);
					} catch (Exception e) {
						return new JsonView(getInfo("上传文件失败。"));
					}

					vo.setFilePath(savePath);
					if (Import.importDate(vo) == 1) {
						return new JsonView("{\"error\":0, \"result\":\"true\"}");
					} 
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
			return new JsonView(getInfo("上传文件失败。"));
		}
		
		return new JsonView(getInfo("数据导入失败"));
	}

	public String requestMapping() {
		return "/app/sldb/import/add.action";
	}

	private String getInfo(String message) {
		String returnInfo = "{\"error\":1, \"message\":\"{2}\"}";

		return returnInfo.replace("{2}", message);
	}
}
