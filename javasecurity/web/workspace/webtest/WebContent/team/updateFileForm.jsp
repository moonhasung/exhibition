<%@ page contentType="text/html; charset=UTF-8" %> 

 
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

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function incheckf(f){
	if(f.filename.value==""){
		alert("파일을 선택하세요");
		f.filename.focus();
		return false;
	}
}

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">사진수정</DIV>
 
<FORM name='frm'
method='POST'
enctype="multipart/crom-data"
action='./updateFIleProc.jsp'
onsubmit="return incheck(this)">
<input type="hidden" name="teamno" value="<%=request.getParameter("teamno")%>">
<input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile")%>">
  <TABLE>
    <TR>
      <TH>원본파일</TH>
      <TD>
      <img src="./storage/<%=request.getParameter("oldfile") %>">
      <%=request.getParameter("oldfile") %>
      </TD>
    </TR>
     
     <TR>
      <TH>변경파일</TH>
      <TD>
      <input type="file" name="filename" accept=".png,.gif,.jpg">
      </TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='변경' onclick="">
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 