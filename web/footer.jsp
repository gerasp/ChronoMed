<% if (request.getSession().getAttribute("user") != null) { %>
<div class="section"></div>
<div class="bottom-navbar navbar navbar-default navbar-fixed-bottom navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/FrontController?command=LogOutCommand"><i class="fa  fa-sign-out"></i>Cerrar sesión</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-collapse">
            <ul class="nav navbar-nav">
                <li>
                    <a id="openModal2Button"><img src="/images/flags/${language}.png">&nbsp;<span class="caret"></span></a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="/terminosycondiciones.jsp">Términos y condiciones</a>
                </li>
                <li>
                    <a href="mailto:ayuda@chronomed.com">Ayuda</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<% } else { %>
<div class="navbar navbar-inverse" id="nav" style="margin-top:-50px;">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">@ ChronoMed 2017</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-collapse">
            <ul class="nav navbar-nav">
                <li>
                    <a id="openModal2Button"><img src="/images/flags/${language}.png">&nbsp;<span class="caret"></span></a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#intro-section">Inicio</a>
                </li>
                <li class="">
                    <a href="#services-section">Servicios<br></a>
                </li>
                <li class="">
                    <a href="#team-section">Equipo<br></a>
                </li>
                <li>
                    <a href="#contact-section">Contacto<br></a>
                </li>
            </ul>
        </div>
    </div>
</div>

<% } %>

<%@include file="message.jsp" %>
