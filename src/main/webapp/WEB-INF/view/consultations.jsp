<c:choose>
    <c:when test='${consultations!=null}'>
        <div class="form-inline text-center">
            <h3 class="no-margin-top"><fmt:message key="action.filter.title"/></h3>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon"><fmt:message key="consultation.from"/></div>
                    <input id="from_date" type="date" pattern="dd/MM/yyyy" name="from" class="form-control" required
                           value="">
                    <div class="input-group-addon"><fmt:message key="consultation.to"/></div>
                    <input id="to_date" type="date" pattern="dd/MM/yyyy" name="to" class="form-control" required
                           value="">
                </div>
            </div>
            <button onclick="filter()" class="btn btn-primary not-print"><fmt:message key="action.filter"/></button>
        </div>
        <ul class="timeline">
            <c:forEach items="${consultations}" var="item">
                <li>
                    <div class="timeline-badge primary"><i class="fa fa-lg fa-hospital-o"></i></div>
                    <div class="timeline-panel">
                        <div class="timeline-heading">
                            <h4 class="timeline-title">
                                <c:choose>
                                    <c:when test='${item.doctorByDoctorId.gender.equals("male")}'>
                                        <fmt:message key="navigation.patient.male"/>
                                    </c:when>
                                    <c:when test='${item.doctorByDoctorId.gender.equals("female")}'>
                                        <fmt:message key="navigation.doctor.female"/>
                                    </c:when>
                                </c:choose>
                                &nbsp;${item.doctorByDoctorId.name}
                            </h4>
                            <p>
                                <fmt:formatDate value="${item.date}" var="date" pattern="dd/MM/yyyy"/>
                                <small class="text-muted a_date"><i class="fa fa-clock-o"></i>&nbsp;
                                    <time>${date}</time>
                                </small>
                            </p>
                        </div>
                        <div class="timeline-body">
                            <p>
                                <b><fmt:message key="consultation.symptoms"/></b>: ${item.symptoms}<br>
                                <b><fmt:message key="consultation.examinations"/></b>: ${item.examinations}<br>
                                <b><fmt:message key="consultation.treatment"/></b>: ${item.treatment}<br>
                                <b><fmt:message key="consultation.recomendations"/></b>: ${item.recomendations}<br>
                            </p>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
        <div class="row" style="margin:10px;">
            <c:choose>
                <c:when test="${action.equals('consultations')}">
                    <div class="col-md-12">
                        <button class="btn btn-primary btn-block not-print" onclick="window.print()">
                            <fmt:message key="action.export"/>&nbsp;<i class="fa  fa-print"></i>
                        </button>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="col-md-6">
                        <button class="btn btn-primary btn-block not-print" onclick="window.print()">
                            <fmt:message key="action.export"/>&nbsp;<i class="fa  fa-print"></i>
                        </button>
                    </div>
                    <div class="col-md-6">
                        <button id="new-consultation-button" class="btn btn-primary btn-block">
                            <fmt:message key="action.newConsultation"/>
                            <i class="fa  fa-plus-circle"></i>
                        </button>
                    </div>
                    <%@include file="consultation-new.jsp" %>
                </c:otherwise>
            </c:choose>
        </div>
    </c:when>
    <c:otherwise>
        <div class="well text-center">
            <i class="fa fa-exclamation-circle"></i>&nbsp;<fmt:message key="modal.content.consultationNotFound"/>
        </div>
        <% if (((User) request.getSession().getAttribute("user")).getType() == User.Type.DOCTOR) { %>
        <div class="row" style="margin:10px;">
            <div class="col-md-12">
                <button id="new-consultation-button" class="btn btn-primary btn-block">
                    <fmt:message key="action.newConsultation"/>
                    <i class="fa  fa-plus-circle"></i>
                </button>
            </div>
        </div>
        <%@include file="consultation-new.jsp" %>
        <% } %>
    </c:otherwise>
</c:choose>