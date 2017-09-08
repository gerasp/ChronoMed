<c:choose>
    <c:when test='${consultations!=null}'>
        <div class="row">
            <div class="col-md-12">
                <div class="input-group">
                    <div class="input-group-addon"><fmt:message key="consultation.year"/></div>
                    <input type="number" min="1970" max="2040" id="year-input" class="form-control">
                </div>
            </div>
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
                                <small class="text-muted"><i class="fa fa-clock-o"></i>&nbsp;
                                    <time class="time">${date}</time>
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
        <div class="row not-print" style="margin-top: -20px">
            <div class="col-md-12">
                <button class="btn btn-primary btn-block" onclick="window.print()">
                    <fmt:message key="action.export"/>&nbsp;<i class="fa  fa-print"></i>
                </button>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="well text-center">
            <i class="fa fa-exclamation-circle"></i>&nbsp;<fmt:message key="modal.content.consultationNotFound"/>
        </div>
    </c:otherwise>
</c:choose>

<script>
    $("#year-input").on('input',function(e){
        var year = $("#year-input").val();
        $(".timeline").children().each(function () {
            var actual = $(this).find(".time").text();
            if (actual.includes(year)) $(this).show();
            else $(this).hide();
        });
    });
</script>