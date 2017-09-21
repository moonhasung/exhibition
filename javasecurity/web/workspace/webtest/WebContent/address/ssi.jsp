<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="address.*" %>
<%@ page import="java.util.*" %>
<%@ page import="utility.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<jsp:useBean id="dao" class = "address.AddressDAO" />
<% 
request.setCharacterEncoding("utf-8");
String root = request.getContextPath(); 

String upDir = application.getRealPath("/address/storage");
String tempDir = application.getRealPath("/address/temp");
%> 
