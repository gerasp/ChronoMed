<%@page import="java.util.List"%>
<%@page import="data.entities.Doctor"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="data.facades.DoctorFacade"%>
<html>
    <%@include file="../head.jsp" %>
    <body class="body-background">

        <%@include file="navigation.jsp" %>
        <%
            List<Doctor> doctorList = (List<Doctor>) request.getAttribute("doctorList");
        %>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="signin-form-container">
                        <div class="row">
                            <div class="col-md-7">
                                <a class="btn btn-primary btn-lg register-button" href="/ChronoMed/administrativo/registrarmedico.jsp"><i class="fa  fa-plus-circle"></i>Registrar médico</a>
                            </div>
                            <div class="col-md-5">
                                <form class="form-horizontal" method="GET" role="form" action="/ChronoMed/FrontController">

                                    <input type="hidden" value="SearchDoctorByBoardNumberCommand" name="command">

                                    <div class="input-group input-group-lg">
                                        <input type="text" class="form-control" placeholder="Buscar por Nº de colegiado..." name="search">
                                        <span class="input-group-addon" id="basic-addon2">
                                            <button class="btn-link" type="submit"><i class="fa  -circle fa-search"></i></button>
                                        </span>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="list-group">
                            <% if (doctorList == null) {%>
                            <h2 style="text-align: center;"><span class="label label-default"><i class="fa fa-info-circle"></i> Para editar un médico, introduzca primero su número de colegiado</span></h2>

                            <%} else if (!doctorList.isEmpty()) {
                                for (Doctor doctor : doctorList) {

                            %>
                            <a href="/ChronoMed/administrativo/editarmedico.jsp?id=<%= doctor.getId()%>" class="list-group-item">
                                <h4 class="list-group-item-heading"><%= doctor.getName()%> <%= doctor.getSurname()%><i class="-circle fa fa-2x  pull-right text-primary fa-angle-right"></i></h4>
                                <p class="list-group-item-text">
                                    <%= doctor.getBoardNumber()%>
                                </p>
                            </a>
                            <%}
                            } else {
                            %>
                            <h2 style="text-align: center;"><span class="label label-default"><i class="fa fa-exclamation-circle"></i> No se ha encontrado ningún médico</span></h2>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="../footer.jsp" %>

    </body></html>