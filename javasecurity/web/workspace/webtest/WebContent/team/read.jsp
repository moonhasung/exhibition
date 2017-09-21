<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/team/ssi.jsp" %>
<%
	int teamno = Integer.parseInt(request.getParameter("teamno"));
	TeamDTO dto = dao.read(teamno);
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
div {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

table {
	width: 60%;
	margin: 0 auto;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
} 
</style> 
<script type="text/javascript">

function updateFile(){
	var url = "./updateFileForm.jsp";
	url += "?teamno=<%=dto.getTeamno()%>";
	url += "?oldfile=<%=dto.getFilename()%>"
	location.href=url;
}

function tupdate(){
	var url = "./updateForm.jsp";
	url += "?teamno=<%=dto.getTeamno()%>";
	location.href=url;
}

function tdelete(){
	if(confirm("정말 삭제하시겠습니까?")){
		var url = "./deletePorc.jsp";
		url += "?teamno=<%=teamno%>";
		url += "&oldfile=<%=dto.getFilename()%>"; 
		location.href=url;
		
	}
}
function tlist(){
	var url = "./list.jsp";
	location.href=url;
}
</script>
</head> 
<body> 
<jsp:include page="/menu/top.jsp"/>
<div>팀 조회</div>
<table>
<tr>
	<td rowspan="5" width="30%">
		<img src="./storage/<%=dto.getFilename()%>">
	    </td>
	    <th width="20%">이름</th>
	    <td width="50%"><%=dto.getName() %>
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
	<tr>
		<th>성별</th>
		<td><%=dto.getGender() %></td>
	</tr>
	<tr>
		<th>취미</th>
		<td><%=dto.getHobby() %></td>
	</tr>
	<tr style="line-height: 2em;">
		<th>주소</th>
		<td colspan="2" ><%=Utility.checkNull(dto.getAddress1()) %></td>
	</tr>
	<tr style="line-height: 2em;">
		<th>상세주소</th>
		<td colspan="2"><%=Utility.checkNull(dto.getAddress2()) %></td>
	</tr>  
</table>
<div>
	<button type="button" 
	onclick="location.href='./createForm.jsp'">등록</button>
	<button type="button" onclick="tupdate()">수정</button>
	<button type="button" onclick="tdelete()">삭제</button>
	<button type="button" onclick="tlist()">목록</button>
	<button type="button" onclick="updateFile()">사진수정</button>
	
</div>
<jsp:include page="/menu/bottom.jsp"/>
</body> 
</html>