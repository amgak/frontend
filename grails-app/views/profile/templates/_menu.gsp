<link rel="stylesheet" href="${resource(dir: 'css', file: 'menu.css')}">
<script type="text/javascript">
    $(document).on('click', '.menuCabinet', function () {
        $.ajax({
            method: "POST",
            data: {
            },
            url: "${createLink(controller: 'profile', action: "cabinet")}",
            success: function (res) {
                $('.content').html(res);
            }
        });
    });



</script>

<div id='cssmenu'>


    <ul>

        <li class='active menuCabinet'><a href='#'><span>кабинет</span></a></li>
        <li class='active'><a href='#'><span>мои договора</span></a></li>
        <li class='has-sub'><a href='#'><span>мое имущество</span></a>
            <ul>
                <li class='has-last'><a href='#'><span>мои автомобили</span></a> </li>
                <li class='has-last'><a href='#'><span>мои дома</span></a> </li>
            </ul>
        </li>
    <li class='has-sub'><a href='#'><span>мои страховые случаи</span></a>
        <ul>
            <li class='has-last'><a href='#'><span>мои страховые случаи КАСКО</span></a> </li>
            <li class='has-last'><a href='#'><span>мои страховые случаи ОСАГО</span></a> </li>
            <li class='has-last'><a href='#'><span>мои страховые случаи имущество</span></a> </li>
            <li class='has-last'><a href='#'><span>мои страховые случаи здооровье</span></a> </li>
        </ul>
    </li>
    <li class='has-sub'><a href='#'><span>уведомление о страховом событии</span></a></li>
    <li><a href='#'><span>О проекте</span></a></li>
    <li class='last'><a href='#'><span>Обратная связь</span></a></li>
        <li class='has-sub'><a href='#'><span>изменить язык</span></a>
            <ul>
                <li class='has-last'>
                    <g:link controller="auth" action="lang" params="[lang: 'ru']">
                        <g:message code="ru"/></g:link>
                </li>
                <li class='has-last'>
                    <g:link controller="auth" action="lang" params="[lang: 'ua']">
                        <g:message code="ua"/></g:link>
                </li>
                <li class='has-last'>
                    <g:link controller="auth" action="lang" params="[lang: 'en']">
                        <g:message code="en"/></g:link>
                </li>
            </ul>
        </li>
    </ul>
</div>




