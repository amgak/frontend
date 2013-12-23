<script>
    function deleteDriverLicense(driverLicenseId) {
        $.ajax({
            method: "POST",
            data: {
                driverLicenseId: driverLicenseId
            },
            url: "${createLink(controller: 'protectedData', action: "deleteDriverLicense")}",
            success: function (res) {
                $('.popupEditData #entitySection').html(res);
                $('.popup-closeButton, .indexCloseButton, .popupOverlay').click(function () {
                    $('.popupEditData').removeClass('active').stop().fadeOut(300);

                });
            }
        });
        if( $('.driverLicense').find('.docInfo-section').size() - 1 == 0){
            $('.popup-closeButton').trigger('click');
            $('.docs.navLink').trigger('click');
        }
    }

    function goToEditTemplate(driverLicenseId) {
        $('.popupCreateData #entitySection').empty();
        $.ajax({
            method: "POST",
            data: {
                driverLicenseId: driverLicenseId
            },
            url: "${createLink(controller: 'protectedData', action: "editDriverLicenseTemplate")}",
            success: function (res) {
                $('.popupEditEntity #entitySection').html(res);
                $('.popup-closeButton, .indexCloseButton, .popupOverlay').click(function () {
                    $('.popupEditEntity').removeClass('active').stop().fadeOut(300);
                });
                reBuildCusels('.countrySelect');
                reBuildCusels('.driverCategorySelect');
            }
        });
    }
</script>

<div class="popup driverLicense clear">
    <h2 class="popup-title"><g:message code='profile.docs.driver.license'/></h2>

    <form class="popup-form" action="#" method="">
        <g:each in="${driverLicenses}" var="license">
            <section class="docInfo-section">
                <h3 class="docInfo-section-title">
                    <p class="widget-nameObject"><g:message code='profile.docs.driver.license'/></p>

                    <p><g:message code='category'/>: ${license.category.title}</p>

                </h3>

                <div class="docInfo-section-desc">
                    <li class="userObject-list-item"><g:message
                            code='profile.docs.driver.license.country'/>: ${license?.country?.title}</li>
                    <li class="userObject-list-item"><g:message
                            code='profile.docs.driver.license.seriesandnumber'/>: ${license?.serial} ${license?.number}</li>
                    <g:if test="${license.publisher}">
                        <li class="userObject-list-item"><g:message
                                code='profile.docs.driver.license.issue'/>: ${license.publisher}</li>
                    </g:if>
                    <g:if test="${license.publishDate}">
                        <li class="userObject-list-item"><g:message
                                code='profile.docs.driver.license.date'/>: <g:formatDate
                                date="${license.publishDate as Long}" format="dd-MM-yyyy"/></li>
                    </g:if>
                </div>

                <g:if test="${license.attachments}">
                    <g:each in="${license.attachments}" var="attachment">
                        <div class="docInfo-section-document">

                            <span class="docInfo-section-document-name">${(attachment.fileName.length() > 15) ? attachment.fileName.substring(0,13) + "..." : attachment.fileName}</span>

                            <span class="docInfo-deleteButton" role="button" tabindex="1"
                                  onclick="deleteAttachment($(this), ${license.id}, ${attachment.id})"
                                  role="button" tabindex="1">
                            </span>

                            <span class="docInfo-openButton" role="button" tabindex="1"></span>
                            <a href="${createLink(controller: 'protectedData', action: 'downloadAttachment', params: [attachmentId: attachment.id, recordId: license.id])}">
                                <span class="docInfo-downloadButton" role="button" tabindex="1"></span>
                            </a>
                            <span class="docInfo-shareButton" role="button" tabindex="1"></span>
                        </div>
                    </g:each>
                </g:if>
                <span class="docInfo-section-editButton" role="button" onmousedown="goToEditTemplate('${license.id}');"
                      data-popup=".popupEditEntity" tabindex="1"><g:message code='change'/></span>
                <span class="docInfo-section-editButton" role="button" onclick="deleteDriverLicense('${license.id}');"
                      tabindex="1"><g:message code='delete'/></span>
            </section>
        </g:each>


        %{--<div class="popup-buttonContainer">--}%
            %{--<input class="buttonCancel" type="button" value="${message(code: 'cancel')}"--}%
                   %{--onclick="$('.indexCloseButton.popup-closeButton').trigger('click');">--}%
        %{--</div>--}%
    </form>

    <span class="indexCloseButton popup-closeButton" role="button" tabindex="1"></span>
</div>