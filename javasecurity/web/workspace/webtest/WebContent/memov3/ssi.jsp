<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="memo.*" %>
<%@ page import="java.util.*" %>
<%@ page import="utility.Utility" %>

<jsp:useBean id="dao" class="memo.MemoDAO"/>
<%    
	  request.setCharacterEncoding("utf-8");
      String root = request.getContextPath();
	
%> 