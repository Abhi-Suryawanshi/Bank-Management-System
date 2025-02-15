<%@page import="com.bankingsystem.daoimpl.MSDefinitionDAOImpl"%>
<%@page import="com.bankingsystem.entity.MSDefinitionEntity"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	
	int custId = session.getAttribute("custId") != null ? (int) session.getAttribute("custId") : 0;
	Collection<MSDefinitionEntity> def = MSDefinitionDAOImpl.getInstance().getAll();
	Collection<String> categoriesList = MSDefinitionDAOImpl.getInstance().getAllCategories();	
%>

<html>
<head>
<meta charset="UTF-8">
<title>View All Definitions</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>


<link href="css/bootstrapdttbl.min.css" rel="stylesheet">   
<script src="js/jquery.min.js"></script>
<link rel="stylesheet" href="css/jquery.dataTables.min.css">
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/bootstrapdttbl.min.js"></script>

</head>
<script type="text/javascript">
	
	function sendDefIdToDefUpdatePg(defID){
		document.getElementById("defId").value=defID;
		document.getElementById("defForm").submit();
	}
	

	
</script>
<body>
	<%	
	if (custId > 0) {
	%>
	
	<form name="defForm" id="defForm" action="MSDefinitionController" method="post">
		<input type="hidden" name="defId" id="defId" value="">
		<input type="hidden" name="docmd" id="docmd" value="getDefDetailsForUpdate">
	</form>
	
	
	<div class="well"><h4 style="color: #f14a46;">View All Definitions</h4></div>
	<table id="myTable" class="table table-striped table-dark table-bordered table-responsive">
		<thead>
			<tr>
				<th>Serial No.</th>
				<th>Name</th>
				<th>Category</th>
				<th>Remark</th>
			</tr>
		</thead>
		<tbody>
			<%
			if (def != null && !def.isEmpty()) {
				Iterator<MSDefinitionEntity> itr = def.iterator();
				while (itr.hasNext()) {
					MSDefinitionEntity msEntity = itr.next();
			%>
			<tr>
				<td><a style="color: #f14a46;" href="javascript: sendDefIdToDefUpdatePg('<%=msEntity.getDefId()%>')"> <%=msEntity.getDefId()%></a></td>
				<td><%=msEntity.getName()%></td>
				<td><%=msEntity.getCategory()%></td>
				<td><%=msEntity.getDescription() !=null? msEntity.getDescription() : ""%></td>
			</tr>

			<%
				}
			}
			%>
			
		</tbody>
	</table>

	<%
	} else {
	%>
	<div style="margin-top: 10%; margin-left: 20%;">
		<img src="AppData/images/authreq.png" height="300px" width="800px">
	</div>
	<%
	}
	%>

	<script>
		$(document).ready(function() {
			$('#myTable').dataTable();
		});
	</script>

</body>
</html>