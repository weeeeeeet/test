<%@page import="org.json.simple.parser.JSONParser"%>

<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.util.Enumeration"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String resultCode = request.getParameter("resultCode");
String resultMsg = request.getParameter("resultMsg");

// STEP2 에 이어 인증결과가 성공일(resultCode=0000) 경우 STEP2 에서 받은 인증결과로 아래 승인요청 진행



JSONObject resJson = null;
if("0000".equals(resultCode)){ 

String authRequestUrl = request.getParameter("authRequestUrl");
String txId = request.getParameter("txId");

String token = request.getParameter("token");     // 최초 요청시 reservedMsg="isUseToken=Y" 일경우 개인정보SEED 복호화를 위한 토큰값 전달


JSONParser parser = new JSONParser();
URL url = new URL(authRequestUrl);
HttpURLConnection conn = (HttpURLConnection) url.openConnection();

if (conn != null) {
conn.setRequestProperty("Content-Type", "application/json; charset=utf-8");
conn.setRequestMethod("POST");
conn.setDefaultUseCaches(false);
conn.setConnectTimeout(3000);
conn.setReadTimeout(3000);
conn.setDoOutput(true);

JSONObject reqJson = new JSONObject();
reqJson.put("mid", "**********");    // 부여받은 MID(상점ID) 입력(영업담당자 문의)

reqJson.put("txId", txId);

if (conn.getDoOutput()) {
conn.getOutputStream().write(reqJson.toString().getBytes());
conn.getOutputStream().flush();
conn.getOutputStream().close();
}

conn.connect();

if (conn.getResponseCode() == HttpServletResponse.SC_OK) {
BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
resJson = (JSONObject) parser.parse(br);
br.close();
}
}
for(Object key : resJson.keySet()){
out.print("<p>"+key + " : " + resJson.get(key)+"</p>");
}


// -------------------- 결과 수신 -------------------------------------------//


}else{
out.print("<p>"+resultCode+"</p>");
out.print("<p>"+resultMsg+"</p>");
}
%>