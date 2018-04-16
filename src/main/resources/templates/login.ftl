<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maxinum-scale=1,width=device-width">

    <meta content="telephone=no" name="format-detection">
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="x-rim-auto-match" content="none">
    <meta name="applicable-device" content="mobile">

    <meta name="apple-mobile-web-app-capable" content="yes">

    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <meta name="format-detection" content="telephone=no,email=no">

    <link rel="stylesheet" type="text/css" href="${request.contextPath}/css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/css/demo.css"/>
    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/css/component.css"/>
    <!--[if IE]>
    <script src="${request.contextPath}/js/html5.js"></script>
    <![endif]-->
</head>
<body>
<div class="container demo-1">
    <div class="content">
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas"></canvas>
            <div class="logo_box">
                <h3>金沙物流园货源信息发布平台欢迎你</h3>
                <form action="/publish" name="form_login" id="form_login" method="post">
                    <div class="input_outer">
                        <span class="u_user"></span>
                        <input name="telphone" class="text" style="color: #FFFFFF !important" type="tel"
                               placeholder="请输入联系电话">
                    </div>
                    <div class="input_outer">
                        <span class="us_uer"></span>
                        <input name="pwd" class="text"
                               style="color: #FFFFFF !important; position:absolute; z-index:100;" value=""
                               type="password" placeholder="请输入密码">
                    </div>
                    <div class="aui-form-ty">
                        <input type="checkbox" name="ck" id="ckc"/>我已阅读<a href="#" style="color: #ed4242">「信息发布平台协议」</a>
                    </div>
                    <div class="mb2"><a class="act-but submit sumbit_login" style="color: #FFFFFF">登录</a></div>
                    <div class="mb2"><a href="/reg" class="act-but submit" style="color: #FFFFFF">注册</a></div>

                </form>
            </div>
        </div>
    </div>
</div><!-- /container -->
<script src="${request.contextPath}/js/TweenLite.min.js"></script>
<script src="${request.contextPath}/js/EasePack.min.js"></script>
<script src="${request.contextPath}/js/rAF.js"></script>
<script src="${request.contextPath}/js/demo-1.js"></script>
<script src="${request.contextPath}/js/jquery-1.8.2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    $(".sumbit_login").click(function () {
        var telphone = $("input[name='telphone']").val();
        var pwd = $("input[name='pwd']").val();
        if (!$("#ckc").is(':checked')) {
            swal("警告!", "请同意信息发布平台协议", "warning");
            return false;
        }
        if (telphone != "" && pwd != "") {
            $("#form_login").submit();
        } else {
            swal("警告!", "电话号码/密码不能为空!", "warning");
        }
        login(telphone, pwd);
    })
    function login(telphone, pwd) {
        $.ajax({
            url: '/login',
            type: 'POST', //GET
            async: true, //或false,是否异步
            data: {
                'telphone': telphone,
                'pwd': pwd
            },
            dataType: 'json', //返回的数据格式：json/xml/html/script/jsonp/text
            success: function (data, textStatus, jqXHR) {
                console.log(data)
            },
            error: function (xhr, textStatus) {
                console.log('错误')
                console.log(xhr)
            },
            complete: function () {
                console.log('结束')
            }
        })
    }

</script>
<div style="text-align:center;">
</div>
</body>
</html>