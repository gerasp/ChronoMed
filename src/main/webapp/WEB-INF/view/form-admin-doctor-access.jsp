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
    <div class="panel-footer">
        <div class="row">
            <div class="col-md-9">
                <h5><fmt:message key="form.requiredFields.some"/></h5>
            </div>
            <div class="col-md-3">
                <button type="submit" class="btn btn-primary btn-block"><fmt:message key="form.data.save"/>&nbsp;
                    <i class="fa  fa-save"></i>
                </button>
            </div>
        </div>
    </div>
</div>