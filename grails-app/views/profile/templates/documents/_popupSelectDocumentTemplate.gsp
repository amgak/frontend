<script>
    var protectedDataControl = {};

    protectedDataControl.renderPopup = function (type) {
        $('.popupEditData #entitySection').empty();
        $.ajax({
            method: "POST",
            data: {
                type: type
            },
            url: "${createLink(controller: 'protectedData', action: "renderTemplate")}",
            success: function (res) {
                $('.popupCreateData #entitySection').html(res);
                loadJS();
                $('.popup-closeButton, .indexCloseButton, .popupOverlay').click(function () {
                    $('.popupCreateData').removeClass('active').stop().fadeOut(300);
                });
                switch (type) {
                    case "PASSPORT":
                        reBuildCusels('.countrySelect');
                        reBuildCusels('.passportTypeSelect');
                        break;
                    case "DRIVER_LICENSE":
                        reBuildCusels('.countrySelect');
                        reBuildCusels('.driverCategorySelect');
                        break;
                    case "INSURANCE":
                        reBuildCusels('.countrySelect');
                        reBuildCusels('.insuranceTypeSelect');
                        break;
                }
            }
        });
    };
</script>

<div class="popupContainer popupSelectDocumentData hidden">
    <div class="popupOverlay"></div>

    <div class="popupMini clear">
        <h2 class="popupMini-title"><g:message code='profile.docs.add'/></h2>

        <form class="popupMini-form" action="#" method="POST">
            <div class="fieldContainer">
                <label class="label"><g:message code='profile.docs.type'/></label>
                <select id="docTempateType" class="fieldSelect protectedDataTemplateSelect">
                    <option selected value="PASSPORT"><g:message code='profile.docs.passport'/></option>
                    <option value="DRIVER_LICENSE"><g:message code='profile.docs.driver.license'/></option>
                    <option value="INSURANCE"><g:message code='profile.docs.insurance'/></option>
                </select>
            </div>

            <div class="popupMini-buttonContainer">
                <input class="buttonCancel popup-closeButton" type="button"
                       value="${message(code: 'cancel')}"/>
                <input class="button" type="button"
                       onmousedown="protectedDataControl.renderPopup($('#docTempateType').val());"
                       value="${message(code: 'add')}" data-popup=".popupCreateData"/>
            </div>
        </form>

        <span class="indexCloseButton popup-closeButton" role="button" tabindex="1"></span>
    </div>
</div>