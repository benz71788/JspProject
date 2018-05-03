<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%@ page import="javax.activation.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String sender = request.getParameter("sender");
	String receiver = request.getParameter("receiver");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	String server = "smtp.naver.com";
	
	try{
		Properties properties = new Properties();
		
		properties.put("mail.smtp.host", server);
		
		Session s = Session.getDefaultInstance(properties);
		
		Address sender_address = new InternetAddress(sender);
		Address receiver_address = new InternetAddress(receiver);
		
		Message message = new MimeMessage(s);
		
		message.setHeader("content-type",
				"text/html; charset=UTF-8");
		
		message.setFrom(sender_address);
		
		message.addRecipient(Message.RecipientType.TO,
				receiver_address);
		
		message.setSubject(subject);
		
		message.setContent(content, "text/html; charset=UTF-8");
		
		message.setSentDate(new java.util.Date());
		
		Transport transport = s.getTransport("smtp");
		
		transport.connect(server, "아이디", "비밀번호");
		
		transport.sendMessage(message, message.getAllRecipients());
		
		transport.close();
		
		out.println("<h3>메일이 정상적으로 전송되었습니다.</h3>");
	} catch(Exception e){
		e.printStackTrace();
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