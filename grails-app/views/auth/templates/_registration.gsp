<script>
    $(document).on('click', '.buttonReg', function (e) {
        $.ajax({
            method: "POST",
            data: {
                login: $('input[name=login]').val(),
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

    function fieldError(field_name, desc) {
        var $this = $('.field[name=' + field_name + ']').length > 0 ? $('.field[name=' + field_name + ']') : $('input[name=' + field_name + ']');
        if ($this.length < 1 || $this.next().is('.fieldError')) {
            return;
        } else {
            var $container = $this.closest('.active');
            var position_left = $this.position().left;
            var position_top = $this.position().top;

            $this.after('<div class="fieldError fieldError_' + field_name + '" style="top: ' + position_top + 'px; left: ' + position_left + 'px;">' + desc + '</div>');

            $this.focus(function () {
                $('.fieldError_' + field_name).remove();
                $this.off('focus');
            });
        }
    }

</script>

<table>
    <tr>
        <td>
            ${message(code: 'login')}:<br/>
            <g:textField name="login" placeholder="${message(code: 'login.placeholder')}"/><br/>
        </td>
        <td>
            ${message(code: 'password')}:<br/>
            <g:textField name="password" type="password" placeholder="${message(code: 'mobile.placeholder')}"/><br/>

        </td>
    </tr>
    <tr>

        <td>
            ${message(code: 'firstName')}:<br/>
            <g:textField name="firstName" placeholder="${message(code: 'firstName.placeholder')}"/><br/>
        </td>
        <td>
            ${message(code: 'repeatPassword')}:<br/>
            <g:textField name="repeatPassword" type="password"
                         placeholder="${message(code: 'repeatPassword.placeholder')}"/><br/>
        </td>
    </tr>
    <tr>
        <td>
            ${message(code: 'middleName')}:<br/>
            <g:textField name="middleName" placeholder="${message(code: 'middleName.placeholder')}"/><br/>
        </td>
        <td>
            ${message(code: 'mobile')}:<br/>
            <g:textField name="mobile" placeholder="${message(code: 'mobile.placeholder')}"/><br/>

        </td>
    </tr>
    <tr>
        <td>
            ${message(code: 'lastName')}:<br/>
            <g:textField name="lastName" placeholder="${message(code: 'lastName.placeholder')}"/><br/>
        </td>
    </td>
        <td>
            ${message(code: 'mail')}:<br/>
            <g:textField name="mail" placeholder="${message(code: 'mail.placeholder')}"/><br/>
        </td>
    </tr>
    <tr>
        <td>
            <input type="button" class="buttonBack" value="${message(code: 'back')}"/>
        </td>
    </td>
        <td>
            <input type="button" class="buttonReg" value="${message(code: 'registration')}"/>
        </td>
    </tr>

</table>