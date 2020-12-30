<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="tr">
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/cover.css" >
    <title>Title</title>
    <style>

    </style>
</head>
<body class="text-center">
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <header class="masthead mb-auto">
        <div class="inner">
            <h1 class="text-info">Araç Satış Sistemi</h1>
            <hr class="border-light"/>
        </div>
    </header>

    <main role="main" class="inner cover">
        <p class="lead text-light"><span class="font-weight-bold">Araç Satış Sistemi</span> Spring Boot teknolojilerinin kullanılması adına geliştirilmiştir.
        </p>
        <br/>
        <p class="lead text-light">
            <u><b>Proje Kapsamı</b></u>
            <br/>- Üye Kayıt/Giriş İşlemleri
            <br/>- (ROLE_USER için) Mevcut araç ilanlarının listelenmesi
            <br/>- (ROLE_ADMIN için) İlan ekleme, düzenleme ve silme
        </p>
        <br/>
        <p class="lead text-light"> <b>Kullanılan  teknolojiler:</b> Spring Boot + Spring MVC + Spring Security + JPA/Hibernate + H2 Database</p>
        <hr class="border-light"/>
        <s:authorize access="isAuthenticated()">
            <s:authorize access="hasRole('ADMIN')">
                <a href="/dashboard" class="btn btn-success btn-lg my-2">Yönetim Paneli</a>
                <form action="/logout" method="post" class="d-inline-block">
                    <button type="submit" class="btn btn-danger btn-lg my-2">Çıkış Yap</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </form>
            </s:authorize>
            <s:authorize access="hasRole('USER') and !hasRole('ADMIN')">
                <a href="/adverts" class="btn btn-success btn-lg my-2">İlanları Listele</a>
                <form action="/logout" method="post" class="d-inline-block">
                    <button type="submit" class="btn btn-danger btn-lg my-2">Çıkış Yap</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </form>
            </s:authorize>
        </s:authorize>
        <s:authorize access="isAnonymous()">
            <a href="/register" class="btn btn-primary btn-lg my-2">Kayıt Ol</a>
            <a href="/login" class="btn btn-warning btn-lg my-2">Giriş yap</a>
        </s:authorize>
    </main>

    <footer class="mastfoot mt-auto">
        <div class="inner">
            Designed by, <a href="#" >Ersin YILDIZ</a>
        </div>
    </footer>
</div>
</body>
</html>