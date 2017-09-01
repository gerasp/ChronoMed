<%@page import="data.entities.Medicalhistory"%>
<%@page import="data.facades.FacadeFactory"%>
<%@page import="data.facades.MedicalhistoryFacade"%>
    <%@include file="/header.jsp" %>
    <body class="body-background">

        <div class="container">
            <div class="row">
                <%@include file="navigation.jsp" %>
                <%
                    MedicalhistoryFacade medicalhistoryFacade = FacadeFactory.getFacade("MedicalhistoryFacade");
                    Medicalhistory medicalhistory = medicalhistoryFacade.findByPatient(patient).get(0);
                %>

                <div class="col-md-9">
                    <div class="white-container">
                        <h1 class="text-primary text-center"><small><fmt:message key="history.title" /></small><br>
                            <%=patient.getName() + " " + patient.getSurname()%></h1>
                        <blockquote>
                            <footer><fmt:message key="history.bloodType" /></footer>
                            <p><%=medicalhistory.getBloodType()%></p>
                        </blockquote>
                        <blockquote>
                            <footer><fmt:message key="history.pathologies" /></footer>
                            <p><%=medicalhistory.getPathologies()%></p>
                        </blockquote>
                        <blockquote>
                            <footer><fmt:message key="history.surgeries" /></footer>
                            <p><%=medicalhistory.getSurgeries()%></p>
                        </blockquote>
                        <blockquote>
                            <footer><fmt:message key="history.allergies" /></footer>
                            <p><%=medicalhistory.getAllergies()%></p>
                        </blockquote>
                        <blockquote>
                            <footer><fmt:message key="history.familyHistory" /></footer>
                            <p><%=medicalhistory.getFamilyHistory()%></p>
                        </blockquote>
                        <blockquote>
                            <footer><fmt:message key="history.others" /></footer>
                            <p><%=medicalhistory.getOthers()%></p>
                        </blockquote>
                        <div class="row">
                            <div class="col-md-12" id="print3">
                                <button class="btn btn-primary btn-block" onclick="window.print()"><fmt:message key="action.export" />&nbsp;<i class="fa  fa-print"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="/footer.jsp" %>

    </body>
</html>