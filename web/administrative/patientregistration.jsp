<%@include file="/header.jsp" %>
<body class="body-background">
<%@include file="navigation.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="signin-form-container">
                <form class="form-vertical" role="form" action="/FrontController" method="POST">
                    <input type="hidden" value="RegisterPatientCommand" name="command">
                    <div class="row">
                        <div class="col-md-2">
                            <a href="/administrative/patientmanagement.jsp"
                               class="btn btn-block btn-lg btn-link "><i class="fa fa-arrow-circle-left"></i> Atr�s</a>
                        </div>
                        <div class="col-md-8">
                            <h1 class="form-title text-center">Formulario de registro de pacientes</h1>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-block btn-lg btn-link pull-right">Registrar<i
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
                                        <label for="inputName" class="control-label"><fmt:message key="form.name" /></label>
                                        <input type="text" class="form-control" name="name" id="inputName"
                                               placeholder="Fulano" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputSurname" class="control-label"><fmt:message key="form.surname" /></label>
                                        <input type="text" class="form-control" name="surname" id="inputSurname"
                                               required placeholder="De Tal De Cual">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputIdcard" class="control-label"><fmt:message key="form.idcard" /></label>
                                        <input type="text" class="form-control" name="nif" id="inputIdcard" required
                                               placeholder="65764330F">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputBirthDate" class="control-label">Fecha de nacimiento</label>
                                        <input type="date" class="form-control" name="birthdate" required
                                               id="inputBirthDate" placeholder="1 de enero de 1970">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputGender" class="control-label"><fmt:message key="form.gender" /></label>
                                        <select class="form-control" name="gender" id="inputGender">
                                            <option><fmt:message key="form.gender.male" /></option>
                                            <option><fmt:message key="form.gender.female" /></option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputNationality" class="control-label">Nacionalidad</label>
                                        <input type="text" class="form-control" name="nationality" required
                                               id="inputNationality" placeholder="Espa�a">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer"><fmt:message key="form.mandatoryFields.all" /></div>
                    </div>

                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title text-left">Tarjetas sanitarias</h3>
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
                                               placeholder="23461256012578">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-3">
                                        <button type="button" onclick="addHealthCard()"
                                                class="btn btn-primary btn-block"><i
                                                class="-circle fa  fa-plus-circle"></i>A�adir tarjeta sanitaria&nbsp;
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title text-left">Datos de contacto</h3>
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="inputAddress" class="control-label">Direcci�n*</label>
                                        <input type="text" class="form-control" id="inputAddress" required
                                               name="address" placeholder="Calle de la Salud 55">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputLocality" class="control-label">Localidad*</label>
                                        <input type="" class="form-control" id="inputLocality" required name="locality"
                                               placeholder="G�ldar">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputZipcode" class="control-label">C�digo postal*</label>
                                        <input type="text" class="form-control" id="inputZipcode" required
                                               name="zipCode" placeholder="12345">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputProvince" class="control-label">Provincia*</label>
                                        <input type="text" class="form-control" id="inputProvince" required
                                               name="province" placeholder="Las Palmas">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="inputCountry" class="control-label">Pa�s*</label>
                                        <input type="" class="form-control" id="inputCountry" required name="country"
                                               placeholder="Espa�a">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPhoneNumber" class="control-label">Tel�fono principal*</label>
                                        <input type="tel" class="form-control" id="inputPhoneNumber" required
                                               name="phoneNumber" placeholder="928555666">
                                    </div>
                                    <div class="form-group">
                                        <label for="inputAlternativePhoneNumber" class="control-label">Tel�fono
                                            alternativo</label>
                                        <input type="tel" class="form-control" id="inputAlternativePhoneNumber"
                                               name="alternativePhoneNumber" placeholder="666777888">
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
                                        <label for="inputEmail" class="control-label"><fmt:message key="form.email" />*</label>
                                        <input type="email" name="email" class="form-control" id="inputEmail"
                                               placeholder="ejemplo@ejemplo.com">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">*<fmt:message key="form.mandatoryFields" /></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function addHealthCard() {
        var healthcard = $("#inputHealthCard").val();
        if (healthcard === "")
            return;
        var html = "<li class='health-card-item'> <input value='" + healthcard + "' name='healthCardsList' style='border:0; background:none;'> <button onclick='this.parentNode.remove()' class='btn btn-danger btn-xs pull-right'><i class='fa  fa-remove'></i> Eliminar</button></li>";
        $("#healthCards").append(html);
    }

    function deleteHealthCard(button) {
        button.parentNode.remove();
    }
</script>
<%@include file="/footer.jsp" %>
</body>
</html>