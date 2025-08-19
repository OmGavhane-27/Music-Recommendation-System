<%@page import="java.util.Vector"%>
<%@page import="models.JavaFuns"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/cust.css">


<title> </title>
</head>
<body><jsp:include page="Top.jsp"></jsp:include>
<%
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);
if(session.getAttribute("userid")==null)
{
	response.sendRedirect("/home");
}
String userid=String.valueOf(session.getAttribute("userid"));
JavaFuns jf=new JavaFuns();
response.sendRedirect("ViewMusicDataset2.jsp");
 %>
<center><h2>User Home</h2></center>

 
</body>
</html>