<%@page import="com.bankingsystem.daoimpl.CustomerDaoImpl"%>
<%@page import="com.bankingsystem.entity.CustomerEntity"%>
<%@page import="java.util.function.Function"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	String successMsg = (String)request.getAttribute("success");
	String errorMsg = (String)request.getAttribute("error");
	
	int custId =   session.getAttribute("custId") != null ? (int) session.getAttribute("custId") : 0;
	CustomerEntity custEntity = CustomerDaoImpl.getInstance().findByCustId(custId);
	
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

.navbarhov{
	color: white;
}

.navbarhov:hover{
	color: #f14a46 ;
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
	

	function showPwd() {
		
		var x = document.getElementById("pwd");
	  		if (x.type === "password") {
	    	x.type = "text";
	  	} else {
	    	x.type = "password";
			}
	  }
	
	function showForgotPassword() {
		
		var x = document.getElementById("fpassword");
		var y = document.getElementById("cpassword");
	  		if (x.type === "password" || y.type === "password") {
	  			x.type = "text";
		    	y.type = "text";	
	  	} else {
	    	
	    	x.type = "password";
	    	y.type = "password";
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
	
	function forgotPwd() {
		var isValid = true;
		var uEmail = document.getElementById("uEmail").value;
		if(uEmail == ""){
			isValid = false;
			alert("Please enter valid data to proceed.");
			document.getElementById("uEmail").style.backgroundColor = "#f0ebc7";
		}
		if(isValid){
			document.getElementById("forgotPwdForm").submit();
		}
	}
	
	function matchPassword(){
		var pass = document.getElementById("password").value;
		var cpass = document.getElementById("cpassword").value;
		var isValid = true;
		
		if(pass!=cpass)
			{
			alert("password not matching");
			document.getElementById("pass").style.backgroundColor = "#f0ebc7";
			document.getElementById("cpass").style.backgroundColor = "#f0ebc7";
			}
		if(isValid)
			{
			alert("password is updated successfully");
			document.getElementById("updatePwdForm").submit();
			}
	}
	

	$(function(){
		$("#sendOTPBtn").click(
			function(){
				var userName = $("#userName").val();
				$.ajax({
					type:'post',
					url: 'AjaxController',
					dataType: 'json',
					data:{uname: userName,docmd:'sendOTP'},
					success:function(jsonResponse){
						if(jsonResponse>0){
							alert("OTP Sent on your Email.");
							//here in jsonResponse we received custId
							$('#custId').val(jsonResponse);
							document.getElementById("sendOTPDiv").style.display = 'none';
							document.getElementById("verifyOTPDiv").style.display = 'block';
							
						}else{
							document.getElementById("sendOTPDiv").style.display = 'block';
						}
					}
				})
			}	
		)
	})
	
	$(function(){
		$("#verifyOTPBtn").click(
			function(){
				var otp = $("#otp").val();
				var custId = $("#custId").val();
				$.ajax({
					type:'post',
					url: 'AjaxController',
					dataType: 'json',
					data:{otp: otp,docmd:'verifyOTP',custId:custId},
					success:function(jsonResponse){
						alert(jsonResponse);
						if(jsonResponse.includes("Verified Successfully")){
							document.getElementById("verifyOTPDiv").style.display = 'none';
							document.getElementById("updatePwdDiv").style.display = 'block';
						}else{
							$('#otp').val('');
							document.getElementById("verifyOTPDiv").style.display = 'block';
						}
					}
				})
			}	
		)
	})
	
	$(function(){
		$("#updatePWDBtn").click(function(){
				var pwd = $("#fpassword").val();
				var cpwd = $("#cpassword").val();
				var custId = $("#custId").val();
				if(pwd==cpwd){
					$.ajax({
						type:'post',
						url: 'AjaxController',
						dataType: 'json',
						data:{password: cpwd,docmd:'updatePwdForm',custId:custId},
						success:function(jsonResponse){
							alert(jsonResponse);
						}
					})
				}else{
					alert("Password does not match please try again.");
				}
			}	
		)
	})
	
	function defaultSetting(){
        document.getElementById("verifyOTPDiv").style.display = 'none';
        document.getElementById("updatePwdDiv").style.display = 'none';
    }
	
	setInterval(function(){ $(".alert").fadeOut(); }, 3000);
</script>
<body>
<nav class="navbar" style="background-color: #f14a46 ">
  <div class="container-fluid">
    <div class="navbar-header" >
      <a class="navbar-brand " href="#" style="color: white;">Online Banking</a>
    </div>
    <ul class="nav navbar-nav topright" style="color: white;">
      <li><a class="navbarhov" href="#" data-toggle="modal" data-target="#myModal">Register</a></li>
      <li><a class="navbarhov" href="#">Services</a></li>
      <li><a class="navbarhov" href="#">Policies</a></li>
    </ul>
  </div>
</nav>
<div id="warningMsgDiv">
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
</div>
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
   <a href="#" data-toggle="modal" style="color: #f14a46;" data-target="#myModalForgot"> Forgot Password ?</a>
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
        <h4 class="modal-title">Forgot Password<span style="color: red;">*</span></h4>
      </div>
      <div class="modal-body">
        	<form name="forgotPasswordForm" id="forgotPasswordForm" action="AjaxController" method="post"></form>
        	<input type="hidden" id="custId" name="custId" value="">
        	<!--Forgot Password and send otp to customV2  -->
        	<div id="sendOTPDiv">
        		 <div class="form-group">
				    <label for="uname">User Mail <span style="color: red;">*</span></label>
				    <input type="text" class="form-control" id="userName" name="userName">
				  </div>
			 	 <button type="button" id="sendOTPBtn" class="btn btn-info">Send OTP</button>
			</div>  
			 <!-- verify otp with customv2 -->
			 <div id="verifyOTPDiv"> 
			 	<input type="hidden" name="docmd" value="verifyOTP">
				 <input type="hidden" id="custId" name="custId" value="">
				  <div class="form-group">
				    <label for="otp">Enter OTP<span style="color: red;">*</span></label>
				    <input type="text" class="form-control" id="otp" name="otp">
				  </div>
				  <button type="button" class="btn btn-info" id="verifyOTPBtn">Verify</button>
			</div> 
			 
			 <!-- otp verified and now password == confirm password -->
			 <div id="updatePwdDiv">
			  	  <div class="form-group">
				    <label for="fpassword">Password <span style="color: red;">*</span></label>
				    <input type="password" class="form-control" id="fpassword" name="fpassword">
				  </div>
				   <div class="form-group">
				    <label for="cpassword">Confirm Password<span style="color: red;">*</span></label>
				    <input type="password" class="form-control" id="cpassword" name="cpassword">
				    <input type="checkbox" onclick="showForgotPassword()">Show Password
				  </div>
				  <button type="submit" id="updatePWDBtn" class="btn btn-info">Update Password</button>
			</div>
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