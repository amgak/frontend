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
    %{--$(document).on('click', '.buttonReg', function (e) {--}%
        %{--$.ajax({--}%
            %{--method: "POST",--}%
            %{--data: {--}%
                %{--firstName: $('input[name=firstName]').val(),--}%
                %{--middleName: $('input[name=middleName]').val(),--}%
                %{--lastName: $('input[name=lastName]').val(),--}%
                %{--mail: $('input[name=mail]').val(),--}%
                %{--password: $('input[name=password]').val(),--}%
                %{--repeatPassword: $('input[name=repeatPassword]').val(),--}%
                %{--mobile: $('input[name=mobile]').val()--}%
            %{--},--}%
            %{--url: "${createLink(controller: 'auth', action: "register")}",--}%
            %{--success: function (res) {--}%
                %{--alert("success " + res);--}%

            %{--}--}%

        %{--});--}%
    %{--});--}%
</script>
<g:form controller="auth" action="register">
${message( code: 'firstName')}<br/>
<g:textField name="firstName" placeholder="${message( code: 'firstName.placeholder')}"/><br/>


${message( code: 'middleName')}<br/>
<g:textField name="middleName" placeholder="${message( code: 'middleName.placeholder')}"/><br/>

${message( code: 'lastName')}<br/>
<g:textField name="lastName" placeholder="${message( code: 'lastName.placeholder')}"/><br/>

${message( code: 'password')}<br/>
<g:textField name="password" type="password" placeholder="${message( code: 'mobile.placeholder')}"/><br/>


${message( code: 'repeatPassword')}<br/>
<g:textField name="repeatPassword" type="password" placeholder="${message( code: 'repeatPassword.placeholder')}"/><br/>


${message( code: 'mobile')}<br/>
<g:textField name="mobile" placeholder="${message( code: 'mobile.placeholder')}"/><br/>

${message( code: 'mail')}<br/>
<g:textField name="mail" placeholder="${message( code: 'mail.placeholder')}"/><br/>

<g:submitButton name="register" value="${message( code: 'submit')}"/>

    </g:form>

</body>
</html>