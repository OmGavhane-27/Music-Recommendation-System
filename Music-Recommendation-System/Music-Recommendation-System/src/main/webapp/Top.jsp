 
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="models.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html>
<html>
<head>
<title>Music Recommender System</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--flexslider-->
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
<!--//flexslider-->
</head>
<body>
<!--header-->
<div class="header header-main">
	<div class="container">
				<div class="header-top">
				<div class="logo">
					<h1><a href="#">Music Recommender System</a></h1>
				</div>
				<div class="top-nav">
					<span class="menu"><img src="images/menu.png" alt=""> </span>
					<ul>
						<li ><a href="/<%=session.getAttribute("usertype").toString().trim()%>" class="hvr-sweep-to-bottom color"><i class="glyphicon glyphicon-home"></i>Home  </a> </li>
						<li ><a href="ChangePass" class="hvr-sweep-to-bottom color1"><i class="glyphicon glyphicon-picture"></i>Change Password  </a> </li>
						<li><a href="logout"  class="hvr-sweep-to-bottom color2"><i class="glyphicon glyphicon-tags"></i>Logout</a></li>
							<div class="clearfix"> </div>
					</ul>
					<!--script-->
				<script>
					$("span.menu").click(function(){
						$(".top-nav ul").slideToggle(500, function(){
						});
					});
			</script>				
				</div>
			<div class="clearfix"> </div>
		</div>
	</div>
</div>
<!--//header-->
<!--content-->
	<div class="blog whiteback">
		<div class="container "><div class="row">
				<div class="col-md-9">
					<div class="blog-grid adminback">
					 
					<div class="lone-line">
						<h4 class="white"><%=session.getAttribute("usertype").toString() %>
Home</h4>
<p class="white">
Logged in as </span> <%=session.getAttribute("userid").toString() %> (<%=session.getAttribute("usertype").toString() %>)
 </p>
						   
					 
					</div>
					</div>
				</div>
				
				 
				
				
				<div class="col-md-3">
					<div class="grid-categories">
						<div class="cate-top">
						<h4>Activities</h4>
						<ul class="popular">
						<%if(session.getAttribute("usertype").toString().trim().equals("admin"))
                                	{
                                	%>
							 
							<li><a href="viewUsers"><i class="glyphicon glyphicon-chevron-right"> </i>View Users</a></li>
							
						<!-- 	<li><a href="regCategory"><i class="glyphicon glyphicon-chevron-right"> </i>Register Music Categories </a></li> -->
							<li><a href="RegisterSongs.jsp"><i class="glyphicon glyphicon-chevron-right"> </i>Manage Music Dataset</a></li>
							<li><a href="ViewMusicDataset.jsp"><i class="glyphicon glyphicon-chevron-right"> </i>View Music Dataset </a></li>
							<%}if(session.getAttribute("usertype").toString().trim().equals("user"))
                        	{ %>
							<li><a href="http://localhost:80/MusicRecommenderSystemPython/app.py?userid=<%=session.getAttribute("userid").toString().trim()%>"><i class="glyphicon glyphicon-chevron-right"> </i>Emotion Recognition </a></li>
						 <li><a href="mypreferences.jsp"><i class="glyphicon glyphicon-chevron-right"> </i>My Preferences</a>
							<%}%>
						 		</ul>
					</div>
				</div></div>
</div><div class="row">
				<div class="col-md-12 blog-grid">
           
       