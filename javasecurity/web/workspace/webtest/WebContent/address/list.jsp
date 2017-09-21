	<%@ page contentType="text/html; charset=UTF-8" %> 
	<%@ include file ="/address/ssi.jsp" %>
	
	<%  
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if(col.equals("total")) word = "";
	
	
	int nowPage = 1;
	int recordPerPage= 5;
	
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	} 
	
	int sno =((nowPage-1)*recordPerPage);
	int eno = nowPage*recordPerPage;
	
	Map map = new HashMap();
	map.put("col",col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	int total = dao.total(col,word);
	List<AddressDTO> list = dao.list(map);
	
	
	
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
	.search{
		width:80%;
		text-align:center;
		margin:2px auto;
	}
	</style> 
	<link href="<%=root %>/css/style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
	function read(addressnum){
	var url = "./read.jsp";
	url += "?addressnum="+addressnum;
	url += "&col=<%=col %>";
	url += "&word=<%=word %>";
	location.href=url;
	}
	function update(addressnum){
	var url = "./updateForm.jsp";
	url += "?addressnum="+addressnum;
	url += "&col=<%=col %>";
	url += "&word=<%=word %>";
	location.href=url;
	}
	function adelet(addressnum){
	if(confirm("삭제할꺼야?")){
	var url = "./deleteProc.jsp";
	url += "?addressnum="+addressnum;
	url += "&col=<%=col %>";
	url += "&word=<%=word %>";
	location.href=url;
	}
	 
	}
	</script>
	
	</head> 
	<body> 
	<jsp:include page="/menu/top.jsp"/> 
	<div class="title">주소록</div>
	<div class="search">
			<form method="post" action="./list.jsp">
			<select name="col">
				<option value="name"
					<%if (col.equals("name"))out.print("selected='selected'");%>>성명</option>
				<option value="phone"
					<%if (col.equals("phone"))out.print("selected='selected'");%>>전화번호</option>
					<option value ="total">전체출력 </option>
			</select> <input type="text" name="word" value="<%=word%>">
			<button>검색</button>
			<button type="button" onclick="location.href='./createForm.jsp'">등록</button>
	</form>
	</div>
	
	<table>
	
	<tr>
	<th>번호</th>
	<th>사진</th>
	<th>이름</th>
	<th>전화번호</th>
	<th>수정</th>
	<th>삭제</th>
	<th>grpno</th>
	<th>indent</th>
	<th>ansnum</th>
	</tr>
<%
	for(int i=0;i<list.size();i++){
	AddressDTO dto = list.get(i);
	%>
		
		
	  
	
	<tr> 
	<th><%=dto.getAddressnum() %></th>
	
	
	<%


	%>
	
	<td rowspan="1" width="30%">
	<img src="./storage/<%=dto.getFilename()%>">
	</td>
	<td><a href="javascript:read('<%=dto.getAddressnum() %>')"><%=dto.getName() %></a></td>	
	<td><%=dto.getPhone() %></td>
	<td><a href="javascript:update('<%=dto.getAddressnum() %>')">수정</a></td>
	<td><a href="javascript:adelet('<%=dto.getAddressnum() %>')">삭제</a></td>
	<td><%=dto.getGrpno() %></td>
	<td><%=dto.getIndent() %></td>
	<td><%=dto.getAnsnum() %></td>
	</tr>
	
	
	<%
	}
	
	%>
	
	</table>
	<div class ="bottom">
	<%=Utility.paging3(total, nowPage, recordPerPage, col, word) %>
	</div>
	<jsp:include page="/menu/bottom.jsp"/> 
	</body> 
	</html> 