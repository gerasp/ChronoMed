<div class="section">
    <div class="container logo-header">
        <div class="row">
            <div class="col-md-3">
                <img src="/images/ChronoMed.png" class="img-responsive">
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
                <li<%if (request.getRequestURI().contains("paciente")) {%> class="active"<% }%>>
                    <a href="/administrativo/gestiondepacientes.jsp"><i class="fa  fa-lg fa-user"></i>Gesti�n de
                        pacientes</a>
                </li>
                <li<%if (request.getRequestURI().contains("medico")) {%> class="active"<% }%>>
                    <a href="/administrativo/gestiondemedicos.jsp"><i class="fa  fa-lg fa-user-md"></i>Gesti�n de
                        m�dicos</a>
                </li>
            </ul>
        </div>
    </div>
</div>
