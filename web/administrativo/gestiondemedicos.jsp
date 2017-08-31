<%@page import="java.util.List" %>
<%@page import="data.entities.Doctor" %>
<%@include file="/header.jsp" %>
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
                        <a class="btn btn-primary btn-lg register-button" href="/administrativo/registrarmedico.jsp"><i
                                class="fa  fa-plus-circle"></i>Registrar m�dico</a>
                    </div>
                    <div class="col-md-5">
                        <form class="form-horizontal" method="GET" role="form" action="/FrontController">

                            <input type="hidden" value="SearchDoctorByBoardNumberCommand" name="command">

                            <div class="input-group input-group-lg">
                                <input type="text" class="form-control" placeholder="Buscar por N� de colegiado..."
                                       name="search">
                                <span class="input-group-addon" id="basic-addon2">
                                            <button class="btn-link" type="submit"><i class="fa  -circle fa-search"></i></button>
                                        </span>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="list-group">
                    <% if (doctorList == null) {%>
                    <h2 style="text-align: center;"><span class="label label-default"><i class="fa fa-info-circle"></i> Para editar un m�dico, introduzca primero su n�mero de colegiado</span>
                    </h2>

                    <%
                    } else if (!doctorList.isEmpty()) {
                        for (Doctor doctor : doctorList) {

                    %>
                    <a href="/administrativo/editarmedico.jsp?id=<%= doctor.getId()%>"
                       class="list-group-item">
                        <h4 class="list-group-item-heading"><%= doctor.getName()%> <%= doctor.getSurname()%><i
                                class="-circle fa fa-2x  pull-right text-primary fa-angle-right"></i></h4>
                        <p class="list-group-item-text">
                            <%= doctor.getBoardNumber()%>
                        </p>
                    </a>
                    <%
                        }
                    } else {
                    %>
                    <h2 style="text-align: center;"><span class="label label-default"><i
                            class="fa fa-exclamation-circle"></i> No se ha encontrado ning�n m�dico</span></h2>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="/footer.jsp" %>

</body>
</html>