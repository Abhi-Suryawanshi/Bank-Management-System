<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Update Loan</title>
 <link rel="stylesheet" href="css/bootstrap.min.css">
 <script src="js/jquery.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
</head>
<body>
<form action="LoanController" method="post" id="createUpdateLoanForm" name="createUpdateLoanForm">
	<input type="hidden" name="docmd" id="docmd" value="createLoan">
	<div class="row" style="padding: 8px">
	    <div class="col-md-2">
	    	<label for="full-name">Full Name</label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" placeholder="Full Name" id="fname" name="fname" value="">
	    </div>
	    <div class="col-md-2">
	    	<label for="Fathers/Spouse">Fathers/Spouse</label>
	    </div>
	    <div class="col-md-4">
	    	<input type="number" class="form-control" maxlength="10" placeholder="Fathers / Spouse" id="Fathers/Spouse" name="Fathers/Spouse" value="">
	    </div>
    </div>
    <div class="row" style="padding: 8px">
	    <div class="col-md-2">
	    	<label for="Designation">Designation</label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" placeholder="Designation" id="Designation" name="Designation" value="">
	    </div>
	    <div class="col-md-2">
	    	<label for="dob">Date Of Birth</label>
	    </div>
	    <div class="col-md-4">
	    	<input type="date" class="form-control" maxlength="10" placeholder="Date Of Birth" id="dob" name="dob" value="">
	    </div>
    </div>
    <div class="row" style="padding: 8px">
	    <div class="col-md-2">
	    	<label for="Gender">Gender</label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" placeholder="Gender" id="Gender" name="Gender" value="">
	    </div>
	    <div class="col-md-2">
	    	<label for="nod">No Of Dependents</label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" maxlength="10" placeholder="No Of Dependents" id="nod" name="nod" value="">
	    </div>
    </div>
    <div class="row" style="padding: 8px">
	    <div class="col-md-2">
	    	<label for="Education">Education</label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" placeholder="Education" id="Education" name="Education" value="">
	    </div>
	    <div class="col-md-2">
	    	<label for="od">Occupation</label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" maxlength="10" placeholder="Occupation" id="od" name="od" value="">
	    </div>
    </div>
    <div class="row" style="padding: 8px">
	    <div class="col-md-2">
	    	<label for="pl">Present Liability</label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" placeholder="Present Liability" id="pl" name="pl" value="">
	    </div>
	    <div class="col-md-2">
	    	<label for="los">Length of Service</label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" maxlength="10" placeholder="Length of Service : Years / Months" id="los" name="los" value="">
	    </div>
    </div>
    <div class="row" style="padding: 8px">
	    <div class="col-md-2">
	    	<label for="ai">Annual Income</label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" placeholder="Annual Income" id="ai" name="ai" value="">
	    </div>
	    <div class="col-md-2">
	    	<label for="house">Do you own a House</label>
	    </div>
	    <div class="col-md-4">
	    	<select class="form-control" id="house" name="house">
	    	<option>-- Select --</option>
	    	<option>Yes</option>
	    	<option>No</option>
	    	</select>
	    	
	    </div>
    </div>
    <div class="row" style="padding: 8px">
	    <div class="col-md-2">
	    	<label for="lamt">Loan Amount</label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" maxlength="10" placeholder="Loan Amount:" id="lamt" name="lamt" value="">
	    </div>
	    <div class="col-md-2">
	    	<label for="Vehicle">Vehicle</label>
	    </div>
	    <div class="col-md-4">
	    	<select class="form-control" id="Vehicle" name="Vehicle">
	    	<option>-- Select --</option>
	    	<option>Yes</option>
	    	<option>No</option>
	    	</select>
	    </div>
    </div>
    <div class="row" style="padding: 8px">
	    <div class="col-md-2">
	    	<label for="pol">Purpose of Loan</label>
	    </div>
	    <div class="col-md-4">
	    	<input type="text" class="form-control" placeholder="Purpose of Loan" id="pol" name="pol" value="">
	    </div>
	    <div class="col-md-2">
	    	<label for="psp">Passport Size Photo</label>
	    </div>
	    <div class="col-md-4">
	    	<input type="file" class="form-control" placeholder="Passport Size Photo" id="psp" name="psp" value="">
	    </div>
    </div>
    <div class="row" style="padding: 8px">
    	<div class="col-md-2">
	    	<label for="Address">Address</label>
	    </div>
	    <div class="col-md-10">
	    	<textarea id="Address" class="form-control" name="Address" placeholder="Address" rows="4" cols="54"></textarea>
	    </div>
    </div>
</form>
</body>
</html>