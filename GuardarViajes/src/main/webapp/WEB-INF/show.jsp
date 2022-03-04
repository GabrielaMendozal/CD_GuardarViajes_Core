<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
	<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Show Expense</title>
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-8">
					<h1>
						Expense Details
					</h1>
				</div>
				<div class="col">
					<a href="/expenses">Go back</a>
				</div>
			</div>
			<hr />
			<div class="row">
				<ul>
						<li>
							Expense Name:<c:out value ="${travel.getVendor()}"/>
						</li>
						<li>
							Expense Description: <c:out value ="${travel.getDescription()}"/> 
						</li>
						<li>
							Vendor: <c:out value ="${travel.getVendor()}"/>
						</li>
						<li>
							Amount Spent: <c:out value ="${travel.getAmount()}"/>
						</li>
					</ul>
			</div>
		</div>
	</body>
</html>