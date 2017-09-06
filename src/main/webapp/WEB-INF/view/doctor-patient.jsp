<div class="row">
    <div class="col-md-2">
        <a href="<c:url value="/doctor/patients"/>" class="btn btn-block btn-lg btn-link ">
            <i class="fa fa-arrow-circle-left"></i>&nbsp;<fmt:message key="form.back"/>
        </a>
    </div>
    <div class="col-md-8">
        <h3 class="form-title text-center">${patient.name}&nbsp;${patient.surname}</h3>
    </div>
    <div class="col-md-2">
        <form:button class="btn btn-lg btn-block btn-link pull-right">
            <fmt:message key="form.data.save"/>&nbsp;<i class="fa  fa-check-circle"></i>
        </form:button>
    </div>
</div>
<blockquote>
    <footer>Ficha</footer>
    <p>Paciente de g�nero ${patient.gender} y nacionalidad ${patient.nationality},
        <br>nacido el ${patient.birthDate}
    </p>
</blockquote>
<ul class="nav nav-justified nav-tabs" style="margin-top: 20px;">
    <li class="active" id="history-tab"><a href="#"><i class="fa fa-lg fa-heartbeat"></i> Historial</a></li>
    <li id="consultations-tab"><a href="#"><i class="fa fa-lg fa-calendar"></i> Citas</a></li>
</ul>
<%@include file="doctor-history.jsp" %>
<%@include file="doctor-consultations.jsp" %>
<script>
    $("#history-tab").click(function () {
        $("#consultations-tab").removeClass("active");
        $("#history-tab").addClass("active");
        $("#history").show();
        $("#consultations").hide();
    });
    $("#consultations-tab").click(function () {
        $("#consultations-tab").addClass("active");
        $("#history-tab").removeClass("active");
        $("#history").hide();
        $("#consultations").show();
    });
</script>