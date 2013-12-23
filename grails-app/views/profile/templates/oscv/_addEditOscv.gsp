<div addOscv>
<table>
    <tr>
        <td>
            ${message(code: 'oscv.notification')}:<br/>
            <g:textField name="oscvNotification" /><br/>
        </td>
        <td>
            ${message(code: 'oscv.dtp.protocol')}:<br/>
            <g:textField name="oscvDtpProtocol" /><br/>
        </td>
    </tr>
    <tr>
        <td>
            ${message(code: 'oscv.dtp.schema')}:<br/>
            <g:textField name="oscvDtpSchema" /><br/>
        </td>
        <td>
            ${message(code: 'oscv.dtp.from.place')}:<br/>
            <g:textField name="oscvDtpFromPlace" /><br/>
        </td>
    </tr>
    <tr>
        <td>
            ${message(code: 'oscv.dtp.extended')}:<br/>
            <g:textField name="oscvDtpExtended" /><br/>
        </td>
        <td>
            ${message(code: 'oscv.court.decision')}:<br/>
            <g:textField name="oscvCourtDecision"/><br/>
        </td>
    </tr>
    <tr>
        <td>
            ${message(code: 'oscv.med')}:<br/>
            <g:textField name="oscvMed"/><br/>
        </td>
    </td>
        <td>
            ${message(code: 'oscv.explaination')}:<br/>
            <g:textField name="oscvExplaination"/><br/>
        </td>
    </tr>
    <tr>
        <td>
            ${message(code: 'oscv.statement')}:<br/>
            <g:textField name="oscvStatement"/><br/>
        </td>
    </td>
    </tr>
    <tr>
        <td>
            <input type="button" class="buttonBack" value="${message(code: 'back')}"/>
        </td>
        <td>
            <input type="button" class="buttonReg" value="${message(code: 'registration')}"/>
        </td>
    </tr>

</table>
</div>