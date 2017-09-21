<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/team/ssi.jsp"%>
 <%
 	
 UploadSave upload = new UploadSave(request,-1,-1,tempDir);
 
 int teamno = Integer.parseInt(upload.getParameter("teamno"));
 String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
 FileItem fileItem =upload.getFileItem("filename");
 int size = (int)fileItem.getSize();
 String filename=null;
 if(size>0){
	 if(oldfile!=null && !oldfile.equals("member.jpg"))
		 UploadSave.deleteFile(upDir, oldfile);
 filename = UploadSave.saveFile(fileItem, upDir);
  }
 Map map = new HashMap();
 map.put("teamno",teamno);
 map.put("filename", filename); 
 boolean flag = dao.updateFile(map);
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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
function tlist(){
	var url = "./list.jsp";
	location.href=url;
}
</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title"></DIV>
 
<div class = "content"></div>
 
  <%
  if(flag){
	  out.print("사진을 변경했습니다");
	  
  }else{
	  out.print("사진변경을 실패했습니다");
  }
  
  %>
  <DIV class='bottom'>
    <input type='submit' value='다시시도' onclick ="history.back">
    <input type='button' value='목록' onclick="tlsit()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 