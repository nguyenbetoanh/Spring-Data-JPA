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
    Thêm mới nhân viên
</button>
<div>
    <form action="<%=request.getContextPath()%>/employee/search" method="post">
        <div style="margin-left: 750px;width: 400px;" class="input-group mb-3">
            <input type="text" name="search" class="form-control" placeholder="bạn muốn tìm gì ?"
                   aria-label="Recipient's username" aria-describedby="button-addon2">
            <button style="color: aliceblue;" class="btn btn-outline-secondary btn btn-primary " type="submit" value=""
                    id="button-addon2"> Search <i class="bi bi-search"></i></button>
        </div>
    </form>
</div>
<table class="table table-striped table-hover">
    <thead>
    <tr>
        <th>Mã nhân viên</th>
        <th>Tên nhân viên</th>
        <th>Ngày sinh nhật</th>
        <th>Mô tả</th>
        <th>Tên Công ty</th>
        <th>Ảnh nhân viên</th>
        <th>Trạng thái</th>
        <th colspan="2">Hoạt động khác</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${listEmployee}" var="emp">
        <tr>
            <td>${emp.employeeId}</td>
            <td>${emp.employeeName}</td>
            <td><fmt:formatDate value="${emp.employeeBirdDay}" pattern="dd/MM/yyyy"/></td>
            <td>${emp.employeeDescriptions}</td>
            <td>${emp.company.companyName}</td>
            <td><img width="100px" height="auto" src="${emp.employeeAvatar}" alt="avatar"></td>
            <td>${emp.employeeStatus?"Đang làm":"Nghỉ"}</td>
            <td><a href="<%=request.getContextPath()%>/employee/update?employeeId=${emp.employeeId}"><i
                    class="bi bi-pencil-square"></i></a></td>
            <td><a href="<%=request.getContextPath()%>/employee/delete?employeeId=${emp.employeeId}"><i
                    class="bi bi-trash3"></i></a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="<%=request.getContextPath()%>/employee/create" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Thêm mới nhân viên</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <table class="table table-striped table-hover">
                        <tr>
                            <td>
                                <div class="input-group mb-3">
                                    <input type="hidden" name=employeeId" class="form-control" placeholder="Username"
                                           aria-label="Username" aria-describedby="basic-addon1">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="basic-addon1">Tên nhân viên </span>
                                    <input type="text" name="employeeName" class="form-control" placeholder="Username"
                                           aria-label="Username" aria-describedby="basic-addon1">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="basic-addon2">Mô tả</span>
                                    <input type="text" name="employeeDescriptions" class="form-control"
                                           placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="input-group mb-3">
                                    <span class="input-group-text" id="basic-addon3">Sinh nhật</span>
                                    <input type="date" name="employeeBirdDay" class="form-control"
                                           placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Trạng thái
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="employeeStatus"
                                           value="true" id="flexRadioDefault1" }
                                    >
                                    <label class="form-check-label" for="flexRadioDefault1">
                                        Đang làm
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="employeeStatus"
                                           id="flexRadioDefault2"
                                           value="false">
                                    <label class="form-check-label" for="flexRadioDefault2">
                                        Nghỉ
                                    </label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Tên công ty
                                <select class="form-select" aria-label="Default select example" name="companyId">
                                    <option selected>Chọn tên công ty</option>
                                    <c:forEach items="${listCompany}" var="com">
                                        <option value="${com.companyId}">${com.companyName}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Ảnh nhân viên
                                <div class="input-group">
                                    <input type="file" value="upload" accept=".jsp" id="fileButton" class="form-control"
                                           aria-describedby="inputGroupFileAddon04" aria-label="Upload">
                                    <div class="input-group mb-3">
                                        <input type="text" name="employeeAvatar" id="employeeAvatar" class="form-control"  aria-label="Username" aria-describedby="basic-addon1" readonly>
                                    </div>
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


<script src="https://www.gstatic.com/firebasejs/4.2.0/firebase.js"></script>
<script>

    //BE SURE TO PROTECT EVERYTHING IN THE CONFIG
    //DON'T COMMIT IT!!!

    // Initialize Firebase
    const firebaseConfig = {
        apiKey: "AIzaSyDMRnfZ5OQ5F4ef9WQC5IR33A5PxEguthA",
        authDomain: "test-26801.firebaseapp.com",
        projectId: "test-26801",
        storageBucket: "test-26801.appspot.com",
        messagingSenderId: "102884096361",
        appId: "1:102884096361:web:1869a611e763feb85065f8",
        measurementId: "G-VPK3J2TP28"
    };
    firebase.initializeApp(firebaseConfig);
</script>

<script type="text/javascript">


    // get elements
    var uploader = document.getElementById('uploader');
    var fileButton = document.getElementById('fileButton');


    // listen for file selection
    fileButton.addEventListener('change', function (e) {

        // get file
        var file = e.target.files[0];

        console.log(file)

        // create a storage ref
        var storageRef = firebase.storage().ref('images/' + file.name);

        // upload file
        var uploadTask = storageRef.put(file);

        // The part below is largely copy-pasted from the 'Full Example' section from
        // https://firebase.google.com/docs/storage/web/upload-files

        // update progress bar
        uploadTask.on(firebase.storage.TaskEvent.STATE_CHANGED, // or 'state_changed'
            function (snapshot) {

                switch (snapshot.state) {
                    case firebase.storage.TaskState.PAUSED: // or 'paused'
                        console.log('Upload is paused');
                        break;
                    case firebase.storage.TaskState.RUNNING: // or 'running'
                        console.log('Upload is running');
                        break;
                }
            }, function (error) {

                // A full list of error codes is available at
                // https://firebase.google.com/docs/storage/web/handle-errors
                switch (error.code) {
                    case 'storage/unauthorized':
                        // User doesn't have permission to access the object
                        break;

                    case 'storage/canceled':
                        // User canceled the upload
                        break;

                    case 'storage/unknown':
                        // Unknown error occurred, inspect error.serverResponse
                        break;
                }
            }, function () {
                // Upload completed successfully, now we can get the download URL
                // save this link somewhere, e.g. put it in an input field
                var downloadURL = uploadTask.snapshot.downloadURL;
                // image = downloadURL;
                document.getElementById("employeeAvatar").value = downloadURL;
                console.log('downloadURL ===>', downloadURL);

            });

    });

</script>

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
