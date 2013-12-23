<%@ page import="myfrontend.Lang" %>
<script type="text/javascript">

    $(document).ready(function () {
        $('li.langList-item.${session.lang}').addClass("hidden"); //do not show language in drop down list if it is active now
    });


    $(document).on('click', '.signin', function (e) {
        $.ajax({
            method: "POST",
            data: {
            },
            url: "${createLink(controller: 'auth', action: "login")}",
            success: function (res) {
                $('.content').html(res);
            }
        });
    });


    $(document).on('click', '.signup', function (e) {
        $.ajax({
            method: "POST",
            data: {
            },
            url: "${createLink(controller: 'auth', action: "registration")}",
            success: function (res) {
                $('.content').html(res);
            }
        });
    });

</script>
<header class="head">
    <img class="head-logo" src="${resource(dir: 'css/images', file: 'logo.png')}" alt="U.b.i." height="50"/>

    <div class="head-user">
        <div class="head-platformLink">
            <a class="head-androidLink" href="http://android.com/" title="" target="_blank"></a>
            <a class="head-appleLink" href="http://apple.com/" title="" target="_blank"></a>
        </div>

        <g:link controller="auth" action="lang" params="[lang: 'ru', targetUri: targetUri]"><div
                class="head-user-lang ru"><g:message code="ru"/></div></g:link>
        <g:link controller="auth" action="lang" params="[lang: 'ua', targetUri: targetUri]"><div
                class="head-user-lang ua"><g:message code="ua"/></div></g:link>
        <g:link controller="auth" action="lang" params="[lang: 'en', targetUri: targetUri]"><div
                class="head-user-lang en"><g:message code="en"/></div></g:link>

        <div class="head-user-enter">
            <div class="head-user-link signin" title=""><g:message code="signin"/></div>
        </div>

        <div class="head-user-reg">
            <div class="head-user-link signup" title=""><g:message code="registration"/></div>
        </div>
    </div>
</header>