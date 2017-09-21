<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/team/ssi.jsp" %>
<%
//-검색관련
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	if (col.equals("total")) word = "";
	//--paging 관련
	
	int nowPage = 1;
	int recordPerPage = 5;

	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	//DB에서 가져올 순번
	int sno = ((nowPage-1)*recordPerPage);
	int eno = nowPage*recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	int total = dao.total(map);
	List<TeamDTO> list = dao.list(map);
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
  font-align: center:	
}
div{
	text-align : center;
}

</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> 
<script type="text/javascript">
function read(teamno){
	var url = "./read.jsp";
	url += "?teamno="+teamno;
	
	location.href=url;
}
</script>
</head> 
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="title">팀 목록</div>
<div class="search">
		<form method="post" action="./list.jsp">
			<select name="col">
				<option value="name"
					<%if (col.equals("name"))
				out.print("selected='selected'");%>>성명</option>
				<option value="phone"
					<%if (col.equals("phone"))
				out.print("selected='selected'");%>>전화번호</option>
				<option value="skill"
					<%if (col.equals("skill"))
				out.print("selected='selected'");%>>보유기술</option>
			</select> <input type="text" name="word" value="<%=word%>">
			<button>검색</button>
			<button type="button" onclick="location.href='./createForm.jsp'">등록</button>
		</form>

	</div>
	<br>
<table>
<% 
	for(int i=0;i<list.size();i++){
	 TeamDTO dto = list.get(i);
%>
	<tr>
		<td rowspan="3" width="30%">
		<img src="./storage/<%=dto.getFilename()%>">
	    </td>
	    <th width="20%">이름</th>
	    <td width="50%">
	    <a href="javascript:read('<%=dto.getTeamno() %>')"><%=dto.getName() %></a>
	    </td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><%=dto.getPhone() %></td>
	</tr>
	<tr>
		<th>보유기술</th>
		<td><%=dto.getSkill() %></td>
	</tr>
	
<%
	}
%>
</table>
<div class="bottom">
	<%=Utility.paging3(total, nowPage, recordPerPage, col, word) %>
</div>
<jsp:include page="/menu/bottom.jsp"/>
</body> 
</html>






