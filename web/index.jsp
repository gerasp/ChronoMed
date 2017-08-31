<%@include file="/header.jsp" %>
<body>
<form>
    <select id="language" name="language" onchange="submit()">
        <option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
        <option value="es" ${language == 'es' ? 'selected' : ''}>Español</option>
        <option value="de" ${language == 'de' ? 'selected' : ''}>Deutsch</option>
    </select>
</form>
<div class="cover" id="intro-section">
    <div class="background-image-fixed cover-image" style="background-image : url('images/medicamentos.jpeg')"></div>
    <div class="container">
        <div class="row form">
            <div class="col-md-5 logo">
                <img src="images/ChronoMed.png" class="center-block img-responsive logo">
            </div>
            <div class="col-md-7 signin-form">
                <ul class="nav nav-justified nav-tabs">

                    <li class="active">
                        <a href="#"><i class="fa  fa-lg fa-user"></i>Inicio de sesi�n<br></a>
                    </li>
                    <li>
                    </li>
                    <li>
                    </li>
                    <li>
                    </li>
                </ul>
                <form action="FrontController" method="POST" class="form-horizontal text-right signin-form-container"
                      role="form">
                    <input type="hidden" value="LoginCommand" name="command">
                    <div class="container">
                        <div class="row">
                            <%
                                String error = (String) request.getAttribute("error");
                                if (error != null) {
                            %>
                            <div class="col-md-12 alert alert-danger" style="text-align: center">
                                <%= error%>
                            </div>
                            <%}%>
                            <div class="col-md-8">
                                <div class="form-group has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                        <input type="email" class="form-control" name="email" id="inputEmail"
                                               placeholder="<fmt:message key="login.email" />">
                                    </div>
                                </div>
                                <div class="form-group has-feedback">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i
                                                class="fa fa-key"></i></span>
                                        <input type="password" class="form-control" name="password" id="inputPassword"
                                               placeholder="<fmt:message key="login.password" />">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <button type="submit" class="btn btn-lg btn-primary">
                                        <i class="fa fa-2x fa-sign-in"></i><br><fmt:message key="login.submit" />
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="navbar navbar-inverse" id="nav" style="margin-top:-50px;">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">� ChronoMed 2017</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-collapse">
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
<div class="section" id="services-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>�Qu� me puede ofrecer ChronoMed?</h1>
            </div>
        </div>
    </div>
</div>
<div class="section section-primary services-section">
    <div class="container">
        <div class="row">
            <div class="col-md-4 text-center">
                <img src="images/paciente.jpeg" class="center-block img-responsive">
                <h2 class="text-center">Como paciente</h2>
                <p>Una manera r�pida de acceder a tu historial m�dico desde casa, tu trabajo
                    o donde sea. Te ahorrar�s la necesidad de tener un historial en cada centro
                    m�dico que visites. Tambi�n te avisaremos cuando alg�n m�dico visite
                    tu historial. Tu privacidad y la seguridad de tus datos m�dicos est�n en
                    buenas manos.</p>
            </div>
            <div class="col-md-4">
                <img src="images/medico.jpg" class="center-block img-responsive">
                <h2 class="text-center">Como m�dico</h2>
                <p class="text-center">Un portal �nico para acceder al historial de todos tus pacientes. Podr�s
                    a�adir o consultar informaci�n como enfermedades actuales, distintas consultas
                    que el paciente ha tenido, etc. Deja atr�s esas peticiones a pacientes
                    para que traigan su historial m�dico. �Sigue ejerciendo tu profesi�n de
                    manera m�s eficaz!</p>
            </div>
            <div class="col-md-4 text-center">
                <img src="images/administrativo.jpg" class="center-block img-responsive">
                <h2 class="text-center">Como administrativo</h2>
                <p>Un sistema eficaz y fiable para la asignaci�n de pacientes a m�dicos.
                    Evitar�s las largas colas que se forman con pacientes que buscan su historial
                    m�dico del centro concreto, ya que estos podr�n acceder desde cualquier
                    lugar. Tu �nica tarea: que tanto pacientes como m�dicos comienzen a usar
                    ChronoMed.
                    <br>
                    <br>
                </p>
            </div>
        </div>
    </div>
</div>
<div class="section" id="team-section">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-left">Equipo</h1>
                <p class="lead text-left">Entre todos hacemos ChronoMed posible</p>
            </div>
        </div>
        <div class="row team-row">
            <div class="col-sm-2">
                <img src="images/team/al.jpg" class="img-circle img-responsive">
            </div>
            <div class="col-sm-4">
                <h3 class="text-left">Adri�n Louro</h3>
                <p class="lead text-left">Desarrollador</p>
            </div>
            <div class="col-sm-2">
                <img class="img-circle img-responsive" src="images/team/gm.jpeg">
            </div>
            <div class="col-sm-4">
                <h3 class="text-left font-bold">Gerardo Medina</h3>
                <p class="lead text-left">Desarrollador</p>
            </div>
        </div>
        <div class="row team-row">
            <div class="col-sm-2">
                <img src="images/team/ss.jpg" class="img-circle img-responsive">
            </div>
            <div class="col-sm-4">
                <h3 class="text-left">Saskia Santana</h3>
                <p class="lead text-left">Desarrollador</p>
            </div>
            <div class="col-sm-2">
                <img src="images/team/og.jpg" class="img-circle img-responsive">
            </div>
            <div class="col-sm-4 text-center">
                <h3 class="text-left">�scar Garc�a</h3>
                <p class="lead text-left">Desarrollador</p>
            </div>
        </div>
        <div class="row team-row">
            <div class="col-sm-2">
                <img src="images/team/jd.png" class="img-circle img-responsive">
            </div>
            <div class="col-sm-4">
                <h3 class="text-left">Joel Delgado</h3>
                <p class="lead text-left">Desarrollador</p>
            </div>
            <div class="col-sm-2">
                <img src="images/team/gc.jpg" class="img-circle img-responsive">
            </div>
            <div class="col-sm-4 text-center">
                <h3 class="text-left">Guillermo Cubero</h3>
                <p class="lead text-left">Desarrollador</p>
            </div>
        </div>
    </div>
</div>
<div class="section section-primary" id="contact-section">
    <div class="container">
        <div class="row">
            <div class="col-md-6 text-left">
                <h1>Cont�ctanos</h1>
                <p>Escuela de Ingenier�a Inform�tica
                    <br>Campus de Tafira
                    <br>Universidad de Las Palmas de Gran Canaria
                    <br>Las Palmas, Espa�a</p>
            </div>
            <div class="col-md-6">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3520.4013483806557!2d-15.453591885445855!3d28.07329808264172!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xc40942fde2813a9%3A0x8b61a40c00405a46!2sUniversidad+de+Las+Palmas+de+Gran+Canaria%3A+Escuela+de+Ingenier%C3%ADa+Inform%C3%A1tica!5e0!3m2!1sde!2ses!4v1487770546552"
                        width="600" height="450" frameborder="0" style="border:0" allowfullscreen=""
                        class="img-responsive"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="contact-section section">
    <div class="container">
        <div class="row text-center">
            <div class="col-xs-3 text-center">
                <a><i class="fa fa-5x  fa-instagram"></i></a>
            </div>
            <div class="col-xs-3">
                <a><i class="fa fa-5x  fa-twitter"></i></a>
            </div>
            <div class="col-xs-3">
                <a><i class="fa fa-5x  fa-facebook"></i></a>
            </div>
            <div class="col-xs-3 text-center">
                <a><i class="fa fa-5x  fa-github"></i></a>
            </div>
        </div>
    </div>
</div>

<script>
    $('#nav').affix({
        offset: {
            top: $('#intro-section').height() - 50
        }
    });

    $('body').scrollspy({target: ".navbar", offset: 50});

    $("#nav a").on('click', function (event) {
        if (this.hash !== "") {

            event.preventDefault();
            var hash = this.hash;
            $('html, body').animate({
                scrollTop: $(hash).offset().top
            }, 800, function () {

                window.location.hash = hash;
            });

        }

    });
</script>
</body>

<%@include file="/footer.jsp" %>
</html>