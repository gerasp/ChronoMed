<form:form action="/doctor/patient/history/edit" modelAttribute="patient">
    <div class="row">
        <div class="col-md-3">
            <a href="<c:url value="/doctor/patients"/>" class="btn btn-block btn-lg btn-link ">
                <i class="fa fa-arrow-circle-left"></i>&nbsp;<fmt:message key="form.back"/>
            </a>
        </div>
        <div class="col-md-6">
            <h3 class="form-title text-center">${patient.name}&nbsp;${patient.surname}</h3>
        </div>
        <div class="col-md-3">
            <form:button id="save-history-button" class="btn btn-block btn-lg btn-link ">
                <fmt:message key="form.data.save"/>&nbsp;<i class="fa fa-check-circle"></i>
            </form:button>

            <a id="new-consultation-button" style="margin-top: 0;display: none;" class="btn btn-block btn-lg btn-link">
                <fmt:message key="action.newConsultation"/>&nbsp;<i class="fa fa-plus-circle"></i>
            </a>
        </div>
    </div>

    <ul class="nav nav-pills nav-justified" style="padding: 20px;">
        <li class="active background-grey">
            <a id="history-tab" data-toggle="tab" href="#history">
                <i class="fa fa-lg fa-heartbeat"></i>&nbsp;<fmt:message key="doctor.patient.history"/>
            </a>
        </li>
        <li class="background-grey">
            <a id="consultations-tab" data-toggle="tab" href="#consultations">
                <i class="fa fa-lg fa-calendar"></i>&nbsp;<fmt:message key="doctor.patient.consultations"/>
            </a>
        </li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane fade in active" id="history">
            <%@include file="history.jsp" %>
        </div>
        <div class="tab-pane fade" id="consultations">
            <%@include file="consultations.jsp" %>
        </div>
    </div>

</form:form>
<%@include file="consultation-new.jsp" %>
<script>
    $("#history-tab").click(function () {
        $("#new-consultation-button").hide();
        $("#save-history-button").show();
    });
    $("#consultations-tab").click(function () {
        $("#new-consultation-button").show();
        $("#save-history-button").hide();
    });

</script>