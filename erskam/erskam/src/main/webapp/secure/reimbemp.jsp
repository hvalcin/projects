	<!-- Header -->
	<jsp:include page="../header.jsp" />
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	


	  <div class="container">
	  
	<c:choose>
	<c:when test="${not empty message }">
	  <p class="alert ${messageClass}">${message }</p>
	<%
	  session.setAttribute("message", null);
	  session.setAttribute("messageClass", null);
	%>
	</c:when>
	</c:choose>
	
		<h1>Reimbursement <small>Employee's View</small></h1>
		
		<form action="addReimb.jsp" method="post">
								<button class="btn btn-success">Create New Reimbursement Ticket</button>
							</form>
		<hr class="reimb-primary">
	                    
		<table class="table table table-hover table-responsive reimb-datatable" id="reimbtable">
			<thead>
				<tr>
					<th>ID</th>
					<th>Amount</th>
					<th>Submitted</th>
					<th>Description</th>
					<th>Author</th>
					<th>Type</th>
					<th>Resolved</th>
					<th>Resolver</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="reimb" items="${emplist}">
					<tr>
						<td><c:out value="${reimb.reimbId}" /></td>
						<td><fmt:formatNumber value="${reimb.reimbAmount}" type="CURRENCY" /></td>
						<td><fmt:formatDate value="${reimb.reimbSubmit }" pattern="MM/dd/yyyy HH:mm" /> </td> 
						<td><c:out value="${reimb.reimbDescrip}" /></td>
						<td><c:out value="${reimb.reimbAuthor.ufirstName} ${reimb.reimbAuthor.ulastName}" /></td>
						<td><c:out value="${reimb.reimbTypeId.type}" /></td>
						<td><fmt:formatDate value="${reimb.reimbResolved}" pattern="MM/dd/yyyy HH:mm" /></td>
						<td><c:out value="${reimb.reimbResolver.ufirstName}${reimb.reimbResolver.ulastName}" /></td>
                        <td><c:out value="${reimb.reimbStatusId.status}" /></td>
							<td><form action="Recall" method="post">
								<button class="btn btn-primary">Recall</button>
								
								
							</form></td> 
					</tr>
				</c:forEach>
			</tbody>
		</table>
	  </div>

		<jsp:include page="../footer.jsp" />