<c:if test="${result!=null}">
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><i class="fa fa-info-circle"></i>&nbsp;<fmt:message key="modal.title.info"/>
                    </h4>
                </div>
                <div class="modal-body">
                    <p>
                        <display:column>
                            <c:choose>
                                <c:when test="${result == 0}"><fmt:message key="modal.content.infoCreated"/></c:when>
                                <c:when test="${result == 1}"><fmt:message key="modal.content.infoUptdated"/></c:when>
                                <c:when test="${result == 2}"><fmt:message key="modal.content.wrongPassword"/></c:when>
                                <c:when test="${result == 3}"><fmt:message key="modal.content.addConsultation"/></c:when>
                                <c:when test="${result == 4}"><fmt:message key="modal.content.error"/></c:when>
                                <c:when test="${result == 5}"><fmt:message key="modal.content.wrongEmailOrPassword"/></c:when>
                                <c:when test="${result == 6}"><fmt:message key="search.patient.notFound"/></c:when>
                                <c:when test="${result == 7}"><fmt:message key="search.doctor.notFound"/></c:when>
                                <c:otherwise>undefined</c:otherwise>
                            </c:choose>
                        </display:column>
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">&nbsp;<fmt:message
                            key="action.close"/></button>
                </div>
            </div>
        </div>
    </div>
    <script> $("#myModal").modal("show")</script>
</c:if>