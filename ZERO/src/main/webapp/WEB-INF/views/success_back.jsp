<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	// 요청 작업 성공 시 전달받은 메세지 출력 후 이전페이지로 돌아가기
	// msg만 전달하면 전달하는 msg만 달라지고 작업 같음
	alert("${msg}");
	history.back();
</script>
</head>
<body>

</body>
</html>