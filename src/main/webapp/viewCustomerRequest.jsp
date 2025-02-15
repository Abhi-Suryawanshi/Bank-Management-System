<%@page import="com.bankingsystem.daoimpl.MSDefinitionDAOImpl"%>
<%@page import="com.bankingsystem.entity.MSDefinitionEntity"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.bankingsystem.daoimpl.CustomerDaoImpl"%>
<%@page import="com.bankingsystem.entity.CustomerEntity"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
Collection<CustomerEntity> custList = CustomerDaoImpl.getInstance().getCostomerRequest();

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

Collection<MSDefinitionEntity> branchTypeList = MSDefinitionDAOImpl.getInstance().findByCategory("BANK_BRANCH" );
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Customer Request</title>
 <link rel="stylesheet" href="css/bootstrap.min.css">
 <script src="js/jquery.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
</head>
<script type="text/javascript">


function approveCustomer(rowNum) {
	//alert("rowNum==>"+rowNum);
	var isValid = true;
	var address = document.getElementById("address_"+rowNum).innerHTML;
	var branch= document.getElementById("branch_"+rowNum).value;
		
	if(address.includes(branch.split("~")[0])){
	
		if (confirm("Do you want to approve Customer.!!")) {
			$('#ifsc_'+rowNum).prop('disabled', false);
			document.getElementById("rowNum").value=rowNum;
			document.getElementById("sendIdToCustControllerForm").submit();
		}
	} else {
		alert("you can't apply for opening account for our bank");
	}
	
}

function getIfscCode(branch,rowNo){
	var ifsc = branch.split("~")[1];
	document.getElementById("ifsc_"+rowNo).value=ifsc;
	//alert(ifsc);
}
 
</script>
<body>



<form action="CustomerController" name="sendIdToCustControllerForm" id="sendIdToCustControllerForm" method="post">
	<input type="hidden" name="docmd" id="docmd" value="approveCustomerRequest">
	<input type="hidden" name="rowNum" id="rowNum" value="">
	<input type="hidden" name="nextPage" id="nextPage" value="">
	
	
<div class="well" style="font-weight: bold;"><h4 style="color: #f14a46;">VIEW CUSTOMER REQUEST</h4></div>

	<table class="table table-bordered">
    <thead>
      <tr>
        <th>Name</th>
        <th> DOB  /  Email  /  Contact</th>
        <th>Address</th>
        <th>Branch<span style="color: red;">*</span></th>
        <th>IFSC Code<span style="color: red;">*</span></th>
        <th></th>
       
      </tr>
    </thead>
    <tbody>
      <%
      if(custList !=null){
    	  Iterator<CustomerEntity> itr = custList.iterator();
    	  int i=1;
    	  while(itr.hasNext()){
    		  CustomerEntity custEntity = itr.next();
    		  Date date = sdf.parse(custEntity.getDob());
    		  SimpleDateFormat print = new SimpleDateFormat("dd MMM yyyy");    	 
      %>
      <tr>
        <td id="name_<%=i %>">
        	<input type="hidden" name="custId_<%=i %>" id="custId_<%=i %>" value="<%=custEntity.getCustId() %>">
        	<%=custEntity.getName() %>
        </td>
        <td>
        	<span class="glyphicon glyphicon-user" style="font-size: 15px;"> : </span> <%=print.format(date) %><br>
        	<span class="glyphicon glyphicon-envelope" style="font-size: 15px;"> : </span> <%= custEntity.getEmail() %><br>
        	<span class="glyphicon glyphicon-earphone" style="font-size: 15px;"> : </span> <%= custEntity.getContact() %>
        </td>
        <td>
        <span id="address_<%=i %>"><%= custEntity.getAddress() %></span>
        </td>
        <td><select class="form-control" id="branch_<%=i %>" name="branch_<%=i %>" onchange="getIfscCode(this.value,<%=i %>)">
					    	<option value=""> --Select--</option>
					     <%
					     if(branchTypeList != null && !branchTypeList.isEmpty()){
					    	 Iterator<MSDefinitionEntity> itr1 = branchTypeList.iterator();
					    	 while(itr1.hasNext()){
					    		 MSDefinitionEntity defEntity = (MSDefinitionEntity)itr1.next();
					    		 
					    %>
					    	<option  value="<%=defEntity.getName()+"~"+defEntity.getDescription()%>" ><%=defEntity.getName() %></option>
					    	
					    <%
					    	 }
					     }
					    %>
			</select>
		</td>
        <td><input type="text" class="form-control"  placeholder="IFSC Code" id="ifsc_<%=i %>" name="ifsc_<%=i %>" style="text-transform: uppercase;" value="" disabled></td>
        <td class="text-center">
        	<button type="button" class="btn btn-warning" onclick="approveCustomer(<%=i %>)">Approve</button>
        	
        	
        </td>
      </tr>
      <%
    	  i++;
    	  }
      }
      
      %>
      
     
    </tbody>
  </table>

</form>						
</body>
</html>		