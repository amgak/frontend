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
    <g:javascript library='jquery'/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'common.css')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'addons.css')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'red.css')}">
    <r:layoutResources/>
    <script>
        $(document).on('click', '.signin', function (e) {
            $.ajax({
                method: "POST",
                data: {
                },
                url: "${createLink(controller: 'auth', action: "login")}",
                success: function (res) {
                    for (var i = 0; i < res['errors'].length; i++) {
                        fieldError(res['errors'][i].field, "${message(code: 'incorrect.data')}");
                    }
                }
            });
        });


    </script>
</head>

<body>
<g:render template="templates/header"/>
<g:render template="../profile/templates/menu"/>

<div class="content">
</div>
</body>
</html>