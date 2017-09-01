<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@page import="data.entities.Doctor" %>
<%@page import="data.facades.DoctorFacade" %>
<%@page import="data.facades.FacadeFactory" %>
<%@include file="/header.jsp" %>
<body class="body-background">

<%@include file="navigation.jsp" %>
<%
    DoctorFacade doctorFacade = FacadeFactory.getFacade("DoctorFacade");
    Doctor doctor = doctorFacade.find(Integer.parseInt(request.getParameter("id")));
%>
<div class="container">
    <div class="row">
        <div class="col-md-12 ">
            <div class="signin-form-container">
                <div class="row">
                    <div class="col-md-2">
                        <a href="/manager/doctormanagement.jsp" class="btn btn-block btn-lg btn-link "><i
                                class="fa  fa-arrow-circle-left"></i>&nbsp<fmt:message key="form.back" /></a>
                    </div>
                    <div class="col-md-8">
                        <h1 class="form-title text-center">Dr<% if (doctor.getGender().equals("Femenino")) {
                            out.println("a");
                        }%>. <%= doctor.getSurname()%>
                        </h1>
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                               href="#collapse1"><fmt:message key="form.data.personal" /></a>
                        </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse collapse">
                        <form style="margin:0px;" class="form-vertical" method="POST" role="form"
                              action="/FrontController">
                            <input type="hidden" value="EditDoctorContactDataCommand" name="command">
                            <input type="hidden" value="<%= doctor.getId()%>" name="id">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="inputName" class="control-label"><fmt:message key="form.name" />*</label>
                                            <input type="text" required name="name" class="form-control" id="inputName"
                                                   value="<%= doctor.getName()%>">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputSurname" class="control-label"><fmt:message key="form.surname" />*</label>
                                            <input type="text" required name="surname" class="form-control"
                                                   id="inputSurname" value="<%= doctor.getSurname()%>">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputNif" class="control-label"><fmt:message key="form.idcard" />*</label>
                                            <input type="text" required name="nif" class="form-control" id="inputNif"
                                                   value="<%= doctor.getNif()%>">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputGender" class="control-label"><fmt:message key="form.gender" />*</label>
                                            <select class="form-control" required name="gender" id="inputGender">
                                                <option <% if (doctor.getGender().equals("Masculino")) {
                                                    out.println(" selected ");
                                                } %> ><fmt:message key="form.gender.male" />
                                                </option>
                                                <option <% if (doctor.getGender().equals("Femenino")) {
                                                    out.println(" selected ");
                                                }%> ><fmt:message key="form.gender.female" />
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="inputSpeciality" class="control-label"><fmt:message key="form.speciality" />*</label>
                                            <input type="text" required name="speciality" class="form-control"
                                                   id="inputSpeciality" value="<%= doctor.getSpeciality()%>">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputBoardNumber" class="control-label"><fmt:message key="form.boardNumber" />*</label>
                                            <input type="number" required name="boardNumber" class="form-control"
                                                   id="inputBoardNumber" value="<%= doctor.getBoardNumber()%>">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPhoneNumber" class="control-label"><fmt:message key="form.phoneNumber.main" />*</label>
                                            <input type="text" required name="phoneNumber" class="form-control"
                                                   id="inputPhoneNumber" value="<%= doctor.getPhoneNumber()%>">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputAlternativePhoneNumber" class="control-label"><fmt:message key="form.phoneNumber.alternative" />.alternative</label>
                                            <input type="text" name="alternativePhoneNumber" class="form-control"
                                                   id="inputAlternativePhoneNumber"
                                                   value="<%= doctor.getAlternativePhoneNumber()%>">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-md-9">
                                        <h5>
                                            *<fmt:message key="form.requiredFields.some" />
                                        </h5>
                                    </div>
                                    <div class="col-md-3">
                                        <button type="submit" class="btn btn-primary btn-block"><fmt:message key="form.data.save" />&nbsp;
                                            <i class="fa  fa-save"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                               href="#collapse2"><fmt:message key="form.data.access" /></a>
                        </h4>
                    </div>
                    <div id="collapse2" class="panel-collapse collapse">
                        <form style="margin:0px;" class="form-vertical" method="POST" role="form"
                              action="/FrontController">
                            <input type="hidden" value="EditDoctorUserAccountCommand" name="command">
                            <input type="hidden" value="<%= doctor.getId()%>" name="id">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="inputEmail" class="control-label"><fmt:message key="form.email" />*</label>
                                            <input type="email" required name="email" class="form-control"
                                                   id="inputEmail" value="<%= doctor.getUserAccountID().getEmail()%>">
                                        </div>
                                        <div class="form-group">
                                            <label for="inputActivation" class="control-label"><fmt:message key="form.active" /></label>
                                            <br>
                                            <input type="checkbox" value="<% if (doctor.getUserAccountID().getActive()) {
                                                            out.print("on");
                                                        } %> " name="isActivated"
                                                <% if (doctor.getUserAccountID().getActive()) {
                                                                   out.print("checked");
                                                               }%>
                                                   data-toggle="toggle" id="inputActivation" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-md-9">
                                        <h5>
                                            *<fmt:message key="form.requiredFields.some" />
                                        </h5>
                                    </div>
                                    <div class="col-md-3">
                                        <button type="submit" class="btn btn-primary btn-block"><fmt:message key="form.data.save" />&nbsp;
                                            <i class="fa  fa-save"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="/footer.jsp" %>
</body>
</html>