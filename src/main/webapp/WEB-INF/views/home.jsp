<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="app" value="${pageContext.request.contextPath}" />

<style>
/* 1 
 link : https://inpa.tistory.com/entry/CSS-%F0%9F%92%8D-%EB%B2%84%ED%8A%BC-%EB%94%94%EC%9E%90%EC%9D%B8-%EB%AA%A8%EC%9D%8C
 */
.custom-btn {
	width: 300px;
	height: 40px;
	padding: 10px 25px;
	border: 2px solid #000;
	font-family: 'Lato', sans-serif;
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
	box-shadow: -7px -7px 20px 0px #fff9, -4px -4px 5px 0px #fff9, 7px 7px
		20px 0px #0002, 4px 4px 5px 0px #0001;
}

.homebodyWrapper {
	margin: 300px auto;
	max-width: 400px;
	height: 150px;
	border-radius: 5px;
	text-align: center;
	line-height: 1.8;
}

.slide-child {
	transform: translateY(10px);
	opacity: 0;
	transition: all 1s;
}

.is-visible {
	transform: translateY(0px);
	opacity: 1;
}

.buttonHome {
	background-color: white;
	border: none;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	cursor: pointer;
	color: black;
}
</style>

<html>
<title>Tomorrow</title>

<body>

	<div class="homebodyWrapper">

		<div>
			<button class="custom-btn btn-1" id="popup_open_btn">Introduction
				of EveAdam Blog</button>
		</div>
		<br>
		<div class="slide-child">Review of Today and before is Review of
			Tomorrow.</div>
		<div class="slide-child">So...</div>
		<div class="slide-child">WHAT?</div>
		<br>
		<div class="slide-child">
			<button class="buttonHome"
				onclick="location.href='${app}/board/boardlist';">REVIEW</button>
			|
			<button class="buttonHome" onclick="location.href='${app}/what';">WHAT?</button>
		</div>
	</div>


</body>

</html>