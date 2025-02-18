<%@page import="com.bankingsystem.daoimpl.CustomerDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	int custId = session.getAttribute("custId") != null ? (int) session.getAttribute("custId") : 0;
	int custCount = CustomerDaoImpl.getInstance().customerCount();
	int approvCount = CustomerDaoImpl.getInstance().customerApproveCount();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  
  
</head>
<style>
	.glyphicon glyphicon-user {
		align-content: left;
	}
	
	.topright {
	  position: absolute;
	  top: 70px;
	  right: 86px;
	  font-size: 18px;
	  color: #54B4D3;
	}
	
	.navbar {
	margin-bottom: 0px;
	}
	
</style>
<body>
<%	
if (custId > 0) {
%>

<form name="resetElection" id="resetElection" action="VoterRegistrationController" method="post"> 
<input type="hidden" name="docmd" id="docmd" value="resetElectionForm">
<div class="well"><h4 style="color: #f14a46;">Dashboard</h4></div>

<div class="panel-group">
	<div class="panel">		
		<div class="panel-body" style="padding: 30px">
			<div class="col-md-3">
				<div class="card text-white shadow-lg" >
					<div class="card-header" style="text-align: center; background-color: #f14a46"><h4>Customer Count</h4></div>
					<div class="card-body">							
						<span class="glyphicon glyphicon-user" style="color: #f14a46;font-size: 22px;">
						</span>
						<span class="topright"  style="color: #f14a46;"><%=custCount%></span>						
					</div> 
				</div>	
			</div>
			
			<div class="col-md-3">
				<div class="card text-white shadow-lg" >
					<div class="card-header" style="text-align: center; background-color: #f14a46"><h4>Customer Approv Count</h4></div>
					<div class="card-body">							
						<span class="glyphicon glyphicon-th" style="color: #f14a46;font-size: 22px;">
						</span>
						<span class="topright" style="color: #f14a46;" ><%=approvCount %></span>
					</div>
				</div>	
			</div>
			<!--
			<div class="col-md-3">
				<div class="card text-white shadow-lg" >
					<div class="card-header" style="text-align: center; background-color: #54B4D3"><h4>Test</h4></div>
					<div class="card-body">							
						<span class="glyphicon glyphicon-th" style="color: #54B4D3;font-size: 22px;">
						</span>
						<span class="topright" >85</span>
					</div>
				</div>	
			</div>
			
			<div class="col-md-3">
				<div class="card text-white shadow-lg">
					<div class="card-header" style="text-align: center; background-color: #54B4D3"><h4>Test</h4></div>
					<div class="card-body">							
						<span class="glyphicon glyphicon-th" style="color: #54B4D3;font-size: 22px;">
						</span>
						<span class="topright" >89</span>
					</div>
				</div>	
			</div>	
		</div>						
			
		<div class="panel-body" style="padding: 30px">			
			<div class="col-md-3">
				<div class="card text-white shadow-lg" >
					<div class="card-header" style="text-align: center; background-color: #54B4D3"><h4>Test</h4></div>
					<div class="card-body">							
						<span class="glyphicon glyphicon-th" style="color: #54B4D3;font-size: 22px;">
						</span>
						<span class="topright" >79</span>
					</div>
				</div>	
			</div>
		 
			<div class="col-md-3">
				<div class="card text-white shadow-lg" >
					<div class="card-header" style="text-align: center; background-color: #54B4D3"><h4>Test</h4></div>
					<div class="card-body">							
						<span class="glyphicon glyphicon-th" style="color: #54B4D3;font-size: 22px;">
						</span>
						<span class="topright" ><button type="submit" class="btn btn-info" >Reset</button></span>
					</div>
				</div>	
			</div>
			 -->
		</div>
	</div>
</div>



	<!-- <div class="card col-md-3">
  <div class="card-header">Header</div>
  <div class="card-body">Content</div>
  <div class="card-footer">Footer</div>
</div> -->


<div class="panel-group">
   <div class="panel">
      <div class="panel-heading text-white" style="background-color: #f14a46;"><h4>Election Data Analysis</h4></div>
   </div>
      <div class="panel-body">
          <div class="col-md-6">
				<div class="panel panel-default shadow-lg" style="height: 320px; width: 450px;">
					<div class="panel-body">
						<canvas id="barChart" style="width: 100%; height:300px;"></canvas>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-default shadow-lg" style="height: 320px; width: 450px;">
					<div class="panel-body">
						<canvas id="pieChart" style="width: 100%; height:300px;"></canvas>
					</div>
				</div>
			</div>
      </div>
</div>


<script>
var xValues = ["Italy", "France", "Spain", "USA", "Argentina"];
var yValues = [55, 49, 44, 24, 15];
var barColors = ["red", "green","blue","orange","brown"];

new Chart("barChart", {
  type: "bar",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    legend: {display: false},
    title: {
      display: true,
      text: "World Wine Production 2018"
    }
  }
});




var xValues = ["Italy", "France", "Spain", "USA", "Argentina"];
var yValues = [55, 49, 44, 24, 15];
var barColors = [
  "#b91d47",
  "#00aba9",
  "#2b5797",
  "#e8c3b9",
  "#1e7145"
];

new Chart("pieChart", {
  type: "pie",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    title: {
      display: true,
      text: "World Wide Wine Production 2018"
    }
  }
});
</script>

			

</form>
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