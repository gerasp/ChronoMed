<%@ page import="net.gerardomedina.chronomed.entity.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="user" value='<%=request.getSession().getAttribute("user")%>'/>
<c:set var="language" value='<%=request.getSession().getAttribute("language")%>'/>
<c:if test="${language!=null}">
    <c:set var="language" value="${not empty param.language ?
    param.language : not empty language ?
    language : pageContext.request.locale}" scope="session"/>
</c:if>

<fmt:setLocale value="${language}" />
<fmt:setBundle basename="text" />

<fmt:requestEncoding value = "UTF-8" />
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="${language}">
<head>
    <title>ChronoMed</title>
    <link rel="icon" href="<c:url value="/static/images/favicon.ico"/>">

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css">
    <link rel="stylesheet" href="<c:url value="/static/css/bootstrap.css"/>">
    <link rel="stylesheet" href="<c:url value="/static/css/vendor.css"/>">
    <link rel="stylesheet" href="<c:url value="/static/css/custom.css"/>">
</head>
