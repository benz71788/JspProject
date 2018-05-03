<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*" %>

<%@ page trimDirectiveWhitespaces="true" %>

<%
	String fileName = request.getParameter("file_name");
	System.out.println("fileName = " + fileName);
	
	String savePath = "upload";
	
	ServletContext context = pageContext.getServletContext();
	String sDownloadPath = context.getRealPath(savePath);
	
	String sFilePath = sDownloadPath + "/" + fileName;
	System.out.println(sFilePath);
	
	byte b[] = new byte[4096];
	
	String sMimeType = context.getMimeType(sFilePath);
	System.out.println("sMimeType>>>" + sMimeType);
	
	if(sMimeType == null){
		sMimeType = "application/octet-stream";
	}
	
	response.setContentType(sMimeType);
	
	String sEncoding =
			new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
	System.out.println(sEncoding);
	
	response.setHeader("Content-Disposition", "inline; filename= " + sEncoding);
	
	ServletOutputStream so = response.getOutputStream();
	BufferedOutputStream out2 = null;
	BufferedInputStream in = null;
	try{
		out2 = new BufferedOutputStream(so);
		
		in = new BufferedInputStream(new FileInputStream(sFilePath));
		
		int numRead;
		
		while((numRead = in.read(b, 0, b.length)) != -1){
			out2.write(b, 0, numRead);
		}
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		try{
			if(out2 != null){
				out2.flush();
				out2.close();
			}
			if(in != null){
				in.close();
			}
		} catch(Exception e){
			e.printStackTrace();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>