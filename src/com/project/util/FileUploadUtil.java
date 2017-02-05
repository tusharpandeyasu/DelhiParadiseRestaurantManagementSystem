package com.project.util;


import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUploadUtil {
	private ServletFileUpload servletFileUpload;
	private List<FileItem> fileItems;

	@SuppressWarnings("unchecked")
	public FileUploadUtil(HttpServletRequest request) {
		FileItemFactory fileItemFactory = new DiskFileItemFactory();
		servletFileUpload = new ServletFileUpload(fileItemFactory);
		try {
			fileItems = servletFileUpload.parseRequest(request);
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
	}

	
	public String getParameter(String fieldName) {
		return this.getParameter(fieldName, "utf-8");
	}

	public String getParameter(String fieldName, String encoding) {
		String value = null;
		if (fileItems != null) {
			for (FileItem fileItem : fileItems) {
				String name = fileItem.getFieldName();
				if ((fileItem.isFormField()) && (name != null)
						&& (fieldName.equals(name))) {
					try {
						value = fileItem.getString(encoding);
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return value;
	}

	
	public List<String> getParameterValues(String fieldName) {
		return this.getParameterValues(fieldName, "utf-8");
	}

	public List<String> getParameterValues(String fieldName, String encoding) {
		List<String> list = new ArrayList<String>();
		if (fileItems != null) {
			for (FileItem fileItem : fileItems) {
				String name = fileItem.getFieldName();
				if ((fileItem.isFormField()) && (name != null)
						&& fieldName.equals(name)) {
					try {
						String value = fileItem.getString(encoding);
						list.add(value);
					} catch (UnsupportedEncodingException e) {
						e.printStackTrace();
					}

				}
			}
		}
		if ((list != null) && (list.size() > 0)) {
			return list;
		}
		return null;
	}

	public BufferedInputStream getInputStream(String fieldName) {
		BufferedInputStream bufferedInputStream = null;
		if (fileItems != null) {
			for (FileItem fileItem : fileItems) {
				String name = fileItem.getFieldName();
				if ((!fileItem.isFormField()) && (name != null)
						&& fieldName.equals(name)) {
					try {
						InputStream inputStream = fileItem.getInputStream();
						bufferedInputStream = new BufferedInputStream(
								inputStream);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return bufferedInputStream;
	}

	
	public String getFileName(String fieldName) {
		String fileName = null;
		if (fileItems != null) {
			for (FileItem fileItem : fileItems) {
				String name = fileItem.getFieldName();
				if ((!fileItem.isFormField()) && (name != null)
						&& fieldName.equals(name)) {
					fileName = fileItem.getName();
				}
			}
		}
		return fileName;
	}
}
