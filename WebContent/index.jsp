<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Teste proxy</title>
</head>
<body>
<h2>Teste proxy https</h2>
<br/>
<%
  String urlAddress = request.getParameter("endereco");
  
  String httpsProxyHost = System.getProperty("https.proxyHost");
  String httpsProxyPort = System.getProperty("https.proxyPort"); 
  
  String httpProxyHost = System.getProperty("http.proxyHost");
  String httpProxyPort = System.getProperty("http.proxyPort"); 
   
  if (httpsProxyHost == null || "".equals(httpsProxyHost)) {
  	httpsProxyHost = "N/A";
  } 
  
  if (httpProxyPort == null || "".equals(httpProxyPort)) {
  	httpProxyPort = "N/A";
  } 
  
   if (urlAddress == null || "".equals(urlAddress)) {
   	urlAddress = "http://www.google.com.br";
  } 
%>

JVM HTTPs Proxy host = <%=httpsProxyHost %> <br/>
JVM HTTPs Proxy port = <%=httpsProxyPort %> <br/><br/>
JVM HTTP Proxy host = <%=httpProxyHost %> <br/>
JVM HTTP Proxy port = <%=httpProxyPort %>
<br/>
Iframe chamando o endereço http(s):<br>
<form method="POST" action="index.jsp">
  <input type="text" name="endereco" size="50"/>
  <br>
  <input type="submit" name="testar"/>
</form>
<iframe src="<%=urlAddress %>" style="position: absolute; width: 100%; height: 100%; border: none">
  <p>Your browser does not support iframes.</p>
</iframe>
</body>
</html>