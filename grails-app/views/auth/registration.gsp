<%--
  Created by IntelliJ IDEA.
  User: amgak
  Date: 12/14/13
  Time: 1:00 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<g:setProvider library="jquery"/>
<html>
  <title></title>
    <g:javascript library='jquery' />
<link rel="stylesheet" href="${resource(dir: 'css', file: 'common.css')}">
    <r:layoutResources/>
</head>
<body>

<script>
    $(document).on('click', '.buttonReg', function (e) {
        $.ajax({
            method: "POST",
            data: {
                firstName: $('input[name=firstName]').val(),
                middleName: $('input[name=middleName]').val(),
                lastName: $('input[name=lastName]').val(),
                mail: $('input[name=mail]').val(),
                password: $('input[name=password]').val(),
                repeatPassword: $('input[name=repeatPassword]').val(),
                mobile: $('input[name=mobile]').val()
            },
            url: "${createLink(controller: 'auth', action: "register")}",
            success: function (res) {
                for (var i = 0; i < res['errors'].length; i++) {
                    fieldError(res['errors'][i].field, "${message(code: 'incorrect.data')}");
                }
            }
        });
    });

    function fieldError(field_name, desc){
        var $this = $('.field[name='+ field_name +']').length > 0 ? $('.field[name='+ field_name +']') : $('input[name='+ field_name +']');
        if ($this.length < 1 || $this.next().is('.fieldError')) {
            return;
        } else {
            var $container = $this.closest('.active');
            var	position_left = $this.position().left;
            var	position_top = $this.position().top;

            $this.after('<div class="fieldError fieldError_'+ field_name +'" style="top: '+ position_top +'px; left: '+ position_left +'px;">'+ desc +'</div>');

            $this.focus(function(){
                $('.fieldError_'+ field_name).remove();
                $this.off('focus');
            });
        }
    }

</script>
    ${message( code: 'login')}<br/>
    <g:textField name="login" placeholder="${message( code: 'login.placeholder')}"/><br/>


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

<input type="button" value="buttonReg" class="buttonReg"/>
</body>
</html>