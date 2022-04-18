<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete board</title>

<style>
.boarddeleteWrapper {
	margin: 300px auto;
	max-width: 400px;
	height: 250px;
	border-radius: 5px;
	text-align: center;
	line-height: 1.8;
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

	<div class="boarddeleteWrapper">
		<form method="post">

			<table>
				<caption>Delete board</caption>
				<tr>
					<th>board_subject</th>
					<td><select id="selectBox" name="board_subject"
						required="required">
					</select>
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