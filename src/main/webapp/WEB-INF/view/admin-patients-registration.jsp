<%@include file="header.jsp" %>
<body class="body-background">
<%@include file="admin-navigation.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="white-container">
                <form class="form-vertical" role="form" action="/FrontController" method="POST">
                    <input type="hidden" value="RegisterPatientCommand" name="command">
                    <div class="row">
                        <div class="col-md-2">
                            <a href="/admin/patient/management.jsp"
                               class="btn btn-block btn-lg btn-link "><i class="fa fa-arrow-circle-left"></i>&nbsp<fmt:message key="form.back" /></a>
                        </div>
                        <div class="col-md-8">
                            <h1 class="form-title text-center">&nbsp<fmt:message key="form.patient.registration" /></h1>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-block btn-lg btn-link pull-right"><fmt:message key="form.submit" />&nbsp<i
                                    class="fa  fa-check-circle"></i></button>
                        </div>
                    </div>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title text-left"><fmt:message key="form.data.personal"/></h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputName" class="control-label"><fmt:message
                                                key="form.name"/></label>
                                        <input type="text" class="form-control" name="name" id="inputName"
                                               placeholder="" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputSurname" class="control-label"><fmt:message
                                                key="form.surname"/></label>
                                        <input type="text" class="form-control" name="surname" id="inputSurname"
                                               required placeholder="">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputIdcard" class="control-label"><fmt:message
                                                key="form.idcard"/></label>
                                        <input type="text" class="form-control" name="idCard" id="inputIdcard" required
                                               placeholder="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputBirthDate" class="control-label"><fmt:message
                                                key="form.birthday"/></label>
                                        <input type="date" class="form-control" name="birthdate" required
                                               id="inputBirthDate" placeholder="1 de enero de 1970">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputGender" class="control-label"><fmt:message
                                                key="form.gender"/></label>
                                        <select class="form-control" name="gender" id="inputGender">
                                            <option><fmt:message key="form.gender.male"/></option>
                                            <option><fmt:message key="form.gender.female"/></option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputNationality" class="control-label"><fmt:message
                                                key="form.nationality"/></label>
                                        <input type="text" class="form-control" name="nationality" required
                                               id="inputNationality" placeholder="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer"><fmt:message key="form.requiredFields.all"/></div>
                    </div>

                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title text-left"><fmt:message key="form.healthcards"/></h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <ul class="list-unstyled" id="healthCards">

                                        </ul>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <input type="number" class="form-control" id="inputHealthCard"
                                               placeholder="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-6">
                                        <button type="button" onclick="addHealthCardRegistration()"
                                                class="btn btn-primary btn-block"><i
                                                class="-circle fa  fa-plus-circle"></i>&nbsp;<fmt:message
                                                key="form.healthcards.add"/>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title text-left"><fmt:message key="form.data.contact"/></h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="inputAddress" class="control-label"><fmt:message
                                                key="form.address"/>*</label>
                                        <input type="text" class="form-control" id="inputAddress" required
                                               name="address" placeholder="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputLocality" class="control-label"><fmt:message
                                                key="form.locality"/>*</label>
                                        <input type="text" class="form-control" id="inputLocality" required
                                               name="locality"
                                               placeholder="">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputZipcode" class="control-label"><fmt:message
                                                key="form.postalCode"/>*</label>
                                        <input type="text" class="form-control" id="inputZipcode" required
                                               name="zipCode" placeholder="">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputProvince" class="control-label"><fmt:message
                                                key="form.province"/>*</label>
                                        <input type="text" class="form-control" id="inputProvince" required
                                               name="province" placeholder="">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputCountry" class="control-label"><fmt:message
                                                key="form.country"/>*</label>
                                        <input type="text" class="form-control" id="inputCountry" required
                                               name="country"
                                               placeholder="">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPhoneNumber" class="control-label"><fmt:message
                                                key="form.phoneNumber.main"/>*</label>
                                        <input type="tel" class="form-control" id="inputPhoneNumber" required
                                               name="phoneNumber" placeholder="">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputAlternativePhoneNumber" class="control-label"><fmt:message
                                                key="form.phoneNumber.alternative"/></label>
                                        <input type="tel" class="form-control" id="inputAlternativePhoneNumber"
                                               name="alternativePhoneNumber" placeholder="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">*<fmt:message key="form.requiredFields.some"/></div>
                    </div>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title text-left"><fmt:message key="form.data.access"/></h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="inputEmail" class="control-label"><fmt:message
                                                key="form.email"/>*</label>
                                        <input type="email" name="email" class="form-control" id="inputEmail"
                                               placeholder="ejemplo@ejemplo.com">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">*<fmt:message key="form.requiredFields.some"/></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>

</script>
<%@include file="footer.jsp" %>
</body>
</html>