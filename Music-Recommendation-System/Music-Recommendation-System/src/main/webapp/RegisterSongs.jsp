
 
<%@page import="models.JavaFuns"%> 
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>

<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 

</head>
<body>
<jsp:include page="Top.jsp"></jsp:include>
<% try{ response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setDateHeader("Expires", -1);
if(session.getAttribute("userid")==null)
{
	response.sendRedirect("index.jsp");
}
%>
<div class="container">
  <div class="jumbotron"> 

     
<div class="row">

<div class="col-md-12"> <h2>Register Songs</h2>
   <div class="form-group"> 
    <form method="post" name="frm" action="/RegSongs">
<%
Vector v=new Vector();
JavaFuns jf=new JavaFuns();
v=jf.getValue("select category from categories ", 1); 
%><table class="tblform"><tr><td>
<table class="tblform"><tr><td>Title</td><td>
    <input type="text" name="title" class="form-control" required></input>
     </td></tr>
     <tr>
     <td>Main Category</td>
     <td>
      <input type="radio" name="mainCate" value="old"/>Old
      <input type="radio" name="mainCate" value="New"/>New
 </td></tr>
 
 <tr>
     <td>Category</td>
     <td>
   <select name="category" required class="form-control" required>
   <option value=""><--Select--></option>
   <%for(int i=0;i<v.size();i++)
	   {%>
   <option value="<%=v.elementAt(i).toString().trim() %>"><%=v.elementAt(i).toString().trim() %></option>
   <%} %>
   
   </select>
 </td></tr>
 <tr>
     <td>Song Description</td>
     <td>
  <textarea name="desc" class="form-control" required></textarea>
     
 </td></tr>
  <tr>
     <td>Related Emotions</td>
     <td> <table><tr><td>
      <input type="checkbox" name="emotion" value="angry" class="from-control"/>angry
     </td></tr><tr><td> <input type="checkbox" name="emotion" value="disgust" class="from-control"/>disgust
    </td></tr><tr><td>  <input type="checkbox" name="emotion" value="fear" class="from-control"/>fear
    </td></tr><tr><td>  <input type="checkbox" name="emotion" value="happy" class="from-control"/>happy
    </td></tr><tr><td>  <input type="checkbox" name="emotion" value="sad" class="from-control"/>sad
    </td></tr><tr><td>  <input type="checkbox" name="emotion" value="surprise" class="from-control"/>surprise
    </td></tr><tr><td>  <input type="checkbox" name="emotion" value="neutral" class="from-control"/>neutral
 </td></tr></table></td></tr>
 
 </table></td><td><table class="tblform">
 
 
 <tr>
     <td>Song Type</td>
     <td>
      <select name="song_type" class="form-control">
       <option value="Duet">Duet</option>
       <option value="Solo">Solo</option>
      </select>
 </td></tr>
 
 <tr>
     <td>Singer Type</td>
     <td>
      <select name="singer_type" class="form-control">
       <option value="Male">Male</option>
       <option value="Male&Female">Male&Female</option>
       <option value="Female">Female</option>
      </select>
 </td></tr>
  <tr>
     <td>Movie</td>
     <td>
   <textarea name="movie" class="form-control" required></textarea>
  
 </td></tr>
  <tr><td>Singer</td><td>
    <textarea name="singers" class="form-control" required></textarea>
  
 </td></tr>
  <tr><td>Year Of Release</td><td>
    <textarea name="yearOfRelease" class="form-control" required></textarea>
  
 </td></tr>
 <tr><td>Music Director</td><td>
    <textarea name="musicdir" class="form-control" required></textarea>
  
 </td></tr> <tr><td>Yutube Link</td><td>
    <textarea name="videoLink" class="form-control" required></textarea>
  
 </td></tr> <tr><td>Audio Link</td><td>
    <textarea name="audioLink" class="form-control" required></textarea>
  
 </td></tr>
 <tr><td colspan="2">
     <input type="submit" class="btn btn-primary" value="Submit" />
    </td></tr>
 
</table></td></tr></table></form>
 
</div> 
  
</div>
</div>
<%}
catch(Exception ex)
{
	
} %>

</div></div></div>
</body>
</html>