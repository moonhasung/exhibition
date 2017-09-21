<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/team/ssi.jsp" %>
<%  
	int teamno = Integer.parseInt(request.getParameter("teamno"));
	String oldfile = request.getParameter("oldfile");
	boolean flag = dao.delete(teamno);
	if(flag){
		if(flag && oldfile!=null && !oldfile.equals("member.jsg"));
		UploadSave.deleteFile(upDir, oldfile);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
<style type="text/css">
*{
	font-size: 20px;
}
div{
	text-align: center;
	margin-top: 100px
}
</style>
</head>
<body>
<div>
<%
	if(flag){
		out.print("팀정보가 삭제되었습니다.");
	}else{
		out.print("팀정보 삭제가 실패되었습니다.");
	}

%>
 <br>
 <button type="button" 
 onclick="location.href='./createForm.jsp'">계속등록</button>
 <button type="button" 
 onclick="location.href=./list.jsp">목록</button>
</div>
</body>
</html>




