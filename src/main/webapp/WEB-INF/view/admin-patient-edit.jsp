<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
               href="#collapse1">M�dicos vinculados</a>
        </h4>
    </div>
    <div id="collapse1" class="panel-collapse collapse">
        <form class="form-vertical" method="POST" role="form"
              action="/FrontController">
            <input type="hidden" value="AssociateDoctorsCommand" name="command">
            <input type="hidden" value="<%= patient.getId()%>" name="id">
            <div class="panel-body">
                <div class="row">
                    <div class="form-group">
                        <div class="col-md-12">
                            <ul class="list-unstyled" id="patientList">
                                <%
                                    for (DoctorPatient dp : patientPatientList) {
                                %>
                                <li class='card-item'>
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
                            <input list="patients" class="form-control" id="inputDoctor"
                                   placeholder="Elige tu patient...">
                            <datalist id="patients">
                                <%
                                    DoctorFacade patientFacade = FacadeFactory.getFacade("DoctorFacade");
                                    for (Doctor patient : patientFacade.findAll()) {
                                %>
                                <option value="<%= patient.getName() + " (" + patient.getBoardNumber() + ")"%>">
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
                        <button type="submit" class="btn btn-primary btn-block"><fmt:message key="form.data.save"/>&nbsp;
                            <i class="fa  fa-save"></i>
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>



<form:form action="/admin/patient/edit" modelAttribute="patient" cssClass="form-vertical">
    <div class="row">
        <div class="col-md-2">
            <a href="<c:url value="/admin/patients"/>" class="btn btn-block btn-lg btn-link ">
                <i class="fa fa-arrow-circle-left"></i>&nbsp;<fmt:message key="form.back"/>
            </a>
        </div>
        <div class="col-md-8">
            <h1 class="form-title text-center">&nbsp<fmt:message key="form.patient.registration"/></h1>
        </div>
        <div class="col-md-2">
            <form:button class="btn btn-lg btn-block btn-link pull-right">
                <fmt:message key="form.data.save"/>&nbsp;<i class="fa  fa-check-circle"></i>
            </form:button>
        </div>
    </div>
    <form:errors path="*" element="div" cssClass="col-md-12 alert alert-danger text-center"/>
    <%@include file="form-admin-patient-personal.jsp" %>
    <%@include file="form-admin-patient-healthcards.jsp" %>
    <%@include file="form-admin-patient-contact.jsp" %>
    <%@include file="form-admin-access.jsp" %>
    <p><fmt:message key="form.requiredFields.some"/></p>
</form:form>
