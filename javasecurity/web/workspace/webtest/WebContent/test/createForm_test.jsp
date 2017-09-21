<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/bbs/ssi.jsp"%>
 
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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">글내용</DIV>
 
<FORM name='frm' 
method='POST'
 enctype="multipart/form-data"  
 action='./createProc_test.jsp'>
  <TABLE>
    <TR>
      <TH>제목</TH>
      <TD><input type= "text" name="title"></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><textarea rows="15" cols ="50" name = "content"></textarea>
    </TR>
    <TR>
      <TH>파일</TH>
      <TD><input type= "file" name="filename"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='전송'>
    <input type='reset' value='취소'>
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 