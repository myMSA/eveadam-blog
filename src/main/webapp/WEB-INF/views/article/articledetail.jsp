<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail of Article</title>

<!-- style of button link ;  https://www.w3schools.com/css/tryit.asp?filename=trycss_buttons_border-->
<style>
.button {
	background-color: white;
	border: none;
	color: white;
	/*padding: 15px 32px;*/
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin: 4px 2px;
	cursor: pointer;
}

.button4 {
	background-color: white;
	color: black;
	/*border: 2px solid black;*/
	font-size: 4px;
}

.button5 {
	background-color: white;
	color: black;
	/*border: 2px solid black;*/
	font-size: 20px;
}
</style>

<style>
.articledetailWrapper {
	margin: 150px auto;
	width: 600px;
	height: 600px;
	border-radius: 5px;
	text-align: center;
	line-height: 1.8;
}
</style>

<style>
table {
	border-color: white;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
}

a:link {
	color: black;
}

a:visited {
	color: gray;
}
</style>

<style>
textarea {
	border: none;
	resize: none;
}

.edit {
	text-align: center;
}
</style>

<script>
//화면 시작 시 tbl show 우선 실행 
$(document).ready(function(){
		showTable();
	})

function showTable(){
    $("#tbl_reply").hide();
    $("#tbl_articledetail").show();
}

function showReply(){
    $("#tbl_articledetail").hide();
    $("#tbl_reply").show();
}
</script>


</head>
<body>
	<div class="articledetailWrapper">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center mb-5">
				<h2 class="heading-section">Article of
					${articleDTO.board_subject.toUpperCase() }</h2>
			</div>
		</div>
		<table id="tbl_articledetail">
			<tr>
				<th>번호</th>
				<td>${articleDTO.article_id}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${articleDTO.title}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${articleDTO.name}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="20" cols="70" readonly>${articleDTO.content}</textarea></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><fmt:formatDate value="${articleDTO.regdate}" type="both" /></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${articleDTO.readcount}</td>
			</tr>
			<tr>
				<th>Edit</th>
				<td class="edit">
					<c:if test="${user != null}">
						<a href="./articleupdate">Update</a>
						| 
						<a href="./articledelete">Delete</a>
					</c:if>
				</td>
			</tr>
		</table>
		<table id="tbl_reply">
			<tr>
				<th>번호</th>
				<td>${articleDTO.article_id}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${articleDTO.title}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${articleDTO.name}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="20" cols="70" readonly>${articleDTO.content}</textarea></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><fmt:formatDate value="${articleDTO.regdate}" type="both" /></td>
			</tr>
			<tr>
				<th> </th>
				<td>${articleDTO.readcount}</td>
			</tr>
			<tr>
				<th>Edit</th>
				<td class="edit">
					<c:if test="${user != null}">
						<a href="./articleupdate">Insert Reply</a>
						| 
						<a href="./articledelete">Delete Reply</a>
					</c:if>
				</td>
			</tr>
		</table>
		
		<br>
		<div class="row justify-content-center">
			<div class="col-md-6 text-center mb-5">
				<button class="button button4" onclick="showTable();">Article</button>
				|
				<button class="button button4" onclick="showReply();">reply</button>
				|
				<button class="button button4" onclick="location.href='../';">Back</button>
			</div>
		</div>

	</div>

</body>
</html>