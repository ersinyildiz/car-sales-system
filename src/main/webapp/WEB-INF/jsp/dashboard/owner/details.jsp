<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="tr">
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
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
            <hr class="hr-text" data-content="İlan Sahibi Bilgileri">
            <div class="owner-detail">
                <div class="card">
                    <div class="text-center">
                        <h5 class="card-header"> Kişi Bilgileri
                            <a class="btn btn-primary btn-sm text-light ml-3" href="#">Düzenle</a>
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="mt-2">
                            <div class="row">
                                <div class="col-lg-6 col-sm-12">
                                    <span class="card-text"><i class="fa fa-user mr-2"></i><span
                                        class="font-weight-bold">İsim Soyisim:</span> ${owner.firstName} ${owner.lastName}</span>
                                </div>
                                <div class="col-lg-6 col-sm-12">
                                <span class="card-text"><i class="fa fa-envelope mr-2"></i><span
                                        class="font-weight-bold">Mail adresi:</span> - </span>
                                </div>
                                <div class="col-lg-6 col-sm-12 mt-2">
                                <span class="card-text mr-2"><i class="fa fa-phone"></i> <span
                                        class="font-weight-bold">Telefon numarası:</span> ${owner.phoneNumber}</span>
                                </div>
                                <div class="col-lg-6 col-sm-12 mt-2">
                                <span class="card-text"><i class="fa fa-map-marker-alt mr-1"></i> <span
                                        class="font-weight-bold">Adres bilgisi:</span> ${owner.address.county.name}/${owner.address.city.name} </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <hr/>

                <div class="card mt-3">
                    <div class="text-center">
                        <h5 class="card-header">
                            <span> Mevcut İlanları </span>
                        </h5>
                    </div>
                    <div class="card-body">
                        <c:if test="${owner.cars.size() eq 0}">
                            <div class="alert alert-danger text-center" role="alert">
                                <i class="fa fa-exclamation-triangle mr-2"></i> İlan bulunamadı
                            </div>
                        </c:if>
                        <div class="row">
                            <c:forEach items="${owner.cars}" var="car">
                                <c:if test="${car.getPhotoSet().isEmpty() ne true}">
                                    <div class="col-lg-6 mb-4">
                                        <div class="card">
                                            <div class="card-body">
                                                <h5 class="card-title">${car.advert.title}</h5>
                                                <hr/>
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <span> <b>Marka:</b> ${car.brand}</span><br/>
                                                        <span> <b>Model:</b> ${car.model} </span><br/>
                                                        <span> <b>Km:</b> ${car.km} </span><br/>
                                                        <span> <b>Yıl:</b> ${car.year}</span><br/>
                                                        <span> <b>Renk:</b> ${car.color}</span>
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <img width="200" height="120" src="data:image/jpg;base64,${car.getPhotoSet().stream().findFirst().get().getBase64Data()}" alt="First slide"/>
                                                    </div>
                                                </div>

                                                <div class="row mt-2">
                                                    <div class="col-lg-12 col-sm-12">
                                                        <span class="font-weight-bold">Açıklama: </span> ${car.advert.description} </span>
                                                    </div>
                                                </div>
                                                <div class="row mt-4 justify-content-center">
                                                    <a href="/advert/details/${car.advert.id}" class="btn btn-secondary btn-sm">İncele</a>
                                                </div>

                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>



                <hr/>

                <!-- ACTION SECTION START -->
                <c:if test="${admin ne null}">
                    <div class="row">
                        <div class="col-lg-12 col-sm-12 text-center">
                            <a href="#myModal" data-toggle="modal" class="btn btn-danger text-white">
                                Hayvan Sahibini Kalıcı Olarak Sil
                            </a>
                        </div>
                    </div>
                </c:if>

                <!-- ACTION SECTION END -->
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