<script>
    $(document).off("click", ".addInsurance");
    $(document).on("click", ".addInsurance", function (e) {
        $.ajax({
            method: "POST",
            data: {
                countryId: $('.countrySelect input').val(),
                insuranceTypeId: $('.insuranceTypeSelect input').val(),
                beginDay: $('input[name=beginDay]').val(),
                beginMonth: $('input[name=beginMonth]').val(),
                beginYear: $('input[name=beginYear]').val(),
                endDay: $('input[name=endDay]').val(),
                endMonth: $('input[name=endMonth]').val(),
                endYear: $('input[name=endYear]').val(),
                serial: $('input[name=serial]').val(),
                number: $('input[name=number]').val(),
                publisher: $('input[name=publisher]').val(),
                isEdit: ${isEdit},
                insuranceId: '${insurance?.id}'
            },
            url: "${createLink(controller: 'protectedData', action: "saveInsurance")}",
            success: function (res) {
                if (res.errors) {
                    for (var i = 0; i < res['errors'].length; i++) {
                        fieldError(res['errors'][i].field, "${message (code: 'incorrect.data')}")
                    }
                } else {
                    $('.insurance .indexCloseButton').trigger('click');
                    $('.docs.navLink').trigger('click');
                }
            }
        });
    });
</script>


<div class="popup insurance clear">
    <form class="popup-form" action="#" method="">
        <g:if test="${!isEdit}">
            <h2 class="popup-title"><g:message code='profile.docs.insurance.add'/></h2>
        </g:if>
        <g:else>
            <h2 class="popup-title"><g:message code='profile.docs.insurance.edit'/></h2>
        </g:else>

        <div class="fieldContainer">
            <label class="label"><g:message code='profile.docs.insurance.type'/></label>
            <select name="insuranceType" class="fieldSelect insuranceTypeSelect">
                <g:each in="${insuranceTypes}" var="insuranceType" status="indx">
                    <option ${(insurance?.type?.id as Long).equals(insuranceType?.id) ? 'selected' : ''}
                            value="${insuranceType?.id}">${insuranceType?.name}</option>
                </g:each>
            </select>
        </div>

        <div class="fieldContainer">
            <label class="label"><g:message code='profile.docs.insurance.country'/></label>
            <select name="country" class="fieldSelect countrySelect">
                <g:each in="${countries}" var="country" status="indx">
                    <option ${(insurance?.country?.id as Long).equals(country?.id) ? 'selected' : ''}
                            value="${country?.id}">${country?.name}</option>
                </g:each>
            </select>
        </div>

        <div class="fieldContainer">
            <label for="begin-day" class="label"><g:message code='profile.docs.insurance.start.date'/></label>
            <span class="jsHint" role="button" tabindex="1" data-hint="data hint"></span>

            <div class="fieldDateContainer">
                <input name="beginDay" id="begin-day" class="field day field_date numbersOnly" type="text"
                       value="${insurance?.startDate ? formatDate(date: insurance?.startDate as Long, format: 'dd') : ''}"
                       maxlength="2" placeholder="<g:message code='dd'/>"/>
                <input name="beginMonth" class="field month field_date numbersOnly" type="text"
                       value="${insurance?.startDate ? formatDate(date: insurance?.startDate as Long, format: 'MM') : ''}"
                       maxlength="2"
                       placeholder="<g:message code='mm'/>"/>
                <input name="beginYear" class="field year field_date numbersOnly" type="text"
                       value="${insurance?.startDate ? formatDate(date: insurance?.startDate as Long, format: 'yyyy') : ''}"
                       maxlength="4"
                       placeholder="<g:message code='yyyy'/>"/>
            </div>
        </div>

        <div class="fieldContainer">
            <label for="end-date" class="label"><g:message code='profile.docs.insurance.end.date'/></label>
            <span class="jsHint" role="button" tabindex="1" data-hint="data hint"></span>

            <div class="fieldDateContainer">
                <input name="endDay" id="end-date" class="field day field_date numbersOnly" type="text"
                       value="${insurance?.endDate ? formatDate(date: insurance?.endDate as Long, format: 'dd') : ''}"
                       maxlength="2" placeholder="<g:message code='dd'/>"/>
                <input name="endMonth" class="field month field_date numbersOnly" type="text"
                       value="${insurance?.endDate ? formatDate(date: insurance?.endDate as Long, format: 'MM') : ''}"
                       maxlength="2"
                       placeholder="<g:message code='mm'/>"/>
                <input name="endYear" class="field year field_date numbersOnly" type="text"
                       value="${insurance?.endDate ? formatDate(date: insurance?.endDate as Long, format: 'yyyy') : ''}"
                       maxlength="4"
                       placeholder="<g:message code='yyyy'/>"/>
            </div>
        </div>

        <div class="fieldContainer">
            <label for="serial" class="label"><g:message code='profile.docs.insurance.series'/></label>
            <input name="serial" id="serial" class="field serial" maxlength="4" type="text"
                   value="${insurance?.serial ?: ''}"/>
        </div>

        <div class="fieldContainer">
            <label for="number" class="label"><g:message code='profile.docs.insurance.number'/></label>
            <input name="number" id="number" class="field number numbersOnly" maxlength="8" type="text"
                   value="${insurance?.number ?: ''}"/>
        </div>

        <div class="fieldContainer">
            <label for="publisher" class="label"><g:message code='profile.docs.insurance.issue'/></label>
            <input name="publisher" id="publisher" class="field publisher" maxlength="70" type="text"
                   value="${insurance?.publisher ?: ''}"/>
        </div>

        <div class="fieldContainer">
            <g:if test="${insurance?.attachments}">
                <g:each in="${insurance?.attachments}" var="attachment">
                    <div class="docInfo-section-document">

                        <span class="docInfo-section-document-name">${attachment?.fileName}</span>

                        <span class="docInfo-deleteButton" role="button" tabindex="1"
                              onclick="deleteAttachment($(this), ${insurance?.id}, ${attachment?.id})"
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
                       id="passport_application"/>
            </span>
            <input type="button" id="attachmentUploadButton" onclick="uploadAttachment(this.form);"
                   hidden="hidden"/>
        </div>
    </g:form>

    <div class="popup-buttonContainer">
        <input class="buttonCancel" type="button" value="${message(code: 'cancel')}"
               onclick="$('.insurance .indexCloseButton').trigger('click');">
        <input class="button addInsurance" type="button" value="${message(code: 'save')}">
    </div>


    <span class="indexCloseButton popup-closeButton" role="button" tabindex="1"></span>
</div>