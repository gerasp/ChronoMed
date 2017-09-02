<%@page import="data.entities.DoctorPatient"%>
<%@page import="data.entities.Healthcard"%>
<%@page import="data.facades.DoctorPatientFacade"%>
<%@page import="data.facades.FacadeFactory"%>
<%@page import="data.facades.HealthcardFacade"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
    <%@include file="/header.jsp" %>
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
                    <div class="white-container">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse1"><fmt:message key="form.data.personal" /></a>
                                </h4>
                            </div>
                            <div id="collapse1" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="inputName" class="control-label"><fmt:message key="form.name" /></label>
                                                <input type="text" class="form-control" disabled id="inputName" name="name" value="<%= patient.getName()%>" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputSurname" class="control-label"><fmt:message key="form.surname" /></label>
                                                <input type="text" class="form-control" disabled id="inputSurname" name="surname" value="<%= patient.getSurname()%>" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputIdcard" class="control-label"><fmt:message key="form.idcard" /></label>
                                                <input type="text" class="form-control" disabled id="inputIdcard" name="nif" value="<%= patient.getNif()%>" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="inputBirthDate" class="control-label"><fmt:message key="form.birthday" /></label>
                                                <input type="date" class="form-control" disabled id="inputBirthDate" name="birthdate" 
                                                       value="<%= new SimpleDateFormat("yyyy-MM-dd").format(patient.getBirthDate())%>"
                                                       required>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputGender" class="control-label"><fmt:message key="form.gender" /></label>
                                                <select class="form-control" disabled  required name="gender" id="inputGender">
                                                    <option <% if (patient.getGender().equals("Masculino")) {
                                                            out.println(" selected ");
                                                        } %> ><fmt:message key="form.gender.male" /></option>
                                                    <option <% if (patient.getGender().equals("Femenino")) {
                                                            out.println(" selected ");
                                                        }%> ><fmt:message key="form.gender.female" /></option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputNationality" class="control-label"><fmt:message key="form.nationality" /></label>
                                                <input type="text" class="form-control" disabled id="inputNationality" name="nationality" value="<%= patient.getNationality()%>" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-footer"><fmt:message key="form.requiredFields.contactManager" /></div>
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse2"><fmt:message key="form.healthcards" /></a>
                                </h4>
                            </div>
                            <div id="collapse2" class="panel-collapse collapse">
                                <form  class="form-vertical" method="POST" role="form" action="/FrontController">
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
                                <div class="panel-footer"><fmt:message key="form.requiredFields.contactManager" /></div>
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse3"><fmt:message key="form.data.contact" /></a>
                                </h4>
                            </div>
                            <div id="collapse3" class="panel-collapse collapse">
                                <form  class="form-vertical" method="POST" role="form" action="/FrontController">
                                    <input type="hidden" value="EditPatientMyContactDataCommand" name="command">
                                    <input type="hidden" value="<%= patient.getId()%>" name="id">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="inputAddress" class="control-label"><fmt:message key="form.address" />*</label>
                                                    <input type="text" class="form-control" id="inputAddress" name="address" value="<%= patient.getAddress()%>" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="inputLocality" class="control-label" contenteditable="true"><fmt:message key="form.locality" />*</label>
                                                    <input type="text" class="form-control" id="inputLocality" name="locality" value="<%= patient.getLocality()%>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputZipcode" class="control-label"><fmt:message key="form.postalCode" />*</label>
                                                    <input type="text" class="form-control" id="inputZipcode" name="zipCode" value="<%= patient.getZipCode()%>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputProvince" class="control-label"><fmt:message key="form.province" />*</label>
                                                    <input type="text" class="form-control" id="inputProvince" name="province" value="<%= patient.getProvince()%>" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="inputCountry" class="control-label" contenteditable="true"><fmt:message key="form.country" />*</label>
                                                    <input type="text" class="form-control" id="inputCountry" name="country" value="<%= patient.getCountry()%>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputPhoneNumber" class="control-label"><fmt:message key="form.phoneNumber.main" />*</label>
                                                    <input type="tel" class="form-control" id="inputPhoneNumber" name="phoneNumber" value="<%= patient.getPhoneNumber()%>" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="inputAlternativePhoneNumber" class="control-label"><fmt:message key="form.phoneNumber.alternative" /></label>
                                                    <input type="tel" class="form-control" id="inputAlternativePhoneNumber" name="alternativePhoneNumber" value="<%= patient.getAlternativePhoneNumber()%>">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                     <div class="panel-footer">*<fmt:message key="form.requiredFields.some" />
                                        <button type="submit" class="btn btn-primary btn-xs pull-right"><fmt:message key="form.data.save" />&nbsp;
                                            <i class="fa  fa-save"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse4"><fmt:message key="form.data.access" /></a>
                                </h4>
                            </div>
                            <div id="collapse4" class="panel-collapse collapse">
                                <form  class="form-vertical" method="POST" role="form" action="/FrontController">
                                    <input type="hidden" value="EditPatientMyCredentialsCommand" name="command">
                                    <input type="hidden" value="<%= patient.getId()%>" name="id">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="inputEmail" class="control-label"><fmt:message key="form.email" /></label>
                                                    <input type="email" class="form-control" id="inputEmail" name="email" value="<%= patient.getUserAccountID().getEmail()%>">
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
                                    </div>
                                    <div class="panel-footer">*<fmt:message key="form.requiredFields.some" />
                                        <button type="submit" class="btn btn-primary btn-xs pull-right"><fmt:message key="form.data.save" />&nbsp;
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