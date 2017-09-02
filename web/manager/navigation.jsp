<div class="section">
    <div class="container logo-header">
        <div class="row">
            <div class="col-md-3">
                <img src="/images/ChronoMed.png" class="img-responsive">
            </div>
            <div class="col-md-9 text-right welcome-message">
                <h2><fmt:message key="navigation.greetings"/>,
                    <span class="label label-primary"><fmt:message key="navigation.manager"/></span>
                </h2>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <ul class="nav nav-justified nav-tabs">
                <li<%if (request.getRequestURI().contains("patient")) {%> class="active"<% }%>>
                    <a href="/manager/patient/management.jsp"><i class="fa  fa-lg fa-user"></i>&nbsp;
                        <fmt:message key="navigation.patient.management"/></a>
                </li>
                <li<%if (request.getRequestURI().contains("doctor")) {%> class="active"<% }%>>
                    <a href="/manager/doctor/management.jsp"><i class="fa  fa-lg fa-user-md"></i>&nbsp;
                        <fmt:message key="navigation.doctor.management"/></a>
                </li>
            </ul>
        </div>
    </div>
</div>
