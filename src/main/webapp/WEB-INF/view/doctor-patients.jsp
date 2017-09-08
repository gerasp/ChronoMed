<c:choose>
    <c:when test="${patients!=null}">
        <div class="row">
            <div class="col-md-12">
                <div class="form-horizontal" style="margin-bottom:20px;">
                    <div class="input-group input-group-lg">
                        <input id="id-card-input" type="text" name="idCard" class="form-control"
                               placeholder="<fmt:message key="form.idcard" />">
                        <span class="input-group-addon">
                            <div id="id-card-search" class="btn-link"><i class="fa fa-search"></i></div>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <ul class="list-group" id="patient-list">
            <c:forEach items="${patients}" var="item">
                <a href='<c:url value="/doctor/patient" />?idCard=${item.idCard}' class="list-group-item">
                    <h4 class="list-group-item-heading">${item.name}&nbsp;${item.surname}
                        <i class="fa fa-2x  pull-right text-primary fa-angle-right"></i>
                    </h4>
                    <p class="list-group-item-text">${item.idCard}</p>
                </a>
            </c:forEach>
        </ul>
    </c:when>
    <c:otherwise>
        <div class="well text-center">
            <i class="fa fa-exclamation-circle"></i>&nbsp;<fmt:message key="modal.content.patientNotFound"/>
        </div>
    </c:otherwise>
</c:choose>

<script>
    $("#id-card-input").on('input',function(e){
        var idCard = $("#id-card-input").val();
        $("#patient-list").children().each(function () {
            var actual = $(this).find(".list-group-item-text").text();
            if (actual.includes(idCard)) $(this).show();
            else $(this).hide();
        });
    });

</script>