<script>
    function deleteInsurance(insuranceId) {
        $.ajax({
            method: "POST",
            data: {
                insuranceId: insuranceId
            },
            url: "${createLink(controller: 'protectedData', action: "deleteInsurance")}",
            success: function (res) {
                $('.popupCreateData #entitySection').empty();
                $('.popupEditData #entitySection').html(res);
                $('.popup-closeButton, .indexCloseButton, .popupOverlay').click(function () {
                    $('.popupEditData').removeClass('active').stop().fadeOut(300);

                });
            }
        });
        if( $('.insurance').find('.docInfo-section').size() - 1 == 0){
            $('.popup-closeButton').trigger('click');
            $('.docs.navLink').trigger('click');
        }
    }

    function goToEditTemplate(insuranceId) {
        $.ajax({
            method: "POST",
            data: {
                insuranceId: insuranceId
            },
            url: "${createLink(controller: 'protectedData', action: "editInsuranceTemplate")}",
            success: function (res) {
                $('.popupCreateData #entitySection').empty();
                $('.popupEditEntity #entitySection').html(res);
                $('.popup-closeButton, .indexCloseButton, .popupOverlay').click(function () {
                    $('.popupEditEntity').removeClass('active').stop().fadeOut(300);
                });
                reBuildCusels('.countrySelect');
                reBuildCusels('.insuranceTypeSelect');
            }
        });
    }
</script>

<div class="popup insurance clear">
    <h2 class="popup-title"><g:message code='profile.docs.insurances'/></h2>

    <form class="popup-form" action="#" method="">
        <g:each in="${insurances}" var="insurance">
            <section class="docInfo-section">
                <h3 class="docInfo-section-title">
                <p> ${insurance.publisher}  </p>
                <p>${insurance.type.title} </p>
                    <span class="widget-setting-block recordAccess" role="button" onclick="accessControl.getRecordGroupsWithAccess(this, '${insurance.id}');" tabindex="1"></span>
                    <g:render template="/profile/templates/access/recordAccessLockSelect" model="[recordId: insurance.id]"/>
                </h3>

                <div class="docInfo-section-desc">
                    <p><g:message code='profile.docs.insurance.country'/>: ${insurance.country.title} </p>
                    <p><g:message code='profile.docs.driver.license.seriesandnumber'/>: ${insurance.serial} ${insurance.number}</p>

                    <g:if test="${insurance.startDate}">
                        <p><g:message code='profile.docs.insurance.start.date'/>: <g:formatDate
                                date="${insurance.startDate as Long}" format="dd-MM-yyyy"/></p>
                    </g:if>
                    <g:if test="${insurance.endDate}">
                        <p><g:message code='profile.docs.insurance.end.date'/>: <g:formatDate
                                date="${insurance.endDate as Long}" format="dd-MM-yyyy"/></p>
                    </g:if>
                </div>

                <g:if test="${insurance.attachments}">
                    <g:each in="${insurance.attachments}" var="attachment">
                        <div class="docInfo-section-document">

                            <span class="docInfo-section-document-name">${(attachment.fileName.length() > 15) ? attachment.fileName.substring(0,13) + "..." : attachment.fileName}</span>

                            <span class="docInfo-deleteButton" role="button" tabindex="1"
                                  onclick="deleteAttachment($(this), ${insurance.id}, ${attachment.id})"
                                  role="button" tabindex="1">
                            </span>

                            <span class="docInfo-openButton" role="button" tabindex="1"></span>
                            <a href="${createLink(controller: 'protectedData', action: 'downloadAttachment', params: [attachmentId: attachment.id, recordId: insurance.id])}">
                                <span class="docInfo-downloadButton" role="button" tabindex="1"></span>
                            </a>
                            <span class="docInfo-shareButton" role="button" tabindex="1"></span>
                        </div>
                    </g:each>
                </g:if>
                <span class="docInfo-section-editButton" role="button" onmousedown="goToEditTemplate('${insurance.id}');" data-popup=".popupEditEntity" tabindex="1"><g:message code='change'/></span>
                <span class="docInfo-section-editButton" role="button" onclick="deleteInsurance('${insurance.id}');"
                      tabindex="1"><g:message code='delete'/></span>
            </section>
        </g:each>


        %{--<div class="popup-buttonContainer">--}%
            %{--<input class="buttonCancel" type="button" value="${message(code: 'cancel')}" onclick="$('.indexCloseButton.popup-closeButton').trigger('click');">--}%
        %{--</div>--}%
    </form>

    <span class="indexCloseButton popup-closeButton" role="button" tabindex="1"></span>
</div>