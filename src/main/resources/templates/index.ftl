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

    <link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.2/style/weui.min.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.0/css/jquery-weui.min.css">
    <link rel="stylesheet" href="${request.contextPath}/css/index.css"/>
</head>

<body>
<header class="head">
    <span class="head_font">全国货运联盟信息发布平台</span>
</header>
<div id="div_information">
</div>
<input type="hidden" id="currentPage" value="10">
<input type="hidden" id="pageSize" value="10">
<div class="weui-footer weui-footer_fixed-bottom">
    <p class="weui-footer__links">
        <a href="http://wwtianmei.cn" class="weui-footer__link">wwtianmei 武威天美网络科技有限公司</a>
    </p>
    <p class="weui-footer__text">Copyright © 2018 wwtianmei.cn</p>
</div>
<script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery-weui/1.2.0/js/jquery-weui.min.js"></script>
</body>
<script>
    $(document).ready(function () {
        getData()
    })
    function getData() {
        var currentPage = $("#currentPage").val();
        var pageSize = $("#pageSize").val();
        $.ajax({
            url: '/itemsPage',
            type: 'POST', //GET
            async: true, //或false,是否异步
            data: {
                'currentPage': currentPage,
                'pageSize': pageSize
            },
            dataType: 'json', //返回的数据格式：json/xml/html/script/jsonp/text
            success: function (data, textStatus, jqXHR) {
                console.log(data)
                eachdata(data)
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
    function eachdata(json_arr) {
        var con = "";
        $.each(json_arr, function (i, data) {
            con += '<div class="weui-cell"><ul><li><span class="add">' + data.beginCity + '</span> <img src="${request.contextPath}/img/from.png"></img> <span class="add">' + data.endCity + '</span></li>'
            con += '<li> <span class="typ">' + data.commander + '</span> <span class="typ">' + isNoll(data) + '</span> <span class="typ">' + data.cargoType + '/</span></li>'
            con += '<li class="publish_time_li"><span class="publish_time">一分钟前</span></li></ul><ul><li class="photo_li"> <a href="tel:18693527550"> <img src="img/photo.png"/></a></li></ul></div>'
        })
        $("#div_information").html(con);
    }
    function isNoll(data) {
        if (data.weight != null) {
            return '' + data.weight + '吨'
        } else if (data.volume != null) {
            return '' + data.volume + '方'
        }
    }

</script>
</html>