<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member/ssi.jsp"%>
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
function incheck(f){
  if(f.fname.value==""){
 alert("사진을 선택하세요.");
 f.fname.focus();
 return false;
  } 
}
</script>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"></DIV>
 
<FORM name='frm'
 method='POST'
 enctype="multipart/form-data"
 action='./updateFileProc.jsp'
 onsubmit="return incheck(this)">
  
  <input type="hidden" name="id" value="<%=request.getParameter("id") %>">
  <input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile") %>">
  <TABLE>
    <TR>
      <TH>원본파일</TH>
      <TD>
      <img src = ".storage/<%=request.getParameter("oldfile")%>">
     	원본파일명 :<%=request.getParameter("oldfile") %>
      </TD>
    </TR>
  	<TR>
      <TH>변경파일</TH>
      <TD>
      	<input type= "file" name="fname" accept=".png,.jpg,.gif">
     	 </TD>
  
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='변경'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 