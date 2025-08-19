 
<%@page import="models.*"%>
<%@page import="models.GetStateNCities"%>
<%@page import="java.util.List"%> 

<!DOCTYPE html>
<html>
<head>
<title>Music Recommendation System</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Music Club Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</head>
<body>
<!--header-->
<div class="header">
	<div class="container">
			<div class="header-top">
				<div class="logo">
					<h1><a href="index.html">Music Recommender System</a></h1>
				</div>
				<div class="top-nav">
					<span class="menu"><img src="images/menu.png" alt=""> </span>
					<ul>
						<li ><a href="home" class="hvr-sweep-to-bottom color"><i class="glyphicon glyphicon-home"></i>Home  </a> </li>
						<li ><a href="#login" class="hvr-sweep-to-bottom color1"><i class="glyphicon glyphicon-log-in"></i>Login  </a> </li>
						<li><a href="#reg"  class="hvr-sweep-to-bottom color2"><i class="glyphicon glyphicon-registration-mark"></i>Registration</a></li>
					 
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
			<div class="banner-main">
	  <section class="slider">
           <div class="flexslider">
             <ul class="slides">
				   <li>
				   	<div class="banner-matter">
					   	<h3>Facial Emotion Recognition</h3>
					   	<p>Facial Emotion Recognition using CNN algorithm</p>
				  	</div>
				   </li>
				    <li>
				   	<div class="banner-matter">
					   	<h3>Facial Emotion based Music Recommendation System</h3>
					   	<p> Music Recommendation based on Facial Emotions</p>				  	</div>
				   </li>
				   
          </ul>
        </div>
      </section>

	</div>

<!--FlexSlider-->
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
	<script defer src="js/jquery.flexslider.js"></script>
	<script type="text/javascript">
    $(function(){
      SyntaxHighlighter.all();
    });
    $(window).load(function(){
      $('.flexslider').flexslider({
        animation: "slide",
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
  </script>

	</div>
</div>
<!--//header-->
<!--content-->
<div class="content">
	<div class="container">
		<!--content-top-->
		<div class="content-top">
			<div class="col-md-7 content-top1">
				<h3>Welcome</h3>
				<p>Register yourself and get emotion based music recommendation. We provide accurate emotion recognition model based on machine learning</p>
			</div>
			<div class="col-md-5 top-col">
				<div class="col1">
					<div class="col-md-6 col2">
						<img src="images/ic.png" alt="" >
					</div>
					<div class="col-md-6 col3">
						<img src="images/ic1.png" alt="" >
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="col1">
					<div class="col-md-6 col4">
						<img src="images/ic2.png" alt="" >
					</div>
					<div class="col-md-6 col5">
						<img src="images/ic3.png" alt="" >
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
		<!--//content-top-->
		 
	</div>
	<div class="content-middle" id="login">
		<div class="container">
		<div class="content-mid-top">
					<h3>Login</h3>
				</div>
				<div class="news">
					<div class="col-md-6 new-more">
						<div class=" new-more1">
						<div class="form-div"><div class="row"><div class="col-md-6">
						 <form name="frm" method="post" action="check">
         <table class="tblform"> 
         <tr><td>Userid</td>
         <td>
          <input type="text" class="form-control" name="userid" required>
          </td>
          </tr>
          <tr><td>Password</td>
          <td> <input type="password"  class="form-control" name="pswd" required>
          </td>
          </tr>
          <tr><td colspan="2"><input type="submit" class="btn btn-primary" value="Submit"></td></tr>
          <tr><td colspan="2"><a href="forgetpassword" class="black">Forget Password?</a></td></tr>
         </table>
				<br/><br/>			 
							 
							 
						</form></div><div class="col-md-6">
<img src="images/login.avif" width="90%"/>
</div></div>  </div>
						<div class="clearfix"> </div>
					</div>
					</div>
						<div class="col-md-6 new-more">
						 
					</div>
					<div class="clearfix"> </div>
				</div>
				 
			</div>
	</div>
	 
</div>
<!--//content-->
<!--footer-->
<div class="footer" id="reg">
	<div class="container">
		<h2><a href="index.html"> Registration</a></h2>
		<div class=" new-more1">
		<div class="row"><div class="col-md-6">
					 <form name="frm" method="post" action="registeruser" enctype="multipart/form-data"><table class="tblform">
	<tr><td>Userid</td>
	<td><input type="text" name="userid" class="form-control" required></td>
	</tr>
	<tr><td>User Name</td>
	<td><input type="text" name="usernm" class="form-control" required></td>
	</tr>
	<tr><td>Password</td>
	<td><input type="password" name="pswd" class="form-control" required>
	 <input type="hidden" name="usertype" value="user"/>
	</td>
	</tr>
 
       <tr><td>Mobile Number</td>
       	<td><input type="text" name="mobileno"  pattern="^\d{10}$" class="form-control" required></td></tr>
       <tr>
		<td>Email Address</td>       
       <td><input type="text" name="emailid" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"  class="form-control" required></td>
       </tr>
     
       <tr>
<td>Gender</td>
<td>
  <input type="hidden" name="userstatus" value="active"/>
<input type="radio" name="gender" value="Male"   checked="checked" required >Male 
<input type="radio" name="gender" value="Female"  required>Female 
</td>
</tr>
        
         <tr><td> Address</td>
	<td><textarea  name="addr" class="form-control" required></textarea></td>
	</tr>
	<tr><td>Pincode</td>
	<td><input type="text" name="pincode" class="form-control" required></td>
	</tr>
      
       <tr>
       	<td>Date Of Birth</td>
       	<td><input type="date" name="dob" class="form-control"></td>
       </tr>
        
	<tr>
	<td><input type="submit" value="Submit" class="btn btn-primary" ></td>
	</tr>
	</table>
</form></div><div class="col-md-6">
<img src="images/reg1.avif" width="90%"/>
</div></div> </div>
					<p > © 2023 Music Recommendation System rights reserved </p>
	</div>
</div>
<!--//footer-->
</body>
</html>
