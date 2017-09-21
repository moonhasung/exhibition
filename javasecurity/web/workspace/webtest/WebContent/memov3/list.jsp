
<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/memov3/ssi.jsp" %>

<% 
  //검색관련--------
String col = Utility.checkNull(request.getParameter("col"));
String word = Utility.checkNull(request.getParameter("word"));


	if(col.equals("total")){
		word="";
	}
//page 관련------
	int nowPage = 1; //현제페이지
	int recordPerPage =3;// 페이지당 보여줄수 있는 레코드 갯수 
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	//db에서 데이터가져올 순번 
	int sno = ((nowPage-1)*recordPerPage)+1;
	int eno = nowPage*recordPerPage;
		
	Map map = new HashMap();
		map.put("col",col);
		map.put("word",word);	
		map.put("sno",sno);	
		map.put("eno",eno);	
		
		
		
		int totalRecord = dao.total(map);	
	
	
	
	List<MemoDTO> list = dao.list(map);
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
.search{
	width:80;
	text-align:center;
	margin:2px auto;
}
*{ 
  font-family: gulim; 
  font-size: 20px; 
  font-align:center;	
} 
</style>
<link href="<%=root %>/css/style.css" rel="stylesheet" type="text/css"> 
<script type="text/javascript"> //제목클릭
	function read(memono){
		var url ="./read.jsp"; //이동경로
		url += "?memono="+memono;	
		url += "&col="+"<%=col%>";	
		url += "&word="+"<%=word%>";	
		//alert(url); 경고창 함수
		location.href=url;
	}


</script>

</head> 
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="title">메모목록</div>
<div class="search">
<form method="post" action ="./list.jsp">
	<select name ="col">
	<option value="title"
	<%if(col.equals("title")) out.print("selected='selected'"); %>
	>제목</option>
	<option value="content"
	<%if(col.equals("content")) out.print("selected='selected'"); %>
	>내용</option>
	
	<option value="total"
	<%if(col.equals("total")) out.print("selected='selected'"); %>
	>전체출력</option>
	</select>
	<input type="text" name ="word" value="<%=word %>">
	<button>검색</button>
	<button type="button" onclick="location.href='./createForm.jsp'"></button>
</form>
</div>

<table>
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>날짜</th>
	<th>조회수</th>
	<th>grpno</th>
	<th>indent</th>
	<th>ansnum</th>
</tr>
<%if(list.size()==0){ %>
<tr>
	<td colspan="7">등록된 메모가 없습니다.</td>
</tr>
<%}else{
	for(int i = 0 ; i<list.size() ; i++){
		MemoDTO dto = list.get(i);
	%>
		<tr>
			<td><%=dto.getMemono() %></td>
			<td> <!-- 제목클릭 -->
			<%
			for(int j=0;j<dto.getIndent();j++){
				out.print("&nbsp;&nbsp;&nbsp;");
			}
			if(dto.getIndent()>0){
				out.print("<img src='../images/re.jpg'>");
			}
			%>
			
			<a href="javascript:read('<%=dto.getMemono() %>')"><%=dto.getTitle() %></a> 
			<%if (Utility.compareDay(dto.getWdate())){  %>
			<img src = "<%=root %>/images/new.gif">
			<%} %>			
			</td>
			<td><%=dto.getWdate() %></td>
			<td><%=dto.getViewcnt() %></td>
			<td><%=dto.getGrpno() %></td>
			<td><%=dto.getIndent() %></td>
			<td><%=dto.getAnsnum() %></td>
		</tr>
	<%
	}//for-end
	}//if-end
	%>

</table>
<div class="bottom">
<input type="button"value="등록"
onclick="location.href='./createForm.jsp'">


</div>
<div class="bottom">
<%= Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
</div>

<jsp:include page="/menu/bottom.jsp"/>
</body> 
</html> 
