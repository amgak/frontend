<script>
    $(document).off("click", ".addPassport");
    $(document).on("click", ".addPassport", function (e) {
        $.ajax({
            method: "POST",
            data: {
                countryId: $('.countrySelect input').val(),
                passportTypeId: $('.passportTypeSelect input').val(),
                firstName: $('input[name=firstName]').val(),
                middleName: $('input[name=middleName]').val(),
                lastName: $('input[name=lastName]').val(),
                expireInDay: $('input[name=expireInDay]').val(),
                expireInMonth: $('input[name=expireInMonth]').val(),
                expireInYear: $('input[name=expireInYear]').val(),
                serial: $('input[name=serial]').val(),
                number: $('input[name=number]').val(),
                publisher: $('input[name=publisher]').val(),
                publishDateDay: $('input[name=publishDateDay]').val(),
                publishDateMonth: $('input[name=publishDateMonth]').val(),
                publishDateYear: $('input[name=publishDateYear]').val(),
                isEdit: ${isEdit},
                passportId: '${passport?.id}'
            },
            url: "${createLink(controller: 'protectedData', action: "savePassport")}",
            success: function (res) {
                if (res.errors) {
                    for (var i = 0; i < res['errors'].length; i++) {
                        fieldError(res['errors'][i].field, "${message (code: 'incorrect.data')}")
                    }
                } else {
                    $('.passport .indexCloseButton').trigger('click');
                    $('.docs.navLink').trigger('click');
                }
            }
        });
    });
</script>

<div class="popup passport clear">
    <form class="popup-form" action="#" method="">
        <g:if test="${!isEdit}">
            <h2 class="popup-title"><g:message code='profile.docs.passport.add'/></h2>
        </g:if>
        <g:else>
            <h2 class="popup-title"><g:message code='profile.docs.passport.edit'/></h2>
        </g:else>
        <form class="popup-form" action="#" method="">

            <div class="fieldContainer">
                <label class="label"><g:message code='profile.docs.passport.type'/></label>
                <select name="passportType" class="fieldSelect passportTypeSelect">
                    <g:each in="${passportTypes}" var="passportType" status="indx">
                        <option ${(passport?.type?.id as Long).equals(passportType?.id) ? 'selected' : ''}
                                value="${passportType?.id}">${passportType?.name}</option>
                    </g:each>
                </select>
            </div>

            <div class="fieldContainer">
                <label class="label"><g:message code='profile.docs.passport.country'/></label>
                <select name="country" class="fieldSelect countrySelect">
                    <g:each in="${countries}" var="country" status="indx">
                        <option ${(passport?.country?.id as Long).equals(country?.id) ? 'selected' : ''}
                                value="${country?.id}">${country?.name}</option>
                    </g:each>
                </select>
            </div>

            <div class="fieldContainer">
                <label for="lastName" class="label"><g:message code='profile.docs.passport.lastname'/></label>
                <input name="lastName" id="lastName" class="field lastName" type="text"
                       value="${passport?.lastName ?: ''}"/>
            </div>

            <div class="fieldContainer">
                <label for="firstName" class="label"><g:message code='profile.docs.passport.firstname'/></label>
                <input name="firstName" id="firstName" class="field firstName" type="text"
                       value="${passport?.firstName ?: ''}"/>
            </div>

            <div class="fieldContainer">
                <label for="middleName" class="label"><g:message code='profile.docs.passport.middlename'/></label>
                <input name="middleName" id="middleName" class="field middleName" type="text"
                       value="${passport?.middleName ?: ''}"/>
            </div>

            <div class="fieldContainer">
                <label for="publisher" class="label"><g:message code='profile.docs.passport.issue'/></label>
                <input name="publisher" id="publisher" class="field publisher" maxlength="70" type="text"
                       value="${passport?.publisher ?: ''}"/>
            </div>

            <div class="fieldContainer">
                <label for="serial" class="label"><g:message code='profile.docs.passport.series'/></label>
                <input name="serial" id="serial" class="field serial" type="text" maxlength="4"
                       value="${passport?.serial ?: ''}"/>
            </div>

            <div class="fieldContainer">
                <label for="number" class="label"><g:message code='profile.docs.passport.number'/></label>
                <input name="number" id="number" class="field number" type="text" maxlength="8"
                       value="${passport?.number ?: ''}"/>
            </div>


            <div class="fieldContainer">
                <label for="publishDate" class="label"><g:message code='profile.docs.passport.date'/></label>
                <span class="jsHint" role="button" tabindex="1" data-hint="data hint"></span>

                <div class="fieldDateContainer">
                    <input name="publishDateDay" id="publishDate" class="field day field_date numbersOnly" type="text"
                           value="${passport?.publishDate ? formatDate(date: passport?.publishDate as Long, format: 'dd') : ''}"
                           maxlength="2" placeholder="<g:message code='dd'/>"/>
                    <input name="publishDateMonth" class="field month field_date numbersOnly" type="text"
                           value="${passport?.publishDate ? formatDate(date: passport?.publishDate as Long, format: 'MM') : ''}"
                           maxlength="2"
                           placeholder="<g:message code="mm"/>"/>
                    <input name="publishDateYear" class="field year field_date numbersOnly" type="text"
                           value="${passport?.publishDate ? formatDate(date: passport?.publishDate as Long, format: 'yyyy') : ''}"
                           maxlength="4"
                           placeholder="<g:message code="yyyy"/>"/>
                </div>
            </div>

            <div class="fieldContainer">
                <label for="expireIn" class="label"><g:message code='profile.docs.passport.expired'/></label>
                <span class="jsHint" role="button" tabindex="1" data-hint="data hint"></span>

                <div class="fieldDateContainer">
                    <input name="expireInDay" id="expireIn" class="field day field_date numbersOnly" type="text"
                           value="${passport?.expireInDate ? formatDate(date: passport?.expireInDate as Long, format: 'dd') : ''}"
                           maxlength="2" placeholder="<g:message code="dd"/>"/>
                    <input name="expireInMonth" class="field month field_date numbersOnly" type="text"
                           value="${passport?.expireInDate ? formatDate(date: passport?.expireInDate as Long, format: 'MM') : ''}"
                           maxlength="2"
                           placeholder="<g:message code="mm"/>"/>
                    <input name="expireInYear" class="field year field_date numbersOnly" type="text"
                           value="${passport?.expireInDate ? formatDate(date: passport?.expireInDate as Long, format: 'yyyy') : ''}"
                           maxlength="4"
                           placeholder="<g:message code="yyyy"/>"/>
                </div>
            </div>

            <div class="fieldContainer">
                <g:if test="${passport?.attachments}">
                    <g:each in="${passport?.attachments}" var="attachment">
                        <div class="docInfo-section-document">

                            <span class="docInfo-section-document-name">${attachment?.fileName}</span>

                            <span class="docInfo-deleteButton" role="button" tabindex="1"
                                  onclick="deleteAttachment($(this), ${passport?.id}, ${attachment?.id})"
                                  role="button" tabindex="1">
                            </span>

                            <span class="docInfo-openButton" role="button" tabindex="1"></span>
                            <a href="${createLink(controller: 'protectedData', action: 'downloadAttachment', params: [attachmentId: attachment?.id, recordId: license?.id])}">
                                <span class="docInfo-downloadButton" role="button" tabindex="1"></span>
                            </a>
                            <span class="docInfo-shareButton" role="button" tabindex="1"></span>
                        </div>
                    </g:each>
                </g:if>
            </div>
        </form>


        <g:form enctype="multipart/form-data" method="post" target="upload_iframe" name="uploadPhotoForm"
                id="uploadAttachmentForm" controller="protectedData"
                action="uploadAttachment">
            <div class="fieldContainer">
                <label class="label" for="passport_application"><g:message code="attachment"/></label>
                <span class="jq-file fieldFile" id="passport_application-styler">


                    <div class="jq-file__browse"><g:message code="upload"/></div>
                    <input type="file" placeholder="" name="myFile" multiple value="" class="attachment"
                           id="passport_application">
                </span>
                <input type="button" id="attachmentUploadButton" onclick="uploadAttachment(this.form);"
                       hidden="hidden"/>
            </div>
        </g:form>

        `

        <div class="popup-buttonContainer">
            <input class="buttonCancel" type="button" value="${message(code: 'cancel')}"
                   onclick="$('.passport .indexCloseButton').trigger('click');">
            <input class="button addPassport" type="button" value="${message(code: 'save')}">
        </div>


        <span class="indexCloseButton popup-closeButton" role="button" tabindex="1"></span>
</div>