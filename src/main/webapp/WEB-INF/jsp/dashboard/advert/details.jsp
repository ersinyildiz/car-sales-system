<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="tr">
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <!-- Our Custom CSS -->
    <link href="/css/custom.css" rel="stylesheet" type="text/css">
    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
    <title>Title</title>
</head>
<body>
<div class="wrapper">
    <!-- Sidebar  -->
    <nav id="sidebar">
        <div class="sidebar-header text-center">
            <h3>Yönetim Paneli</h3>
        </div>
        <ul class="list-unstyled components">
            <li>
                <a href="#userSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Kullanıcılar</a>
                <ul class="collapse list-unstyled" id="userSubmenu">
                    <li>
                        <a href="/user/users">Kullanıcıları Listele</a>
                    </li>
                    <li>
                        <a href="/user/search">Kullanıcı Ara</a>
                    </li>

                </ul>
            </li>
            <li>
                <a href="#adSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">İlanlar</a>
                <ul class="collapse list-unstyled" id="adSubmenu">
                    <li>
                        <a href="/advert/add">İlan Ekle</a>
                    </li>
                    <li>
                        <a href="/advert/adverts">İlanları Listele</a>
                    </li>
                    <li>
                        <a href="/advert/search">İlan Ara</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#ownerSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">İlan Sahipleri</a>
                <ul class="collapse list-unstyled" id="ownerSubmenu">
                    <li>
                        <a href="/owner/add">İlan Sahibi Ekle</a>
                    </li>
                    <li>
                        <a href="/owner/owners">İlan Sahipleri Listele</a>
                    </li>
                    <li>
                        <a href="/owner/search">İlan Sahibi Ara</a>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>

    <!-- Page Content  -->
    <div id="content">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <button type="button" id="sidebarCollapse" class="btn btn-dark">
                    <i class="fas fa-align-left"></i>
                </button>

                <form action="/logout" method="post">
                    <label class="mr-1">Hoşgeldiniz, <b><s:authentication property="name"/></b></label>
                    <button type="button" class="btn btn-outline-danger">Çıkış Yap</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                </form>
            </div>
        </nav>
        <div class="container">
            <hr class="hr-text" data-content="İlan Detayları">
            <div class="container-fluid mt-5">
                <h2>${advert.getTitle()}</h2>
                <div class="row">
                    <div class="col-md-5 align-items-center justify-content-center d-flex">
                        <div class="carousel slide" data-ride="carousel" id="carousel-1">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active">
                                    <img class="img-thumbnail w-100 d-block" src="data:image/jpg;base64,${advert.getCar().getPhotoSet().stream().findFirst().get().getBase64Data()}" alt="Slide Image" loading="lazy">
                                </div>
                                <c:forEach items="${advert.getCar().getPhotoSet()}" begin="1" var="advertPhoto">
                                    <div class="carousel-item">
                                        <img class="img-thumbnail w-100 d-block" src="data:image/jpg;base64,${advertPhoto.getBase64Data()}" alt="Slide Image">
                                    </div>
                                </c:forEach>
                            </div>
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-1" data-slide-to="0" class="active"></li>
                                <c:forEach items="${advert.getCar().getPhotoSet()}" begin="1" varStatus="loop">
                                    <li data-target="#carousel-1" data-slide-to="${loop.index}"></li>
                                </c:forEach>
                            </ol>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="row">
                            <div class="col-md-7 mt-3">
                                <table class="table table-striped table-bordered">
                                    <tr>
                                        <td class="font-weight-bold">Marka</td>
                                        <td>${advert.getCar().getBrand()}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Model</td>
                                        <td>${advert.getCar().getModel()}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Yıl</td>
                                        <td>${advert.getCar().getYear()}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Km</td>
                                        <td>${advert.getCar().getKm()}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Renk</td>
                                        <td>${advert.getCar().getColor()}</td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold">Fiyat</td>
                                        <td class="text-danger font-weight-bold">${advert.getPrice()} TL</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-md-5 mt-3 text-right">
                                <div class="form-group border p-3">
                                    <h6 class="font-weight-bold d-block">${advert.getCar().getOwner().getFirstName()} ${advert.getCar().getOwner().getLastName()}</h6>
                                    <div class="d-block"><i class="fa fa-phone text-success"></i><span>&nbsp;&nbsp;${advert.getCar().getOwner().getPhoneNumber()}</span></div>
                                    <a class="btn btn-sm btn-success d-block mt-1" href="/owner/details/${advert.getCar().getOwner().getId()}">Profiline Git</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="card border-0 w-100">
                        <div class="card-header font-weight-bold">
                            Açıklama
                        </div>
                        <div class="card-body">
                            <p>
                                ${advert.getDescription()}
                            </p>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
<!-- jQuery CDN - Slim version (=without AJAX) -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<!-- Popper.JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<!-- jQuery Custom Scroller CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        // MDB Lightbox Init
        $(function () {
            $("#mdb-lightbox-ui").load("mdb-addons/mdb-lightbox-ui.html");
        });

        $("#sidebar").mCustomScrollbar({
            theme: "minimal"
        });

        $('#sidebarCollapse').on('click', function () {
            $('#sidebar, #content').toggleClass('active');
            $('.collapse.in').toggleClass('in');
            $('a[aria-expanded=true]').attr('aria-expanded', 'false');
        });


    });
</script>
</body>
</html>