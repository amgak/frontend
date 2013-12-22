<%--
  Created by IntelliJ IDEA.
  User: amgak
  Date: 12/22/13
  Time: 1:21 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>
<body>
<a href="${createLink(controller: 'auth', action: 'login')}">${message( code: 'login')}</a>
<a href="${createLink(controller: 'auth', action: 'registration')}">${message( code: 'registration')}</a>
</body>
</html>