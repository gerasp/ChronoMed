<%@page import="data.entities.DoctorPatient"%>
<%@page import="data.entities.Healthcard"%>
<%@page import="data.facades.DoctorPatientFacade"%>
<%@page import="data.facades.FacadeFactory"%>
<%@page import="data.facades.HealthcardFacade"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<html>
    <%@include file="../head.jsp" %>        
    <body class="body-background">

        <div class="container">
            <div class="row">
                <%@include file="navigation.jsp" %>
                <%
                    DoctorPatientFacade doctorPatientFacade = FacadeFactory.getFacade("DoctorPatientFacade");
                    HealthcardFacade healthcardFacade = FacadeFactory.getFacade("HealthcardFacade");
                    List<DoctorPatient> doctorPatientList = doctorPatientFacade.findByPatient(patient);
                    List<Healthcard> healthcardList = healthcardFacade.findByPatient(patient);

                %>
                <div class="col-md-9">
                    <div class="signin-form-container">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse1">Datos personales</a>
                                </h4>
                            </div>
                            <div id="collapse1" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="inputName" class="control-label">Nombre</label>
                                                <input type="text" class="form-control" disabled id="inputName" name="name" value="<%= patient.getName()%>" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputSurname" class="control-label">Apellidos</label>
                                                <input type="text" class="form-control" disabled id="inputSurname" name="surname" value="<%= patient.getSurname()%>" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputDNI" class="control-label">DNI</label>
                                                <input type="text" class="form-control" disabled id="inputDNI" name="nif" value="<%= patient.getNif()%>" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="inputBirthDate" class="control-label">Fecha de nacimiento</label>
                                                <input type="date" class="form-control" disabled id="inputBirthDate" name="birthdate" 
                                                       value="<%= new SimpleDateFormat("yyyy-MM-dd").format(patient.getBirthDate())%>"
                                                       required>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputGender" class="control-label">G�nero</label>
                                                <select class="form-control" disabled  required name="gender" id="inputGender">
                                                    <option <% if (patient.getGender().equals("Masculino")) {
                                                            out.println(" selected ");
                                                        } %> >Masculino</option>
                                                    <option <% if (patient.getGender().equals("Femenino")) {
                                                            out.println(" selected ");
                                                        }%> >Femenino</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputNationality" class="control-label">Nacionalidad</label>
                                                <input type="text" class="form-control" disabled id="inputNationality" name="nationality" value="<%= patient.getNationality()%>" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-footer">Para modificar estos datos, contacte con el administrativo de su centro
                                    asignado.</div>
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse2">Tarjetas sanitarias</a>
                                </h4>
                            </div>
                            <div id="collapse2" class="panel-collapse collapse">
                                <form style="margin:0px;" class="form-vertical" method="POST" role="form" action="/ChronoMed/FrontController">
                                    <input type="hidden" value="AssociateHealthcardsCommand" name="command">
                                    <input type="hidden" value="<%= patient.getId()%>" name="id">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <ul class="list-unstyled" id="healthCards">
                                                        <%
                                                            for (Healthcard hc : healthcardList) {
                                                        %>
                                                        <li class='health-card-item'> 
                                                            <input value="<%=hc.getNumber()%>" name='healthCardsList' style='border:0; background:none;' readonly> 
                                                        </li>
                                                        <%
                                                            }
                                                        %>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div class="panel-footer">Para modificar estos datos, contacte con el administrativo de su centro
                                    asignado.</div>
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse3">Datos de contacto</a>
                                </h4>
                            </div>
                            <div id="collapse3" class="panel-collapse collapse">
                                <form style="margin:0px;" class="form-vertical" method="POST" role="form" action="/ChronoMed/FrontController">
                                    <input type="hidden" value="EditPatientMyContactDataCommand" name="command">
                                    <input type="hidden" value="<%= patient.getId()%>" name="id">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="inputAddress" class="control-label">Direcci�n*</label>
                                                    <input type="text" class="form-control" id="inputAddress" name="address" value="<%= patient.getAddress()%>" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="inputLocality" class="control-label" contenteditable="true">Localidad*</label>
                                                    <input type="text" class="form-control" id="inputLocality" name="locality" value="<%= patient.getLocality()%>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputZipcode" class="control-label">C�digo postal*</label>
                                                    <input type="text" class="form-control" id="inputZipcode" name="zipCode" value="<%= patient.getZipCode()%>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputProvince" class="control-label">Provincia*</label>
                                                    <input type="text" class="form-control" id="inputProvince" name="province" value="<%= patient.getProvince()%>" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="inputCountry" class="control-label" contenteditable="true">Pa�s*</label>
                                                    <input type="text" class="form-control" id="inputCountry" name="country" value="<%= patient.getCountry()%>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputPhoneNumber" class="control-label">Tel�fono principal*</label>
                                                    <input type="tel" class="form-control" id="inputPhoneNumber" name="phoneNumber" value="<%= patient.getPhoneNumber()%>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputAlternativePhoneNumber" class="control-label">Tel�fono alternativo</label>
                                                    <input type="tel" class="form-control" id="inputAlternativePhoneNumber" name="alternativePhoneNumber" value="<%= patient.getAlternativePhoneNumber()%>">
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
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse4">Datos de acceso</a>
                                </h4>
                            </div>
                            <div id="collapse4" class="panel-collapse collapse">
                                <form style="margin:0px;" class="form-vertical" method="POST" role="form" action="/ChronoMed/FrontController">
                                    <input type="hidden" value="EditPatientMyCredentialsCommand" name="command">
                                    <input type="hidden" value="<%= patient.getId()%>" name="id">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="inputEmail" class="control-label">Correo electr�nico</label>
                                                    <input type="email" class="form-control" id="inputEmail" name="email" value="<%= patient.getUserAccountID().getEmail()%>">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="inputOldPassword" class="control-label">Contrase�a actual*</label>
                                                    <input type="password" class="form-control" id="inputOldPassword" name="oldPassword" placeholder="******">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="inputNewPassword" class="control-label">Actualizar contrase�a</label>
                                                    <input type="password" class="form-control" id="inputNewPassword" name="newPassword" placeholder="******">
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
    </div>
    <%@include file="../footer.jsp" %>
</body>
</html>