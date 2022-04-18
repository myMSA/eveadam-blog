<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<html>
<head>
<title>Delete Article</title>

<style>
.ArticleDeleteWrapper {
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

</style>

</head>
<body>

	<div class="ArticleDeleteWrapper">

		<form method="post">
			<table>
				<caption>Delete article</caption>
				<tr>
					<th>글번호</th>
					<td>${article_id }<input type="hidden" name="article_id" value="${article_id }"
						autofocus="autofocus" required="required" /></td>
				</tr>
				<tr>
					<th>password</th>
					<td><input type="password" name="password" required="required" /></td>
				</tr>
				<tr>
					<th></th>
					<td>* 처음 글 작성 시 비밀번호를 기입해주세요.</td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit" value="완료" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
