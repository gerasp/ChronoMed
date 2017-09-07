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
        <%--<form:button class="btn btn-lg btn-block btn-link pull-right">--%>
        <%--<fmt:message key="form.data.save"/>&nbsp;<i class="fa  fa-check-circle"></i>--%>
        <%--</form:button>--%>
    </div>
</div>

<blockquote>
    <footer>Ficha</footer>
    <p>Paciente de g�nero ${patient.gender} y nacionalidad ${patient.nationality},
        <br>nacido el ${patient.birthDate}
    </p>
</blockquote>

<ul class="nav nav-tabs text-center" style="margin-bottom: 20px;">
    <li class="active"><a data-toggle="tab" href="#history"><i class="fa fa-lg fa-heartbeat"></i> Historial</a></li>
    <li><a data-toggle="tab" href="#consultations"><i class="fa fa-lg fa-calendar"></i> Citas</a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane fade in active" id="history">
        <%@include file="history.jsp" %>
    </div>
    <div class="tab-pane fade" id="consultations">
        <%@include file="consultations.jsp" %>
    </div>
</div>
