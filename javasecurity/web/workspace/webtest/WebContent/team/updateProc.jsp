<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/team/ssi.jsp" %>
<jsp:useBean id="dto" class="team.TeamDTO" />
<jsp:setProperty name = "dto" property="*" />    
<% 
	boolean flag = dao.update(dto);	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function tlist(){
	var url = "./list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	
	location.href=url;
}

</script>
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
<link href="<%=root %>css/style.css"rel="stylesheet">
</head>
<body>
<div>
<%	
	if(flag){
		out.print("팀정보 수정완료 ^^");
	}else{
		out.print("팀정보 수정실패 ㅠㅠ");
	}
%>
<br>
<button type="button" onclick = "location.href='./createForm.jsp'">계속등록</button>
<button type="button" onclick = "tlist()">목록</button>
</div>
</fieldset>
</body>
</html>