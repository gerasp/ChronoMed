<%@ page import="java.util.Locale" %>
<div class="panel panel-primary">
    <div class="panel-heading">
        <h4 class="panel-title collapsed">
            <a class="accordion-toggle panel-open-first" data-toggle="collapse" data-parent="#accordion"
               href="#patient-personal"><fmt:message key="form.data.personal"/></a>
        </h4>
    </div>
    <div id="patient-personal" class="panel-collapse collapse">
        <div class="panel-footer">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group required">
                        <form:label path="name">
                            <fmt:message key="form.name"/>
                        </form:label>
                        <form:input path="name" required="required" cssClass="form-control"/>
                    </div>
                    <div class="form-group required">
                        <form:label path="surname">
                            <fmt:message key="form.surname"/>
                        </form:label>
                        <form:input path="surname" required="required" cssClass="form-control"/>
                    </div>
                    <div class="form-group required">
                        <form:label path="idCard">
                            <fmt:message key="form.idcard"/>
                        </form:label>
                        <form:input path="idCard" required="required" cssClass="form-control"/>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group required">
                        <form:label path="gender">
                            <fmt:message key="form.gender"/>
                        </form:label>
                        <form:select path="gender" required="required" cssClass="form-control">
                            <form:option value="male"><fmt:message key="form.gender.male"/></form:option>
                            <form:option value="female"><fmt:message key="form.gender.female"/></form:option>
                        </form:select>
                    </div>
                    <div class="form-group required">
                        <fmt:formatDate value="${birthDate}" var="dateString" pattern="dd/MM/yyyy" />
                        <form:label path="birthDate">
                            <fmt:message key="form.birthDate"/>
                        </form:label>
                        <form:input type="date" path="birthDate" required="required" cssClass="form-control" value="${dateString}" />
                    </div>
                    <div class="form-group required">
                        <form:label path="nationality">
                            <fmt:message key="form.nationality"/>
                        </form:label>
                        <form:select path="nationality" required="required" cssClass="form-control">
                            <form:option value=""/>
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

