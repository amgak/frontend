<div class="widget generalUserInfo">
    <h2 class="widget-title"><g:message code="user.info"/></h2>
    <dl class="generalUserInfo-list">
        <g:if test="${userInfo.firstName}">
            <dt class="generalUserInfo-list-key"><g:message code="firstName"/></dt>
            <dd class="generalUserInfo-list-value">${userInfo.firstName}</dd>
        </g:if>
        <g:if test="${userInfo.middleName}">
            <dt class="generalUserInfo-list-key"><g:message code="middleName"/></dt>
            <dd class="generalUserInfo-list-value">${userInfo.middleName}</dd>
        </g:if>
        <g:if test="${userInfo.lastName}">
            <dt class="generalUserInfo-list-key"><g:message code="lastName"/></dt>
            <dd class="generalUserInfo-list-value">${userInfo.lastName}</dd>
        </g:if>
        <g:if test="${userInfo.mail}">
            <dt class="generalUserInfo-list-key"><g:message code="mail"/></dt>
            <dd class="generalUserInfo-list-value">${userInfo.mobile}</dd>
        </g:if>
        <g:if test="${userInfo.mobile}">
            <dt class="generalUserInfo-list-key"><g:message code="mobile"/></dt>
            <dd class="generalUserInfo-list-value">${userInfo.mobile}</dd>
        </g:if>
    </dl>

    <div class="widget-setting">
        <span class="widget-setting-options" data-popup=".generalUserInfoSettings" role="button" tabindex="1"></span>
        <span class="widget-setting-block" role="button" tabindex="1"></span>
    </div>
</div>