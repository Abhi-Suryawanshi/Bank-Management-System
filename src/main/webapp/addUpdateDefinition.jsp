<%@page import="com.bankingsystem.daoimpl.MSDefinitionDAOImpl"%>
<%@page import="com.bankingsystem.entity.MSDefinitionEntity"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String errorMsg = request.getAttribute("error") != null ? (String)request.getAttribute("error"):null;
	String successMsg = request.getAttribute("success") != null ? (String)request.getAttribute("success"):null;
	
	int custId = session.getAttribute("custId") != null ? (int) session.getAttribute("custId") : 0;
	MSDefinitionEntity msEntity = request.getAttribute("defEntity") != null ? (MSDefinitionEntity)request.getAttribute("defEntity") : null;
	Collection<String> categoriesList = MSDefinitionDAOImpl.getInstance().getAllCategories();	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Add Update Definition Form</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	function addUpdateDefinition(){
		
		var name = document.getElementById("name").value;
		var category = document.getElementById("category").value;
		var status = document.getElementById("status").value;
		var Description = document.getElementById("Description").value;
		var isValid = true;
		
		if(name=="" || category=="" || status=="" || Description==""){ 
			alert("Please, Enter the valid details to proceed.");
			
			document.getElementById("name").style.backgroundColor = "#f0ebc7";
			document.getElementById("category").style.backgroundColor = "#f0ebc7";
			document.getElementById("status").style.backgroundColor = "#f0ebc7";
			document.getElementById("addDefinitionForm").style.backgroundColor = "#f0ebc7";
			var isValid = false;			
		}
		if(isValid){
			alert("Form Submitted successfully.");			
			document.getElementById("addDefinitionForm").submit();			
		}
 }
	setInterval(function(){ $(".alert").fadeOut(); }, 3000);
</script>

<body>
	<%	
	if (custId > 0) {
	%>
	<div>
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
	<form id="addDefinitionForm" name="addDefinitionForm" action="MSDefinitionController" method="post" >
	<input type="hidden" name="defId" value="<%=msEntity!=null ? msEntity.getDefId()  : "0" %>">
	<input type="hidden" name="docmd" value="<%=msEntity!=null? "updateDefinition" : "addNewDefinition" %>">
		<div style="padding: 10px">
			<div>
				<label>Name<span style="color: red">*</span></label>
			</div>
			<div>
				<input type="text" class="form-control" id="name" name="name" placeholder="Enter Name" value="<%=msEntity !=null && msEntity.getName() !=null ? msEntity.getName(): ""%>">
			</div>
		</div>
		
		<div style="padding: 10px">
			<div>
				<label>Category<span style="color: red">*</span></label>
			</div>
			<div>
				<select class="form-control" id="category" name="category">
					<option value="">-Select-</option>
					<%
					if(null != categoriesList && !categoriesList.isEmpty()){
						Iterator<String> itr = categoriesList.iterator();
						while(itr.hasNext()){
							String catagory = itr.next();
					%>
						<option value="<%=catagory %>" <%=msEntity != null && msEntity.getCategory().equals(catagory) ? "selected":"" %>><%=catagory %></option>
					<%
						}
					}
				%>
				</select>
			</div>
		</div>
		
		
		<div style="padding: 10px">
			<div>
				<label>Status<span style="color: red">*</span></label>
			</div>
			<div>
				<select class="form-control" id="status" name="status">
					<option value="">---Select---</option>
					<option value="1">Active</option>
					<option value="0">In-Active</option>
				</select>
			</div>
		</div>
		
		<div style="padding: 10px">
			<div>
				<label>Remark</label>
			</div>
			<div>
				<textarea class="form-control" id="Description" name="Description" rows="" cols=""></textarea>	
			</div>
		</div>
		
		<div style="padding: 10px">
			<div>
				
				<button type="button" style="background-color:#f14a46; color: white " class="btn" onclick="addUpdateDefinition()">Submit</button>
				
			</div>
		</div>	
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





	
	