<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	String user = "soldesk";
	String password = "1234";
	String driver = "oracle.jdbc.driver.OracleDriver";

	Class.forName(driver);

	Connection con = DriverManager.getConnection(url, user, password);

	/*조회수 증가*/
	StringBuffer sql = new StringBuffer();
	sql.append(" update memo ");
	sql.append(" set viewcnt = viewcnt + 1 ");
	sql.append(" where memono = ? ");
	
	PreparedStatement pstmt = con.prepareStatement(sql.toString());
	pstmt.setInt(1, memono);
	pstmt.executeUpdate();
	/*조회수 증가 end*/
	
	sql.delete(0, sql.length());
	
	/*조회*/
	sql.append(" select memono, title, content, ");
	sql.append(" to_char(wdate,'yyyy-mm-dd') wdate, viewcnt ");
	sql.append(" from memo ");
	sql.append(" where memono = ? ");
	
	pstmt = con.prepareStatement(sql.toString());
	pstmt.setInt(1, memono);
	
	ResultSet rs = pstmt.executeQuery();
	String content = null;
    if(rs.next()){			
		content = rs.getString("content");
		content = content.replaceAll("\r\n", "<br>");
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
div{
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}
table{
	width:60%;
	margin:0 auto;
}
table,th,td{
	border:1px solid black;
	border-collapse: collapse;
}
th,td{
	padding:10px;
}

</style>
<script type="text/javascript">
	function mupdate(memono){
		var url = "./updateForm.jsp";
		url += "?memono="+memono;
		location.href=url;
	}
	function mdelete(memono){
		var url = "./deleteForm.jsp";
		url += "?memono="+memono;
		location.href=url;
	}
	
</script>
</head>
<body>
<div>조회</div>
<table>
	<tr>
		<th>제목</th>
		<td><%=rs.getString("title") %></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><%=content %></td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><%=rs.getInt("viewcnt") %></td>
	</tr>
	<tr>
		<th>등록일</th>
		<td><%=rs.getString("wdate") %></td>
	</tr>
</table>
<div>
	<button type="button" onclick="location.href='./createForm.jsp'">등록</button>
	<button type="button" onclick="mupdate('<%=memono%>')">수정</button>
	<button type="button" onclick="mdelete('<%=memono%>')">삭제</button>
	<button type="button" onclick="location.href='./list.jsp'">목록</button>
</div>
</body>
</html>
<%
if(rs!=null)rs.close();
if(pstmt!=null)pstmt.close();
if(con!=null)con.close();

%>





