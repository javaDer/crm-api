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
                <h3>注册用户</h3>
                <form action="/reg" name="form_login" id="form_login" method="post">
                    <div class="input_outer">
                        <span class="u_user"></span>
                        <input name="telphone" class="text" style="color: #FFFFFF !important" type="tel"
                               placeholder="请输入联系电话">
                    </div>
                    <div class="input_outer">
                        <span class="us_uer"></span>
                        <input name="homeid" class="text"
                               style="color: #FFFFFF !important; position:absolute; z-index:100;" value=""
                               type="text" placeholder="请输入金沙物流信息部房间号">
                    </div>
                    <div class="input_outer">
                        <span class="us_uer"></span>
                        <input name="verifyCode" class="text"
                               style="color: #FFFFFF !important; position:absolute; z-index:100;" value=""
                               type="text" onclick="clickButton(this)" placeholder="请输入短信验证码">
                        <a class="get-verify act-but submit btn-reg" style="color: #FFFFFF">获取验证码</a>
                    </div>

                    <div class="input_outer">
                        <span class="us_uer"></span>
                        <input name="password" class="text" id="password"
                               style="color: #FFFFFF !important; position:absolute; z-index:100;" value=""
                               type="password" placeholder="请设置密码">
                    </div>
                    <div class="input_outer">
                        <span class="us_uer"></span>
                        <input name="confirm_password" class="text" id="confirm_password"
                               style="color: #FFFFFF !important; position:absolute; z-index:100;" value=""
                               type="password" placeholder="请确认密码">
                    </div>
                    <div class="aui-form-ty">
                        <input type="checkbox" name="ck" id="ckc"/>我已阅读<a href="#" style="color: #ed4242">「信息发布平台协议」</a>
                    </div>
                    <div class="mb2"><a class="act-but submit btn-reg" style="color: #FFFFFF">注册</a></div>

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
    $(".btn-reg").click(function () {
        var telphone = $("input[name='telphone']").val();
        var homeid = $("input[name='homeid']").val();
        var paw = $("input[name='password']").val();
        var confirm_paw = $("input[name='confirm_password']").val();
        if (!$("#ckc").is(':checked')) {
            swal("警告!", "请同意信息发布平台协议", "warning");
            return false;
        }
        if (paw != confirm_paw) {
            swal("警告!", "两次输入的密码不一致！", "warning");
            return false;
        }
        if (telphone == "") {
            swal("警告!", "电话号码不能为空!", "warning");
            return false
        } else if (homeid == "") {
            swal("警告!", "金沙物流信息部房间号不能为空!", "warning");
            return false
        } else if (paw == '') {
            swal("警告!", "密码不能为空!", "warning");
            return false
        } else {
            confirmHomeByTelphone(telphone, homeid, paw)
        }
    })
    function confirmHomeByTelphone(telphone, homeid, paw) {
        $.ajax({
            url: '/submit_reg',
            type: 'POST', //GET
            async: true, //或false,是否异步
            data: {
                'telphone': telphone,
                'homeid': homeid,
                'paw': paw,
            },
            dataType: 'json', //返回的数据格式：json/xml/html/script/jsonp/text
            success: function (data, textStatus, jqXHR) {
                console.log(data)
                if (data.status = true) {
                    swal("成功!", data.msg, "success");
                    jumpPage(telphone, homeid)

                }
            },
            error: function (xhr, textStatus) {
                console.log('错误')
                console.log(xhr)
                console.log(textStatus)
            },
            complete: function () {
                console.log('结束')
            }
        })
    }
    function jumpPage(telphone, homeid) {
        window.location.href = "${request.contextPath}/publish?telphone=" + telphone + "&homeid=" + homeid;
    }
    function clickButton(obj) {
        var tell = $("input[name='telphone']").val();
        if (tell != "") {
//            sencode(tell)
            var obj = $(obj);
            obj.attr("disabled", "disabled");
            /*按钮倒计时*/
            var time = 60;
            var set = setInterval(function () {
                obj.val(--time + "(s)");
            }, 1000);
            /*等待时间*/
            setTimeout(function () {
                obj.attr("disabled", false).val("重新获取验证码");
                /*倒计时*/
                clearInterval(set);
            }, 60000);
        }
    }
    function sencode(tel) {
        $.ajax({
            type: "post",
            url: "/send",
            data: {tel: tel},
            dataType: "json",
            success: function (data) {

            }
        });
    }
</script>
<div style="text-align:center;">
</div>
</body>
</html>