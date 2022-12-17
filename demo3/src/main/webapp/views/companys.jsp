<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/15/2022
  Time: 11:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>Danh sách công ty</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
</head>
<body>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Thêm mới công ty
</button>
<div>
    <form action="<%=request.getContextPath()%>/company/search" method="post">
        <div style="margin-left: 900px;width: 400px;" class="input-group mb-3">
            <input type="text" name="search" class="form-control" placeholder="bạn muốn tìm gì ?" aria-label="Recipient's username" aria-describedby="button-addon2">
            <button style="color: aliceblue;" class="btn btn-outline-secondary btn btn-primary " type="submit" value="search"  id="button-addon2"> Search <i class="bi bi-search"></i></button>
        </div>
    </form>
</div>
<table class="table table-striped table-hover" border="2px">
    <thead>
    <tr>
        <th>Mã công ty</th>
        <th>Tên công ty</th>
        <th>Địa chỉ</th>
        <th>Ngày thành lập</th>
        <th>Trạng thái</th>
        <th colspan="2">Hoạt động khác</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listCompany}" var="com">
        <tr>
            <td>${com.companyId}</td>
            <td>${com.companyName}</td>
            <td>${com.companyAddress}</td>
            <td><fmt:formatDate value="${com.companyDateFounded}" pattern="dd/MM/yyyy"/></td>
            <td>${com.companyStatus?"Hoạt động":"Phá sản"}</td>

            <td><a href="<%=request.getContextPath()%>/company/update?companyId=${com.companyId}"><i class="bi bi-pencil-square"></i></a></td>
            <td><a href="<%=request.getContextPath()%>/company/delete?companyId=${com.companyId}"><i class="bi bi-trash3"></i></a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="<%=request.getContextPath()%>/company/create">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thêm mới công ty</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <table class="table table-striped table-hover" border="2px">
                        <tr>
                            <td>
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="basic-addon1">Tên danh mục </span>
                                    <input type="text" name="companyName" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="basic-addon2">Địa chỉ</span>
                                    <input type="text" name="companyAddress" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="basic-addon3">Ngày thành lập</span>
                                    <input type="date" name="companyDateFounded" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Trạng thái
                                <div class="form-check">
                                    <input class="form-check-input" type="radio"  name="companyStatus"
                                           value="true" id="flexRadioDefault1"}
                                    >
                                    <label class="form-check-label" for="flexRadioDefault1">
                                        Hoạt động
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="companyStatus" id="flexRadioDefault2"
                                           value="false">
                                    <label class="form-check-label" for="flexRadioDefault2">
                                        Phá sản
                                    </label>
                                </div>
                            </td>
                        </tr>
                    </table>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="submit" value="create" class="btn btn-primary">Đồng ý</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
