<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member/ssi.jsp"%>
 <%
 	String id = request.getParameter("id");
 	if(id==null)id=(String)session.getAttribute("id");
 	MemberDTO dto = dao.read(id);
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
<script type="text/javascript">
function updateFile(){
	var url = "updateFileForm.jsp";
	url += "?id=<%=id%>";
	url += "&oldfile=<%=dto.getFname()%>";
	location.href=url;
	}
function updatePw(){
	var url ="updatePwForm.jsp";
	url += "?id=<%=id%>"
	location.href=url;
	}
function update(){
		var url = "updateForm.jsp";
		url += "?id=<%=id%>"
				
		location.href=url;
}
function del(){
	var url = "deleteForm.jsp";
	url += "
	?id=<%=id%>"
	url += "&oldfile=<%=dto.getFname()%>"
	location.href=url;
}

</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"><%=dto.getMname() %>의 회원정보</DIV>
 

  <TABLE>
    <TR>
      <td colspan="2">
      <img src="./storage/<%=dto.getFname()%>">
    </td>
     <TR>
      <TH >아이디</TH>
      <TD><%=dto.getId() %></TD>
    </TR>
     <TR>
      <TH >성명</TH>
      <TD><%=dto.getMname() %></TD>
    </TR>
     <TR>
      <TH >전화번호</TH>
      <TD><%=Utility.checkNull(dto.getTel()) %></TD>
    </TR>
     <TR>
      <TH >우편번호</TH>
      <TD><%=Utility.checkNull(dto.getZipcode()) %></TD>
    </TR>
     <TR>
      <TH >주소</TH>
      <TD><%=Utility.checkNull(dto.getAddress1()) %><br></TD>
      <TD><%=Utility.checkNull(dto.getAddress2()) %><br></TD>
      
    </TR>
     <TR>
      <TH >직업</TH>
      <TD>
      	직업코더:<%=dto.getJob()%>
      	(<%=Utility.getCodeValue(dto.getJob()) %>)
    </TD>
    </TR>
    <TR>
      <TH>등록날짜</TH>
      <TD>
      <%=dto.getMdate() %>
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='정보수정' onclick ="update()">
    <input type='button' value='패스워드변경' onclick = "updatePw()">
  	<input type= 'button' value='사진수정' onclick = "updateFile()">
  	<input type= 'button' value='회원삭제' onclick = "del()">
  	  <input type='button' value='다운로드'  
           onclick="location.href='<%=request.getContextPath() %>/download?dir=/member/storage&filename=<%=dto.getFname()%>'"> 
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 