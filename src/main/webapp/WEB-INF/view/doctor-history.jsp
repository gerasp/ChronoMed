
<div class="bordered-folder" id="history">

    <form class="form-vertical" method="POST" role="form" action="/FrontController">

        <h5 style="margin-left:10px; margin-bottom: 10px;" class="text-muted text-center"><i
                class="fa fa-question-circle"></i> Puede editar los campos clicando sobre ellos y luego haciendo
            click en "<fmt:message key="form.data.save"/>&nbsp;"</h5>
        <table class="table table-striped">
            <tbody>
            <tr>
                <td><strong><fmt:message key="history.bloodType"/></strong></td>
                <td><input required class="input-in-table" type="text" name="bloodType"
                           value="${patient.bloodType}%>"></td>
            </tr>
            <tr>
                <td><strong><fmt:message key="history.pathologies"/></strong></td>
                <td><textarea required rows="4" cols="50"
                              name="pathologies">${patient.pathologies}</textarea></td>
            </tr>
            <tr>
                <td><strong><fmt:message key="history.surgeries"/></strong></td>
                <td><textarea required rows="4" cols="50"
                              name="surgeries">${patient.surgeries}</textarea></td>
            </tr>
            <tr>
                <td><strong><fmt:message key="history.allergies"/></strong></td>
                <td><textarea required rows="4" cols="50"
                              name="allergies">${patient.allergies}</textarea></td>
            </tr>
            <tr>
                <td><strong><fmt:message key="history.familyHistory"/></strong></td>
                <td><textarea required rows="4" cols="50"
                              name="familyHistory">${patient.familyHistory}</textarea></td>
            </tr>
            <tr>
                <td><strong><fmt:message key="history.others"/></strong></td>
                <td><textarea required rows="4" cols="50"
                              name="others">${patient.others}</textarea></td>
            </tr>
            </tbody>
        </table>
        <div class="row" style="margin:10px;">
            <div class="col-md-6">
                <button class="btn btn-primary btn-block" onclick="window.print()"><fmt:message
                        key="action.export"/>&nbsp;<i class="fa  fa-print"></i>
                </button>
            </div>
            <div class="col-md-6">
                <button type="submit" class="btn btn-primary btn-block"><fmt:message key="form.data.save"/>&nbsp;
                    <i class="fa  fa-save"></i>
                </button>
            </div>
        </div>

    </form>
</div>