			
<%@page import="javax.xml.bind.DatatypeConverter"%>

<%@page import="java.security.MessageDigest"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Calendar"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String mid = "MIIiasTest";                                    // 부여받은 MID(상점ID) 입력(영업담당자 문의)

    String apiKey = "ZUhPSzQzQUpCN1dLa1I0RFd3Y1VuQT09";      // 부여받은 MID 에 대한 apiKey
    String reqSvcCd = "01";
    String mTxId = "mTxId_" + Calendar.getInstance().getTimeInMillis();

    String reservedMsg = "isUseToken=Y";                 // 결과조회 응답시 개인정보SEED 암호화 처리 요청

    // 등록가맹점 확인
    String plainText1 = mid + mTxId + apiKey;
    MessageDigest authmd = MessageDigest.getInstance("SHA-256");
    authmd.update(plainText1.getBytes("UTF-8"));
    authHash = DatatypeConverter.printHexBinary(authmd.digest()).toLowerCase();

    String userName = "홍길동";           // 사용자 이름
    String userPhone = "01011112222";  // 사용자 핸드폰
    String userBirth = "19800101";         // 사용자 생년월일
    String userHash = "";

    String flgFixedUser = "N";              // 특정사용자 고정시 Y

    if("Y".equals(flgFixedUser))
    {
    String plainText2 = userName + mid + userPhone + mTxId + userBirth + reqSvcCd;
    MessageDigest md = MessageDigest.getInstance("SHA-256");
    md.update(plainText2.getBytes("UTF-8"));
    userHash = DatatypeConverter.printHexBinary(md.digest()).toLowerCase();
    }
%>

<html> 
<head> 
<title>통합본인인증 요청</title> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<script language="javascript"> 
function callSa()
{
let window = popupCenter();
if(window != undefined && window != null)
{
document.saForm.setAttribute("target", "sa_popup");
document.saForm.setAttribute("post", "post");
document.saForm.setAttribute("action", "https://sa.inicis.com/auth");
document.saForm.submit();
}
}

function popupCenter() {
let _width = 400;
let _height = 620;
var xPos = (document.body.offsetWidth/2) - (_width/2); // 가운데 정렬
xPos += window.screenLeft; // 듀얼 모니터일 때

return window.open("", "sa_popup", "width="+_width+", height="+_height+", left="+xPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes");
}
</script> 
</head>
<body>

<form name="saForm">

<input type="text" name="mid" value="<%=mid %>">
<input type="text" name="reqSvcCd" value="<%=reqSvcCd %>">
<input type="text" name="mTxId" value="<%=mTxId %>">

<input type="text" name="authHash" value="<%=authHash %>">
<input type="text" name="flgFixedUser" value="<%=flgFixedUser %>">
<input type="text" name="userName" value="<%=userName %>">
<input type="text" name="userPhone" value="<%=userPhone %>">
<input type="text" name="userBirth" value="<%==userBirth %>">
<input type="text" name="userHash" value="<%=userHash %>">

<input type="text" name="reservedMsg" value="<%=reservedMsg %>">

<input type="text" name="directAgency" value="">
                                                             
<input type="text" name="successUrl" value="https://merchantdomain/success.jsp">
<input type="text" name="failUrl" value="https://merchantdomain/success.jsp">
<!-- successUrl/failUrl 은 분리하여도 됩니다. !-->

</form>

<button onclick="callSa()">확인</button>

</body>
</html>