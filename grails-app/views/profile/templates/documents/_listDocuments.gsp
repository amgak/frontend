<div listDocuments>
    <h2> ${message(code: 'my.documents')} </div> </h2>

<script>
    var editProtectedDataControl = {};

    editProtectedDataControl.renderListEntitiesForEditTemplate = function (type) {
        $.ajax({
            method: "POST",
            data: {
                type: type
            },
            url: "${createLink(controller: 'protectedData', action: "renderTemplateForEditEntities")}",
            success: function (res) {
                $('.popupCreateData #entitySection').empty();
                $('.popupEditData #entitySection').html(res);
                $('.popup-closeButton, .indexCloseButton, .popupOverlay').click(function () {
                    $('.popupEditData').removeClass('active').stop().fadeOut(300);
                });
            }
        });
    };
</script>


<span class="button smaller buttonAddInfo" role="button" tabindex="1"
      onmousedown="refreshCusels('.protectedDataTemplateSelect')" data-popup=".popupSelectDocumentData"><g:message
        code='add'/></span>

<div class="infoBlockOverlay clear">
    <g:if test="${!passports.isEmpty()}">
        <div class="widget userClinic">
            <h2 class="widget-title"><g:message code='profile.docs.passports'/></h2>
            <g:each in="${passports}" var="passport">
                <section class="widget-objectSection">
                    <p class="widget-nameObject">${passport.type.title} № ${passport.serial}${passport.number}</p>

                    <ul class="userObject-list">
                        <li class="userObject-list-item"><g:message
                                code='fio'/>: ${passport.firstName} ${passport.middleName} ${passport.lastName}</li>
                        <li class="userObject-list-item"><g:message
                                code='profile.country'/>: ${passport.country.title} </li>
                        <li class="userObject-list-item"><g:message
                                code='profile.docs.passport.issue'/>: ${passport.publisher}</li>
                        <li class="userObject-list-item"><g:message code='profile.docs.passport.date'/>: <g:formatDate
                                date="${passport.publishDate as Long}" format="dd-MM-yyyy"/></li>

                        <g:if test="${passport.expireInDate}">
                            <li class="userObject-list-item"><g:message
                                    code='profile.docs.passport.expired'/>: <g:formatDate
                                    date="${passport.expireInDate as Long}" format="dd-MM-yyyy"/></li>
                        </g:if>
                    </ul>

                    <g:if test="${passport.attachments}">
                        <g:each in="${passport.attachments}" var="attachment">
                            <div class="docInfo-section-document">

                                <span class="docInfo-section-document-name">${(attachment.fileName.length() > 15) ? attachment.fileName.substring(0,13) + "..." : attachment.fileName}</span>

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

                </section>
            </g:each>

            <div class="widget-setting">
                <span class="widget-setting-options"
                      onmousedown="editProtectedDataControl.renderListEntitiesForEditTemplate('PASSPORT');"
                      data-popup=".popupEditData" role="button" tabindex="1"></span>
                <span class="widget-setting-block recordTypeAccess"
                      onclick="accessControl.getRecordTypeGroupsWithAccess(this, 1)" role="button" tabindex="1"></span>
                <g:render template="/profile/templates/access/recordTypeAccessLockSelect" model="[recordTypeId: 1]"/>
            </div>
        </div>
    </g:if>
    <g:if test="${!driverLicenses.isEmpty()}">
        <div class="widget userClinic">
            <h2 class="widget-title"><g:message code='profile.docs.driver.license'/></h2>
            <g:each in="${driverLicenses}" var="license">
                <section class="widget-objectSection">
                    <p class="widget-nameObject"><g:message code='profile.docs.driver.license'/></p>

                    <p><g:message code='category'/>: ${license.category.title}</p>
                    <ul class="userObject-list">

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

                    </ul>

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
                </section>
            </g:each>

            <div class="widget-setting">
                <span class="widget-setting-options"
                      onmousedown="editProtectedDataControl.renderListEntitiesForEditTemplate('DRIVER_LICENSE');"
                      data-popup=".popupEditData" role="button" tabindex="1"></span>
                <span class="widget-setting-block recordTypeAccess"
                      onclick="accessControl.getRecordTypeGroupsWithAccess(this, 6)" role="button" tabindex="1"></span>
                <g:render template="/profile/templates/access/recordTypeAccessLockSelect" model="[recordTypeId: 6]"/>
            </div>
        </div>
    </g:if>
    <g:if test="${!insurances.isEmpty()}">
        <div class="widget userClinic">
            <h2 class="widget-title"><g:message code='profile.docs.insurances'/></h2>
            <g:each in="${insurances}" var="insurance">
                <section class="widget-objectSection">
                    <p class="widget-nameObject">${insurance.publisher} <br>
                        ${insurance.type.title}</p>
                    <ul class="userObject-list">
                        <li class="userObject-list-item"><g:message
                                code='profile.docs.insurance.country'/>: ${insurance.country.title}</li>

                        <li class="userObject-list-item"><g:message
                                code='profile.docs.driver.license.seriesandnumber'/>: ${insurance.serial} ${insurance.number}</li>

                        <g:if test="${insurance.startDate}">
                            <li class="userObject-list-item"><g:message
                                    code='profile.docs.insurance.start.date'/>: <g:formatDate
                                    date="${insurance.startDate as Long}" format="dd-MM-yyyy"/></li>
                        </g:if>
                        <g:if test="${insurance.endDate}">
                            <li class="userObject-list-item"><g:message
                                    code='profile.docs.insurance.end.date'/>: <g:formatDate
                                    date="${insurance.endDate as Long}" format="dd-MM-yyyy"/></li>
                        </g:if>
                    </ul>

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
                </section>
            </g:each>

            <div class="widget-setting">
                <span class="widget-setting-options"
                      onmousedown="editProtectedDataControl.renderListEntitiesForEditTemplate('INSURANCE');"
                      data-popup=".popupEditData" role="button" tabindex="1"></span>
                <span class="widget-setting-block recordTypeAccess"
                      onclick="accessControl.getRecordTypeGroupsWithAccess(this, 9)" role="button" tabindex="1"></span>
                <g:render template="/profile/templates/access/recordTypeAccessLockSelect" model="[recordTypeId: 9]"/>
            </div>
        </div>
    </g:if>
</div>




</div>