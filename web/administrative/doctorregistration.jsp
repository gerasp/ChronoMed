<%@include file="/header.jsp" %>
<body class="body-background">
<%@include file="navigation.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <form class="form-vertical" role="form" action="/FrontController" method="POST">
                <input type="hidden" value="RegisterDoctorCommand" name="command">
                <div class="signin-form-container">
                    <div class="row">
                        <div class="col-md-2">
                            <a href="/administrative/doctormanagement.jsp" class="btn btn-block btn-lg btn-link "><i
                                    class="fa fa-arrow-circle-left"></i> Atr�s</a>
                        </div>
                        <div class="col-md-8">
                            <h1 class="form-title text-center">Formulario de registro de m�dicos</h1>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-block btn-lg btn-link pull-right ">Registrar<i
                                    class="fa  -circle fa-check-circle"></i></button>
                        </div>
                    </div>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title text-left"><fmt:message key="form.personalData" /></h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputName" class="control-label"><fmt:message key="form.name" />*</label>
                                        <input type="text" class="form-control" required name="name" id="inputName"
                                               placeholder="Fulano">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputSurname" class="control-label"><fmt:message key="form.surname" />*</label>
                                        <input type="text" class="form-control" required name="surname"
                                               id="inputSurname" placeholder="De Tal De Cual">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputIdcard" class="control-label"><fmt:message key="form.idcard" />*</label>
                                        <input type="text" class="form-control" required name="nif" id="inputIdcard"
                                               placeholder="123452343Q">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputGender" class="control-label"><fmt:message key="form.gender" />*</label>
                                        <select class="form-control" name="gender" id="inputGender">
                                            <option><fmt:message key="form.gender.male" /></option>
                                            <option><fmt:message key="form.gender.female" /></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputSpeciality" class="control-label"><fmt:message key="form.speciality" />*</label>
                                        <input type="text" class="form-control" required name="speciality"
                                               id="inputSpeciality" placeholder="Ginecolog�a">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputBoardNumber" class="control-label"><fmt:message key="form.boardNumber" />*</label>
                                        <input type="number" class="form-control" required name="boardNumber"
                                               id="inputBoardNumber" placeholder="4329509837">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPhoneNumber" class="control-label"><fmt:message key="form.phoneNumber.main" />*</label>
                                        <input type="tel" class="form-control" required name="phoneNumber"
                                               id="inputPhoneNumber" placeholder="2352363123">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputALternativePhoneNumber" class="control-label"><fmt:message key="form.phoneNumber.alternative" />*</label>
                                        <input type="tel" class="form-control" required name="alternativePhoneNumber"
                                               id="inputAlternativePhoneNumber" placeholder="7245623451">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">*<fmt:message key="form.mandatoryFields" /></div>
                    </div>

                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title text-left"><fmt:message key="form.accessData" /></h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="inputEmail" class="control-label"><fmt:message key="form.email" /></label>
                                        <input type="email" name="email" class="form-control" id="inputEmail"
                                               placeholder="ejemplo@ejemplo.com">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer"><fmt:message key="form.mandatoryFields.all" /></div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="/footer.jsp" %>
</body>
</html>