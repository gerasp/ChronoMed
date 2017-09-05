<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
               href="#contact"><fmt:message key="form.data.contact"/></a>
        </h4>
    </div>
    <div id="contact" class="panel-collapse collapse">
        <div class="panel-footer">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group required">
                        <form:label path="phoneNumber" cssClass="control-label">
                            <fmt:message key="form.phoneNumber"/>
                        </form:label>
                        <form:input path="phoneNumber" cssClass="form-control"/>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <form:label path="alternativePhoneNumber" cssClass="control-label">
                            <fmt:message key="form.alternativePhoneNumber"/>
                        </form:label>
                        <form:input path="alternativePhoneNumber" cssClass="form-control"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>