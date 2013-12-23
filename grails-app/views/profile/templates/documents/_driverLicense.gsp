<script>
    $(document).off("click", ".addDriverLicense");
    $(document).on("click", ".addDriverLicense", function (e) {
        $.ajax({
            method: "POST",
            data: {
                countryId: $('.countrySelect input').val(),
                driverCategoryId: $('.driverCategorySelect input').val(),
                serial: $('input[name=serial]').val(),
                number: $('input[name=number]').val(),
                publisher: $('input[name=publisher]').val(),
                publishDateDay: $('input[name=publishDateDay]').val(),
                publishDateMonth: $('input[name=publishDateMonth]').val(),
                publishDateYear: $('input[name=publishDateYear]').val(),
                isEdit: ${isEdit},
                driverLicenseId: '${driverLicense?.id}'
            },
            url: "${createLink(controller: 'protectedData', action: "saveDriverLicense")}",
            success: function (res) {
                if (res.errors) {
                    for (var i = 0; i < res['errors'].length; i++) {
                        fieldError(res['errors'][i].field, "${message (code: 'incorrect.data')}")
                    }
                } else {
                    $('.driverLicense .indexCloseButton').trigger('click');
                    $('.docs.navLink').trigger('click');
                }
            }
        });
    });
</script>


<div class="popup driverLicense clear">
    <g:if test="${!isEdit}">
        <h2 class="popup-title"><g:message code='profile.docs.driver.license.add'/></h2>
    </g:if>
    <g:else>
        <h2 class="popup-title"><g:message code='profile.docs.driver.license.edit'/></h2>
    </g:else>
    <div class="fieldContainer">
        <label class="label"><g:message code='category'/></label>
        <select name="driverCategory" class="fieldSelect driverCategorySelect">
            <g:each in="${driverCategories}" var="driverCategory" status="indx">
                <option ${(driverLicense?.category?.id as Long).equals(driverCategory?.id) ? 'selected' : ''}
                        value="${driverCategory?.id}">${driverCategory?.name}</option>
            </g:each>
        </select>
    </div>

    <div class="fieldContainer">
        <label class="label"><g:message code='profile.docs.driver.license.country'/></label>
        <select name="country" class="fieldSelect countrySelect">
            <g:each in="${countries}" var="country" status="indx">
                <option ${(driverLicense?.country?.id as Long).equals(country?.id) ? 'selected' : ''}
                        value="${country?.id}">${country?.name}</option>
            </g:each>
        </select>
    </div>

    <div class="fieldContainer">
        <label for="serial" class="label"><g:message code='profile.docs.driver.license.series'/></label>
        <input name="serial" id="serial" class="field serial" maxlength="4" type="text"
               value="${driverLicense?.serial ?: ''}"/>
    </div>

    <div class="fieldContainer">
        <label for="number" class="label"><g:message code='profile.docs.driver.license.number'/></label>
        <input name="number" id="number" class="field number numbersOnly" maxlength="8" type="text"
               value="${driverLicense?.number ?: ''}"/>
    </div>

    <div class="fieldContainer">
        <label for="publisher" class="label"><g:message code='profile.docs.driver.license.issue'/></label>
        <input name="publisher" id="publisher" class="field publisher" maxlength="70" type="text"
               value="${driverLicense?.publisher ?: ''}"/>
    </div>

    <div class="fieldContainer">
        <label for="publishDate" class="label"><g:message code='profile.docs.driver.license.date'/></label>
        <span class="jsHint" role="button" tabindex="1" data-hint="data hint"></span>

        <div class="fieldDateContainer">
            <input name="publishDateDay" id="publishDate" class="field day field_date numbersOnly" type="text"
                   value="${driverLicense?.publishDate ? formatDate(date: driverLicense?.publishDate as Long, format: 'dd') : ''}"
                   maxlength="2" placeholder="<g:message code='dd'/>"/>
            <input name="publishDateMonth" class="field month field_date numbersOnly" type="text"
                   value="${driverLicense?.publishDate ? formatDate(date: driverLicense?.publishDate as Long, format: 'MM') : ''}"
                   maxlength="2"
                   placeholder="<g:message code='mm'/>"/>
            <input name="publishDateYear" class="field year field_date numbersOnly" type="text"
                   value="${driverLicense?.publishDate ? formatDate(date: driverLicense?.publishDate as Long, format: 'yyyy') : ''}"
                   maxlength="4"
                   placeholder="<g:message code='yyyy'/>"/>
        </div>

    </div>

    <div class="fieldContainer">
        <g:if test="${driverLicense?.attachments}">
            <g:each in="${driverLicense?.attachments}" var="attachment">
                <div class="docInfo-section-document">

                    <span class="docInfo-section-document-name">${attachment?.fileName}</span>

                    <span class="docInfo-deleteButton" role="button" tabindex="1"
                          onclick="deleteAttachment($(this), ${driverLicense?.id}, ${attachment?.id})"
                          role="button" tabindex="1">
                    </span>

                    <a href="${createLink(controller: 'protectedData', action: 'openAttachment', params: [attachmentId: attachment?.id, recordId: license?.id])}">
                        <span class="docInfo-openButton" role="button" tabindex="1"></span>
                    </a>
                        <span class="docInfo-downloadButton" role="button" tabindex="1" onclick="window.open(${createLink(controller: 'protectedData', action: 'downloadAttachment', params: [attachmentId: attachment?.id, recordId: license?.id])})"></span>
                    <span class="docInfo-shareButton" role="button" tabindex="1"></span>
                </div>
            </g:each>
        </g:if>
    </div>
    <g:form enctype="multipart/form-data" method="post" target="upload_iframe" name="uploadPhotoForm"
            id="uploadAttachmentForm" controller="protectedData"
            action="uploadAttachment">
        <div class="fieldContainer">
            <label class="label" for="passport_application"><g:message code="attachment"/></label>
            <span class="jq-file fieldFile" id="passport_application-styler">


                <div class="jq-file__browse"><g:message code="upload"/></div>
                <input type="file" placeholder="" name="myFile" value="" multiple class="attachment"
                       id="passport_application">
            </span>
            <input type="button" id="attachmentUploadButton" onclick="uploadAttachment(this.form);" hidden="hidden"/>
        </div>
    </g:form>

    <div class="popup-buttonContainer">
        <input class="buttonCancel" type="button" value="${message(code: 'cancel')}"
               onclick="$('.driverLicense .indexCloseButton').trigger('click');">
        <input class="button addDriverLicense" type="button" value="${message(code: 'save')}">
    </div>

    <span class="indexCloseButton popup-closeButton" role="button" tabindex="1"></span>
</div>