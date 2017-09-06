<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
               href="#patient-doctors">M�dicos vinculados</a>
        </h4>
    </div>
    <div id="patient-doctors" class="panel-collapse collapse">
        <div class="panel-footer">
            <div class="row">
                <div class="form-group">
                    <div class="col-md-12">
                        <ul class="list-unstyled" id="patientList">
                            <%--<%--%>
                                <%--for (DoctorPatient dp : patientPatientList) {--%>
                            <%--%>--%>
                            <%--<li class='card-item'>--%>
                                <%--<input value="<%= dp.getDoctorID().getName() + " (" + dp.getDoctorID().getBoardNumber() + ")"%>"--%>
                                       <%--name='healthCardsList' style='border:0; background:none;'--%>
                                       <%--readonly>--%>
                                <%--<button type='button' onclick='deleteDoctor(this)'--%>
                                        <%--class='btn btn-danger btn-xs pull-right'><i--%>
                                        <%--class='fa  fa-remove'></i> Eliminar--%>
                                <%--</button>--%>
                            <%--</li>--%>
                            <%--<%--%>
                                <%--}--%>
                            <%--%>--%>
                        </ul>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-6">
                        <input list="patients" class="form-control" id="inputDoctor"
                               placeholder="Elige tu patient...">
                        <datalist id="patients">
                            <%--<%--%>
                                <%--DoctorFacade patientFacade = FacadeFactory.getFacade("DoctorFacade");--%>
                                <%--for (Doctor patient : patientFacade.findAll()) {--%>
                            <%--%>--%>
                            <%--<option value="<%= patient.getName() + " (" + patient.getBoardNumber() + ")"%>">--%>
                                    <%--<%--%>
                                                                <%--}--%>
                                                            <%--%>--%>
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
    </div>
</div>