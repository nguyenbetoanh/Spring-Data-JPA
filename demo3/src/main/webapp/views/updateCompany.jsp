<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 12/15/2022
  Time: 11:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
</head>
<body>
<table class="table table-striped table-hover">
    <form action="<%=request.getContextPath()%>/company/update" method="post">
        <tr>
            <th>
                Mã danh mục
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon1">@</span>
                    <input type="number" name="companyId" value="${company.companyId}" class="form-control"
                           placeholder="Username"
                           aria-label="Username" aria-describedby="basic-addon1" readonly>
                </div>
            </th>
        </tr>
        <tr>
            <th>
                Tên danh mục
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon2">@</span>
                    <input type="text" name="companyName" value="${company.companyName}" class="form-control"
                           placeholder="Username"
                           aria-label="Username" aria-describedby="basic-addon1">
                </div>
            </th>
        </tr>
        <tr>
            <th>
                Địa chỉ công ty
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon3">@</span>
                    <input type="text" name="companyAddress" value="${company.companyAddress}" class="form-control"
                           placeholder="Username"
                           aria-label="Username" aria-describedby="basic-addon1">
                </div>
            </th>
        </tr>
        <tr>
            <th>
                Ngày thành lập
                <div class="input-group mb-3">
                    <span class="input-group-text" id="basic-addon4">@</span>
                    <input type="datetime-local" name="companyDateFounded" value="${company.companyDateFounded}"
                           class="form-control" placeholder="Username" aria-label="Username"
                           aria-describedby="basic-addon1">
                </div>
            </th>
        </tr>
        <tr>
            <th>
                Trạng thái
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="companyStatus"
                           value="true" id="flexRadioDefault1" ${company.companyStatus?"checked":""}
                    >
                    <label class="form-check-label" for="flexRadioDefault1">
                        Hoạt động
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="companyStatus" id="flexRadioDefault2"
                           value="false" ${company.companyStatus?"":"checked"} >
                    <label class="form-check-label" for="flexRadioDefault2">
                        Phá sản
                    </label>
                </div>
            </th>
        </tr>
        <tr>
            <td>
                <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                    <button type="submit" value="update" class="btn btn-success">Đồng ý</button>
                </div>
            </td>
        </tr>
    </form>
</table>

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
