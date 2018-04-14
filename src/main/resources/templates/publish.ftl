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
    <title>金沙物流园货源信息发布平台</title>
    <script src="js/jquery-1.8.2.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/css/payment.css"/>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/css/index.css"/>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/css/global.css"/>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/css/style.css"/>
    <style type="text/css">
        ._input {
            font-size: 1.6rem;
            margin-left: 14%;
        }

        .datetime-picker .picker-item {
            text-overflow: initial
        }

    </style>
</head>

<body>
<section class="content">
    <div class="contentList">
        <ul>
            <li class="cfd">
                <label>出发地</label>
                <div>
                    <input class="_input" id="city" type="text" value="">
                </div>
            </li>
            <li>
                <label>到达地</label>
                <div>
                    <input class="_input" id="end" type="text" value="">
                </div>
            </li>
        </ul>
    </div>
    <div class="contentList">
        <ul>
            <li class="carSel">
                <label>车长车型</label>
                <span id="cat_pyte">点击选择</span>
            </li>
            <li class="hwlx">
                <label>货物类型</label>
                <span id="cargo_type">点击选择</span>
            </li>
            <li class="weight">
                <label>货物重量/体积<em>（至少填写一项）</em></label>
                <p>
							<span>
							<input type="text" id="weight" placeholder="点击输入"/><em>吨</em>
						</span>
                    <span>
							<input type="text" id="volume" placeholder="点击输入"/><em>方</em>
						</span>
                </p>
            </li>
        </ul>
    </div>
    <div class="contentList">
        <ul>
            <li class="yfje">
                <label>运费金额</label>
                <p>
                    <input type="text" placeholder="点击输入,可不填"/>
                    <em>元</em>
                </p>
            </li>
            <li>
                <label>装车时间</label>
                <div class="iDate full">
                    <input type="text" class="_input" id="Idate_full">
                    <button type="button" class="addOn"></button>
                </div>
            </li>
        <#--<li class="noteInfo">-->
        <#--<label>备注信息</label>-->
        <#--<span id="remake">装卸方式、付款方式、备注</span>-->
        <#--</li>-->
        </ul>
    </div>
</section>
<section class="fb">
    <button type="button" class="issue_btn" id="issue">确定发布</button>
</section>

<input type="hidden" id="car_type" value="整车"/>
<section class="layerBg"></section>
<!--
作者：1152206843@qq.com
时间：2018-02-28
描述：车长车型
-->
<section class="layer carStyleLayer">
    <div class="layerTitle">
        <h1>车长车型<em class="close">×</em></h1>
    </div>
    <div class="layerBody">
        <div class="layerBodyContent">
            <div class="layerBodyContentList">
                <h1>用车类型</h1>
                <ul class="yclx">
                    <li onclick="yclx(this);">整车<img src="img/check.png" alt=""/></li>
                    <li onclick="yclx(this);">零担<img src="img/check.png" alt=""/></li>
                </ul>
            </div>
            <div class="layerBodyContentList">
                <h1>车长<em>（米，可多选）</em></h1>
                <ul class="carlength">
                    <li onclick="carlength(this);">4.2米<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);">6.8米<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);">9.6米<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);">11.7米<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);">12.5米<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);">13米<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);">17.5米<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li class="all">全部</li>
                    <li onclick="carlength(this);" style="display: none;">3.0米<img
                            src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);" style="display: none;">3.3米<img
                            src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);" style="display: none;">3.6米<img
                            src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);" style="display: none;">4.2米<img
                            src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);" style="display: none;">4.5米<img
                            src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);" style="display: none;">5.0米<img
                            src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);" style="display: none;">5.2米<img
                            src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);" style="display: none;">6.2米<img
                            src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);" style="display: none;">7.2米<img
                            src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);" style="display: none;">7.6米<img
                            src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);" style="display: none;">8.2米<img
                            src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);" style="display: none;">8.6米<img
                            src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);" style="display: none;">13.5米<img
                            src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);" style="display: none;">14.0米<img
                            src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);" style="display: none;">15.0米<img
                            src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);" style="display: none;">16.0米<img
                            src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);" style="display: none;">17.0米<img
                            src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);" style="display: none;">18.0米<img
                            src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="carlength(this);" style="display: none;">不限<img src="img/check.png" alt=""/></li>
                </ul>
                <p class="otherLength" style="display: none;">
                    <label>其他车长：</label>
                    <span>
							<input type="text" name="" id="" placeholder="点击输入"/>米
						</span>
                </p>
            </div>
            <div class="layerBodyContentList">
                <h1>车型<em>（可多选）</em></h1>
                <ul class="cx">
                    <li onclick="cx(this);">平板<img src="img/check.png" alt=""/></li>
                    <li onclick="cx(this);">高栏<img src="img/check.png" alt=""/></li>
                    <li class="allCx">全部</li>
                    <li onclick="cx(this);" style="display: none;">厢车<img src="${request.contextPath}/img/check.png"
                                                                          alt=""/></li>
                    <li onclick="cx(this);" style="display: none;">高低板<img src="${request.contextPath}/img/check.png"
                                                                           alt=""/></li>
                    <li onclick="cx(this);" style="display: none;">保温<img src="${request.contextPath}/img/check.png"
                                                                          alt=""/></li>
                    <li onclick="cx(this);" style="display: none;">冷藏<img src="${request.contextPath}/img/check.png"
                                                                          alt=""/></li>
                    <li onclick="cx(this);" style="display: none;">自卸<img src="${request.contextPath}/img/check.png"
                                                                          alt=""/></li>
                    <li onclick="cx(this);" style="display: none;">中卡<img src="${request.contextPath}/img/check.png"
                                                                          alt=""/></li>
                    <li onclick="cx(this);" style="display: none;">面包<img src="${request.contextPath}/img/check.png"
                                                                          alt=""/></li>
                    <li onclick="cx(this);" style="display: none;">棉被车<img src="${request.contextPath}/img/check.png"
                                                                           alt=""/></li>
                    <li onclick="cx(this);" style="display: none;">爬梯车<img src="${request.contextPath}/img/check.png"
                                                                           alt=""/></li>
                    <li onclick="cx(this);" style="display: none;">笼车<img src="${request.contextPath}/img/check.png"
                                                                          alt=""/></li>
                    <li onclick="cx(this);" style="display: none;">大件车<img src="${request.contextPath}/img/check.png"
                                                                           alt=""/></li>
                    <li onclick="cx(this);" style="display: none;">轴线车<img src="${request.contextPath}/img/check.png"
                                                                           alt=""/></li>
                    <li onclick="cx(this);" style="display: none;">特种车<img src="${request.contextPath}/img/check.png"
                                                                           alt=""/></li>
                </ul>
                <p class="otherLength" style="display: none;">
                    <label>自定义车型：</label>
                    <span>
							<input type="text" name="" id="" placeholder="自定义车型"/>
						</span>
                </p>
            </div>
        </div>
    </div>
    <div class="layerFoot">
        <button type="button" class="currentCarLength">确定</button>
    </div>
</section>
<!--
作者：1152206843@qq.com
时间：2018-02-28
描述：货物类型
-->
<section class="layer hwLayer">
    <div class="layerTitle">
        <h1>货物类型<em class="closeHw">×</em></h1>
    </div>
    <div class="layerBody">
        <div class="layerBodyContent">
            <div class="layerBodyContentList">
                <ul class="hwlxList">
                    <li onclick="hwlxList(this);">普货<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="hwlxList(this);">重货<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="hwlxList(this);">泡货<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="hwlxList(this);">设备<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="hwlxList(this);">配件<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="hwlxList(this);">百货<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="hwlxList(this);">建材<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="hwlxList(this);">食品<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="hwlxList(this);">饮料<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="hwlxList(this);">化工<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="hwlxList(this);">水果<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="hwlxList(this);">蔬菜<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="hwlxList(this);">木材<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="hwlxList(this);">煤炭<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="hwlxList(this);">石材<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="hwlxList(this);">家具<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="hwlxList(this);">树苗<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="hwlxList(this);">化肥<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="hwlxList(this);">粮食<img src="${request.contextPath}/img/check.png" alt=""/></li>
                    <li onclick="hwlxList(this);">钢材<img src="${request.contextPath}/img/check.png" alt=""/></li>
                </ul>
                <p class="otherStyle" style="">
                    <label>其他类型：</label>
                    <span>
							<input type="text" name="" id="" placeholder="点击输入（最多4个字）" maxlength="4"/>
						</span>
                    <button type="button" class="confirmOther" style="display: none;">确定</button>
                </p>
            </div>
        </div>
    </div>
</section>
<!--
作者：1152206843@qq.com
时间：2018-02-28
描述：备注信息
-->
<section class="layer noteLayer">
    <div class="layerTitle">
        <h1>其他信息<em class="closeOther">×</em></h1>
    </div>
    <div class="layerBody">
        <div class="layerBodyContent">
            <div class="layerBodyContentList">
                <h1>装卸方式</h1>
                <ul class="zxfs">
                    <li onclick="zxfs(this);">一装一卸<img src="img/check.png" alt=""/></li>
                    <li onclick="zxfs(this);">一装两卸<img src="img/check.png" alt=""/></li>
                    <li onclick="zxfs(this);">一装多卸<img src="img/check.png" alt=""/></li>
                    <li onclick="zxfs(this);">两装一卸<img src="img/check.png" alt=""/></li>
                    <li onclick="zxfs(this);">两装两卸<img src="img/check.png" alt=""/></li>
                    <li onclick="zxfs(this);">两装多卸<img src="img/check.png" alt=""/></li>
                </ul>
            </div>
            <div class="layerBodyContentList">
                <h1>付款方式</h1>
                <ul class="fkfs">
                    <li onclick="fkfs(this);">全现金<img src="img/check.png" alt=""/></li>
                    <li onclick="fkfs(this);">需回单<img src="img/check.png" alt=""/></li>
                    <li onclick="fkfs(this);">现付+到付<img src="img/check.png" alt=""/></li>
                    <li onclick="fkfs(this);">预付油卡<img src="img/check.png" alt=""/></li>
                </ul>
            </div>
            <div class="layerBodyContentList noteContent">
                <h1>备注</h1>
                <div contenteditable="true" id="edit"></div>
                <ul class="noteList">
                    <li onclick="noteList(this);">三不超</li>
                    <li onclick="noteList(this);">高价急走</li>
                    <li onclick="noteList(this);">需要雨布</li>

                    <li onclick="noteList(this);">货物重量为估算</li>
                </ul>
            </div>
        </div>
        <input type="hidden" id="telphone" value="${telphone}">
        <input type="hidden" id="homeid" value="${homeid}">
    </div>
    <div class="layerFoot">
        <button type="button" class="noteBtn">确定</button>
    </div>
</section>
<script src="${request.contextPath}/js/Popt.js"></script>
<script src="${request.contextPath}/js/cityJson.js"></script>
<script src="${request.contextPath}/js/citySet.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/moment.js"></script>
<script type="text/javascript" src="${request.contextPath}/js/bootstrap-datetimepicker.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
    if ($(".iDate.full").length > 0) {
        $(".iDate.full").datetimepicker({
            locale: "zh-cn",
            format: "YYYY-MM-DD a hh:mm",
            dayViewHeaderFormat: "YYYY年 MMMM"
        });
    }
    var arr = []
    $("#city").click(function (e) {
        SelCity(this, e);
    });
    $("#end").click(function (e) {
        SelCity(this, e);
    });

    function init() {
        $(".carlength li").removeClass("current");
        $(".cx li").removeClass("current");
        $(".cx li:gt(2)").hide();
        $(".cx li.allCx").show();
        $(".carlength li:gt(7)").hide();
        $(".all").show();
        $(".layerBody").css("padding-bottom", "10px");

        $(".otherStyle input").val('');
    }
    //选择用车类型
    function yclx(obj) {
        $(obj).addClass("current").siblings("li").removeClass("current");
        $(obj).find("img").show().closest("li").siblings("li").find("img").hide();
        $("#car_type").val($(obj).text())
    }
    ;
    //选择车型
    function cx(obj) {
        $(obj).toggleClass("current");
        $(obj).find("img").toggle();
        arr.push($(obj).text())
        console.log(arr.toString())
    }
    ;
    //选择车长

    function carlength(obj) {
        $(obj).toggleClass("current");
        $(obj).find("img").toggle();
        arr.push($(obj).text())
        console.log(arr.toString())
    }
    ;
    //选择货物类型
    function hwlxList(obj) {
        $(".hwlx span").addClass("current").text($(obj).text());
        $(".layerBg,.hwLayer").hide();
        $(obj).text()

    }
    ;
    //备注 选择装卸方式
    function zxfs(obj) {
        $(obj).addClass("current").siblings("li").removeClass("current");
    }
    ;
    //备注 选择付款方式
    function fkfs(obj) {
        $(obj).addClass("current").siblings("li").removeClass("current");
    }
    ;

    function noteList(obj) {
        /*$(".noteContent p input").val($(obj).text());*/
    }
    ;

    //    function chooseStyle(obj) {
    //        $(obj).addClass("current").siblings("li").removeClass("current");
    //    }
    $(function () {
        init();
        //选择车长车型
        $(".carSel").click(function () {
            $(".layerBg,.carStyleLayer").show();
            $(".hwLayer").hide();
            init();
        });
        //关闭选择车长车型
        $(".close").click(function () {
            arr = []
            $(".carlength li").removeClass("current");
            $(".cx li").removeClass("current");
            $(".layerBg,.carStyleLayer").hide();
            $(".carStyleLayer").removeClass("carlengthAll");
            $(".allList,.otherLength").hide();
            $(".carlength").show();
        });
        //点击车长车型确定按钮
        $(".currentCarLength").click(function () {
            $(".layerBg,.carStyleLayer").hide();
            var car_ty = $("#car_type").val();
            var _arr = arr.toString()
//            var data = _arr.substring(1, _arr.length);
            var data = _arr
            $("#cat_pyte").text(car_ty + "" + data)
            arr = []

        });
        yclx(); //选择用车类型
        carlength(); //选择车长
        //选择全部车长
        $(".all").click(function () {
            $(".carlength li,.otherLength").show();
            $(this).hide();
            $(".carStyleLayer").addClass("carlengthAll");
            $(".carStyleLayer").css("max-height", "initial");
        });
        //选择全部车型
        $(".allCx").click(function () {
            $(".cx li").show();
            $(this).hide();
            $(".layerBody").css("padding-bottom", "65px");
        });

        //点击货物类型
        $(".hwlx").click(function () {
            $(".layerBg,.hwLayer").show();
            init()
        });
        $(".closeHw").click(function () {
            $(".layerBg,.hwLayer").hide();
        });
        $(".otherStyle input").click(function () {
            $(".confirmOther").show();
        });
        $(".confirmOther").click(function () {
            var thisVal = $(".otherStyle input").val();
            if (thisVal == '') {
                alert("请输入货物类型，限4个字")
            } else {
                $(".hwlx span").addClass("current").text(thisVal);
                $(".layerBg,.hwLayer").hide();
            }
        });

        //选择备注信息
        $(".noteInfo").click(function () {
            $(".layerBg,.noteLayer").show();
        });
        //关闭选择备注信息
        $(".closeOther").click(function () {
            $(".layerBg,.noteLayer").hide();
        });
        //确定选择备注信息
        $(".noteBtn").click(function () {
            $(".layerBg,.noteLayer").hide();
            $(".noteInfo span").addClass("current").text($(".layerBodyContentList li.current").text());
        })
    })
    $("#issue").click(function () {
        var begin_city = $("#city").val();
        var end_city = $("#end").val();
        //车长车型
        var commander = $("#cat_pyte").text();
        var cargo_type = $("#cargo_type").text();
        var date_time = $("#Idate_full").val();
        var weight = $("#weight").val();
        var volume = $("#volume").val();
        var remake = $("#remake").text();
        var telphone = $("#telphone").val();
        var homeid = $("#homeid").val();
        if (begin_city == null || begin_city == '') {
            swal("警告!", "出发地不能为空", "warning");
            return false;
        } else if (end_city == null || end_city == '') {
            swal("警告!", "到达地不能为空", "warning");
            return false;
        } else if (commander == null || commander == '') {
            swal("警告!", "车长车型不能为空", "warning");
            return false;
        } else if (cargo_type == null || cargo_type == '') {
            swal("警告!", "货物类型不能为空", "warning");
            return false;
        } else if (volume == '' && weight == '') {
            swal("警告!", "货物重量/体积至少填写一项", "warning");
            return false;
        }
        ajax_sumbit(begin_city, end_city, commander, cargo_type, date_time, weight, volume, remake, telphone, homeid)
    })

    function ajax_sumbit(begin_city, end_city, commander, cargo_type, date_time, weight, volume, remake, telphone, homeid) {
        $.ajax({
            url: '/save',
            type: 'POST', //GET
            async: true, //或false,是否异步
            data: {
                'begin_city': begin_city,
                'end_city': end_city,
                'commander': commander,
                'cargo_type': cargo_type,
                'date_time': date_time,
                'weight': weight,
                'volume': volume,
                'remake': remake,
                'telphone': telphone,
                'homeid': homeid
            },
            dataType: 'json', //返回的数据格式：json/xml/html/script/jsonp/text
            success: function (data) {
                if (data.success == true) {
                    swal("成功!", data.msg, "success");
                    window.location.reload()
                } else {
                    swal("错误!", data.msg, "error");
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
    //    function chooseStyle(obj) {
    //        var choose_style = $("#choose_style").val(obj)
    //    }
</script>
</body>

</html>