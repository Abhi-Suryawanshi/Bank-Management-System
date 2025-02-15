<%@page import="com.bankingsystem.daoimpl.CustomerDaoImpl"%>
<%@page import="com.bankingsystem.entity.CustomerEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	int custId = session.getAttribute("custId") != null ? (int) session.getAttribute("custId") : 0;
	CustomerEntity custEntity = CustomerDaoImpl.getInstance().findByCustId(custId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Page</title>
<meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="css/bootstrap.min.css">
 <script src="js/jquery.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
</head>
<style>

body {
  margin-top: 50px;
  background-color: #fff;
  font-family: Arial, sans-serif;
  font-size: 14px;
  letter-spacing: 0.01em;
  color: #39464e;
}

.navbar-default {
  background-color: #FFF;
  margin-left: 200px;
}

/*main side bar*/
.msb {
  width: 200px;
  background-color: #f14a46;
  position: fixed;
  left: 0;
  top: 0;
  right: auto;
  min-height: 100%;
  overflow-y: auto;
  white-space: nowrap;
  height: 100%;
  z-index: 1;
  border-right: 1px solid #ddd;
  .navbar {
    border: none;
    margin-left: 0;
    background-color: inherit;
  }
  .navbar-header {
    width: 100%;
    border-bottom: 1px solid #e7e7e7;
    margin-bottom: 20px;
    background: red;
  }
  
  .nb {
    padding-top: 5px;
    padding-left: 10px;
    margin-bottom: 30px;
    overflow: hidden;
    
  }
  
  nav{
  	margin-bottom: 0px;
  	color: green;
  }
  
}

::placeholder,-ms-input-placeholder {
  color: #f14a46;
  opacity: 1; /* Firefox */
}

/*main content wrapper*/
.mcw {
  margin-left: 200px;
  position: relative;
  min-height: 100%;
  
  /*content view*/
  .cv {
  	margin-top: -20px;
    }
  }
}
</style>
<script type="text/javascript">


    function launchNewWindow(pageName){
    	document.getElementById('mainPage').src = pageName;
    }
    
    function logOut(){
    	document.getElementById("logOutFrom").submit();	
    }


</script>
<body>
	<%=custId %>
	<%	
	if (custId > 0) {
	%>
<form name="logOutFrom" id="logOutFrom" action="#" method="post">
	<input type="hidden" name="docmd" value="logOut">
</form>

<nav class="mnb navbar navbar-default navbar-fixed-top" style="background-color: #f14a46;color:white;margin-bottom: 0px;">
  <div class="container-fluid" >
    <div id="navbar" style="margin-bottom: 0px;" >
      <ul class="nav navbar-nav navbar-right">
        <li>
        	<a href="javascript:logOut()" style="background-color:white;color: #f14a46;font-size: 18px;" class=" navbarhov btn">
        		Logout
        	</a>
        </li>
      </ul>
      	
      	<p class="navbar-form navbar-right " style="color: white;font-size: 20px;margin-top: 12px;"><span class="glyphicon glyphicon-user"></span> Logged User : <%=custEntity.getName() %></p>
      	
    </div>
  </div>    
    
</nav>
<!--msb: main sidebar-->
<div class="msb" id="msb">
	<nav class="navbar navbar-default" role="navigation">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<div class="brand-wrapper">
				<!-- Brand -->
				<div class="brand-name-wrapper">
					<a class="navbar-brand1" href="#">
						<img src="AppData/images/bankLogo.png" height="50px" width="200px">
					</a>
				</div>
			</div>
		</div>				
		<!-- Main Menu -->
		<div class="side-menu-container">
			<ul class="nav navbar-nav">
				<li style="display: block;width:200px;"><a href="javascript:launchNewWindow('dashboard.jsp')" style="color:white;">Dashboard</a></li>
				<li style="display: block;width:200px;"><a href="javascript:launchNewWindow('manageAccount.jsp')" style="color:white;">Manage Account</a></li>
				<li  id="dropdown" style="display: block;width:200px">
				<a data-toggle="collapse" href="#dropdown-lvl1" style="color:white;"><i class="fa fa-puzzle-piece"></i> Manage Customer <span class="caret"></span></a>
			    	<div id="dropdown-lvl1" class="panel-collapse collapse">
						<div class="panel-body1">
							<ul class="nav navbar-nav">							
								<li style="display: block;width:200px"><a href="javascript:launchNewWindow('createUpdateCustomer.jsp')" style="color:white;" title="Create Update Customer">Create Update Customer</a></li>							
								<li style="display: block;width:200px"><a href="javascript:launchNewWindow('viewCustomerRequest.jsp')" style="color:white;" title="View Customer Request">View Customer Request </a></li>
								<li style="display: block;width:200px"><a href="javascript:launchNewWindow('viewAllCustomer.jsp')" style="color:white;" title="View All Customer">View All Customer</a></li>
							</ul>
						</div>
					</div>
			    </li>
			    
			    <li  id="dropdown" style="display: block;width:200px">
				<a data-toggle="collapse" href="#dropdown-lvl2" style="color:white;"><i class="fa fa-puzzle-piece"></i> Manage Definition <span class="caret"></span></a>
			    	<div id="dropdown-lvl2" class="panel-collapse collapse">
						<div class="panel-body1">
							<ul class="nav navbar-nav">							
								<li style="display: block;width:200px"><a href="javascript:launchNewWindow('addUpdateDefinition.jsp')" style="color:white;" title="Create Update Customer">Create Update Definition</a></li>							
								<li style="display: block;width:200px"><a href="javascript:launchNewWindow('viewAllDefinition.jsp')" style="color:white;" title="View All Customer">View All Definition</a></li>
							</ul>
						</div>
					</div>
			    </li>	
			    
			     <li  id="dropdown" style="display: block;width:200px">
				<a data-toggle="collapse" href="#dropdown-lvl3" style="color:white;"><i class="fa fa-puzzle-piece"></i> Manage Loan <span class="caret"></span></a>
			    	<div id="dropdown-lvl3" class="panel-collapse collapse">
						<div class="panel-body1">
							<ul class="nav navbar-nav">							
								<li style="display: block;width:200px"><a href="javascript:launchNewWindow('applyForLoan.jsp')" style="color:white;" title="Create Update Customer">Apply For Loan</a></li>							
								<li style="display: block;width:200px"><a href="javascript:launchNewWindow('viewLoanRequest.jsp')" style="color:white;" title="View Loan Request">View Loan Request</a></li>
								<li style="display: block;width:200px"><a href="javascript:launchNewWindow('viewAllLoan.jsp')" style="color:white;" title="View All Loan">View All Loan</a></li>
							</ul>
						</div>
					</div>
			    </li>	
			    	
			</ul>
		</div>
	</nav>  
</div>
<!--main content wrapper-->
	<div class="mcw">
	  <!--navigation here-->
	  <!--main content view-->
	  <div class="cv">
	   	<div class="inbox">
	       <div class="inbox-sb">
	       	<iframe id="mainPage" src="dashboard.jsp" height="750px" width="100%" title="Iframe" style="border: none"></iframe>
	       </div>
	    </div>
	  </div>
	</div>
	<%
	} else {
	%>
	<div style="margin-top: 10%; margin-left: 20%;">
		<img src="AppData/images/authreq.png" height="300px" width="800px">
	</div>
	<%
	}
	%>	
</body>
</html>