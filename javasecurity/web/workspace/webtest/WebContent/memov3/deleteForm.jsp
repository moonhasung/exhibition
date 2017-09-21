	<%@ page contentType="text/html; charset=UTF-8" %> 
	<%@ include file="/bbs/ssi.jsp" %>
	<%
		int memono = Integer.parseInt(request.getParameter("memono"));
		boolean flag = dao.getRefnum(memono);
	%>
	<!DOCTYPE html> 
	<html> 
	<head> 
	<meta charset="UTF-8"> 
	<title></title> 
	<script type="text/javascript">
function mlist(){
	var url = "./list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	
	location.href=url;
}

</script>
	<style type="text/css"> 
	*{ 
	  font-family: gulim; 
	  font-size: 20px; 
	} 
	
	</style> 
	
	<link rel="stylesheet" href="<%=root %>/css/style.css">
	</head> 
	<body> 
	<jsp:include page="/menu/top.jsp"/>
	<div>삭제확인</div>
	<%
	if(flag){
	%>
		<div class="content">
		답글이 존재함으로 삭제할 수 없습니다.
		</div>
	<div class="bottom">		
		<button type="button" onclick="history.back()">뒤로가기</button>	
		<button type="button" onclick="mlist()">목록</button>	
	</div>
	<%}else{ %>
	<form action = "deleteProc.jsp" method="post">
		<input type="hidden" name="memono" value="<%=memono %>">
	
			삭제를 하면 복구할 수 없습니다.<br><br>
			삭제를 하시려면 삭제 버튼을 클릭하세요 <br><br>
			취소는 '목록'버튼을 누르세요<br><br>
		
	<div class="bottom">		
		<button type="submit">삭제처리</button>	
		<button type="button" onclick="mlist()">목록</button>	
	</div>
		</form>
		<%} %>
	<jsp:include page="/menu/bottom.jsp"/>
	</body> 
	</html> 