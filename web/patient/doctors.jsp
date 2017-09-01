<%@page import="data.entities.Doctor"%>
<%@page import="data.facades.DoctorFacade"%>
<%@page import="data.facades.FacadeFactory"%>
<%@page import="java.util.List"%>
<%@include file="/header.jsp" %>
    <body class="body-background">
        <div class="container">
            <div class="row">
                <%@include file="navigation.jsp" %>
                <div class="col-md-9">
                    <div class="signin-form-container">
                        <h2 class="text-center"><fmt:message key="navigation.doctors" /></h2>
                        <div class="list-group">
                            <% 
                                DoctorFacade doctorFacade = FacadeFactory.getFacade("DoctorFacade");
                                List<Doctor> doctorList = doctorFacade.findByPatient(patient);
                                
                                if (doctorList != null && !doctorList.isEmpty()) {
                                for (Doctor doctor : doctorList) {
                            %>
                            <a class="list-group-item">
                                <span class="badge"><i class="fa fa-phone"></i>&nbsp;<%= doctor.getPhoneNumber()%></span>
                                <h4 class="list-group-item-heading"><%= doctor.getName()%> <%= doctor.getSurname()%></h4>
                                <p class="list-group-item-text">
                                    <%= doctor.getSpeciality() %>&nbsp;|&nbsp;
                                    <fmt:message key="form.boardNumber" />:&nbsp;
                                    <%= doctor.getBoardNumber()%>
                                </p>
                            </a>
                            <% }} else { %>
                            <h2 style="text-align: center;"><span class="label label-default"><i class="fa fa-exclamation-circle"></i> No tiene ningún médico asignado</span></h2>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/footer.jsp" %>

    </body>
</html>