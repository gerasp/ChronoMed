<div class="section">
    <div class="container logo-header">
        <div class="row">
            <div class="col-md-3">
                <img src="/ChronoMed/images/ChronoMed.png" class="img-responsive">
            </div>
            <div class="col-md-9">
                <div class="text-right">
                    <h1>Saludos,
                        <span class="label label-primary">administrativo</span>
                    </h1>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <ul class="nav nav-justified nav-tabs">
                <li 
                    <%
                        if (request.getRequestURI().contains("paciente")) {
                    %>
                    class="active"
                    <% }%>
                    >
                    <a href="/ChronoMed/administrativo/gestiondepacientes.jsp"><i class="fa  fa-lg fa-user"></i>Gestión de pacientes</a>
                </li>
                <li <%
                    if (request.getRequestURI().contains("medico")) {
                    %>
                    class="active"
                    <% }%>
                    >
                    <a href="/ChronoMed/administrativo/gestiondemedicos.jsp"><i class="fa  fa-lg fa-user-md"></i>Gestión de médicos</a>
                </li>
            </ul>
        </div>
    </div>
</div>
