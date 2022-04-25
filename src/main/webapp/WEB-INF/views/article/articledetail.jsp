<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Detail of Article</title>

<style>
/* style of wrapper */
.articledetailWrapper {
	margin: 150px auto;
	width: 600px;
	height: 600px;
	border-radius: 5px;
	text-align: center;
	line-height: 1.8;
}

/* style of table and related */
table {
	border-color: white;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
}

#answer_input{
	width : 100px;
	border : none;
}

textarea {
	border: none;
	resize: none;
}

.edit {
	text-align: center;
}

a:link {
	color: black;
}

a:visited {
	color: gray;
}

/* style of button link ;  https://www.w3schools.com/css/tryit.asp?filename=trycss_buttons_border */
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

</head>

<body>
	<div class="articledetailWrapper">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center mb-5">
				<h2 class="heading-section">Article of
					${articleDTO.board_subject.toUpperCase() }</h2>
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
				<c:choose>
					<c:when test="${member != null}">
						<a href="./articleupdate">Update</a>
						| 
						<a href="./articledelete">Delete</a>
					</c:when>
					<c:otherwise>
						Only login member can EDIT
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
		<div style="width:100%; height:500px; overflow:auto">
			<table  width="100%" id="tbl_reply">

				<!-- insert table row -->
				<c:if test="${member != null}">
					<tr>
						<th colspan="5"><input type="text" id="name"
							required="required" value="${ member.nickname }" /> | 
							<input type="text" id="content" required="required" /></th>
						<td colspan="1" class="edit">
							<button type="button" class="button button4" onclick="insertReply();">Insert</button>
						</td>
					</tr>
				</c:if>

				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>내용</th>
					<th>작성일</th>
					<th>Answer</th>
					<c:if test="${member != null}">
						<th>Edit</th>
					</c:if>
				</tr>
				<c:forEach var="replydto" items="${replylist}">
					<tr>
						<td>${replydto.reply_id}</td>
						<td>${replydto.name}</td>
						<td><textarea rows="1">${replydto.content}</textarea></td>
						<td><fmt:formatDate value="${replydto.regdate}" type="date" /></td>
						<td>
						<c:choose>
							<c:when test="${replydto.answerYN !=0 }">
							 <div style="text-align : center;">v</div>
							</c:when>
							<c:otherwise>
								
							</c:otherwise>
						</c:choose>
						</td>
						
						<c:if test="${member != null}">
							<td>
								<button type="submit" class="button button4" onclick="selectReply(${replydto.reply_id});">Select</button>
								/
								<button type="submit" class="button button4" onclick="deleteReply(${replydto.reply_id});">Delete</button>
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
	</div>


	<script>
		//화면 시작 시 tbl show 우선 실행
		$(document).ready(function() {
			showTable();
		})

		function showTable() {
			$("#tbl_reply").hide();
			$("#tbl_articledetail").show();
		}

		function showReply() {
			$("#tbl_articledetail").hide();
			$("#tbl_reply").show();
		}

		// reply insert jquery fn 		
		function insertReply() {
			var val_article_id = '${articleDTO.article_id}';
			var val_name = $('#name').val();
			var val_content = $('#content').val();

			//alert(val_article_id)
			//alert(val_name)
			//alert(val_content)
			
			$.ajax({
				url : "${app}/replyinsert",
				method : "POST",
				data : {
					article_id : val_article_id,
					name : val_name,
					content : val_content
				},
				dataType : "json",
				
				success : function(data) {
					//alert(JSON.stringify(data));
					if (data.insert_reply_Success == "True") {
						location.reload();
					}
				}
			})	
			
		}

		// reply delete jquery fn
		function deleteReply(reply_id) {
			//alert(reply_id)

			$.ajax({
				url : "${app}/replydelete",
				method : "POST",
				data : {
					reply_id : reply_id
				},
				dataType : "json",
				
				success : function(data) {
					//alert(JSON.stringify(data));
					if (data.delete_reply_Success == "True") {
						location.reload();
					}
				}
			})

		}

		// reply update jquery fn
		function selectReply(reply_id) {
			//alert(reply_id)
			
			$.ajax({
				url : "${app}/selectreply",
				method : "POST",
				data : {
					reply_id : reply_id
				},
				dataType : "json",
				
				success : function(data) {
					//alert(JSON.stringify(data));
					if (data.select_reply_Success == "True") {
						location.reload();
					}
				}
			})	
		}
				
	</script>

</body>
</html>