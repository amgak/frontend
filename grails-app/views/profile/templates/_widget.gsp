<div class="widget generalUserInfo">
    <h2 class="widget-title"><g:message code="profile.user.info.popup.title"/></h2>
    <dl class="generalUserInfo-list">
        <g:if test="${mainUserInfo.firstName}">
            <dt class="generalUserInfo-list-key"><g:message code="name"/></dt>
            <dd class="generalUserInfo-list-value">${mainUserInfo.firstName}</dd>
        </g:if>
        <g:if test="${mainUserInfo.lastName}">
            <dt class="generalUserInfo-list-key"><g:message code="surname"/></dt>
            <dd class="generalUserInfo-list-value">${mainUserInfo.lastName}</dd>
        </g:if>
        <g:if test="${mainUserInfo.age}">
            <dt class="generalUserInfo-list-key"><g:message code="age"/></dt>
            <dd class="generalUserInfo-list-value">${mainUserInfo.age}</dd>
        </g:if>
        <g:if test="${mainUserInfo.birthDate}">
            <dt class="generalUserInfo-list-key"><g:message code="birthday"/></dt>
            <dd class="generalUserInfo-list-value"><g:formatDate date="${mainUserInfo.birthDate as Long}"
                                                                 format="dd-MM-yyyy"/></dd>
        </g:if>
        <g:if test="${mainUserInfo.sex}">
            <dt class="generalUserInfo-list-key"><g:message code="sex"/></dt>
            <dd class="generalUserInfo-list-value">${mainUserInfo.sexVal}</dd>
        </g:if>
        <g:if test="${mainUserInfo.religion}">
            <dt class="generalUserInfo-list-key"><g:message code="profile.user.info.popup.religion"/></dt>
            <dd class="generalUserInfo-list-value">${mainUserInfo.religionVal}</dd>
        </g:if>
        <g:if test="${mainUserInfo.familyStatus}">
            <dt class="generalUserInfo-list-key"><g:message code="profile.user.info.popup.family.status"/></dt>
            <dd class="generalUserInfo-list-value">${mainUserInfo.familyStatusVal}</dd>
        </g:if>
        <g:if test="${mainUserInfo.language}">
            <dt class="generalUserInfo-list-key"><g:message code="profile.user.info.popup.language"/></dt>
            <dd class="generalUserInfo-list-value">${mainUserInfo.languageVal}</dd>
        </g:if>
    </dl>

    <div class="widget-setting">
        <span class="widget-setting-options" data-popup=".generalUserInfoSettings" role="button" tabindex="1"></span>
    </div>
</div>