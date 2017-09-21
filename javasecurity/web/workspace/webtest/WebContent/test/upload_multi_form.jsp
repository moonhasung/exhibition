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
 
<DIV class="title">파일 전송 테스트</DIV>
 
<FORM name='frm' 
method='POST' 
enctype="multipart/form-data"
action='./upload_multi_proc.jsp'>
  <TABLE>
    <TR>
      <TH>① 파일:</TH>
      <TD><input type="file" name= "file1"></TD>
    </TR>
    <TR>
      <TH>② 파일:</TH>
      <TD><input type="file" name= "file2"></TD>
    </TR>
    <TR>
      <TH>③ 파일:</TH>
      <TD><input type="file" name= "file3"></TD>
    </TR>
    <TR>
      <TH>파일설명</TH>
      <TD><input type="text" name= "title"></TD>
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