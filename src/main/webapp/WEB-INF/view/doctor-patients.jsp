<c:choose>
    <c:when test="${patients!=null}">
        <div class="row">
            <div class="col-md-12">
                <form method="get" action="<c:url value="/doctor/patients/search"/>" class="form-horizontal">
                    <div class="input-group input-group-lg">
                        <input type="text" name="idCard" class="form-control"
                               placeholder="<fmt:message key="form.idcard" />">
                        <span class="input-group-addon">
                            <button type="submit" class="btn-link"><i class="fa fa-search"></i></button>
                        </span>
                    </div>
                </form>
            </div>
        </div>
        <ul class="list-group">
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

