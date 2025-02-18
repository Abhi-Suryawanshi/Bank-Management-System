<%@page import="java.util.function.Function"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	String successMsg = (String)request.getAttribute("success");
	String errorMsg = (String)request.getAttribute("error");
	
%>

<html>
<head>
  <title>Welcome</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
</head>
<style>
body{
	 background-image: url(AppData/images/bg.jpg);
	 background-repeat: no-repeat;
	 background-attachment: fixed;
	 background-size: cover;
}

.navbar {
	margin-bottom: 0px;
}
.topright {
  position: absolute;
  right: 16px;
  font-size: 18px;
}

.xmdtl {
  position: absolute;
  top: 50px;
  right: 16px;
}

.slogan{
	font-weight: bold;
	color: #DC4C64;
}

.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color: #f14a46;
   color: white;
   text-align: center;
}

</style>
<script>
	function login(){
		var userName = document.getElementById("uname").value;
		var pwd = document.getElementById("pwd").value;
		var isValid = true;
		if(userName == "" || pwd == ""){
			isValid = false;
			alert("Please Enter valid credentials to proceed.");
			document.getElementById("uname").style.backgroundColor = "#f0ebc7";
			document.getElementById("pwd").style.backgroundColor = "#f0ebc7";
		}
		if(isValid){
			document.getElementById("loginForm").submit();
		}
	}
	
	function showPassword() {
		
		var x = document.getElementById("pwd");
		if (x.type === "password") {
	    	x.type = "text";
	    } else {
	    	x.type = "password";
	    }
	  }
	
	
	function register(){
		var name = document.getElementById("name").value;
		var contact = document.getElementById("contact").value;
		var email = document.getElementById("email").value;
		var user = document.getElementById("user").value;
		var dob = document.getElementById("dob").value;
		var address = document.getElementById("address").value;
		var isValid = true;
		
		var birth = new Date(dob);
		var birthYear = birth.getYear();
		var now = new Date();
		var currentYear = now.getYear();
		var age = currentYear - birthYear;
		
		if(age < 18){
		alert("Please enter valid Date of Birth to Proceed");
		isValid = false;
		}
		
		if(contact.length!=10){
			alert("Please enter valid contact");
			isValid = false;
		}
		if(name=="" || contact=="" || email =="" || user == "" ||  dob == "" || address == "" || age < 18){
			isValid = false;
			alert("Please enter valid data to proceed.");
			document.getElementById("name").style.backgroundColor = "#f0ebc7";
			document.getElementById("contact").style.backgroundColor = "#f0ebc7";
			document.getElementById("email").style.backgroundColor = "#f0ebc7";
			document.getElementById("user").style.backgroundColor = "#f0ebc7";
			document.getElementById("dob").style.backgroundColor = "#f0ebc7";
			document.getElementById("address").style.backgroundColor = "#f0ebc7";
			
		}
		if(isValid){
			document.getElementById("registerForm").submit();
		}
	}
	
	
</script>
<body>
<nav class="navbar" style="background-color: #dbd9de;">
  <div class="container-fluid">
    <div class="navbar-header" >
      <a class="navbar-brand" href="#" >Online Banking</a>
    </div>
    <ul class="nav navbar-nav topright" style="color: black;">
      <li><a href="#" data-toggle="modal" data-target="#myModal">Register</a></li>
      <li><a href="#">Services</a></li>
      <li><a href="#">Policies</a></li>
      <li><a href="#">Logout</a></li>
    </ul>
  </div>
</nav>

<%if(successMsg != null){%>
	<div class="alert alert-success" style="width: 50%;margin-left: 25%;">
	  <strong>Success!</strong> <%=successMsg %>
	</div>
<%
} 
%>

<%if(errorMsg != null){ %>
	<div class="alert alert-danger" style="width: 50%;margin-left: 25%;">
	  <strong>Error</strong> <%=errorMsg %>
	</div>
<%
}
%>

<!-- START LOGIN MODEL -->
<div class="col-md-4" style="margin-top: 17%;margin-left:2%;background-color: white;padding: 10px;">
<form action="CustomerController" method="post" name="loginForm" id="loginForm">
 <input type="hidden" name="docmd" id="docmd" value="checkLoginCredentials">
  <h3>Login</h3>
  <div class="form-group">
    <label for="email">Username <span style="color: red;">*</span></label>
    <input type="email" class="form-control" id="uname" name="uname">
  </div>
  <div class="form-group">
    <label for="pwd">Password <span style="color: red;">*</span></label>
    <input type="password" class="form-control" id="pwd" name="pwd">
    <input type="checkbox" onclick="showPassword()">Show Password
  </div>
  <div class="checkbox">
   <a href="#" data-toggle="modal" data-target="#myModalForgot"> Forgot Password?</a>
  </div>
  <button type="button" class="btn " style="background-color: #f14a46;color: white;" onclick="login()">Submit</button>
</form>
</div>
<!-- END LOGIN MODEL -->


<!-- START Registration Model -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Register</h4>
        </div>
        <div class="modal-body">
         	<form action="CustomerController" method="post" name="registerForm" id="registerForm">
			  <input type="hidden" name="docmd" id="docmd" value="createCustomer">
			  <div class="form-group">
			    <label for="fullname">Full Name <span style="color: red;">*</span></label>
			    <input type="text" class="form-control" id="name" name="name">
			  </div>
			  <div class="form-group">
			    <label for="contact">Contact <span style="color: red;">*</span></label>
			    <input type="text" class="form-control" id="contact" name="contact" maxlength="10" >
			  </div>
			   <div class="form-group">
			    <label for="email">Email <span style="color: red;">*</span></label>
			    <input type="text" class="form-control" id="email" name="email">
			  </div>
			  <div class="from-group">
			  <label for="user">Set User Name <span style="color: red;">*</span></label>
			  <input type="text" class="form-control" id="user" name="user"> 
			  </div>
			  <div class="form-group">
			    <label for="dob">DOB <span style="color: red;">*</span></label>
			    <input type="date" class="form-control" id="dob" name="dob">
			  </div>
			   <div class="form-group">
			    <label for="address">Address <span style="color: red;">*</span></label>
			    <textarea class="form-control" id="address" name="address"></textarea>
			  </div>
			  <button type="button" class="btn " style="background-color: #f14a46;color: white;" onclick="register()">Submit</button>
			</form>
        </div>
      </div>
    </div>
 </div>
<!-- END Registration Model Start -->

<!-- START Forgot Password -->
<!-- Modal -->
<div id="myModalForgot" class="modal fade" role="dialog">
  <div class="modal-dialog">
	<!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Forgot Password</h4>
      </div>
      <div class="modal-body">
        	<form action="#" name="forgotPwdForm" id="forgotPwdForm" method="post">
			  <div class="form-group">
			    <label for="email">User name <span style="color: red;">*</span></label>
			    <input type="email" class="form-control" id="uname" name="uname">
			  </div>
			  <button type="button" class="btn" style="background-color: #f14a46;color: white;" onclick="forgotPwd()">Submit</button>
			</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn" style="background-color: #f14a46;color: white;" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<!-- START Forgot Password -->


<!-- START FOOTER -->
<div class="footer">
  <p>This Product is developed and maintained by Fragile Technology, Manjari(Bk), Hadapasar,Pune 412307 @2023</p>
</div>
<!-- END FOOTER -->
</body>
</html>