<div class="modal fade" id="new-consultation-modal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <form:form modelAttribute="consultation" action="/doctor/patient/consultation/new">
                <table class="table table-striped">
                    <tbody>
                    <tr>
                        <td><strong><fmt:message key="consultation.date"/></strong></td>
                        <td><form:input type="date" required="required" path="date" class="input-in-table" /></td>
                    </tr>
                    <tr>
                        <td><strong><fmt:message key="consultation.symptoms"/></strong></td>
                        <td><form:textarea rows="3" cols="30" path="symptoms" class="input-in-table" /></td>
                    </tr>
                    <tr>
                        <td><strong><fmt:message key="consultation.examinations"/></strong></td>
                        <td><form:textarea rows="3" cols="30" path="examinations" class="input-in-table" /></td>
                    </tr>
                    <tr>
                        <td><strong><fmt:message key="consultation.treatment"/></strong></td>
                        <td><form:textarea rows="3" cols="30" path="treatment" class="input-in-table" /></td>
                    </tr>
                    <tr style="border-bottom: 1px solid gainsboro">
                        <td><strong><fmt:message key="consultation.recomendations"/></strong></td>
                        <td><form:textarea rows="3" cols="30" path="recomendations" class="input-in-table"/></td>
                    </tr>
                    </tbody>
                </table>
                <div class="row" style="margin:10px;">
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-primary btn-block"><fmt:message key="consultation.new"/>&nbsp;<i
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