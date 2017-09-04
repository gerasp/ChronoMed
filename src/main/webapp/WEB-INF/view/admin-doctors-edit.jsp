<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
               href="#collapse1"><fmt:message key="form.data.personal"/></a>
        </h4>
    </div>
    <div id="collapse1" class="panel-collapse collapse">
        <form:form action="login" modelAttribute="doctor" cssClass="form-vertical">
            <form:errors path="" element="div" cssClass="col-md-12 alert alert-danger text-center"/>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group required">
                            <form:label path="name" cssClass="control-label">
                                <fmt:message key="form.name"/>
                            </form:label>
                            <form:input path="name" cssClass="form-control"/>
                        </div>
                        <div class="form-group required">
                            <form:label path="surname" cssClass="control-label">
                                <fmt:message key="form.surname"/>
                            </form:label>
                            <form:input path="surname" cssClass="form-control"/>
                        </div>
                        <div class="form-group required">
                            <form:label path="idCard" cssClass="control-label">
                                <fmt:message key="form.idcard"/>
                            </form:label>
                            <form:input path="idCard" cssClass="form-control"/>
                        </div>
                        <div class="form-group required">
                                <%--<label for="inputGender" class="control-label"><fmt:message key="form.gender"/></label>--%>
                                <%--<select class="form-control" required name="gender" id="inputGender">--%>
                                <%--<option <% if (doctor.getGender().equals("Masculino")) {--%>
                                <%--out.println(" selected ");--%>
                                <%--} %> ><fmt:message key="form.gender.male"/>--%>
                                <%--</option>--%>
                                <%--<option <% if (doctor.getGender().equals("Femenino")) {--%>
                                <%--out.println(" selected ");--%>
                                <%--}%> ><fmt:message key="form.gender.female"/>--%>
                                <%--</option>--%>
                                <%--</select>--%>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group required">
                            <form:label path="speciality" cssClass="control-label">
                                <fmt:message key="form.speciality"/>
                            </form:label>
                            <form:input path="speciality" cssClass="form-control"/>
                        </div>
                        <div class="form-group required">
                            <form:label path="boardNumber" cssClass="control-label">
                                <fmt:message key="form.boardNumber"/>
                            </form:label>
                            <form:input path="boardNumber" cssClass="form-control"/>
                        </div>
                        <div class="form-group required">
                            <form:label path="phoneNumber" cssClass="control-label">
                                <fmt:message key="form.phoneNumber.main"/>
                            </form:label>
                            <form:input path="phoneNumber" cssClass="form-control"/>
                        </div>
                        <div class="form-group required">
                            <form:label path="alternativePhoneNumber" cssClass="control-label">
                                <fmt:message key="form.phoneNumber.alternative"/>
                            </form:label>
                            <form:input path="alternativePhoneNumber" cssClass="form-control"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-footer">
                <div class="row">
                    <div class="col-md-9">
                        <h5>
                            <fmt:message key="form.requiredFields.some"/>
                        </h5>
                    </div>
                    <div class="col-md-3">
                        <form:button class="btn btn-primary btn-block">
                            <fmt:message key="form.data.save"/>&nbsp;<i class="fa fa-save"></i>
                        </form:button>
                    </div>
                </div>
            </div>
        </form:form>

    </div>
</div>
<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
               href="#collapse2"><fmt:message key="form.data.access"/></a>
        </h4>
    </div>
    <div id="collapse2" class="panel-collapse collapse">
        <form:form action="login" modelAttribute="doctor" cssClass="form-vertical">
            <form:errors path="" element="div" cssClass="col-md-12 alert alert-danger text-center"/>
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
            <div class="panel-footer">
                <div class="row">
                    <div class="col-md-9">
                        <h5>
                            <fmt:message key="form.requiredFields.some"/>
                        </h5>
                    </div>
                    <div class="col-md-3">
                        <button type="submit" class="btn btn-primary btn-block"><fmt:message key="form.data.save"/>&nbsp;
                            <i class="fa  fa-save"></i>
                        </button>
                    </div>
                </div>
            </div>
        </form:form>
    </div>
</div>
