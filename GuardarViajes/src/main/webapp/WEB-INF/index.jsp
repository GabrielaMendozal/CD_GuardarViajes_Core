<%@ page language="java" contentType="text/html; charset=ISO-8859-1"     pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Read Share</title>
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	</head>
	<body>
		<div class="container">
			<div class="col">
				<div class="d-flex justify-content-between align-items-center pb-4">
					<h3>Save Travels</h3>
				</div>
				
				<div class="table-responsive">
					<table class="table table-hover">
					  <thead>
					    <tr>
					      <th scope="col">Expense</th>
					      <th scope="col">Vendor</th>
					      <th scope="col">Amount</th>
					      <th scope="col">Actions</th>
					    </tr>
					  </thead>
					  <tbody>
						  <c:forEach var="travel" items="${listaTravels}">
							<tr>
						      <td><a href="/expenses/${travel.id}">${travel.name}</a></td>
						      <td>${travel.vendor}</td>
						      <td>$ ${travel.amount}</td>
						      <td>
						      	<div class="d-flex justify-content-between align-items-center">
							      	<a href="/expenses/edit/${travel.id}">edit</a>
								    <form action="/eliminar/${travel.id}" method="post">
								    	<input type="hidden" name="_method" value="DELETE">
								      	<button type="submit" class="btn btn-danger">delete</button>
								    </form>
						      	</div>
						      </td>
						    </tr>
						</c:forEach>
					  </tbody>
					</table>
				</div>
				<div >
					<h3>Add an expense</h3>
					<form:form method="POST" action="/expenses/registrar" modelAttribute= "travel" >
						<div class="mb-3">
							<form:label  path= "name" for="name">
								Expense Name:
							</form:label>
							<form:input path="name" type="text" name="name" id="name" />
							<form:errors path="name" />
						</div>
						<div class="mb-3">
							<form:label  path= "vendor" for="vendor">
								Vendor:
							</form:label>
							<form:input path="vendor" type="text" name="vendor" id="vendor" />
							<form:errors path="vendor" />
						</div>
						<div class="mb-3">
							<form:label  path= "amount" for="amount">
								Amount:
							</form:label>
							<form:input path="amount" type="text" name="amount" id="amount" />
							<form:errors path="amount" />
						</div>
						<div class="mb-3">
							<form:label  path= "description" for="description">
								Description:
							</form:label>
							<form:textarea path="description" type="text" name="description" id="description"/>
							<form:errors path="description" />
						</div>
						<button class="btn btn-primary" type="submit">
							Submit
						</button>
					</form:form>
				</div>
			</div>
			</div>
	</body>
</html>