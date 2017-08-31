<%String message = (String) request.getAttribute("message");
    if (message != null) {
%>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><i class="fa fa-info-circle"></i> Información importante</h4>
            </div>
            <div class="modal-body">
                <p><%=message%></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
        </div>

    </div>
</div>
<script> $("#myModal").modal("show")</script>
<%}%>