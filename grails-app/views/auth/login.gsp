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
    <g:javascript library='jquery' />
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'common.css')}">
    <r:layoutResources/>
</head>

<body>

<script>
    $(document).on('click', '.buttonLogin', function (e) {
        $.ajax({
            method: "POST",
            data: {
                login: $('input[name=login]').val(),
                password: $('input[name=password]').val()
            },
            url: "${createLink(controller: 'auth', action: "doLogin")}",
            success: function (res) {
                console.log(res);
                if(res['errors']){
                    console.log(res['errors']);
                    for (var i = 0; i < res['errors'].length; i++) {
                        fieldError(res['errors'][i].field, "${message(code: 'incorrect.data')}");
                    }
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


    ${message( code: 'password')}<br/>
    <g:textField name="password" type="password" placeholder="${message( code: 'password.placeholder')}"/><br/>

    <input type="button" class="buttonLogin" value="${message( code: 'submit')}"/>


</body>
</html>