<div class="form-inline text-center">
    <h3><fmt:message key="action.filter.title"/></h3>
    <div class="form-group">
        <div class="input-group">
            <div class="input-group-addon"><fmt:message key="consultation.from"/></div>
            <input id="from_date" type="date" name="from" class="form-control" required value="">
            <div class="input-group-addon"><fmt:message key="consultation.to"/></div>
            <input id="to_date" type="date" name="to" class="form-control" required value="">
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
                            <c:when test='${item.doctorByDoctorId.gender.equals("male")}'><fmt:message
                                    key="navigation.patient.male"/></c:when>
                            <c:when test='${item.doctorByDoctorId.gender.equals("female")}'><fmt:message
                                    key="navigation.doctor.female"/></c:when>
                            <c:otherwise>undefined</c:otherwise>
                        </c:choose>
                        &nbsp;${item.doctorByDoctorId.name}
                    </h4>
                    <p>
                        <fmt:formatDate value="${item.date}" var="date" pattern="dd/MM/yyyy"/>
                        <small class="text-muted a_date"><i class="fa fa-clock-o"></i>&nbsp;
                            <time datetime="${date}"></time>
                        </small>
                    </p>
                </div>
                <div class="timeline-body">
                    <p>
                        <b><fmt:message key="consultation.symptoms"/></b>: ${item.symptoms}<br>
                        <b><fmt:message key="consultation.examinations"/></b>: ${item.examinations}%><br>
                        <b><fmt:message key="consultation.treatment"/></b>: ${item.treatment}<br>
                        <b><fmt:message key="consultation.recomendations"/></b>: ${item.recomendations}<br>
                    </p>
                </div>
            </div>
        </li>
    </c:forEach>

</ul>
<button class="btn btn-primary btn-block not-print" onclick="window.print()">
    <fmt:message key="action.export"/>&nbsp;<i class="fa  fa-print"></i>
</button>
