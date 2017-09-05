<div class="cover" id="intro">
    <div class="background-image-fixed cover-image"
         style="background-image : url('<c:url value="/static/images/cover.jpeg"/>')"></div>
    <div class="container">
        <div class="row form">
            <div class="col-md-5 logo">
                <img src="<c:url value="/static/images/ChronoMed.png"/>" class="center-block img-responsive logo">
            </div>
            <div class="col-md-7 signin-form">
                <form:form action="login" modelAttribute="user" cssClass="form-horizontal text-right signin-container">
                    <ul class="nav nav-justified nav-tabs">
                        <li class="active">
                            <a href="#"><i class="fa fa-lg fa-user"></i><fmt:message key="index.login.patient"/><br></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-lg fa-md"></i><fmt:message key="index.login.doctor"/><br></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-lg fa-briefcase"></i><fmt:message key="index.login.admin"/><br></a>
                        </li>
                    </ul>
                    <div class="container">
                        <div class="row">
                            <form:errors path="*" element="div" cssClass="col-md-12 alert alert-danger text-center"/>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                        <fmt:message key="form.email" var="emailPlaceholder"/>
                                        <form:input path="email" cssClass="form-control"
                                                    placeholder="${emailPlaceholder}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                        <fmt:message key="form.password" var="passwordPlaceholder"/>
                                        <form:password path="password" cssClass="form-control"
                                                       placeholder="${passwordPlaceholder}"/>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <form:button class="btn btn-lg btn-primary">
                                        <i class="fa fa-2x fa-sign-in"></i><br><fmt:message key="form.login"/>
                                    </form:button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>