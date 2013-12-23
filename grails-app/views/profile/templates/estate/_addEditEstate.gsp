<div saveEstate>
<table>
    <tr>
        <td>
            ${message(code: 'estate.name')}:<br/>
            <g:textField name="estateName"/><br/>
        </td>
        <td>
            ${message(code: 'estate.category')}:<br/>
            <g:textField name="estateCategory" /><br/>
        </td>
    </tr>
    <tr>
        <td>
            ${message(code: 'estate.square')}:<br/>
            <g:textField name="estateSquare" /><br/>
        </td>
        <td>
            ${message(code: 'estate.address')}:<br/>
            <g:textField name="estateAddress" /><br/>
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
</div>