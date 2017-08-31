<html>
<%@include file="../head.jsp" %>
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
                               href="#collapse1">Datos personales</a>
                        </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputName" class="control-label">Nombre</label>
                                        <input type="text" class="form-control" disabled id="inputName" name="name"
                                               value="<%= doctor.getName()%>" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputSurname" class="control-label">Apellidos</label>
                                        <input type="text" class="form-control" disabled id="inputSurname"
                                               name="surname" value="<%= doctor.getSurname()%>" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputGender" class="control-label">Género</label>
                                        <select class="form-control" disabled required name="gender" id="inputGender">
                                            <option <% if (doctor.getGender().equals("Masculino")) {
                                                out.println(" selected ");
                                            } %> >Masculino
                                            </option>
                                            <option <% if (doctor.getGender().equals("Femenino")) {
                                                out.println(" selected ");
                                            }%> >Femenino
                                            </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputSpeciality" class="control-label">Especialidad</label>
                                        <input type="text" class="form-control" id="inputSpeciality"
                                               value="<%= doctor.getSpeciality()%>" disabled="disabled">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputBoardNumber" class="control-label">Nº de colegiado</label>
                                        <input type="text" class="form-control" id="inputBoardNumber"
                                               value="<%= doctor.getBoardNumber()%>" disabled="disabled">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputDNI" class="control-label">DNI</label>
                                        <input type="text" class="form-control" disabled id="inputDNI" name="nif"
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
                               href="#collapse5">Datos de contacto</a>
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
                            <div class="panel-footer">*Campos obligatorios
                                <button type="submit" class="btn btn-primary btn-xs pull-right">Guardar cambios
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
                               href="#collapse4">Datos de acceso</a>
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
                                            <label for="inputEmail" class="control-label">Correo electrónico</label>
                                            <input type="email" class="form-control" id="inputEmail" name="email"
                                                   value="<%= doctor.getUserAccountID().getEmail()%>">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="inputOldPassword" class="control-label">Contraseña
                                                actual*</label>
                                            <input type="password" class="form-control" id="inputOldPassword"
                                                   name="oldPassword" placeholder="******">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="inputNewPassword" class="control-label">Actualizar
                                                contraseña</label>
                                            <input type="password" class="form-control" id="inputNewPassword"
                                                   name="newPassword" placeholder="******">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer">*Campos obligatorios
                                <button type="submit" class="btn btn-primary btn-xs pull-right">Guardar cambios
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
<%@include file="../footer.jsp" %>
</body>
</html>