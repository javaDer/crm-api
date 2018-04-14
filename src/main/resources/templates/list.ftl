<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta content="telephone=no" name="format-detection"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <title>金沙物流货源信息发布中心</title>
    <script src="${request.contextPath}js/jquery-1.8.2.min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="${request.contextPath}js/jquery-weui.min.js"></script>
<#--<script src="${request.contextPath}/js/webSocket.js"></script>-->
    <link rel="stylesheet" type="text/css" href="${request.contextPath}css/payment.css"/>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}css/global.css"/>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}css/index.css"/>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}css/weui.min.css"/>

    <style>
        .weui-cell {
            background: #fff;
            margin-bottom: 15px;
        }

        .weui-cell ul li a img {
            width: 35px;
            height: 35px;
        }

        .photo_li {
            position: absolute;
            right: 24px;
            top: 37px;
        }

        .add {
            font-size: 16px
        }

        .typ {
            font-size: 14px
        }

        .publish_time_li {
            padding-left: 0;
        }

        .publish_time {
            color: #999;
        }

        .content {
            overflow-y: auto;
        }

        .notice {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            color: #ff4348;
            font-size: 1.6em;
        }

        .notice-show {
            height: 1.5em;;
        }

        .notice-show span {
            width: 100%;
            display: inline-block;
            border: 0px solid #eee;
            /*padding: 6px;*/
            position: relative;
            /*padding-left: 259%;*/

            color: #56b4f8;
            height: 15px;
            width: 15px;
            line-height: 15px;
            text-align: center;
            border-radius: 3px;
            position: absolute;
            right: 0px;
            top: -1px;
            border: 1px solid #56b4f8;
            cursor: pointer;
        }

        .tips_font {
            font-variant: small-caps;
            color: #ff0a1e;
        }

        .screen {
            position: fixed;
            top: 1.52em;
            left: 0px;
            right: 0;
        }
    </style>
</head>
<body>
<#--<header class="head">-->
<#--<span class="head_font">全国货运联盟信息发布平台</span>-->
<#--</header>-->
<div class="notice-show">
    <span title="关闭" id="cColse">×</span>
    <marquee bgcolor="#E0FFFF">温馨提示:本平台只认证房间号的真伪性,未认证货源信息的真实性;如出现假货源,作废货源与本平台无关!
    </marquee>
</div>
<section class="content">
    <div id="div_information" style="height:100%; margin-top: 10%;overflow:auto;  z-index: 1"></div>
    <div class="screen">
        <div class="weui-navbar">
            <div class="weui-navbar__item weui_bar__item_on">
                货物类型(筛选)
            </div>
            <div class="weui-navbar__item">
                发货地(筛选)
            </div>
            <#--<div class="weui-navbar__item">-->
                <#--选项三-->
            <#--</div>-->
        </div>
        <img src="${request.contextPath}/img/setting.png"/>
    </div>
</section>
<input type="hidden" id="currentPage" value="1">
<input type="hidden" id="pageSize" value="10">
<div class="weui-footer weui-footer_fixed-bottom">
    <p class="weui-footer__links">
        <a href="http://www.wwjswl.com" class="weui-footer__link">武威金沙物流园</a>
    </p>
    <p class="weui-footer__text">Copyright © 2018 wwjswl.com</p>
</div>
</body>
<script type="text/javascript">
    $(function () {
        $(".content").height($("body").height() - $("header").height());
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
            con += '<li class="publish_time_li"><span class="publish_time">' + getDateDiff(data.releaseDate) + '</span> <span class="home">房间号:' + data.homeid + '</span><img src="${request.contextPath}/img/authentication.png"></img></li></ul><ul><li class="photo_li"> <a href="tel:' + data.telphone + '"> <img src="img/photo.png"/></a></li></ul></div>'
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
    function getDateDiff(dateTimeStamp) {
        var minute = 1000 * 60;
        var hour = minute * 60;
        var day = hour * 24;
        var halfamonth = day * 15;
        var month = day * 30;
        var now = new Date().getTime();
        var diffValue = now - dateTimeStamp;
        if (diffValue < 0) {
            return;
        }
        var monthC = diffValue / month;
        var weekC = diffValue / (7 * day);
        var dayC = diffValue / day;
        var hourC = diffValue / hour;
        var minC = diffValue / minute;
        if (monthC >= 1) {
            result = "" + parseInt(monthC) + "月前";
        }
        else if (weekC >= 1) {
            result = "" + parseInt(weekC) + "周前";
        }
        else if (dayC >= 1) {
            result = "" + parseInt(dayC) + "天前";
        }
        else if (hourC >= 1) {
            result = "" + parseInt(hourC) + "小时前";
        }
        else if (minC >= 1) {
            result = "" + parseInt(minC) + "分钟前";
        } else
            result = "刚刚";
        return result;
    }
    $("#div_information").pullToRefresh().on("pull-to-refresh", function () {
        setTimeout(function () {
            pages = 1;
            $("#Tolist").html("");
            getData();
            $("#div_information").pullToRefreshDone(); // 重置下拉刷新
        }, 1500);   //模拟延迟
    });
    //    function noticeScroll() {
    //        var noticeContent = $(".notice").text();
    //        if (noticeContent.length > 0) {
    //            //取出要显示文字的第一个字符然后拼接到字符串的末尾
    //            noticeContent = noticeContent.substr(1) + noticeContent.substr(0, 1);
    //            $(".notice-show div").text(noticeContent);
    //            //每隔半秒调用一次，可以更改数字使它更快或更慢
    //            setTimeout(noticeScroll, 500);
    //            //setTimeout("noticeScroll()",500);
    //
    //            // setInterval(noticeScroll, 500); //每隔0.5秒就动一次;
    //        }
    //    }
    $("#cColse").click(function () {
        $(".notice-show").hide();
    });

</script>
</html>
