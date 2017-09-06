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
                <% switch (((User) request.getSession().getAttribute("user")).getType()) {
                    case ADMIN: %>
                <div class="col-md-10">
                    <div class="form-group required">
                        <form:label path="email">
                            <fmt:message key="form.email"/>
                        </form:label>
                        <form:input path="email" required="required" cssClass="form-control"/>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="form-group text-right">
                        <form:label path="active">
                            <fmt:message key="form.active"/>
                        </form:label>
                        <br>
                        <form:checkbox required="required" path="active" cssClass="form-control"
                                       data-toggle="toggle" id="inputActivation"/>
                    </div>
                </div>
                <% break;
                    case DOCTOR:
                    case PATIENT: %>
                <div class="col-md-12">
                    <div class="form-group required">
                        <form:label path="email">
                            <fmt:message key="form.email"/>
                        </form:label>
                        <form:input path="email" required="required" cssClass="form-control"/>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group required">
                        <label for="inputOldPassword" class="control-label"><fmt:message
                                key="form.oldPassword"/></label>
                        <input type="password" class="form-control" required="required"
                               id="inputOldPassword" name="oldPassword"
                               placeholder="******">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="inputNewPassword" class="control-label"><fmt:message
                                key="form.newPassword"/></label>
                        <input type="password" class="form-control" id="inputNewPassword" name="newPassword"
                               placeholder="******">
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</div>