
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/bbs/ssi.jsp"%>
<%
	//-검색관련
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if (col.equals("total"))
		word = "";
	//---페이징관련
	int nowPage = 1; //현재 보고있는 페이지
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));	
	}
	int recordPerPage =3; //한페이지당 보여줄 레코드 갯수
	//DB에서 데이터를 가저올 순번
	int sno = ((nowPage-1)*recordPerPage) + 1; 
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	List<BbsDTO> list = dao.list(map);
	int totalRecord = dao.total(map);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function read(bbsno){
	var url = "./read.jsp";
	url+="?bbsno="+bbsno;
	url+="&col=<%=col%>";
	url+="&word=<%=word%>";

		location.href = url;

	}
</script>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}

.search {
	width: 80%;
	margin: 2px auto;
	text-align: center;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">게시판 목록</DIV>
	<div class="search">
		<form method="post" action="./list.jsp">
			<select name="col">
				<option value="wname"
					<%if (col.equals("wname"))
				out.print("selected='selected'");%>>성명</option>
				<option value="title"
					<%if (col.equals("title"))
				out.print("selected='selected'");%>>제목</option>
				<option value="content"
					<%if (col.equals("content"))
				out.print("selected='selected'");%>>내용</option>
				<option value="total"
					<%if (col.equals("total"))
				out.print("selected='selected'");%>>전체출력</option>
			</select> <input type="text" name="word" value="<%=word%>">
			<button>검색</button>
			<button type="button" onclick="location.href='./createForm.jsp'">등록</button>
		</form>

	</div>
	<br>
	<TABLE>
		<TR>
			<TH>번호</TH>
			<TH>제목</TH>
			<TH>성명</TH>
			<TH>조회수</TH>
			<TH>등록일</TH>
			<TH>grpno</TH>
			<TH>indent</TH>
			<TH>ansnum</TH>
		</TR>

		<%
			if (list.size() == 0) {
		%>
		<tr>
			<td colspan="8">등록된 글이 없습니다.</td>
		</tr>

		<%
			} else {
				for (int i = 0; i < list.size(); i++) {
					BbsDTO dto = list.get(i);
		%>
		<tr>
			<td><%=dto.getBbsno()%></td>
			<td>
				<%
					for (int j = 0; j < dto.getIndent(); j++) {
								out.print("&nbsp;&nbsp;&nbsp;");
							}
							if (dto.getIndent() > 0) {
								out.print("<img src='../images/re.jpg'>");
							}
				%> <a href="javascript:read('<%=dto.getBbsno()%>')">
				<%=dto.getTitle()%></a>
					<%if(Utility.compareDay(dto.getWdate().substring(0,10))){ %>
					<img src="<%=root %>/images/new.gif">
				<%} %>
			</td>
			<td><%=dto.getWname()%></td>
			<td><%=dto.getViewcnt()%></td>
			<td><%=dto.getWdate().substring(0, 10)%></td>
			<td><%=dto.getGrpno()%></td>
			<td><%=dto.getIndent()%></td>
			<td><%=dto.getAnsnum()%></td>
		</tr>
		<%
			} //for-end
			} //if-end
		%>

	</TABLE>

	<DIV class='bottom'>

		<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>

	</DIV>
	</FORM>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
