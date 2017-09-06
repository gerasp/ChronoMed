<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion"
               href="#patient-address"><fmt:message key="form.data.address"/></a>
        </h4>
    </div>
    <div id="patient-address" class="panel-collapse collapse">
        <div class="panel-footer">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group required">
                        <form:label path="address" cssClass="control-label">
                            <fmt:message key="form.address"/>
                        </form:label>
                        <form:input path="address" cssClass="form-control"/>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group required">
                        <form:label path="locality" cssClass="control-label">
                            <fmt:message key="form.locality"/>
                        </form:label>
                        <form:input path="locality" cssClass="form-control"/>
                    </div>
                    <div class="form-group required">
                        <form:label path="zipCode" cssClass="control-label">
                            <fmt:message key="form.zipCode"/>
                        </form:label>
                        <form:input path="zipCode" cssClass="form-control"/>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group required">
                        <form:label path="province" cssClass="control-label">
                            <fmt:message key="form.province"/>
                        </form:label>
                        <form:input path="province" cssClass="form-control"/>
                    </div>
                    <div class="form-group required">
                        <form:label path="country" cssClass="control-label">
                            <fmt:message key="form.country"/>
                        </form:label>
                        <form:select path="country" cssClass="form-control">
                            <% String[] locales = Locale.getISOCountries();
                                for (String countryCode : locales) {
                                    Locale obj = new Locale(request.getLocale().getLanguage(), countryCode); %>
                            <form:option value="<%=countryCode%>"><%=obj.getDisplayCountry()%></form:option>
                            <% } %>
                        </form:select>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
