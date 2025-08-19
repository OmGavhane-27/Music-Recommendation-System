  
<%@page import="java.util.Vector"%>
<%@page import="models.JavaFuns"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="soham"%>
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

String userid=String.valueOf(session.getAttribute("userid"));
String usertype=String.valueOf(session.getAttribute("usertype"));
if(!userid.equalsIgnoreCase("null")){	
	
session.setMaxInactiveInterval(10*60); 
%>
<h2>Preferences Report</h2>
<hr>
<%JavaFuns jf=new JavaFuns();
Vector v=jf.getValue("select * from preferences where userid='"+session.getAttribute("userid").toString().trim()+"'", 5);
%>
<table class="table table-bordered">
<tr style="background-color:seashell">
<th>Singer</th>
<th>Category</th>
<th>Music Director</th>
 
 
</tr>

  <%for(int i=0;i<v.size();i=i+5){ %>
  <tr>
   
  <td><%=v.elementAt(i+2).toString().trim() %></td>
  <td><%=v.elementAt(i+3).toString().trim() %></td>
   <td><%=v.elementAt(i+4).toString().trim() %></td>
     
  <td><a href="delete?id=<%=v.elementAt(i).toString().trim() %>">Delete</a></td>
    </tr>
  <%} %>
</table>

<%
if(usertype.equals("admin")){
%> 
<%
}
else{	%>
	 
<%
	}
	
}
else{
	%>
	<h2>Invalid Session...Login again</h2>
	<br>
	<a href="index.jsp">Login</a>
	
	<%
}

%>
</body>
</html>