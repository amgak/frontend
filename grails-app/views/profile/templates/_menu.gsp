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

<div id="menu">
    <ul>
        <li class="menuCabinet"><g:message code="cabinet"/></li>
    </ul>
    <ul>
        <li class="menuCabinet"><g:message code="cabinet"/></li>
    </ul>
    <ul>
        <li class="menuCabinet"><g:message code="cabinet"/></li>
    </ul>
    <ul>
        <li class="menuCabinet"><g:message code="cabinet"/></li>
    </ul>
    <ul>
        <li class="menuCabinet"><g:message code="cabinet"/></li>
    </ul>
    <ul>
        <li class="menuCabinet"><g:message code="cabinet"/></li>
    </ul>
    <ul>
        <li class="menuCabinet"><g:message code="cabinet"/></li>
    </ul>

</div>