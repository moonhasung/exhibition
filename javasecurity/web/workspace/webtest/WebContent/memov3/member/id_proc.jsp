<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member/ssi.jsp" %>
<%
	String id = request.getParameter("id");
	boolean flag = dao.duplicateId(id);
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
<script type = "text/javascript">
function use(){
	opener.frm.id.value='<%=id%>'
	window.close();
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>

<!-- *********************************************** -->
 
<DIV class="title">ID 중복확인</DIV>
 
<DIV class="content">
	입력된 ID:<%=id %><br><br>
	<%
		if(flag){
			out.print("중복되어서 사용할 수 없어요.<br><br>");
		}else{
			out.print("중복아니에요, 사용가능해요.<br><br>");
			out.print("<button type='button' onclick='use()'>사용</button>");
		}
	%>	
</DIV>

  <DIV class='bottom'>
    <input type='button' value='다시시도' onclick="location.href='id_form.jsp'">
    <input type='button' value='닫기' onclick="window.close()">
  </DIV>
 
 
<!-- *********************************************** -->

</body>
<!-- *********************************************** -->
</html> 