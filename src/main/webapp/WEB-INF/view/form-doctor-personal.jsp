<%@ page import="net.gerardomedina.chronomed.entity.User" %>
<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"
               href="#doctor-personal"><fmt:message key="form.data.personal"/></a>
        </h4>
    </div>
    <div id="doctor-personal" class="panel-collapse panel-open-first collapse">
        <div class="panel-footer">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group required">
                        <form:label path="name">
                            <fmt:message key="form.name"/>
                        </form:label>
                        <form:input path="name" required="required" cssClass="form-control"/>
                    </div>
                    <div class="form-group required">
                        <form:label path="surname">
                            <fmt:message key="form.surname"/>
                        </form:label>
                        <form:input path="surname" required="required" cssClass="form-control"/>
                    </div>
                    <div class="form-group required">
                        <form:label path="idCard">
                            <fmt:message key="form.idcard"/>
                        </form:label>
                        <form:input path="idCard" required="required" cssClass="form-control"/>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group required">
                        <form:label path="gender">
                            <fmt:message key="form.gender"/>
                        </form:label>
                        <form:select path="gender" required="required" cssClass="form-control">
                            <form:option value="male"><fmt:message key="form.gender.male"/></form:option>
                            <form:option value="female"><fmt:message key="form.gender.female"/></form:option>
                        </form:select>
                    </div>
                    <div class="form-group required">
                        <form:label path="speciality">
                            <fmt:message key="form.speciality"/>
                        </form:label>
                        <form:input path="speciality" required="required" cssClass="form-control"/>
                    </div>
                    <div class="form-group required">
                        <form:label path="boardNumber">
                            <fmt:message key="form.boardNumber"/>
                        </form:label>
                        <form:input path="boardNumber" required="required" cssClass="form-control"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<% if (((User) request.getSession().getAttribute("user")).getType() == User.Type.DOCTOR) { %>
<script>
    $("#doctor-personal").find(".panel-footer .row .col-md-6 .form-group select,input").attr("disabled","true");
</script>
<% } %>