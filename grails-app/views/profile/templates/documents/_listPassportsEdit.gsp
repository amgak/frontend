<script>
    function deletePassport(passportId) {
        $.ajax({
            method: "POST",
            data: {
                passportId: passportId
            },
            url: "${createLink(controller: 'protectedData', action: "deletePassport")}",
            success: function (res) {
                $('.popupCreateData #entitySection').empty();
                $('.popupEditData #entitySection').html(res);
                $('.popup-closeButton, .indexCloseButton, .popupOverlay').click(function () {
                    $('.popupEditData').removeClass('active').stop().fadeOut(300);
                });

            }
        });
        if( $('.passport').find('.docInfo-section').size() - 1 == 0){
            $('.popup-closeButton').trigger('click');
            $('.docs.navLink').trigger('click');
        }
    }


    function goToEditTemplate(passportId) {
        $.ajax({
            method: "POST",
            data: {
                passportId: passportId
            },
            url: "${createLink(controller: 'protectedData', action: "editPassportTemplate")}",
            success: function (res) {
                $('.popupCreateData #entitySection').empty();
                $('.popupEditEntity #entitySection').html(res);
                $('.popup-closeButton, .indexCloseButton, .popupOverlay').click(function () {
                    $('.popupEditEntity').removeClass('active').stop().fadeOut(300);
                });
                reBuildCusels('.countrySelect');
                reBuildCusels('.passportTypeSelect');
            }
        });
    }

    function deleteAttachment(elem, recordId, attachmentId) {
        $.ajax({
            method: "POST",
            data: {
                recordId: recordId,
                attachmentId: attachmentId

            },
            url: "${createLink(controller: 'protectedData', action: 'deleteAttachment')}",
            success: function () {
                elem.parent('.docInfo-section-document').hide();
            }
        });
    }

</script>

<div class="popup passport clear">
    <h2 class="popup-title"><g:message code='profile.docs.passports'/></h2>

    <form class="popup-form" action="#" method="">
        <g:each in="${passports}" var="passport">
            <section class="docInfo-section">
                <h3 class="docInfo-section-title">
                    <p class="widget-nameObject">${passport.type.title} № ${passport.serial}${passport.number}</p>
                    <span class="widget-setting-block recordAccess" role="button"
                          onclick="accessControl.getRecordGroupsWithAccess(this, '${passport.id}');"
                          tabindex="1"></span>
                    <g:render template="/profile/templates/access/recordAccessLockSelect" model="[recordId: passport.id]"/>
                </h3>

                <div class="docInfo-section-desc">
                    <p><g:message code='fio'/>: ${passport.firstName} ${passport.middleName} ${passport.lastName}</p>
                    <p><g:message code='profile.country'/>: ${passport.country.title} </p>
                    <p><g:message
                            code='profile.docs.passport.issue'/>: ${passport.country.title}, ${passport.publisher}</p>

                    <p><g:message code='profile.docs.passport.date'/>: <g:formatDate
                            date="${passport.publishDate as Long}" format="dd-MM-yyyy"/></p>

                    <g:if test="${passport.expireInDate}">
                        <p><g:message code='profile.docs.passport.expired'/>: <g:formatDate
                                date="${passport.expireInDate as Long}" format="dd-MM-yyyy"/></p>
                    </g:if>
                </div>

                <g:if test="${passport.attachments}">
                    <g:each in="${passport.attachments}" var="attachment">
                        <div class="docInfo-section-document">

                            <span class="docInfo-section-document-name">${ (attachment.fileName.length() > 20) ? attachment.fileName.substring(0,18) + "..." : attachment.fileName}</span>

                            <span class="docInfo-deleteButton" role="button" tabindex="1"
                                  onclick="deleteAttachment($(this), ${passport.id}, ${attachment.id})"
                                  role="button" tabindex="1">
                            </span>

                            <span class="docInfo-openButton" role="button" tabindex="1"></span>
                            <a href="${createLink(controller: 'protectedData', action: 'downloadAttachment', params: [attachmentId: attachment.id, recordId: passport.id])}">
                                <span class="docInfo-downloadButton" role="button" tabindex="1"></span>
                            </a>
                            <span class="docInfo-shareButton" role="button" tabindex="1"></span>
                        </div>
                    </g:each>
                </g:if>
                <span class="docInfo-section-editButton" role="button" onmousedown="goToEditTemplate('${passport.id}');"
                      data-popup=".popupEditEntity" tabindex="1"><g:message code='change'/></span>
                <span class="docInfo-section-editButton" role="button" onclick="deletePassport('${passport.id}');"
                      tabindex="1"><g:message code='delete'/></span>
            </section>
        </g:each>


    %{--<div class="popup-buttonContainer">--}%
    %{--<input class="buttonCancel" type="button" value="${message(code: 'cancel')}" onclick="$('.indexCloseButton.popup-closeButton').trigger('click');">--}%
    %{--</div>--}%
    </form>

    <span class="indexCloseButton popup-closeButton" role="button" tabindex="1"></span>
</div>