	<%@ page contentType="text/html; charset=UTF-8" %> 
	<%@ page import ="utility.*" %>
	<%@ page import="org.apache.commons.fileupload.FileItem" %>
	<%
	//업로드한 파일 저장공간(임시,실패)	
	String upDir = application.getRealPath("/test/storage");
	String tempDir = application.getRealPath("/test/temp");
	
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	String title = UploadSave.encode(upload.getParameter("title"));
	
	FileItem fileItem = null;
	String filename1=null;
	String filename2=null;
	String filename3=null;
	
	fileItem = upload.getFileItem("file1");
	int size1 = (int)fileItem.getSize();
	
	if(size1>0){
		filename1 = UploadSave.saveFile(fileItem,upDir);
		
	}
	fileItem = upload.getFileItem("file2");
	
	int size2 = (int)fileItem.getSize();	
	
	if(size2>0){
		filename2 = UploadSave.saveFile(fileItem, upDir);
		
	}
	fileItem = upload.getFileItem("file3");
	int size3 = (int)fileItem.getSize();
	
	if(size3>0){
		filename3=UploadSave.saveFile(fileItem, upDir);
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
	} 
	</style> 
	<link href="../css/style.css" rel="Stylesheet" type="text/css">
	</head> 
	<!-- *********************************************** -->
	<body>
	<jsp:include page="/menu/top.jsp" flush="false"/>
	<!-- *********************************************** -->
	 
		<DIV class="title">파일 확인</DIV>
	<div class ="content">
	 제목 : <%=title %> <br><br>
	 파일1 : <%=filename1 %> / 파일사이즈 :<%=size1 %> <br>
	 파일2 : <%=filename2 %> / 파일사이즈 :<%=size2 %> <br>
	 파일3: <%=filename3 %> / 파일사이즈 :<%=size3 %> <br>
	</div> 
	 
	  
	 
	 
	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false"/>
	</body>
	<!-- *********************************************** -->
	
	
	</html> 