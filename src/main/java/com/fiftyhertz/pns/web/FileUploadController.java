package com.fiftyhertz.pns.web;
import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
@SuppressWarnings("unused")
@RequestMapping("../projects/fileUpload")
public class FileUploadController {
	
	String filePath = "G:\\Backup project\\Project-Navigation-System\\src\\main\\webapp\\app\\UploadedProjects\\";
	private boolean isMultipart;
	private int maxFileSize = 50 * 1024 * 50;
	private int maxMemSize = 4 * 1024;
	private File file;
	
	//@RequestMapping(method="POST")
	public void uploadFile()
	{
	}
	


}
