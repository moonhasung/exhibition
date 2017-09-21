<%@ page contentType="text/html; charset=UTF-8" %> 
<%
session.invalidate();

response.sendRedirect("../index.jsp");
//session.removeJAttribute("id")-- id만 지움
//session.removeJAttribute("pw")-- pw만 지움

%>