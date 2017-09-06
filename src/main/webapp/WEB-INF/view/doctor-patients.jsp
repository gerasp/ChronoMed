
<c:choose>
    <c:when test="${patients!=null}">
        <div class="row">
            <div class="col-md-12">
                <form class="form-horizontal">
                    <div class="input-group input-group-lg">
                        <input type="text" class="form-control" placeholder="<fmt:message key="form.idcard" />">
                        <span class="input-group-addon">
                <button class="btn-link"><i class="fa fa-search"></i></button>
            </span>
                    </div>
                </form>
            </div>
        </div>
        <ul class="list-group">
            <c:forEach items="${patients}" var="item">
                <ul href="" class="list-group-item">
                    <h4 class="list-group-item-heading">${item.name}&nbsp;${item.surname}
                        <i class="fa fa-2x  pull-right text-primary fa-angle-right"></i>
                    </h4>
                    <p class="list-group-item-text">${item.idCard}</p>
                </ul>
            </c:forEach>
        </ul>
    </c:when>
    <c:otherwise>
        <div class="well text-center">
            <i class="fa fa-exclamation-circle"></i>&nbsp;<fmt:message key="search.patient.notFound"/>
        </div>
    </c:otherwise>
</c:choose>

