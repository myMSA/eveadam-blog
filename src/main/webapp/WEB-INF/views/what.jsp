<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="app" value="${pageContext.request.contextPath}" />

<style>

.custom-btn {
  width: 300px;
  height: 40px;
  padding: 5px 15px;
  border: 2px solid #000;
  font-family: "Poppins", Arial, sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
}

.btn-1 {
  transition: all 0.3s ease;
}
.btn-1:hover {
   box-shadow:
   -7px -7px 20px 0px #fff9,
   -4px -4px 5px 0px #fff9,
   7px 7px 20px 0px #0002,
   4px 4px 5px 0px #0001;
}

</style>

<html>
<head>
<title>WHAT?</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="${app}/resources/what/css/style.css">

</head>
<body>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<button class="custom-btn btn-1" id="popup_open_btn">Introduction of WHAT?</button>
					<br>
					<br>
					<br>
					<h2 class="heading-section">MySide Wishes What I Can Do</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
						<table class="table">
							<thead class="thead-dark">
								<tr>
									<th>ID no.</th>
									<th>MySide</th>
									<th>Name</th>
									<th>I WISH YOU</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<tr class="alert" role="alert">
									<th scope="row">001</th>
									<td>Husband</td>
									<td>Adam Senior</td>
									<td>Try to wear clothes that you did stare</td>
									<td><a href="#" class="close" data-dismiss="alert"
										aria-label="Close"> <span aria-hidden="true"><i
												class="fa fa-close"></i></span>
									</a></td>
								</tr>
								<tr class="alert" role="alert">
									<th scope="row">002</th>
									<td>Son</td>
									<td>Adam Junior</td>
									<td>Take pictures at that place with me</td>
									<td><a href="#" class="close" data-dismiss="alert"
										aria-label="Close"> <span aria-hidden="true"><i
												class="fa fa-close"></i></span>
									</a></td>
								</tr>
								<tr class="alert" role="alert">
									<th scope="row">003</th>
									<td>Daughter</td>
									<td>Eve</td>
									<td>Join Cosmetics Promotion Event with me</td>
									<td><a href="#" class="close" data-dismiss="alert"
										aria-label="Close"> <span aria-hidden="true"><i
												class="fa fa-close"></i></span>
									</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script src="${app}/resources/what/js/jquery.min.js"></script>
	<script src="${app}/resources/what/js/popper.js"></script>
	<script src="${app}/resources/what/js/bootstrap.min.js"></script>
	<script src="${app}/resources/what/js/main.js"></script>

</body>
</html>