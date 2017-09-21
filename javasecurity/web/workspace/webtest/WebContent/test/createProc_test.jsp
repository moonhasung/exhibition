<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import ="utility.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%
	//request.setCharacterEncoding("UTF-8");
	String upDir = "/test/storage";
	String tempDir = "/test/temp";
	
	upDir = application.getRealPath(upDir);
	tempDir = application.getRealPath(tempDir);
	
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	
	String title = UploadSave.encode(upload.getParameter("title")); 	
	String content = UploadSave.encode(upload.getParameter("content"));

	FileItem fileItem = upload.getFileItem("filename");
	int size = (int)fileItem.getSize();
	String filename ="";
	if(size>0){
	filename = UploadSave.saveFile(fileItem, upDir);
	}
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
  font-align: center;	
} 
</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">내용확인</DIV>
 
<div class = "content">내용</div>  
  <%
  	out.print("title:"+title+"<br>");
  	out.print("content:"+content+"<br>");
	out.print("filename:"+filename+"<br>");
  %>
  

<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 