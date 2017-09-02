<%
    if (request.getAttribute("result") != null) {
        int result = (Integer) request.getAttribute("result");
%>
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
                    <% switch (result) {
                        case 1: %>
                    <fmt:message key="modal.content.info"/>
                    <% break;
                        case 2: %>
                    <fmt:message key="modal.content.wrongPassword"/>
                    <% break;
                        case 3: %>
                    <fmt:message key="modal.content.addConsultation"/>
                    <% break;
                        case 4: %>
                    <fmt:message key="modal.content.error"/>
                    <% break; }%>

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
<%}%>
