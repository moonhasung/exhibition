<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file ="/bbs/ssi.jsp" %>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = dao.read(bbsno);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	function inCheck(f) {
		if (f.wname.value == "") {
			alert("이름을 입력하세요");
			f.wname.focus();
			return false;
		}
		if (f.title.value == "") {
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}
		if (f.content.value == "") {
			alert("내용을 입력하세요");
			f.content.focus();
			return false;
		}
		if (f.passwd.value == "") {
			alert("비밀번호를 입력하세요");
			f.passwd.focus();
			return false;
		}
	}
</script>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">수정</DIV>

	<FORM name='frm'
	 method='POST'
	 action='./updateProc.jsp'
	onsubmit="return inCheck(this)">
	<input type="hidden" name = "bbsno" value="<%=bbsno%>">
	<input type="hidden" name = "col" value="<%=request.getParameter("col")%>">
	<input type="hidden" name = "word" value="<%=request.getParameter("word")%>">
		<TABLE>
			<TR>
				<TH>성명</TH>
				<TD><input type="text" name="wname"value="<%=dto.getWname()%>"></TD>
			</TR>
			<TR>
				<TH>제목</TH>
				<TD><input type="text" name="title"value="<%=dto.getTitle()%>"></TD>
			</TR>
			<TR>
				<TH>내용</TH>
				<TD><textarea rows="10" cols="45" name="content"><%=dto.getContent()%></textarea></TD>
			</TR>
			<TR>
				<TH>비밀번호</TH>
				<TD><input type="password" name="passwd"></TD>
			</TR>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='수정'> <input type='button'
				value='취소' onclick="history.back()">
		</DIV>
	</FORM>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
