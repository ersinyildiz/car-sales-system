<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="tr">
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" >
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/cover.css" >
    <link rel="stylesheet" href="/css/carsales.css">
    <title>Title</title>
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
        <div class="login-form">
            <h3 class="text-center text-light">Giriş Yap</h3><hr class="border-secondary"/>
            <form action="login" method="post" class="pt-0">
                <div class="form-group">
                    <font class="text-danger">
                        <c:if test="${not empty param.loginFailed}">
                            <c:out value="Kullanıcı adı veya parola yanlış!"></c:out>
                        </c:if>
                    </font>
                </div>
                <div class="form-group">
                    <input type="text" name="username" class="text-dark form-control" placeholder="Kullanıcı Adı" required="required">
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="text-dark form-control" placeholder="Şifre" required="required">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-warning btn-block">Giriş</button>
                </div>
                <div class="form-group">
                    <label class="float-left form-check-label"><input type="checkbox" name="remember-me"> Beni Hatırla </label>
                    <a href="/register" class="float-right text-primary">Kayıt Ol</a>
                </div>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            </form>
            <div class="mt-2">
                <a href="/index" class="text-success">
                    <i class="fa fa-hand-o-left mr-sm-2" aria-hidden="true"></i>Geri Dön
                </a>
            </div>
        </div>
    </main>

    <footer class="mastfoot mt-auto">
        <div class="inner">
            Designed by, <a href="#" >Ersin YILDIZ</a>
        </div>
    </footer>
</div>
</body>
</html>