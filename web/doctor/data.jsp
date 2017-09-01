<%@include file="/header.jsp" %>
<body class="body-background">
<div class="container">
    <div class="row">
        <%@include file="navigation.jsp" %>
        <div class="col-md-9">
            <div class="signin-form-container">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                               href="#collapse1"><fmt:message key="form.data.personal" /></a>
                        </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputName" class="control-label"><fmt:message key="form.name" /></label>
                                        <input type="text" class="form-control" disabled id="inputName" name="name"
                                               value="<%= doctor.getName()%>" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputSurname" class="control-label"><fmt:message key="form.surname" /></label>
                                        <input type="text" class="form-control" disabled id="inputSurname"
                                               name="surname" value="<%= doctor.getSurname()%>" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputGender" class="control-label">Género</label>
                                        <select class="form-control" disabled required name="gender" id="inputGender">
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
                                        <label for="inputSpeciality" class="control-label"><fmt:message key="form.speciality" /></label>
                                        <input type="text" class="form-control" id="inputSpeciality"
                                               value="<%= doctor.getSpeciality()%>" disabled="disabled">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputBoardNumber" class="control-label">Nº de colegiado</label>
                                        <input type="text" class="form-control" id="inputBoardNumber"
                                               value="<%= doctor.getBoardNumber()%>" disabled="disabled">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputIdcard" class="control-label"><fmt:message key="form.idcard" /></label>
                                        <input type="text" class="form-control" disabled id="inputIdcard" name="nif"
                                               value="<%= doctor.getNif()%>" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">Para modificar estos datos, contacte con el administrativo de su
                            centro
                            asignado.
                        </div>
                    </div>
                </div>

                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                               href="#collapse5"><fmt:message key="form.data.contact" /></a>
                        </h4>
                    </div>
                    <div id="collapse5" class="panel-collapse collapse">
                        <form style="margin:0px;" class="form-vertical" method="POST" role="form"
                              action="/FrontController">
                            <input type="hidden" value="EditDoctorMyContactDataCommand" name="command">
                            <input type="hidden" value="<%= doctor.getId()%>" name="id">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="inputALternativePhoneNumber" class="control-label">Teléfono
                                                personal</label>
                                            <input type="tel" class="form-control" id="inputAlternativePhoneNumber"
                                                   name="alternativePhoneNumber"
                                                   value="<%= doctor.getAlternativePhoneNumber()%>">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="inputPhoneNumber" class="control-label">Teléfono de
                                                consulta</label>
                                            <input type="tel" class="form-control" id="inputPhoneNumber"
                                                   name="phoneNumber" value="<%= doctor.getPhoneNumber()%>">
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer">*<fmt:message key="form.requiredFields.some" />
                                <button type="submit" class="btn btn-primary btn-xs pull-right"><fmt:message key="form.data.save" />
                                    <i class="fa  fa-save"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                               href="#collapse4"><fmt:message key="form.data.access" /></a>
                        </h4>
                    </div>
                    <div id="collapse4" class="panel-collapse collapse">
                        <form style="margin:0px;" class="form-vertical" method="POST" role="form"
                              action="/FrontController">
                            <input type="hidden" value="EditDoctorMyCredentialsCommand" name="command">
                            <input type="hidden" value="<%= doctor.getId()%>" name="id">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="inputEmail" class="control-label"><fmt:message key="form.email" /></label>
                                            <input type="email" class="form-control" id="inputEmail" name="email" value="<%= doctor.getUserAccountID().getEmail()%>">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="inputOldPassword" class="control-label"><fmt:message key="form.password.old" />*</label>
                                            <input type="password" class="form-control" id="inputOldPassword" name="oldPassword" placeholder="******">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="inputNewPassword" class="control-label"><fmt:message key="form.password.new" /></label>
                                            <input type="password" class="form-control" id="inputNewPassword" name="newPassword" placeholder="******">
                                        </div>
                                    </div>
                                </div>
                            </div>v>
                            </div>
                            <div class="panel-footer">*<fmt:message key="form.requiredFields.some" />
                                <button type="submit" class="btn btn-primary btn-xs pull-right"><fmt:message key="form.data.save" />
                                    <i class="fa  fa-save"></i>
                                </button>
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