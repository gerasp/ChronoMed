<div class="section"></div>
<%@include file="message.jsp" %>

<div class="bottom-navbar navbar navbar-default navbar-fixed-bottom navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/ChronoMed/FrontController?command=LogOutCommand"><i class="fa  fa-sign-out"></i>Cerrar sesi�n</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="/ChronoMed/terminosycondiciones.jsp">T�rminos y condiciones</a>
                </li>
                <li>
                    <a href="mailto:ayuda@chronomed.com">Ayuda</a>
                </li>
                <li>
                    <a href="/ChronoMed/db.jsp" target="_blank">Base de datos</a>
                </li>
            </ul>
        </div>
    </div>
</div>