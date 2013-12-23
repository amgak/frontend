<table>
    <tr> <td colspan="2"> ${message(code: 'kasko.damage')}</td> </tr>
    <tr>
        <td>
            ${message(code: 'kasko.contract')}:<br/>
            <g:textField name="kaskoDamageContract" /><br/>
        </td>
        <td>
            ${message(code: 'kasko.name')}:<br/>
            <g:textField name="kaskoDamageName" /><br/>
        </td>
    </tr>
    <tr>

        <td>
            ${message(code: 'kasko.date')}:<br/>
            <g:textField name="kaskoDate" placeholder="${message(code:'date.placeholder')}"/><br/>
        </td>
        <td>
            ${message(code: 'kasko.damage.notification')}:<br/>
            <g:textField name="kaskoDamageNotification"/><br/>
        </td>
    </tr>
    <tr>
        <td>
            ${message(code: 'kasko.damage.dtp.protocol')}:<br/>
            <g:textField name="kaskoDamageDtpProtocol"/><br/>
        </td>
        <td>
            ${message(code: 'kasko.damage.dtp.schema')}:<br/>
            <g:textField name="kaskoDamageDtpSchema"/><br/>
        </td>
    </tr>
    <tr>
        <td>
            ${message(code: 'kasko.damage.dtp.from.place')}:<br/>
            <g:textField name="kaskoDamageDtpFromPlace" /><br/>
        </td>

        <td>
            ${message(code: 'kasko.damage.dtp.extended')}:<br/>
            <g:textField name="kaskoDamageDtpExtended"/><br/>

        </td>
    </tr>
    <tr>
        <td>
            ${message(code: 'kasko.damage.court.decision')}:<br/>
            <g:textField name="kaskoDamageCourtDecision" /><br/>
        </td>

        <td>
            ${message(code: 'kasko.damage.med')}:<br/>
            <g:textField name="kaskoDamageMed"/><br/>
        </td>
    </tr>
    <tr>
        <td>
            ${message(code: 'kasko.damage.explaination')}:<br/>
            <g:textField name="kaskoDamageExplaination" /><br/>
        </td>

        <td>
            ${message(code: 'kasko.damage.statement')}:<br/>
            <g:textField name="kaskoDamageStatement"/><br/>
        </td>
    </tr>
    <tr>
        <td>
            <input type="button" class="buttonBack" value="${message(code: 'back')}"/>
        </td>
        <td>
            <input type="button" class="buttonReg" value="${message(code: 'save')}"/>
        </td>
    </tr>

</table>