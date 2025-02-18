<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Apply For Loan</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
  
</head>
<script type="text/javascript">

	function emiCalculator() {
		window.location = 'emiCalculator.jsp';
	}


</script>
<style>
	.card-body{
		padding: 9rem;
	}
	.col-md-4{
		padding-bottom: 15px;
	}
	.btn{
		font-size: 15px;
	}
</style>
<body>
<div class="well" style="font-weight: bold;"><h4 style="color: #f14a46;">Apply For Loan</h4></div>
	<div class="panel-group">
	<div class="panel">		
		<div class="panel-body" style="padding: 30px">
			<div class="col-md-4">
				<div class="card text-white shadow-lg" >
					<div class="card-body" style="background-image: url('AppData/images/PersonalLoans.jpg');background-repeat: no-repeat;background-size: cover;">							
					</div> 
						<button type="button" onclick="" class="btn btn-lg" style="background-color: #f14a46;color: white;">Apply For Personal Loan</button>				
				</div>	
			</div>
			
			<div class="col-md-4">
				<div class="card text-white shadow-lg" >
					<div class="card-body" style="background-image: url('AppData/images/carLoan.jpg');background-repeat: no-repeat;background-size: cover;">							
					</div> 
						<button type="button" onclick="" class="btn btn-lg" style="background-color: #f14a46;color: white;">Apply For Car Loan</button>				
				</div>	
			</div>
			
			<div class="col-md-4">
				<div class="card text-white shadow-lg" >
					<div class="card-body" style="background-image: url('AppData/images/homeLoan.png');background-repeat: no-repeat;background-size: cover;">							
					</div>
						<button type="button" onclick="" class="btn btn-lg" style="background-color: #f14a46;color: white;">Apply For Home Loan</button>
				</div>	
			</div>
			
			<div class="col-md-4">
				<div class="card text-white shadow-lg" >
					<div class="card-body" style="background-image: url('AppData/images/creditCard.jpg');background-repeat: no-repeat;background-size: cover;">							
					</div>
						<button type="button" onclick="" class="btn btn-lg" style="background-color: #f14a46;color: white;">Apply For Credit Card</button>
				</div>	
			</div>
			
			<div class="col-md-4">
				<div class="card text-white shadow-lg" >
					<div class="card-body" style="background-image: url('AppData/images/emi.png');background-repeat: no-repeat;background-size: cover;">							
					</div>
						<button type="button" id="emiC" onclick="emiCalculator()" class="btn btn-lg" style="background-color: #f14a46;color: white;">EMI Calculator</button>
				</div>	
			</div>
		</div>
	</div>
	</div>
</body>
</html>