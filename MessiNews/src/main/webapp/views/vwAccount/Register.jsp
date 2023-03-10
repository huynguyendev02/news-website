<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="email" scope="request" type="java.lang.String"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Messi News | Register</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        body {
            scroll-behavior: auto;
        }

        div {
            border-radius: 10px;
        }

        img {
            border-radius: 10px;
        }

        a {
            text-decoration: none;
            color: black;
            font-weight: bold;

        }

        a:hover {
            text-decoration: none;
            color: cornflowerblue;
            font-weight: bold;

        }


        .crop img {
            width: 100%;
            height: 100%;
        }


        .bgColorGray {
            background-color: #F0F0F0;
        }

        .inputStyle {
            border-style: solid;
            height: 40px;
            border-radius: 10px;
            border-color: #F0F0F0;
        }

        .inputStyle:focus {
            outline: #F0F0F0;
        }
    </style>
    <script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>
</head>
<body>
<form id="form" action="" method="post" class="d-flex justify-content-center w-100 h-100 bgColorGray">
    <div class="mt-5 p-4" style="background-color: white; width: 30%">
        <div class="d-flex justify-content-between">
            <h4>
                <a href="" class="mr-2">
                    <a href="${pageContext.request.contextPath}/Account/Login">
                        <i class="fa fa-caret-left" aria-hidden="true"></i>
                    </a>
                </a>
                ????ng k?? t??i kho???n
            </h4>
            <a href="${pageContext.request.contextPath}/Home">
                <i class="fa fa-times-circle-o fa-2x" aria-hidden="true"></i>
            </a>
        </div>
        <hr>

        <div class="d-flex justify-content-center">
            <img src="${pageContext.request.contextPath}/photos/logos/LogoMessi.png" alt="" style="width: 120px">
        </div>

        <h6 class="mt-3 pl-2">Th??ng tin t??i kho???n</h6>
        <input id="username" name="username" type="text" placeholder="T??i kho???n" class="w-100 pl-2 inputStyle mt-1" required>
        <input name="rawpwd" id="pwd" type="password" placeholder="M???t kh???u" class="w-100 pl-2 inputStyle mt-3" required>
        <input id="confirmPwd" type="password" placeholder="X??c nh???n m???t kh???u" class="w-100 pl-2 inputStyle mt-3" required>

        <div class="dropdown mt-3" >
            <button id="btRole" class="btn inputStyle dropdown-toggle w-100 d-flex justify-content-between align-items-center " type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Vai tr??
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item"  onclick="chooseRole('${pageContext.request.contextPath}/Account/Register?role=1','?????c gi???')"> ?????c gi???</a>
                <a class="dropdown-item"  onclick="chooseRole('${pageContext.request.contextPath}/Account/Register?role=2','Ph??ng vi??n')">Ph??ng vi??n</a>
                <a class="dropdown-item"  onclick="chooseRole('${pageContext.request.contextPath}/Account/Register?role=3','Bi??n t???p')">Bi??n t???p</a>
            </div>
        </div>

        <h6 class="mt-4 pl-2">Th??ng tin c?? nh??n</h6>
        <input name="fullName" type="text" placeholder="H??? v?? t??n" class="w-100 pl-2 inputStyle mt-1" required>
        <c:if test="${email.length()!=0}">
            <input id="email" name="email" type="email" placeholder="Email" class="w-100 pl-2 inputStyle mt-3" value="${email}" readonly required>
        </c:if>
        <c:if test="${email.length()==0}">
            <input id="email" name="email" type="email" placeholder="Email" class="w-100 pl-2 inputStyle mt-3" required>
        </c:if>

        <div class="d-flex justify-content-between align-items-center mt-3 pl-2">
            <div>Ng??y sinh</div>
            <input name="dob" id="txtDOB" type="text" class=" inputStyle" required style="width: 80%">
        </div>

        <div class="g-recaptcha my-3" data-sitekey="6LcyK9gjAAAAACFIpnIgZhHo6qa7Np9cTSPGOwyD"></div>

        <button id="btRegister" type="submit" class="w-100 inputStyle btn btn-primary mt-3">????ng k??</button>

    </div>

</form>

<script src="https://code.jquery.com/jquery-3.6.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
        integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
<script>
    function chooseRole(a, name){
        document.getElementById('form').action = a
        document.getElementById('btRole').innerText = name;
    }

    $('#form').on('submit', function (e) {
        e.preventDefault()



        let pwd = document.getElementById('pwd').value;

        if (/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/.test(pwd)==false){
            alert('M???t kh???u ph???i c?? t???i thi???u 8 k?? t???, g???m ??t nh???t 1 s???, 1 ch??? th?????ng, 1 ch??? in hoa')
            return
        }
        if (document.getElementById('pwd').value != document.getElementById('confirmPwd').value){
            alert('X??c nh???n m???t kh???u ch??a ch??nh x??c')
            return
        }

        const username = $('#username').val();
        const email = $('#email').val();
        $.getJSON('${pageContext.request.contextPath}/Account/IsAvailable?username='+username+'&email='+email, (data) => {
            if (data==false) {
                alert('T??n t??i kho???n ho???c email ???? ???????c s??? d???ng.')
                return
            }
        })
        let captcha = $('#g-recaptcha-response').val();
        $.getJSON('${pageContext.request.contextPath}/Account/CheckCaptcha?captcha='+captcha, (data) => {
            if (data==false) {
                alert('M?? x??c nh???n Captcha kh??ng ????ng! Vui l??ng th??? l???i')
                return
            }
        })

        $('#form').off('submit').submit();

    })

    $('#txtDOB').datetimepicker({
        format: 'd/m/Y',
        timepicker: false,
        mask: true
    });
</script>
</html>