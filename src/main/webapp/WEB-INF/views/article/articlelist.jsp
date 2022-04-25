<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Article</title>

<style>
.articleWrapper {
	margin-top: 3%;
	margin-bottom: 3%;
	margin-left: 13%;
}

.buttonArticle {
	background-color: white;
	border: none;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	cursor: pointer;
	color: black;
}

.paging{
text-align: center;
}

a:link {
  color : black;
}
a:visited {
  color : gray;
}

</style>


<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="${app}/resources/css/style.css">

</head>
<body>

	<div class="articleWrapper">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Articles of
						${board_subject.toUpperCase() }</h2>
				</div>
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">

						<table class="table">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>

							<tbody>
								<c:forEach items="${list}" var="dto" varStatus="vs">
									<c:if test="${dto.board_subject == board_subject }">
										<tr>
											<td>${dto.article_id}</td>
											<td>
												<button class="buttonArticle"
													onclick="location.href='${dto.article_id}/';">${ dto.title }</button>
											</td>
											<td>${dto.name}</td>
											<c:choose>
												<c:when test="${dto.regdate.date == now.date }">
													<td><fmt:formatDate value="${dto.regdate}" type="time" /></td>
												</c:when>
												<c:otherwise>
													<td><fmt:formatDate value="${dto.regdate}" type="date" /></td>
												</c:otherwise>
											</c:choose>
											<td>${dto.readcount}</td>
										</tr>

									</c:if>
								</c:forEach>

							</tbody>

							<tr class="paging">
								<td colspan="5">
									
									<c:if test="${startPage != 1}">
											[<a href="../${startPage - 1}/">이전블럭</a>]
									</c:if>
									
									<c:forEach begin="${startPage}" end="${endPage}" var="p">
										<c:if test="${p == pg}">${p}</c:if>
										<c:if test="${p != pg}">
											<a href="../${p}/">${p}</a>
										</c:if>
									</c:forEach>
									
									<c:if test="${endPage != pageCount}">
											[<a href="../${endPage + 1}/">다음블럭</a>]
									</c:if></td>
							</tr>
						</table>

					</div>
				</div>
			</div>

			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
				<c:if test="${member != null}">
					<a href="./articleinsert">Insert Article</a>
				</c:if>
				</div>
			</div>
		</div>
		</section>

		<script src="${app}/resources/js/jquery.min.js"></script>
		<script src="${app}/resources/js/popper.js"></script>
		<script src="${app}/resources/js/bootstrap.min.js"></script>
		<script src="${app}/resources/js/main.js"></script>

	</div>

</body>
</html>