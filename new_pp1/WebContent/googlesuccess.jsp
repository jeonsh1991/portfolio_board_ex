<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%
String id = request.getParameter("apiID");
String name = request.getParameter("apiName");
String image = request.getParameter("apiImage");
String token = request.getParameter("apiIdToken");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="1008172242633-dbgdamskcigv6coibmumfoe9149cvcck.apps.googleusercontent.com">
<script>
function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
  console.log('Name: ' + profile.getName());
  console.log('Image URL: ' + profile.getImageUrl());
  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
}
</script>
</head>
<body>
아이디 = <%=id%> <br>
이름 = <%=name %> <br>
이미지 = <img src="<%=image %>"> <br>
토큰 = <%=token %>


<div class="g-signin2" data-onsuccess="onSignIn"></div>
<a href="index.jsp" onclick="signOut();">Sign out</a>
<script>
  function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }
</script>
</body>
</html>