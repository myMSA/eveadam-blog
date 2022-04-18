<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Article</title>

<style>
.articleInsertWrapper {
	margin: 200px auto;
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
</style>

<style>
input {
	border: none;
	resize: none;
}
</style>

<style>
textarea {
	border: none;
	resize: none;
}
</style>

</head>
<body>
	<div class="articleInsertWrapper">
	<form method="post">
		<table>
			<caption>Insert Article</caption>
			<tr>
				<th>title</th>
				<td><input type="text" name="title" autofocus="autofocus"
					required="required" /></td>
			</tr>
			<tr>
				<th>name</th>
				<td><input type="text" name="name" required="required" value="${ user.nickname }"/></td>
			</tr>
			<tr>
				<th>board_subject</th>
				<td><input type="text" name="board_subject" required="required" /></td>
			</tr>
			<tr>
				<th>password</th>
				<td><input type="password" name="password" required="required" /></td>
			</tr>
			<tr>
				<th>content</th>
				<td><textarea name="content" rows="5" cols="40"
						required="required"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="완료" /></td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>