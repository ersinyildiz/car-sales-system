<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="tr">
<head>
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

    <!-- Our Custom CSS -->
    <link href="/css/custom.css" rel="stylesheet" type="text/css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>


    <title>Test Project</title>
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
                <hr class="hr-text" data-content="İlanlar">
                <div class="table-responsive text-center">
                    <c:if test="${advertList.size() ne 0}">
                        <table class="table table-bordered">
                            <thead class="table-secondary">
                            <tr>
                                <th>Fotoğraf</th>
                                <th>Marka</th>
                                <th>Model</th>
                                <th>İlan Başlığı</th>
                                <th>Fiyat</th>
                                <th>Konum</th>
                                <th>Detay</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${advertList}" var="advert">
                                    <td><img width="100" height="80" src="data:image/jpg;base64,${advert.getCar().getPhotoSet().stream().findFirst().get().getBase64Data()}" /></td>
                                    <td class="align-middle"><c:out value="${advert.car.getBrand()}"/></td>
                                    <td class="align-middle"><c:out value="${advert.car.getModel()}"/></td>
                                    <td class="align-middle"><c:out value="${advert.title}"/></td>
                                    <td class="align-middle"><c:out value="${advert.price} TL"/></td>
                                    <td class="align-middle"><c:out value="${advert.car.owner.address.county.getName()}/${advert.car.owner.address.city.getName()}"/></td>
                                    <td class="align-middle">
                                        <a href="/advert/details/${advert.id}" class="btn btn-info">İncele</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </div>
            </div>
            <!-- Delete Modal HTML -->
            <div id="deleteEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form>
                            <div class="modal-header">
                                <h4 class="modal-title">İlanı Sil</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <p>İlanı silmek üzersin, emin misin?</p>
                                <p class="text-warning"><small>Bu işlem geri alınamaz.</small></p>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default text-light" data-dismiss="modal" value="İptal">
                                <input type="submit" class="btn btn-danger" value="Sil">
                            </div>
                        </form>
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