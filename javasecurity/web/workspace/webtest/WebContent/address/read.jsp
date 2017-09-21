<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/address/ssi.jsp" %>
<%
	int addressnum = Integer.parseInt(request.getParameter("addressnum"));
	AddressDTO dto = dao.read(addressnum);	
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
}
</style> 
<link type="text/css" href="<%=root %>/css/style.css"rel="stylesheet">
<script type="text/javascript">
function treply(a){
	var url = "./replyForm.jsp";
	url+="?addressnum="+a;
	location.href=url;
}
function tlist(){
	var url = "./list.jsp";
	location.href=url;
}
</script>
</head> 
<body> 
<jsp:include page="/menu/top.jsp"/> 
<div class="title">주소조회</div>
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
		<tr style="line-height:2em;">
		<th>주소</th>
		<td colspan="2"><%=dto.getAddress1() %>(<%=dto.getZipcode() %>)</td>
	</tr>
	<tr style="line-height:2em;">
		<th>상세주소</th>
		<td colspan="2"><%=dto.getAddress2() %></td>
	</tr>
</table>
<div class="bottom">
	<button type="button" onclick="location.href='./list.jsp'">.href목록</button>
	<button type="button" onclick="tlist()">fn목록</button>
	<button type="button" onclick="treply('<%=addressnum%>')">답변</button>
</div>

<jsp:include page="/menu/bottom.jsp"/>
</body> 
</html> 