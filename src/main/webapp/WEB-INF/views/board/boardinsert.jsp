<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert board</title>

<style>
.boardinsertWrapper {
	margin: 300px auto;
	max-width: 400px;
	height: 250px;
	border-radius: 5px;
	text-align: center;
	line-height: 1.8;
}
</style>

</head>
<body>
	<div class="boardinsertWrapper">
		<form method="post">
			<table>
				<caption>Insert board</caption>
				<tr>
					<th>board_subject</th>
					<td><input type="text" name="board_subject" required="required" /></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="password" required="required" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="완료" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>