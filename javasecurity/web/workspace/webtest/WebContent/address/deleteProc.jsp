<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "/address/ssi.jsp" %>  
<% 
	int addressnum = Integer.parseInt(request.getParameter("addressnum"));
	
	String oldfile = request.getParameter("oldfile");
	boolean flag = false;
	if(flag){
		if(flag && oldfile!=null && !oldfile.equals("member.jsg"));
		UploadSave.deleteFile(upDir, oldfile);
	}
		boolean flag2 = dao.getRefnum(addressnum);
	if(flag2){}
	else{ flag = dao.delete(addressnum);
	};
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
font-size:20px;
}
div{
text-align:center;
margine-top:100px
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">

</head>
<body>
<div class="content">
<%  
	if(flag && !flag2){ 
		out.print("팀정보 삭제완료");
	}else if(flag2){
		out.print("댓글 먼저 지우세요");
	}else{
		out.print("삭제가 안됩니다");
	}
%>
<br>
<button type="button" onclick = "location.href='./createForm.jsp'">계속등록</button>
<button type="button" onclick = "location.href='./list.jsp'">목록</button>
</div>
</body>
</html>