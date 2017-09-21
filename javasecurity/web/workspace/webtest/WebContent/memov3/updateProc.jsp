<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/memov3/ssi.jsp"%>
<jsp:useBean id="dto" class="memo.MemoDTO" />
<jsp:setProperty name="dto" property="*" />
<%
	
	boolean flag = dao.update(dto);
	

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
	font-size: 24px;
}

div {
	text-align: center;
	margin-top: 100px;
}
</style>
<link href="<%=root %>css/style.css"rel="stylesheet">
</head>

<body>
	<div>
		<%
			if (flag) {
				out.print("메모를 수정했습니다.");
			} else {
				out.print("메모수정이 실패했습니다.");
			}
		%>
		</div>
		<div class = "bottom">
		<br> <input type="button" value="계속 등록"
			onclick="location.href='./createForm.jsp'"> <input
			type="button" value="목록" onclick="mlist()">
	</div>
	
</body>
</html>
