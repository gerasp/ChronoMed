<h3 class="text-center"><fmt:message key="navigation.doctors"/></h3>
<div class="list-group">
    <c:forEach items="${doctors}" var="item">
        <a class="list-group-item">
        <span class="pull-right label label-primary label-telefon"><i
                class="fa fa-phone"></i>&nbsp;${item.phoneNumber}</span>
            <h4 class="list-group-item-heading">${item.name}&nbsp;${item.surname}</h4>
            <p class="list-group-item-text">
                    ${item.speciality}&nbsp;|&nbsp;<fmt:message key="form.boardNumber"/>:&nbsp;${item.boardNumber}
            </p>
        </a>
    </c:forEach>
    <c:if test="${doctors==null}">
        <div class="well text-center">
            <i class="fa fa-exclamation-circle"></i>&nbsp;<fmt:message key="search.doctor.notFound"/>
        </div>
    </c:if>
</div>
