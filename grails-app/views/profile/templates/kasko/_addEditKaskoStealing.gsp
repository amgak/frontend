<table>
    <tr> <td colspan="2"> ${message(code: 'kasko.stealing')}</td> </tr>
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
            <g:textField name="kaskoDate"
                laceholder="${message(code:'date.placeholder')}"/><br/>
        </td>
        <td>
            ${message(code: 'kasko.stealing.illustration')}:<br/>
            <g:textField name="kaskoStealingIllustration"/><br/>
        </td>
    </tr>
    <tr>
        <td>
            ${message(code: 'kasko.stealing.protocol')}:<br/>
            <g:textField name="kaskoStealingProtocol"/><br/>
        </td>
        <td>
            ${message(code: 'kasko.stealing.explaination')}:<br/>
            <g:textField name="kaskoStealingExplaination"/><br/>
        </td>
    </tr>
    <tr>
        <td>
            ${message(code: 'kasko.stealing.court.decision')}:<br/>
            <g:textField name="kaskoStealingCourtDecision" /><br/>
        </td>

        <td>
            ${message(code: 'kasko.stealing.price.document')}:<br/>
            <g:textField name="kaskoStealingpriceDocument"/><br/>

        </td>
    </tr>
    <tr>
        <td>
            ${message(code: 'kasko.stealing.statement')}:<br/>
            <g:textField name="kaskoStealingStatement" /><br/>
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