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
                        <display:column>
                            <c:choose>
                                <c:when test="${result.equals('info')}"><fmt:message key="modal.content.info"/></c:when>
                                <c:when test="${result.equals('wrongPassword')}"><fmt:message key="modal.content.wrongPassword"/></c:when>
                                <c:when test="${result.equals('error')}"><fmt:message key="modal.content.error"/></c:when>
                                <c:when test="${result.equals('wrongEmailOrPassword')}"><fmt:message key="modal.content.wrongEmailOrPassword"/></c:when>
                                <c:when test="${result.equals('patientNotFound')}"><fmt:message key="search.patient.notFound"/></c:when>
                                <c:when test="${result.equals('doctorNotFound')}"><fmt:message key="search.doctor.notFound"/></c:when>
                                <c:when test="${result.equals('notActive')}"><fmt:message key="modal.content.notActive"/></c:when>
                            </c:choose>
                        </display:column>
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