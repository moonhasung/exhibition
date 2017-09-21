<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/member/ssi.jsp"%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function incheck(f){
if(f.passwd.value==""){
alert("패스워드를 입력하세요");
f.passwd.focus();
return false;
}
if(f.repasswd.value==""){
alert("패스워드 확인을 입력하세요");
f.repasswd.focus();
return false;
}
if(f.passwd.value!=f.repasswd.value){
alert("비밀번호가 일치하지 않습니다.다시 입력하세요.");
f.passwd.focus();
return false;
}
}
</script> 
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
 
<DIV class="title">password 수정</DIV>
 
<FORM name='frm' 
	method='POST' 
	action='./updatePwProc.jsp'
	onsubmit="return incheck(this)">
 <input type= "hidden" name="id" 
 	value="<%=request.getParameter("id") %>"> 

  <TABLE>
    <TR>
      <TH>password</TH>
      <TD><input type= "password" name="passwd"></TD>
    </TR>
    <TR>
      <TH>password 확인</TH>
      <TD><input type= "password" name="repasswd"></TD>
    </TR>
 
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='수정'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 