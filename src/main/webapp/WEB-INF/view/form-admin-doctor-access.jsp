<div class="panel panel-primary">
    <div class="panel-body">
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <form:label path="userByUserAccountId.email" cssClass="control-label">
                        <fmt:message key="form.email"/>
                    </form:label>
                    <form:input path="userByUserAccountId.email" cssClass="form-control"/>
                </div>
                <div class="form-group">
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
    <div class="panel-footer"><fmt:message key="form.requiredFields.all"/></div>
</div>