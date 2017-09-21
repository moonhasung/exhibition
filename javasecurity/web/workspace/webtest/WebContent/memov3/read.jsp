<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/memov3/ssi.jsp" %>
 
<%  request.setCharacterEncoding("utf-8"); 
int memono = Integer.parseInt(request.getParameter("memono"));
 

/*조회수 증가 */
dao.upviewcnt(memono);
/*조회수 증가 END*/
 
/* 조회    */
MemoDTO dto = dao.read(memono);
String content = dto.getContent();
content = content.replaceAll("\r\n", "<br>");

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

</style>
<link type="text/css" href="<%=root%>/css/style.css" rel="stylesheet">
<script type = "text/javascript">
	function mlist(){
	var url = "./list.jsp";
	url += "?col=<%=request.getParameter("col")%>";
	url += "&word=<%=request.getParameter("word")%>";
	location.href=url;
}
	function mreply(memono){
		var url = "./replyForm.jsp";
		url += "?memono="+memono;
		location.href=url;
	}
	function mupdate(memono){
		var url = "./updateForm.jsp";
		url += "?memono="+memono;
		location.href=url;
	}
	function mdelete(memono){
		var url = "./deleteForm.jsp";
		url += "?memono="+memono;
		location.href=url;
	}

</script> 
</head> 
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="title">조회</div>
<table>
	<tr>
	<th>제목</th>
	<td><%=dto.getTitle() %></td>
	</tr>
	<tr>
	<th>내용</th>
	<td><%=content %></td>
	</tr>
	<tr>
	<th>조회수</th>
	<td><%=dto.getViewcnt() %></td>
	</tr>
	<tr>
	<th>등록일</th>
	<td><%=dto.getWdate() %></td>
	</tr>
</table>
<div class="bottom">
	<button type="button" onclick="location.href='./createForm.jsp'">등록</button>
	<button type="button" onclick="mupdate('<%=memono%>')">수정</button>
	<button type="button" onclick="mdelete('<%=memono%>')">삭제</button>
	<button type="button" onclick="mreply('<%=memono%>')">답변</button>
	<button type="button" onclick="location.href='./list.jsp'">목록</button>
</div>
<jsp:include page="/menu/bottom.jsp"/>
</body> 
</html>

