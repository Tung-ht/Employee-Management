<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
<script type="text/javascript" src="${ctx}/res/index.js"></script>

<title>Show List Employees</title>
</head>

<body>
	<div class="container">
		<h3><a href="${ctx}/logout" role="button"></a></h3>
		<br>
		<h1 align="center">Employee Management</h1>
		<div class="text-center">
			<a class="btn btn-outline-info btn-lg btn-block" href="${ctx}/"
				role="button"> <i class="fas fa-house-user"></i> Home Page
			</a>
		</div>
		<br>

		<!-- If there is a request for delete -->
		<c:if test="${delInform != null}">
			<h3>${delInform}</h3>
			<br>
		</c:if>

		<!-- If there is a request for searching and for case searching failed -->
		<c:if test="${searchInform != null}">
			<h3>${searchInform}</h3>
			<br>
		</c:if>

		<!-- add button and search box -->
		<div class="row justify-content-between">
			<div class="col-4">
				<a class="btn btn-outline-primary btn-md"
					href="${ctx}/show-add-form" role="button"> <i
					class="fas fa-user-plus"></i> Add an employee
				</a>
			</div>

			<!-- search box -->
			<div class="col-4">
				<form:form method="get" action="${ctx}/search">
					<div class="input-group">
						<button id="search-button" type="submit" class="btn btn-primary">
							<i class="fas fa-search"></i>
						</button>
						<input type="search" class="form-control rounded"
							name="name-contain" placeholder="Employee name . . ."
							aria-label="Search" aria-describedby="search-addon" />
					</div>
				</form:form>
			</div>
		</div>
		<br>

		<!-- pagination -->
		<c:if test="${totalPages >=1}">
			<h5 align="center">Total pages: ${totalPages}</h5>
			<div class="d-flex justify-content-center">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<!-- current <=1 then disable Previous button -->
						<c:choose>
							<c:when test="${currentPage <= 1}">
								<li class="page-item"><a class="page-link" href="#">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${ctx}/page/${currentPage-1}">Previous</a></li>
							</c:otherwise>
						</c:choose>

						<c:forEach var="i" begin="1" end="${totalPages}">
							<c:choose>
								<c:when test="${currentPage == i}">
									<li class="page-item active"><a class="page-link"
										href="${ctx}/page/${i}">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="${ctx}/page/${i}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<!-- current >= total then disable Next button -->
						<c:choose>
							<c:when test="${currentPage >= totalPages}">
								<li class="page-item"><a class="page-link" href="#">Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="${ctx}/page/${currentPage+1}">Next</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>
		</c:if>
		<table class="table table-hover">
			<thead class="thead-light">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">First name</th>
					<th scope="col">Last name</th>
					<th scope="col">Department</th>
					<th scope="col">Email</th>
					<th scope="col">Phone number</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${employees}" var="employee">
					<tr>
						<th scope="row">${employee.id}</th>
						<td>${employee.firstName}</td>
						<td>${employee.lastName}</td>
						<td>${employee.department}</td>
						<td>${employee.email}</td>
						<td>${employee.phone}</td>
						<td><a href="${ctx}/show-update-form/${employee.id}"
							role="button" class="btn btn-outline-info"> <i
								class="fas fa-user-edit"></i></a> <form:form method="post"
								action="${ctx}/delete/${employee.id}"
								onsubmit="return confirm('Do you want to delete this employee?')">
								<button type="submit" class="btn btn-outline-danger">
									<i class="fas fa-user-minus"></i>
								</button>
							</form:form></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>