<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
               href="#patient-doctors"><fmt:message key="form.assignedDoctors"/></a>
        </h4>
    </div>
    <div id="patient-doctors" class="panel-collapse collapse">
        <div class="panel-footer">
            <div class="row">
                <div class="col-md-12">

                    <div class="form-group">
                        <ul class="list-unstyled" id="doctorList">
                            <c:forEach items="${actualDoctors}" var="doctor">
                                <li class='card-item'>
                                    <input value="${doctor.surname}&nbsp;(${doctor.boardNumber})" name='boardNumbers' readonly>
                                    <button type='button'
                                            class='btn btn-danger btn-xs pull-right'><i
                                            class='fa  fa-remove'></i> <fmt:message key="action.remove"/>
                                    </button>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <input list="doctors" class="form-control" id="add-doctor-input"
                               placeholder="<fmt:message key="role.doctor"/>">
                        <datalist id="doctors">
                            <c:forEach var="doctor" items="${doctors}">
                                <option value="${doctor.surname}&nbsp;(${doctor.boardNumber})"></option>
                            </c:forEach>
                        </datalist>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <button type="button" id="add-doctor-button"
                                class="btn btn-primary btn-block"><i class="fa  fa-plus-circle"></i>&nbsp;<fmt:message
                                key="form.doctor.add"/>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>