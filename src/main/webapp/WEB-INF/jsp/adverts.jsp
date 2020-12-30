<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="tr">
<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="/css/cover.css" rel="stylesheet" type="text/css" >
    <link href="/css/table.css" rel="stylesheet" type="text/css" >
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

    <main role="main" class="inner mt-3">
        <div class="justify-content-center pl-3 pr-3" style="min-height: 35px;">
            <div class="d-inline-block float-left mt-sm-2">
                <a href="/index"><i class="fa fa-backward text-primary">  Geri Dön</i></a>
            </div>
            <form action="/logout" method="post" class="d-inline-block float-right ">
                <button type="submit" class="btn btn-danger btn-sm my-2">Çıkış Yap</button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            </form>
        </div>
        <div class="container-fluid d-flex h-75">
            <div class="table-wrapper">
                <div class="table-title">
                        <div class="row">
                            <div class="col-sm-12 text-center">
                                <h2>İlanlar</h2>
                            </div>
                        </div>
                    </div>
                <c:if test="${carList.size() ne 0}">
                        <table class="table table-responsive h-75">
                            <thead>
                            <tr>
                                <th>Marka</th>
                                <th>Model</th>
                                <th>Yıl</th>
                                <th>KM</th>
                                <th>Renk</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${carList}" var="car">
                                <tr>
                                    <td><c:out value="${car.brand}"/></td>
                                    <td><c:out value="${car.model}"/></td>
                                    <td><c:out value="${car.year}"/></td>
                                    <td><c:out value="${car.km}"/></td>
                                    <td><c:out value="${car.color}"/></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
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