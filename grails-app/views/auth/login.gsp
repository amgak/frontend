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
<g:form controller="auth" action="dologin">
    ${message( code: 'login')}<br/>
    <g:textField name="login" placeholder="${message( code: 'login.placeholder')}"/><br/>


    ${message( code: 'password')}<br/>
    <g:textField name="password" type="password" placeholder="${message( code: 'password.placeholder')}"/><br/>

    <g:submitButton name="sign in" value="${message( code: 'submit')}"/>

</g:form>

</body>
</html>