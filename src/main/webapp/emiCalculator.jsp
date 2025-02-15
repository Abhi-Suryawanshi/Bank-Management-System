<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EMI Calculator</title>
 <link rel="stylesheet" href="css/bootstrap.min.css">
 <script src="js/jquery.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
 <script src="chartjs/Chart.min.js"></script>
  <script src="chartjs/jquery.slim.min.js"></script>
  <script src="chartjs/popper.min.js"></script>
  <script src="chartjs/bootstrap.bundle.min.js"></script>
  <script src="chartjs/jquery.min.js"></script>
  <script src="chartjs/bootstrap.min.js"></script>
  
</head>
<style>
	
	span{
		color: red;
	}
	.chart{
		
	}
	tr,th,td{
		border: 1px solid #ddd;
		text-align: center;
	}
	.btn{
		margin-bottom: 20px;
	}
</style>
<body>
<div class="well" style="font-weight: bold;"><h4>EMI Calculator</h4></div>

	<form id="emiForm" class="emiForm">
		<div class="col-md-6">
		<div class="row" style="padding-bottom: 8px;">
			<div class="col-md-4">
    			<label for="loan-amt">Loan Amount<span>*</span></label>
    		</div>
   			<div class="col-md-4">
    			<input type="number" class="form-control"  id="loanAmt" name="loanAmt" value="">
    		</div>
    	</div>
    
	    <div class="row" style="padding-bottom: 8px;">	
	    	<div class="col-md-4">
	    		<label for="roi">ROI<span>*</span></label>
	    	</div>
	   		<div class="col-md-4">
	    		<input type="number" class="form-control"  id="roi" name="roi" value="">
	    	</div>
	    </div>
    
	    <div class="row" style="padding-bottom: 8px;">	
	    	<div class="col-md-4">
	    		<label for="tenure">Tenure (Month)<span>*</span></label>
	    	</div>
	   		<div class="col-md-4">
	    		<input type="number" class="form-control"  id="tenure" name="tenure" value="" >
	    	</div>
	    </div>
	   
	    <button type="button" style="background-color:#f14a46;color: white;" id="calculate" class="btn" onclick="emiCalculator();this.disabled=true;">Calculate</button>
	    <button type="reset" style="background-color:#f14a46;color: white;margin-left: 1rem;" id="reset" class="btn" onclick="resetFun();">Reset</button>
	    
	    </div>
	</form>
	<div id="chart" class="panel-body" >
			<div class="col-md-6">
				<div class="panel " style="height: 320px; width: 450px;">
					<div class="panel-body">
						<canvas id="pieChart" style="width: 100%; height:300px;"></canvas>
					</div>
				</div>
			</div>
      </div>
 
</body>

<script type="text/javascript">
	
	function resetFun() {
		document.getElementById("calculate").disabled=false;
		$("#myTable").remove();
		$("#chart").remove();
	}
	
	function emiCalculator(){
		var principleAmt = document.getElementById("loanAmt").value;
		var tenure = document.getElementById("tenure").value;
		var roi = document.getElementById("roi").value;
		
		var ttlAmt=0;
		var ttlMonthlyPrincipleAMT = 0;
		var ttlMonthlyInterestAMT = 0;
		var ttlMonthlyEMIAMT = 0;
		var ttlMonthlyOutStanndingAmt = 0;
		
		var principleAry = [];
		var monthlyInterestAry = [];
		var monthlyEMIAry = [];
		var outStandingAmtAry=[];
		var monthlyPrincipleAmt = principleAmt/tenure;
		for(var i=0;i<tenure;i++){
			
			principleAry.push(monthlyPrincipleAmt.toFixed(4));
			ttlMonthlyPrincipleAMT = parseFloat(ttlMonthlyPrincipleAMT) + parseFloat(principleAry);

			var monthlyInterestAmt = (principleAmt*roi/100);
			monthlyInterestAry.push(monthlyInterestAmt.toFixed(4));
			ttlMonthlyInterestAMT = parseFloat(ttlMonthlyInterestAMT) + parseFloat(monthlyInterestAmt.toFixed(4));
			
			var monthlyEmiAmt = monthlyPrincipleAmt + monthlyInterestAmt;
			monthlyEMIAry.push(monthlyEmiAmt.toFixed(4));
			ttlMonthlyEMIAMT = parseFloat(ttlMonthlyEMIAMT) + parseFloat(monthlyEmiAmt.toFixed(4));
			
			var monthlyoutStandingAmt = principleAmt - monthlyPrincipleAmt;
			outStandingAmtAry.push(monthlyoutStandingAmt.toFixed(4));
			principleAmt = monthlyoutStandingAmt;
		} 		

		//Printing Pie Chart
		
		var xValues = ["Monthly Principle", "Monthly Interest", "Monthly EMI", "OutStanding Amount"];
		var yValues = [55, 49, 44, 15];
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
		      text: "EMI Values"
		    }
		  }
		});
			
		//Printing Table.
		var tbl = document.createElement("TABLE");
		tbl.setAttribute("id", "myTable");
		tbl.setAttribute("class", "table table-bordered");
		document.body.appendChild(tbl);
		
		var thead = document.createElement("THEAD");
		thead.setAttribute("id", "myThead");
		document.getElementById("myTable").appendChild(thead);
		
		var tr = document.createElement("TR");
		tr.setAttribute("id", "myTh");
		document.getElementById("myThead").appendChild(tr);
		
		var tbody = document.createElement("TBODY");
		tbody.setAttribute("id", "myTbody");
		document.getElementById("myTable").appendChild(tbody);
		
		var th = document.createElement("TH");
		var NoOfMonth = document.createTextNode("No Of Month");
		th.appendChild(NoOfMonth);
		
		var th1 = document.createElement("TH");
		var MonthlyPrinciple = document.createTextNode("Monthly Principle");
		th1.appendChild(MonthlyPrinciple);
		
		var th2 = document.createElement("TH");
		var MonthlyInterest = document.createTextNode("Monthly Interest");
		th2.appendChild(MonthlyInterest);
		
		var th3 = document.createElement("TH");
		var MonthlyEMI = document.createTextNode("Monthly EMI");
		th3.appendChild(MonthlyEMI);
		
		var th4 = document.createElement("TH");
		var OutStandingAmount = document.createTextNode("OutStanding Amount");
		th4.appendChild(OutStandingAmount);
		 
		document.getElementById("myTh").appendChild(th);	
		document.getElementById("myTh").appendChild(th1);
		document.getElementById("myTh").appendChild(th2);
		document.getElementById("myTh").appendChild(th3);
		document.getElementById("myTh").appendChild(th4);						
					
		for(var t=0;t<parseInt(tenure);t++){
			
			 var tr = document.createElement("TR");
			 tr.setAttribute("id", "myTr_"+t);
			 document.getElementById("myTbody").appendChild(tr);
			 th.appendChild(NoOfMonth);
			 var td = document.createElement("TD");
				 var NoOfManth = document.createTextNode(t +1 );
				 td.appendChild(NoOfManth);
				 
				 //Monthly Principle
				 var td1 = document.createElement("TD");
				 var Principle = document.createTextNode(principleAry[t]);
				 td1.appendChild(Principle); 
				 
				 //Monthly Interest
				 var td2 = document.createElement("TD");
				 var Interest = document.createTextNode(monthlyInterestAry[t]);
				 td2.appendChild(Interest); 
				 //alert(principleAry[t]); 
				 
				 //Monthly EMI
				 var td3 = document.createElement("TD");
				 var MonthlyEMI = document.createTextNode(monthlyEMIAry[t]);
				 td3.appendChild(MonthlyEMI);
				 
				 //OutStanding Amt
				 var td4 = document.createElement("TD");
				 var outStanding = document.createTextNode(outStandingAmtAry[t]>0 ? outStandingAmtAry[t] : 0);
				 td4.appendChild(outStanding); 
			
			 document.getElementById("myTr_"+t).appendChild(td);
			 document.getElementById("myTr_"+t).appendChild(td1);
			 document.getElementById("myTr_"+t).appendChild(td2);
			 document.getElementById("myTr_"+t).appendChild(td3);
			 document.getElementById("myTr_"+t).appendChild(td4);
		}
		
		//Adding Last Row
		 var ttlValTR = document.createElement("TR");
		 ttlValTR.setAttribute("id", "ttlValTr");
		 document.getElementById("myTable").appendChild(ttlValTR);
		 
		 var first_TD = document.createElement("TH");
		 var first = document.createTextNode(" ");
		 first_TD.appendChild(first);
		 
		 var ttlMonthlyPrincipleAMT_TD = document.createElement("TH");
		 var ttlMonthlyPrincipleAMT = document.createTextNode(ttlMonthlyPrincipleAMT.toFixed(4));
		 ttlMonthlyPrincipleAMT_TD.appendChild(ttlMonthlyPrincipleAMT);
		 
		 
		 var ttlMonthlyInterestAMT_TD = document.createElement("TH");
		 var ttlMonthlyInterestAMT = document.createTextNode(ttlMonthlyInterestAMT.toFixed(4));
		 ttlMonthlyInterestAMT_TD.appendChild(ttlMonthlyInterestAMT);
		 
		 var ttlMonthlyEMIAMT_TD = document.createElement("TH");
		 var ttlMonthlyEMIAMT = document.createTextNode(ttlMonthlyEMIAMT.toFixed(4));
		 ttlMonthlyEMIAMT_TD.appendChild(ttlMonthlyEMIAMT);
		 
		 var ttlMonthlyOutStanndingAmt_TD = document.createElement("TH");
		 var ttlMonthlyOutStandingAMT = document.createTextNode('');
		 ttlMonthlyOutStanndingAmt_TD.appendChild(ttlMonthlyOutStandingAMT);
		 
		 
		 document.getElementById("ttlValTr").appendChild(first_TD);
		 document.getElementById("ttlValTr").appendChild(ttlMonthlyPrincipleAMT_TD);
		 document.getElementById("ttlValTr").appendChild(ttlMonthlyInterestAMT_TD);
		 document.getElementById("ttlValTr").appendChild(ttlMonthlyEMIAMT_TD);
		 document.getElementById("ttlValTr").appendChild(ttlMonthlyOutStanndingAmt_TD);
		
	}

	
</script>
</html>

