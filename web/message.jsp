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

<div class="modal fade" id="myModal2" role="dialog" style="padding-top: 50px;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><i class="fa fa-globe"></i>&nbsp;<fmt:message key="language.settings" /></h4>
            </div>
            <form class="form-horizontal" style="padding: 50px;">
                <fieldset>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="language"><fmt:message key="language.select" /></label>
                        <div class="col-md-9 input-group">
                            <select id="language" name="language" onchange="submit()" class="form-control">
                                <option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
                                <option value="es" ${language == 'es' ? 'selected' : ''}>Español</option>
                                <option value="de" ${language == 'de' ? 'selected' : ''}>Deutsch</option>
                            </select>
                            <span class="input-group-addon" id="basic-addon1"><img src="/images/flags/${language}.png"></span>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>

    </div>
</div>
<script>

    $("#openModal2Button").click(function () {
        $("#myModal2").modal("show")
    });
</script>