<%@ page contentType="text/html; charset=UTF-8" %> 
<% 
	int memono = Integer.parseInt(request.getParameter("memono"));
%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
div{
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}
</style> 
</head> 
<body> 
<div>삭제확인</div>
<form action="deleteProc.jsp" method="post">
	<input type="hidden" name="memono" value="<%=memono%>">
	<div>
		삭제를 하면 복구할 수 없습니다.<br><br>
		삭제를 하시려면 삭제 버튼을 클릭하세요 <br><br>
		취소는 '목록'버튼을 누르세요<br><br>
	<button type="submit">삭제처리</button>
	<button type="button" onclick="location.href='./list.jsp'">목록</button>
	
	</div>
	
</form>
</body> 
</html>






