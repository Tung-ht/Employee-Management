<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<!-- Our project just needs Font Awesome solid fas-->
<script defer src="${ctx}/res/icon/js/solid.js"></script>
<script defer src="${ctx}/res/icon/js/fontawesome.js"></script>

<link rel="stylesheet" type="text/css"
	href="${ctx}/res/bootstrap/css/bootstrap.css">
<script type="text/javascript"
	src="${ctx}/res/bootstrap/js/bootstrap.js"></script>

<title>View Information</title>
</head>
<body>
	<div class="container">
		<br>
		<c:choose>
			<c:when test="${employee == null}">
				<h3>${viewInform}</h3>
			</c:when>
			<c:otherwise>
				<!-- employee found -->
				<c:choose>
					<c:when test="${status == 'add'}">
						<h3>Employee is added successfully!</h3>
					</c:when>
					<c:when test="${status == 'update'}">
						<h3>Employee is updated successfully!</h3>
					</c:when>
					<c:otherwise>
						<h3>${viewInform}</h3>
					</c:otherwise>
				</c:choose>
				<br>
				<table class="table table-hover">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Id</th>
							<th scope="col">First name</th>
							<th scope="col">Last name</th>
							<th scope="col">Department</th>
							<th scope="col">Email</th>
							<th scope="col">Phone number</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">${employee.id}</th>
							<td>${employee.firstName}</td>
							<td>${employee.lastName}</td>
							<td>${employee.department}</td>
							<td>${employee.email}</td>
							<td>${employee.phone}</td>
						</tr>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
		<div class="text-center">
			<a class="btn btn-outline-info btn-lg btn-block" href="${ctx}/"
				role="button"> <i class="fas fa-house-user"></i> Home Page
			</a>
		</div>
	</div>
</body>
</html>