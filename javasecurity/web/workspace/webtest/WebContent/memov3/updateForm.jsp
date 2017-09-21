<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/memov3/ssi.jsp" %>
<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	MemoDTO dto = dao.read(memono);
			
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
* {
	font-family: gulim;
	font-size: 20px;
}

div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

table {
	width: 50%;
	margin: 0auto;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
	<div>수정</div>
	<form name="frm" method="post" action="./updateProc.jsp">
		<input type="hidden" name="memono" value="<%=memono%>">
	<input type="hidden" name = "col" value="<%=request.getParameter("col")%>">
	<input type="hidden" name = "word" value="<%=request.getParameter("word")%>">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" size="30"
					value="<%=dto.getTitle() %>" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="30" name="content"><%=dto.getContent()%></textarea>
				</td>
			</tr>
		</table>
		<div>
			<input type="submit" value="전송">
		</div>
	</form>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>
