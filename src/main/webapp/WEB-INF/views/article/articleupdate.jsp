<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update article</title>

<style>
.UpdateArticleWrapper {
	margin: 200px auto;
	max-width: 400px;
	height: 250px;
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
</style>

<style>
textarea {
	border: none;
	resize: none;
}

input {
	border: none;
	resize: none;
}
</style>

<script type="text/javascript">
		// sending member info by ajax
		$(document).ready(function() {
			$.ajax({
				url : "${app}/board/current_boardlist",
				method : "GET",
				success : function(data) {
					for(var i =0; i<data.length;i++){
						console.log(data[i].board_subject);
						$("#selectBox").append("<option>"+data[i].board_subject+"</option>");
					}
				}
			})
		});
	</script>

</head>
<body>

	<div class="UpdateArticleWrapper">

		<form method="post">
			<table>
				<caption>Update article</caption>

				<tr>
					<th>article_id</th>
					<td>${articleDTO.article_id }<input type="hidden"
						name="article_id" value="${articleDTO.article_id }"
						autofocus="autofocus" required="required" /></td>
				</tr>
				<tr>
					<th>title</th>
					<td><input type="text" name="title"
						value="${articleDTO.title }" required="required" /></td>
				</tr>
				<tr>
					<th>board_subject</th>
					<td>
					<select id="selectBox" name="board_subject" required="required">
					</select>
					</td>
				</tr>

				<tr>
					<th>content</th>
					<td><textarea name="content" rows="5" cols="40"
							required="required">${articleDTO.content }</textarea></td>
				</tr>


				<tr>
					<td colspan="2" align="center"><input type="submit" value="완료" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>