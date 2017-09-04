<div class="panel panel-primary">
    <div class="panel-heading">
        <h3 class="panel-title text-left"><fmt:message key="form.data.personal"/></h3>
    </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group required">
                    <form:label path="name" cssClass="control-label">
                        <fmt:message key="form.name"/>
                    </form:label>
                    <form:input path="name" cssClass="form-control"/>
                </div>
                <div class="form-group required">
                    <form:label path="surname" cssClass="control-label">
                        <fmt:message key="form.surname"/>
                    </form:label>
                    <form:input path="surname" cssClass="form-control"/>
                </div>
                <div class="form-group required">
                    <form:label path="idCard" cssClass="control-label">
                        <fmt:message key="form.idcard"/>
                    </form:label>
                    <form:input path="idCard" cssClass="form-control"/>
                </div>
                <div class="form-group required">
                    <form:label path="gender" cssClass="control-label">
                        <fmt:message key="form.gender"/>
                    </form:label>
                    <form:select path="gender" cssClass="form-control">
                        <form:option value="male"><fmt:message key="form.gender.male"/></form:option>
                        <form:option value="female"><fmt:message key="form.gender.female"/></form:option>
                    </form:select>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group required">
                    <form:label path="speciality" cssClass="control-label">
                        <fmt:message key="form.speciality"/>
                    </form:label>
                    <form:input path="speciality" cssClass="form-control"/>
                </div>
                <div class="form-group required">
                    <form:label path="boardNumber" cssClass="control-label">
                        <fmt:message key="form.boardNumber"/>
                    </form:label>
                    <form:input path="boardNumber" cssClass="form-control"/>
                </div>
                <div class="form-group required">
                    <form:label path="phoneNumber" cssClass="control-label">
                        <fmt:message key="form.phoneNumber.main"/>
                    </form:label>
                    <form:input path="phoneNumber" cssClass="form-control"/>
                </div>
                <div class="form-group required">
                    <form:label path="alternativePhoneNumber" cssClass="control-label">
                        <fmt:message key="form.phoneNumber.alternative"/>
                    </form:label>
                    <form:input path="alternativePhoneNumber" cssClass="form-control"/>
                </div>
            </div>
        </div>
    </div>
    <div class="panel-footer">*<fmt:message key="form.requiredFields.some"/></div>
</div>