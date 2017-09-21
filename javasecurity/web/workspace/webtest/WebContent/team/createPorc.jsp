<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/team/ssi.jsp" %>
<jsp:useBean id="dto" class="team.TeamDTO"/>
<%  
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	dto.setName(UploadSave.encode(upload.getParameter("name")));
	dto.setGender(UploadSave.encode(upload.getParameter("gender")));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	dto.setHobby(UploadSave.encode(upload.getParameter("hobby")));
	dto.setPhone(upload.getParameter("phone"));
	dto.setZipcode(upload.getParameter("zipcode"));
	dto.setSkill(upload.getParameter("skills"));
	
	FileItem fileItem = upload.getFileItem("filename");
	int size = (int)fileItem.getSize();
	if(size>0){
		dto.setFilename(UploadSave.saveFile(fileItem, upDir));
	}else{
		dto.setFilename("member.jpg");	
	}
	
	boolean flag = dao.create(dto);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		out.print("팀정보가 등록되었습니다.");
	}else{
		out.print("팀정보 등록이 실패되었습니다.");
	}

%>
 <br>
 <button type="button" 
 onclick="location.href='./createForm.jsp'">계속등록</button>
 <button type="button" 
 onclick="location.href='./list.jsp'">목록</button>
</div>
</body>
</html>




