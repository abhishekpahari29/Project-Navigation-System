package com.fiftyhertz;

import java.io.*;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.net.URL;
import java.net.URLClassLoader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;












import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


public class UploadServlet extends HttpServlet {

	private boolean isMultipart;
	private String filePath;
	private int maxFileSize = 50 * 1024 * 50;
	private int maxMemSize = 4 * 1024;
	private File file;
	
	
	
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/pnsdb";

	static final String USER = "root";
	static final String PASS = "pahari";
	
	
	

	public void init() {
		// Get the file location where it would be stored.
		filePath = getServletContext().getInitParameter("file-upload");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			 {
		try {
		String stat;
		StringBuffer utilOutput = new StringBuffer();

		// Check that we have a file upload request
		isMultipart = ServletFileUpload.isMultipartContent(request);
		/*response.setContentType("text/html");
		java.io.PrintWriter out = response.getWriter();
		if (!isMultipart) {
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet upload</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<p>No file uploaded</p>");
			out.println("</body>");
			out.println("</html>");
			return;
		}*/
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// maximum size that will be stored in memory
		factory.setSizeThreshold(maxMemSize);
		// Location to save data that is larger than maxMemSize.
		factory.setRepository(new File("d:\\upload\\"));

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		// maximum file size to be uploaded.
		upload.setSizeMax(maxFileSize);
		String fname = null;
		
			// Parse the request to get file items.
			List fileItems = upload.parseRequest(request);

			// Process the uploaded file items
			Iterator i = fileItems.iterator();

			/*out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet upload</title>");
			out.println("</head>");
			out.println("<body>");*/

			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();
				if (!fi.isFormField()) {
					// Get the uploaded file parameters
					String fieldName = fi.getFieldName();
					String fileName = fi.getName();
					String contentType = fi.getContentType();
					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();
					// Write the file
					if (fileName.lastIndexOf("\\") >= 0) {
						file = new File(
								filePath
										+ fileName.substring(fileName
												.lastIndexOf("\\")));
					} else {
						file = new File(
								filePath
										+ fileName.substring(fileName
												.lastIndexOf("\\") + 1));
					}
					fi.write(file);

					/*out.println("Uploaded Filename: " + fileName + "<br>");
					out.println("<h4> " + filePath + fileName + "</h4>");*/

					stat = "Uploaded Filename: " + fileName;
					utilOutput.append(stat + "\n");

					stat = "Uploaded File Path" + filePath;
					utilOutput.append(stat + "\n");

					fname = fileName;
				}
			}

			/*out.println("</body>");
			out.println("</html>");
*/
		

		List<String> fileList;
		final String zipFile = filePath + fname;
		final String outputFolder = "G:\\Backup project\\Project-Navigation-System\\src\\main\\webapp\\app\\ExtractedProjectFiles";

		byte[] buffer = new byte[1024];

		

			File rootfolder = new File(fname);
			rootfolder.mkdir();

			// create output directory is not exists
			File folder = new File(outputFolder);
			if (!folder.exists()) {
				folder.mkdir();
			}

			// get the zip file content
			ZipInputStream zis = new ZipInputStream(
					new FileInputStream(zipFile));

			// get the zipped file list entry
			ZipEntry ze = zis.getNextEntry();

			// looping each zip entry for files
			while (ze != null) {

				String fileName = ze.getName();
				File newFile = new File(outputFolder + File.separator
						+ rootfolder + File.separator + fileName);

				System.out.println("file unzip : " + newFile.getAbsoluteFile());

				/*out.println("<p>file unzip : " + newFile.getAbsoluteFile()
						+ "</p>");*/
				stat = "file unzip :" + newFile.getAbsoluteFile();
				utilOutput.append(stat + "\n");

				// Checking whether the zip entry is directory
				if (ze.isDirectory()) {
					String temp = newFile.getCanonicalPath();
					new File(temp).mkdir();
				} else {
					new File(newFile.getParent()).mkdirs();

					FileOutputStream fos = new FileOutputStream(newFile);

					int len;
					while ((len = zis.read(buffer)) > 0) {
						fos.write(buffer, 0, len);
					}

					fos.close();
				}
				ze = zis.getNextEntry();
			}

			zis.closeEntry();
			zis.close();

			
			
			
			
			
			
			
			
			
			
			
			
			
			String pathToJar = "G:\\Backup project\\Project-Navigation-System\\src\\main\\webapp\\app\\UploadedProjects\\" + fname;
			JarFile jarFile = new JarFile(pathToJar);
			Enumeration e = jarFile.entries();
			ClassLoader cl;
			URL[] urls = { new URL("jar:file:" + pathToJar + "!/") };
			int index;
			final String PACKAGE_SEPARATOR = ".";
			cl = URLClassLoader.newInstance(urls);
			Connection conn = null;
			Statement stmt = null;
			int flag = 0;
			String pck_lastid = null;
			String packageName = null;
			String cName = null;
			String visibility = null;
			Scanner scn = new Scanner(System.in);

			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Connecting to a selected database...");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			System.out.println("Connected database successfully...");
			System.out.println("Inserting records into the table...");
			stmt = conn.createStatement();

			//System.out.print("Enter Project Name: ");
			//String projectName = scn.nextLine();
			
			String projectName = fname;
			
			String sql = "INSERT INTO project(project_name,version) "
					+ "VALUES (?,?)";

			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, projectName);
			preparedStatement.setInt(2, 0);
			preparedStatement.executeUpdate();
			System.out.println("Project details Inseted");

			ResultSet rs;
			String proj_lastid;

			rs = stmt
					.executeQuery("select last_insert_id() as last_id from project");
			rs.next();
			proj_lastid = rs.getString("last_id");

			
			
			
			while (e.hasMoreElements()) {
				JarEntry je = (JarEntry) e.nextElement();
				if (je.isDirectory() || !je.getName().endsWith(".class")) {
					continue;
				}
				// -6 because of .class
				String className = je.getName().substring(0,
						je.getName().length() - 6);
				className = className.replace('/', '.');

				/*if(className==null){
					
					continue;
				}*/
				
				if(className=="com.mysql.jdbc.integration.c3p0.MysqlConnectionTester")
				{
					continue;
				}
				
				System.out.println(className);
				
				Class c = cl.loadClass(className);
				
				index = c.getName().lastIndexOf(PACKAGE_SEPARATOR);
				packageName = c.getName().substring(0, index);

				cName = c.getName().substring(index + 1, className.length());

				int classModifier = c.getModifiers();
				// System.out.println(Modifier.isPublic(classModifier));

				if (Modifier.isPublic(classModifier)) {
					visibility = "Public";
				}
				if (Modifier.isPrivate(classModifier)) {
					visibility = "Private";
				}
				if (Modifier.isProtected(classModifier)) {
					visibility = "Protected";
				}

				String selectSQL = "SELECT id, project_id, package_name FROM package_details where project_id = ? and package_name = ?";
				preparedStatement = conn.prepareStatement(selectSQL);
				preparedStatement.setInt(1, Integer.parseInt(proj_lastid));
				preparedStatement.setString(2, packageName);
				ResultSet rs1 = preparedStatement.executeQuery();
				if (rs1.next()) {

					flag = 1;
					pck_lastid = rs1.getString("id");
				} else
					flag = 0;

				if (flag == 0) {
					sql = "INSERT INTO package_details(package_name,version,project_id) "
							+ "VALUES (?,?,?)";
					preparedStatement = conn.prepareStatement(sql);
					preparedStatement.setString(1, packageName);
					preparedStatement.setInt(2, 0);
					preparedStatement.setString(3, proj_lastid);
					preparedStatement.addBatch();
					preparedStatement.executeBatch();
					System.out.println("Package details inserted");

					rs = stmt
							.executeQuery("select last_insert_id() as last_id from package_details");
					rs.next();
					pck_lastid = rs.getString("last_id");
				}
				sql = "INSERT INTO class_details(class_name,class_visibility,version,package_id,project_id) "
						+ "VALUES (?,?,?,?,?)";
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, cName);
				preparedStatement.setString(2, visibility);
				preparedStatement.setInt(3, 0);
				preparedStatement.setString(4, pck_lastid);
				preparedStatement.setString(5, proj_lastid);
				preparedStatement.addBatch();
				preparedStatement.executeBatch();
				System.out.println("Class details inserted");

				rs = stmt
						.executeQuery("select last_insert_id() as last_id from class_details");
				rs.next();
				String class_lastid = rs.getString("last_id");

				Method[] classMethods = c.getMethods();

				for (Method methods : classMethods) {
					// System.out.println("Method names :" + methods.getName());
					// System.out.println("Return type :" +
					// methods.getReturnType());
					String methodName = methods.getName();
					String methodReturntype = methods.getReturnType().toString();

					sql = "INSERT INTO method_detail(method_name,return_type,version,class_id) "
							+ "VALUES (?,?,?,?)";
					preparedStatement = conn.prepareStatement(sql);
					preparedStatement.setString(1, methodName);
					preparedStatement.setString(2, methodReturntype);
					preparedStatement.setInt(3, 0);
					preparedStatement.setString(4, class_lastid);
					preparedStatement.addBatch();
					preparedStatement.executeBatch();

					rs = stmt
							.executeQuery("select last_insert_id() as last_id from method_detail");
					rs.next();
					String method_lastid = rs.getString("last_id");

					Class[] parameterType = methods.getParameterTypes();
					// System.out.println("Parameters :");
					for (Class parameters : parameterType) {
						// System.out.println(parameters);
						// System.out.println(parameters.getName());

						String parameterName = parameters.getName();

						sql = "INSERT INTO method_arg_list(method_arg_type,version,method_id) "
								+ "VALUES (?,?,?)";
						preparedStatement = conn.prepareStatement(sql);
						preparedStatement.setString(1, parameterName);
						preparedStatement.setInt(2, 0);
						preparedStatement.setString(3, method_lastid);
						preparedStatement.addBatch();
						preparedStatement.executeBatch();

					}
					// System.out.println();

				}
				System.out.println("Method details inserted");

			}
			System.out.println("Done!");
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			response.sendRedirect("../Project-Navigation-System/app/#/fileuploadsuccess");
		
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			System.out.println("njnj");
			try {
				response.sendRedirect("../Project-Navigation-System/app/#/fileuploadunsuccess");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {

		throw new ServletException("GET method used with "
				+ getClass().getName() + ": POST method required.");
	}
}