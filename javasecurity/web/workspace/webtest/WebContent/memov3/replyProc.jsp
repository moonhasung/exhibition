<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/memov3/ssi.jsp" %>
<jsp:useBean id="dto" class="memo.MemoDTO" />
<jsp:setProperty name ="dto" property="*" />
<%
	Map map = new HashMap();
	map.put("grpno",dto.getGrpno());
	map.put("ansnum",dto.getAnsnum());
	dao.upAnsnum(map);
	boolean flag = dao.replyCreate(dto);
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
  font-size: 24px; 
} 
}
</style> 
</head> 
<link type="text/css" href="<%=root %>/css/style.css" rel="stylesheet">
<body> 
<div class="title">처리결과</div>
<div class="content">
<%
if(flag){
out.print("답변 등록했습니다.");
}else{
out.print("답변등록이 실패했습니다.");
}
%>
</div>
<div class="bottom">
<input type="button" value="계속 등록" 
onclick="location.href='./createForm.jsp'">
<input type="button" value="목록" 
onclick="mlist()">
</div>
</body> 
</html> 