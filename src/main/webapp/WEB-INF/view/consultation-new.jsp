<div class="modal fade" id="new-consultation-modal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><i class="fa fa-plus-circle"></i> Añadir cita</h4>
            </div>
            <form:form modelAttribute="consultation" action="/doctor/patient/consultation/new">
                <table class="table table-striped">
                    <tbody>
                    <tr>
                        <td><strong><fmt:message key="consultation.symptoms"/></strong></td>
                        <td><form:textarea rows="4" cols="40" required="required" path="symptoms" class="input-in-table" />
                        </td>
                    </tr>
                    <tr>
                        <td><strong><fmt:message key="consultation.examinations"/></strong></td>
                        <td><form:textarea rows="4" cols="40" required="required" path="examinations" class="input-in-table" />
                        </td>
                    </tr>
                    <tr>
                        <td><strong><fmt:message key="consultation.treatment"/></strong></td>
                        <td><form:textarea rows="4" cols="40" required="required" path="treatment" class="input-in-table" />
                        </td>
                    </tr>
                    <tr>
                        <td><strong><fmt:message key="consultation.recomendations"/></strong></td>
                        <td><form:textarea rows="4" cols="40" required="required" path="recomendations" class="input-in-table"/></td>
                    </tr>
                    </tbody>
                </table>
                <div class="row" style="margin:10px;">
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-primary btn-block">A�adir cita <i
                                class="fa  fa-plus-circle"></i>
                        </button>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>

<script>
    $("#new-consultation-button").click(function () {
        $("#new-consultation-modal").modal("show")
    });
</script>