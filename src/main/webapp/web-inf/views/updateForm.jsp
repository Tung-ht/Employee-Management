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
<title>Update Information</title>

<!-- Required meta tags-->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Colorlib Templates">
<meta name="author" content="Colorlib">
<meta name="keywords" content="Colorlib Templates">

<!-- Icons font CSS-->
<link
	href="${ctx}/res/addForm/vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">
<link
	href="${ctx}/res/addForm/vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<!-- Font special for pages-->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Vendor CSS-->
<link href="${ctx}/res/addForm/vendor/select2/select2.min.css"
	rel="stylesheet" media="all">
<link
	href="${ctx}/res/addForm/vendor/datepicker/daterangepicker.css"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="${ctx}/res/addForm/css/main.css" rel="stylesheet"
	media="all">
</head>

<body>
	<div class="page-wrapper bg-gra-01 p-t-130 p-b-100 font-poppins">
		<div class="wrapper wrapper--w680">
			<div class="card card-4">
				<div class="card-body">
					<h2 class="title">Update information</h2>
					<form:form method="post" name="updateForm" action="${ctx}/update/${employee.id}"
						modelAttribute="employee" enctype="multipart/form-data"
						onsubmit="return show_confirm()">
						<div class="col-2">
							<div class="input-group">
								<label class="label">ID</label>
								<form:input path ="id" class="input--style-4" 
									type="text"
									value="${employee.id}"
									name="id" 
									disabled="true"/>
							</div>
						</div>
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">First name</label>
									<form:input path="firstName" class="input--style-4" type="text"
										value="${employee.firstName}" placeholder="required"
										name="fname" pattern="^[a-zA-Z\s]*$"
										title="First name should only contain letters and spaces. e.g. Hoang Tho"
										required="true" />
								</div>
							</div>
							<div class="col-2">
								<div class="input-group">
									<label class="label">Last name</label>
									<form:input path="lastName" class="input--style-4" type="text"
										value="${employee.lastName}" placeholder="required"
										name="lname" pattern="^[a-zA-Z\s]*$"
										title="Last name should only contain letters and spaces. e.g. Hoang Tho"
										required="true" />
								</div>
							</div>
						</div>
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">Email</label>
									<form:input path="email" class="input--style-4" type="email"
										placeholder="required" value="${employee.email}" name="email"
										required="true" />
								</div>
							</div>
							<div class="col-2">
								<div class="input-group">
									<label class="label">Phone Number</label>
									<form:input path="phone" class="input--style-4" type="tel"
										name="phone" value="${employee.phone}" pattern="^[0-9\s]*$"
										title="Phone number should only contain numbers and spaces. e.g 0123 456" />
								</div>
							</div>
						</div>
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">Password</label>
									<form:input path="password" value="${employee.password}"
										class="input--style-4" type="text" name="password" />
								</div>
							</div>
							<div class="col-2 input-group">
								<label class="label">Department</label>
								<div class="rs-select2 js-select-simple select--no-search">
									<form:select name="department" path="department" value ="${employee.department}">
										<option value="Accounting">Accounting department</option>
										<option value="Audit">Audit department</option>
										<option value="Adiministration">Administration department</option>
										<option value="R&D">R&D department</option>
										<option value="IT">IT department</option>
									</form:select>
									<div class="select-dropdown"></div>
								</div>
							</div>
						</div>
						<div class="p-t-15">
							<button class="btn btn--radius-2 btn--blue" type="submit">Save</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function show_confirm() {
			if (!confirm("Do you want to save this employee information?")) {
				return false;
			}
			alert("Update employee successfully!")
			this.form.submit();
		}
	</script>
	<!-- Jquery JS-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<!-- Vendor JS-->
	<script src="vendor/select2/select2.min.js"></script>
	<script src="vendor/datepicker/moment.min.js"></script>
	<script src="vendor/datepicker/daterangepicker.js"></script>

	<!-- Main JS-->
	<script src="js/global.js"></script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>