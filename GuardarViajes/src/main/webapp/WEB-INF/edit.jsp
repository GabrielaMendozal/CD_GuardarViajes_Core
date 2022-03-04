<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Edit My Task</title>
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-8">
					<h1>
						Edit Expense
					</h1>
				</div>
				<div class="col">
					<a href="/expenses">Go back</a>
				</div>
			</div>
			<div>
				<form:form method="POST" action="/expenses/${travel.id}/editar" modelAttribute= "travel">
					<input type="hidden" name="_method" value="PUT">
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
						<form:input path="amount" type="number" name="amount" id="amount" />
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
	</body>
</html>