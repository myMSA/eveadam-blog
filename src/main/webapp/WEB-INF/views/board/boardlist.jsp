<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="app" value="${pageContext.request.contextPath}" />

<style>
.homebodyWrapper {
	margin-top: 100px;
	margin-right: auto;
	margin-left: auto;
	max-width: 400px;
	text-align: center;
	line-height: 1.8;
}

.itemListWrapper {
	margin-right: auto;
	margin-left: auto;
	margin-bottom: 140px;
	text-align: center;
	/* core inner part of Wrapper */
	width: 800px;
	height: 480px;
}

.itemList {
	/*게시글 테두리*/
	margin: 5px;
	float: left;
	width: 250px;
	height: 150px;
	border-radius: 5px;
	border: 2px solid #DDDDDD;
}

.imageArea {
	width: 95%;
	height: 100px;
	background: #ffffff;
	overflow: hidden;
}

.imageArea>img {
	width: 100%;
	height: 100%;
}

.reviewArea {
	width: 100%;
	height: 30px;
	text-align: left;
	padding: 4px;
}

.reviewTitle {
	width: 100%;
	height: 20px;
	text-align: center;
	padding: 4px;
}

.slide-child {
	transform: translateY(3px);
	opacity: 0;
	transition: all 1s;
}

.is-visible {
	transform: translateY(0px);
	opacity: 1;
}

a:link {
  color : black;
}
a:visited {
  color : gray;
}

</style>

<html>
<title>board</title>

<body>

	<div class="homebodyWrapper">
		<h1>REVIEW</h1>
		<c:if test="${member != null}">
		<a href="./boardinsert">Insert Board</a> |
		<a href="./boarddelete">Delete Board</a>
		</c:if>
		
	</div>

	<div class="itemListWrapper">
		<c:forEach items="${boardlist}" var="dto">
			<div class="itemList slide-child">
				<div class="reviewArea">
					<div class="imageArea">
						<img src="${app}/resources/img/img1.jpg" />
					</div>
					<div class="reviewTitle">
						<a href="../board/${ dto.board_subject }/1/">
						<c:out value="${ dto.board_subject.toUpperCase() }" /></a>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>

</body>
</html>
