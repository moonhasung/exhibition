<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/address/ssi.jsp" %>
<jsp:useBean id="dto" class="address.AddressDTO" />
<jsp:setProperty name = "dto" property="*" />    
<% 
Map map = new HashMap();
map.put("grpno",dto.getGrpno());
map.put("ansnum",dto.getAnsnum());
dao.upAnsnum(map);
boolean flag = dao.replyCreate(dto);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
font-size:20px;
}

</style>
<link type="text/css" href="<%=root %>/css/style.css" rel="stylesheet">
</head>
<body>
<div class="title">처리결과</div>
<div class="content">
<%	
	if(flag){
		out.print("답변 등록되었습니다.");
	}else{
		out.print("답변 등록이 실패");
	}
%>
</div>
<div class="bottom">
<button type="button" onclick = "location.href='./createForm.jsp'">계속등록</button>
<button type="button" onclick = "location.href='./list.jsp'">목록</button>
</div>

</body>
</html>