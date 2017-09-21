<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="utility.*" %>
<%@ page import="team.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<jsp:useBean id="dao" class="team.TeamDAO" />
<% request.setCharacterEncoding("utf-8"); 
	String root = request.getContextPath();
	
	String upDir = application.getRealPath("/team/storage");
	String tempDir = application.getRealPath("/team/temp");
%> 
