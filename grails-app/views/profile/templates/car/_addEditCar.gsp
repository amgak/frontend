
<div addEditCar>
    <table>
        <tr>
            <td>
                ${message(code: 'car.brend')}:<br/>
                <g:textField name="carBrend"/><br/>
            </td>
            <td>
                ${message(code: 'car.model')}:<br/>
                <g:textField name="carModel"/><br/>
            </td>
        </tr>
        <tr>
            <td>
                ${message(code: 'car.vin.code')}:<br/>
                <g:textField name="vin"/><br/>
            </td>
            <td>
                ${message(code: 'car.reg.number')}:<br/>
                <g:textField name="regNumber"/><br/>
            </td>
        </tr>
        <tr>
            <td>
                ${message(code: 'car.year')}:<br/>
                <g:textField name="carYear"/><br/>
            </td>
            <td>
                ${message(code: 'car.certificate')}:<br/>
                <g:textField name="carSertificate"/><br/>

            </td>

        <tr>
            <td>
                <input type="button" class="buttonBack" value="${message(code: 'back')}"/>
            </td>
        </td>
            <td>
                <input type="button" class="buttonSaveCar" value="${message(code: 'save')}"/>
            </td>
        </tr>

    </table>
</div>