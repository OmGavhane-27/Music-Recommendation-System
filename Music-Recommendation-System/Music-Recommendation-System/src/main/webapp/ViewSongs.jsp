  
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
<center>
<h2>Recognized emotion is <%=request.getAttribute("emotion").toString().trim() %></h2>
<hr>
<br/>
<h2>Recommended Songs Report</h2></center>
<%JavaFuns jf=new JavaFuns();
String qr="select singer from getPref where cnt=(select max(cnt) from getPref where userid='"+session.getAttribute("userid").toString().trim()+"' limit 1) and userid='"+session.getAttribute("userid").toString().trim()+"' limit 1";
Vector v=jf.getValue("select title, movie,year_of_release,singers,Youtube_link,Audio_link,Music_director,mainCategory from songs2 where related_emotions like '%"+request.getAttribute("emotion").toString().trim()+"%' order by FIELD(singers,(select singer from getPref where userid='"+session.getAttribute("userid").toString().trim()+"' order by cnt desc)) desc", 8);
%>
<table class="table table-bordered">
<tr style="background-color:seashell">
<th>Title</th>
<th>Movie</th>
<th>Year Of Release</th>
<th>Singer</th>
<th>Music Director</th>
<th>Category</th>
<th>Youtube Link</th> 
<th>Audio Link</th>
 
 
</tr>

  <%for(int i=0;i<v.size();i=i+8){ %>
  <tr>
  <td><%=v.elementAt(i).toString().trim() %></td>
  <td><%=v.elementAt(i+1).toString().trim() %></td>
  <td><%=v.elementAt(i+2).toString().trim() %></td>
  <td><%=v.elementAt(i+3).toString().trim() %></td>
   <td><%=v.elementAt(i+6).toString().trim() %></td>
    <td><%=v.elementAt(i+7).toString().trim() %></td>
 <td><a href="pref?category=<%=v.elementAt(i+6).toString().trim() %>&director=<%=v.elementAt(i+7).toString().trim() %>&singer=<%=v.elementAt(i+3).toString().trim() %>&song=<%=v.elementAt(i+4).toString().trim() %>" target="_blank">Youtube Link</a></td>
  <td><a href="pref?category=<%=v.elementAt(i+6).toString().trim() %>&director=<%=v.elementAt(i+7).toString().trim() %>&singer=<%=v.elementAt(i+3).toString().trim() %>&song=<%=v.elementAt(i+5).toString().trim() %>" target="_blank">Audio Link</a></td>
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