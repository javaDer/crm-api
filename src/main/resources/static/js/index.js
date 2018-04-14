/**
 * Created by Javaer on 2018/3/1.
 */
$(document).ready(function () {
    var con = "";
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

    $.each(json_arr, function (i, data) {
        var ss = document.writeln("<div class=\"weui-cell\">");
        document.writeln("    <ul>");
        document.writeln("        <li>");
        document.writeln("            <span class=\"add\">" + data.beginCity + "</span> <img src=\"${request.contextPath}/img/from.png\"></img> <span");
        document.writeln("                class=\"add\">" + data.endCity + "</span>");
        document.writeln("        </li>");
        document.writeln("        <li>");
        document.writeln("            <span class=\"typ\">" + data.commander + "</span> <span class=\"typ\">" + data.weight + "吨/ </span> <span");
        document.writeln("                class=\"typ\">" + data.cargo_type + "/</span>");
        document.writeln("        </li>");
        document.writeln("        <li class=\"publish_time_li\">");
        document.writeln("            <span class=\"publish_time\">一分钟前</span>");
        document.writeln("        </li>");
        document.writeln("    </ul>");
        document.writeln("    <ul>");
        document.writeln("        <li class=\"photo_li\">");
        document.writeln("            <a href=\"tel:18693527550\"> <img src=\"img/photo.png\"/></a>");
        document.writeln("        </li>");
        document.writeln("    </ul>");
        document.writeln("</div>");
    })
//        $("div_information").html(con);
}
