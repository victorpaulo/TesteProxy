<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
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
  
  if (httpProxyHost == null || "".equals(httpProxyHost)) {
  	httpProxyHost = "N/A";
  }
   
  if (httpsProxyPort == null || "".equals(httpsProxyPort)) {
  	httpsProxyPort = "N/A";
  }
   
  if (httpProxyPort == null || "".equals(httpProxyPort)) {
  	httpProxyPort = "N/A";
  } 
  
  String saida = "";
  if (urlAddress != null || !"".equals(urlAddress)) {
      try {
		  URL oracle = new URL(urlAddress);
		  URLConnection yc = oracle.openConnection();
		  BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
		  String inputLine;
		  StringBuffer sb = new StringBuffer();
		  while ((inputLine = in.readLine()) != null) 
		      sb.append(inputLine);
		  in.close();
		  
		  saida = sb.toString();
	  } catch (Exception ex) {
	      saida = ex.getMessage();
	  }
   }
%>

JVM HTTPs Proxy host = <%=httpsProxyHost %> <br/>
JVM HTTPs Proxy port = <%=httpsProxyPort %> <br/><br/>
JVM HTTP Proxy host = <%=httpProxyHost %> <br/>
JVM HTTP Proxy port = <%=httpProxyPort %>
<br/>
<br/>
Chamando o endereço http(s):<br>
<form method="POST" action="index.jsp">
  <input type="text" name="endereco" value="" size="50"/>
  <br>
  <input type="submit" name="testar"/>
  
  <textarea rows="10" cols="60" name="comment">
    <%=saida%>
  </textarea>
</form>

</body>
</html>