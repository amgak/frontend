<%--
  Created by IntelliJ IDEA.
  User: amgak
  Date: 12/14/13
  Time: 1:00 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
  <title></title>
</head>
<body>

<script>

</script>
<label for="firstName">${message( code: 'firstName')}</label><br/>
<input id="firstName" name="firstName" placeholder="${message( code: 'firstName.placeholder')}"/><br/>


<label for="middleName">${message( code: 'middleName')}</label><br/>
<input id="middleName" name="middleName" placeholder="${message( code: 'middleName.placeholder')}"/><br/>

<label for="lastName">${message( code: 'lastName')}</label><br/>
<input id="lastName" name="lastName" placeholder="${message( code: 'lastName.placeholder')}"/><br/>

<label for="mobile">${message( code: 'mobile')}</label><br/>
<input id="mobile" name="mobile" placeholder="${message( code: 'mobile.placeholder')}"/><br/>

<label for="mail">${message( code: 'mail')}</label><br/>
<input id="mail" name="mail" placeholder="${message( code: 'mail.placeholder')}"/><br/>

<input type="button" value="${message( code: 'submit')}">

</body>
</html>