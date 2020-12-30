<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>


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
        <div class="signup-form">
            <h3 class="text-center text-light">Kayıt Ol</h3><hr class="border-secondary"/>
            <div class="">
                <c:if test="${alreadyExistsEmail ne null}">
                    <i class="fa fa-exclamation-circle text-danger">  ${alreadyExistsEmail}</i>
                </c:if>
                <c:if test="${alreadyExistsUsername ne null}">
                    <i class="fa fa-exclamation-circle text-danger">  ${alreadyExistsUsername}</i>
                </c:if>
            </div>
            <%--@elvariable id="createUser" type=""--%>
            <form:form action="register" method="post" modelAttribute="createUser">
                <div class="form-group">
                    <form:input path="username" class="text-dark form-control" placeholder="Kullanıcı Adı" required="required"/>
                </div>
                <div class="form-group">
                    <form:input path="email" type="email" class="text-dark form-control" name="email" placeholder="Email" required="required"/>
                </div>
                <div class="form-group">
                    <form:input path="password" type="password" class="text-dark form-control" name="password" placeholder="Şifre" required="required"/>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Kayıt Ol</button>
                </div>
                <div class="text-center text-light">Zaten bir hesabım var? <a href="/login" class="text-primary">Giriş Yap</a></div>
            </form:form>
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