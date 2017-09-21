<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/team/ssi.jsp" %>  
<% 
	int teamno = Integer.parseInt(request.getParameter("teamno"));
	boolean flag = dao.delete(teamno);	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<style type="text/css">
*{
font-size:20px;
}
div{
text-align:center;
margine-top:100px
}
fieldset{
text-align:center;
}
</style>
</head>

<body>
<fieldset>
<div>
<%	
	if(flag){
		out.print("팀정보 삭제완료 ^^");
	}else{
		out.print("팀정보 삭제실패 ㅠㅠ");
	}
%>
<br>
<button type="button" onclick = "location.href='./createForm.jsp'">계속등록</button>
<button type="button" onclick = "tlist()">목록</button>
</div>
</fieldset>
</body>
</html>