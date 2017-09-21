<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/bbs/ssi.jsp" %>
<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
String col = request.getParameter("col");
String word = request.getParameter("word");	
dao.upViewcnt(bbsno);
	BbsDTO dto = dao.read(bbsno);
	String content = dto.getContent();
	content = content.replaceAll("\r\n","<br>");
%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type = "text/javascript">
function breply(){
	var url = "./replyForm.jsp";
	url += "?bbsno=<%=bbsno%>";
	url += "&col="+"<%=col%>";	
	url += "&word="+"<%=word%>";	
	location.href=url;
}
function bdelete(){
	var url = "./deleteForm.jsp";
	url += "?bbsno=<%=bbsno%>";
	url += "&col="+"<%=col%>";	
	url += "&word="+"<%=word%>";	
	location.href=url;
}
function bupdate(){
	var url="./updateForm.jsp";
	url+="?bbsno=<%=bbsno%>";
	url += "&col="+"<%=col%>";	
	url += "&word="+"<%=word%>";	
	location.href=url;
}
function blist(){
	var url = "./list.jsp";
	url+="?col=<%=request.getParameter("col")%>";
	url+="&word=<%=request.getParameter("word")%>";
	location.href=url;
}
</script> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">조회</DIV>
 
  <TABLE>
    <TR>
      <TH>제목</TH>
      <TD><%=dto.getTitle() %></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><%=content %></TD>
    </TR>
    <TR>
      <TH>성명</TH>
      <TD><%=dto.getWname() %></TD>
    </TR>
    <TR>
      <TH>등록날짜</TH>
      <TD><%=dto.getWdate() %></TD>
    </TR>
    <TR>
      <TH>조회수</TH>
      <TD><%=dto.getViewcnt() %></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='등록' onclick="location.href='createForm.jsp'">
    <input type='button' value='목록' onclick="blist()">
    <input type='button' value='수정' onclick="bupdate()">
    <input type='button' value='삭제' onclick="bdelete()">
    <input type='button' value='답변' onclick="breply()">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 