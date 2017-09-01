<%@page import="data.entities.Doctor" %>
<%@page import="data.entities.DoctorPatient" %>
<%@page import="data.entities.Healthcard" %>
<%@page import="data.entities.Patient" %>
<%@page import="data.facades.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.List" %>
<%@include file="/header.jsp" %>
<body class="body-background">
<%@include file="navigation.jsp" %>
<%
    PatientFacade patientFacade = FacadeFactory.getFacade("PatientFacade");
    DoctorPatientFacade doctorPatientFacade = FacadeFactory.getFacade("DoctorPatientFacade");
    HealthcardFacade healthcardFacade = FacadeFactory.getFacade("HealthcardFacade");
    Patient patient = patientFacade.find(Integer.parseInt(request.getParameter("id")));
    List<DoctorPatient> doctorPatientList = doctorPatientFacade.findByPatient(patient);
    List<Healthcard> healthcardList = healthcardFacade.findByPatient(patient);
%>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="signin-form-container">
                <input type="hidden" value="EditPatientCommand" name="command">
                <input type="hidden" value="<%= patient.getId()%>" name="id">
                <div class="row">
                    <div class="col-md-2">
                        <a href="/manager/patientmanagement.jsp" class="btn btn-block btn-lg btn-link "><i
                                class="fa fa-arrow-circle-left"></i>&nbsp<fmt:message key="form.back" /></a>
                    </div>
                    <div class="col-md-8">
                        <h1 class="form-title text-center">Sr<% if (patient.getGender().equals("a")) {
                            out.println("a");
                        }%>. <%= patient.getSurname()%>
                        </h1>
                    </div>
                    <div class="col-md-2">
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
                               href="#collapse1">M�dicos vinculados</a>
                        </h4>
                    </div>
                    <div id="collapse1" class="panel-collapse collapse">
                        <form style="margin:0px;" class="form-vertical" method="POST" role="form"
                              action="/FrontController">
                            <input type="hidden" value="AssociateDoctorsCommand" name="command">
                            <input type="hidden" value="<%= patient.getId()%>" name="id">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <ul class="list-unstyled" id="doctorList">
                                                <%
                                                    for (DoctorPatient dp : doctorPatientList) {
                                                %>
                                                <li class='health-card-item'>
                                                    <input value="<%= dp.getDoctorID().getName() + " (" + dp.getDoctorID().getBoardNumber() + ")"%>"
                                                           name='healthCardsList' style='border:0; background:none;'
                                                           readonly>
                                                    <button type='button' onclick='deleteDoctor(this)'
                                                            class='btn btn-danger btn-xs pull-right'><i
                                                            class='fa  fa-remove'></i> Eliminar
                                                    </button>
                                                </li>
                                                <%
                                                    }
                                                %>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <input list="doctors" class="form-control" id="inputDoctor"
                                                   placeholder="Elige tu doctor...">
                                            <datalist id="doctors">
                                                <%
                                                    DoctorFacade doctorFacade = FacadeFactory.getFacade("DoctorFacade");
                                                    for (Doctor doctor : doctorFacade.findAll()) {
                                                %>
                                                <option value="<%= doctor.getName() + " (" + doctor.getBoardNumber() + ")"%>">
                                                        <%
                                                                }
                                                            %>
                                            </datalist>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-3">
                                            <button type="button" onclick="addDoctor()"
                                                    class="btn btn-primary btn-block"><i class="fa  fa-plus-circle"></i>Asociar
                                                Doctor&nbsp;
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-md-9">
                                        <h5>
                                        </h5>
                                    </div>
                                    <div class="col-md-3">
                                        <button type="submit" class="btn btn-primary btn-block"><fmt:message key="form.data.save" />
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
                               href="#collapse2"><fmt:message key="form.data.personal" /></a>
                        </h4>
                    </div>
                    <div id="collapse2" class="panel-collapse collapse">
                        <form style="margin:0px;" class="form-vertical" method="POST" role="form"
                              action="/FrontController">
                            <input type="hidden" value="EditPatientPersonalDataCommand" name="command">
                            <input type="hidden" value="<%= patient.getId()%>" name="id">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="inputName" class="control-label"><fmt:message key="form.name" /></label>
                                            <input type="text" class="form-control" id="inputName" name="name"
                                                   value="<%= patient.getName()%>" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputSurname" class="control-label"><fmt:message key="form.surname" /></label>
                                            <input type="text" class="form-control" id="inputSurname" name="surname"
                                                   value="<%= patient.getSurname()%>" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputIdcard" class="control-label"><fmt:message key="form.idcard" /></label>
                                            <input type="text" class="form-control" id="inputIdcard" name="nif"
                                                   value="<%= patient.getNif()%>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="inputBirthDate" class="control-label">Fecha de
                                                nacimiento</label>
                                            <input type="date" class="form-control" id="inputBirthDate" name="birthdate"
                                                   value="<%= new SimpleDateFormat("yyyy-MM-dd").format(patient.getBirthDate())%>"
                                                   required>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputGender" class="control-label"><fmt:message key="form.gender" /></label>
                                            <select class="form-control" required name="gender" id="inputGender">
                                                <option <% if (patient.getGender().equals("Masculino")) {
                                                    out.println(" selected ");
                                                } %> ><fmt:message key="form.gender.male" />
                                                </option>
                                                <option <% if (patient.getGender().equals("Femenino")) {
                                                    out.println(" selected ");
                                                }%> ><fmt:message key="form.gender.female" />
                                                </option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputNationality" class="control-label"><fmt:message key="form.nationality" /></label>
                                            <input type="text" class="form-control" id="inputNationality"
                                                   name="nationality" value="<%= patient.getNationality()%>" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-md-9">
                                        <h5>
                                            <fmt:message key="form.requiredFields.all" />
                                        </h5>
                                    </div>
                                    <div class="col-md-3">
                                        <button type="submit" class="btn btn-primary btn-block"><fmt:message key="form.data.save" />
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
                               href="#collapse3"><fmt:message key="form.healthcards" /></a>
                        </h4>
                    </div>
                    <div id="collapse3" class="panel-collapse collapse">
                        <form style="margin:0px;" class="form-vertical" method="POST" role="form"
                              action="/FrontController">
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
                                                    <input value="<%=hc.getNumber()%>" name='healthCardsList'
                                                           style='border:0; background:none;' readonly>
                                                    <button type='button' onclick='deleteHealthCard(this)'
                                                            class='btn btn-danger btn-xs pull-right'><i
                                                            class='fa  fa-remove'></i> Eliminar
                                                    </button>
                                                </li>
                                                <%
                                                    }
                                                %>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <input type="number" class="form-control" id="inputHealthCard"
                                                   placeholder="23461256012578">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-3">
                                            <button type="button" onclick="addHealthCard()"
                                                    class="btn btn-primary btn-block"><i class="fa  fa-plus-circle"></i>A�adir
                                                tarjeta sanitaria&nbsp;
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-md-9">
                                        <h5>
                                        </h5>
                                    </div>
                                    <div class="col-md-3">
                                        <button type="submit" class="btn btn-primary btn-block"><fmt:message key="form.data.save" />
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
                               href="#collapse4"><fmt:message key="form.data.contact" /></a>
                        </h4>
                    </div>
                    <div id="collapse4" class="panel-collapse collapse">
                        <form style="margin:0px;" class="form-vertical" method="POST" role="form"
                              action="/FrontController">
                            <input type="hidden" value="EditPatientContactDataCommand" name="command">
                            <input type="hidden" value="<%= patient.getId()%>" name="id">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="inputAddress" class="control-label"><fmt:message key="form.address" />*</label>
                                            <input type="text" class="form-control" id="inputAddress" name="address"
                                                   value="<%= patient.getAddress()%>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="inputLocality" class="control-label" contenteditable="true"><fmt:message key="form.locality" />*</label>
                                            <input type="text" class="form-control" id="inputLocality" name="locality"
                                                   value="<%= patient.getLocality()%>" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputZipcode" class="control-label"><fmt:message key="form.postalCode" />*</label>
                                            <input type="text" class="form-control" id="inputZipcode" name="zipCode"
                                                   value="<%= patient.getZipCode()%>" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputProvince" class="control-label">Provincia*</label>
                                            <input type="text" class="form-control" id="inputProvince" name="province"
                                                   value="<%= patient.getProvince()%>" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="inputCountry" class="control-label"
                                                   contenteditable="true"><fmt:message key="form.country" />*</label>
                                            <input type="text" class="form-control" id="inputCountry" name="country"
                                                   value="<%= patient.getCountry()%>" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputPhoneNumber" class="control-label">Tel�fono
                                                principal*</label>
                                            <input type="tel" class="form-control" id="inputPhoneNumber"
                                                   name="phoneNumber" value="<%= patient.getPhoneNumber()%>" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputAlternativePhoneNumber" class="control-label">Tel�fono
                                                alternativo</label>
                                            <input type="tel" class="form-control" id="inputAlternativePhoneNumber"
                                                   name="alternativePhoneNumber"
                                                   value="<%= patient.getAlternativePhoneNumber()%>">
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
                                        <button type="submit" class="btn btn-primary btn-block"><fmt:message key="form.data.save" />
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
                               href="#collapse5"><fmt:message key="form.data.access" /></a>
                        </h4>
                    </div>
                    <div id="collapse5" class="panel-collapse collapse">
                        <form style="margin:0px;" class="form-vertical" method="POST" role="form"
                              action="/FrontController">
                            <input type="hidden" value="EditPatientUserAccountCommand" name="command">
                            <input type="hidden" value="<%= patient.getId()%>" name="id">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="inputEmail" class="control-label"><fmt:message key="form.email" />*</label>
                                            <input type="email" class="form-control" id="inputEmail" name="email"
                                                   value="<%= patient.getUserAccountID().getEmail()%>" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="inputActivation" class="control-label"><fmt:message key="form.activeAccount" /></label>
                                            <br>
                                            <input type="checkbox" value="<% if (patient.getUserAccountID().getActive()) {
                                                            out.print("on");
                                                        } %> " name="isActivated"
                                                <% if (patient.getUserAccountID().getActive()) {
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
                                            *Campos Obligatorios
                                        </h5>
                                    </div>
                                    <div class="col-md-3">
                                        <button type="submit" class="btn btn-primary btn-block"><fmt:message key="form.data.save" />
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
<script>
    function addHealthCard() {
        var healthcard = $("#inputHealthCard").val();
        if (healthcard === "")
            return;
        var html = "<li class='health-card-item'> <input value='" + healthcard + "' name='addedHealthCards' style='border:0; background:none;' readonly> <button type='button' onclick='deleteHealthCard(this)' class='btn btn-danger btn-xs pull-right'><i class='fa  fa-remove'></i> Eliminar</button></li>";
        $("#healthCards").append(html);
    }

    function deleteHealthCard(button) {
        if (button.previousElementSibling.getAttribute("name") !== "addedHealthCards")
            button.previousElementSibling.setAttribute("name", "deletedHealthCards");
        else
            button.previousElementSibling.setAttribute("name", "trashHealthCardsList");
        button.previousElementSibling.attributes["2"].nodeValue += "text-decoration: line-through;";
        button.remove();
    }

    function addDoctor() {
        var healthcard = $("#inputDoctor").val();
        if (healthcard === "")
            return;
        var html = "<li class='health-card-item'> <input value='" + healthcard + "' name='addedBoardNumbers' style='border:0; background:none;' readonly> <button type='button' onclick='deleteDoctor(this)' class='btn btn-danger btn-xs pull-right'><i class='fa  fa-remove'></i> Eliminar</button></li>";
        $("#doctorList").append(html);
    }

    function deleteDoctor(button) {
        if (button.previousElementSibling.getAttribute("name") !== "addedBoardNumbers")
            button.previousElementSibling.setAttribute("name", "deletedBoardNumbers");
        else
            button.previousElementSibling.setAttribute("name", "trashDoctor");
        button.previousElementSibling.attributes["2"].nodeValue += "text-decoration: line-through;";
        button.remove();
    }

</script>
<%@include file="/footer.jsp" %>

</body>
</html>