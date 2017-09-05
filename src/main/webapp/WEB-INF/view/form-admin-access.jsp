<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
               href="#access"><fmt:message key="form.data.access"/></a>
        </h4>
    </div>
    <div id="access" class="panel-collapse collapse">
        <div class="panel-footer">
            <div class="row">
                <div class="col-md-10">
                    <div class="form-group required">
                        <form:label path="userByUserAccountId.email" cssClass="control-label">
                            <fmt:message key="form.email"/>
                        </form:label>
                        <form:input path="userByUserAccountId.email" cssClass="form-control"/>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group text-right">
                        <form:label path="userByUserAccountId.active" cssClass="control-label">
                            <fmt:message key="form.active"/>
                        </form:label>
                        <br>
                        <form:checkbox path="userByUserAccountId.active" cssClass="form-control"
                                       data-toggle="toggle" id="inputActivation"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>