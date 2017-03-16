<%--
  Created by IntelliJ IDEA.
  User: shuaizhiguo
  Date: 16/4/12
  Time: 00:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

    <jsp:include page="../common/head.jsp"></jsp:include>

    <script>

        /*
         * 注意：
         * 1. 所有的JS接口只能在公众号绑定的域名下调用，公众号开发者需要先登录微信公众平台进入“公众号设置”的“功能设置”里填写“JS接口安全域名”。
         * 2. 如果发现在 Android 不能分享自定义内容，请到官网下载最新的包覆盖安装，Android 自定义分享接口需升级至 6.0.2.58 版本及以上。
         * 3. 常见问题及完整 JS-SDK 文档地址：http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html
         *
         * 开发中遇到问题详见文档“附录5-常见错误及解决办法”解决，如仍未能解决可通过以下渠道反馈：
         * 邮箱地址：weixin-open@qq.com
         * 邮件主题：【微信JS-SDK反馈】具体问题
         * 邮件内容说明：用简明的语言描述问题所在，并交代清楚遇到该问题的场景，可附上截屏图片，微信团队会尽快处理你的反馈。
         */
        //        wx.config({
        //            debug: false,
        //            appId: 'wxc26a9306faf76eef',
        //            timestamp: 1489641187,
        //            nonceStr: '3abb9cfb-e718-4646-a244-7eaf34fba23e',
        //            signature: '0baec92b430389a2a337138246c661037314978b',
        //            jsApiList: [
        //                'hideOptionMenu'
        //            ]
        //        });
        wx.config({
            debug: false,
            appId: 'wxc26a9306faf76eef',
            jsApiList: [
                'hideOptionMenu'
            ]
        });
        wx.ready(function(){
            wx.hideOptionMenu();
        })
    </script>

</head>

<body>
<div class="page-group">
    <div class="page page-current">
        <%@ include file="../common/bottom.jsp" %>

        <div class="content">

            <form class="zform zform-radius" action="/classLearn/examResult.j?id=${id}&type=${type}" method="post" id="form1">
            <c:forEach items="${exam}" var="item" varStatus="xh">
                <div class="content-padded"><p> ${item.context} </p></div>
                <div class="content-padded radio-pretty inline ">
                    <input type="radio"  name="radio+${item.itemId}" value="A"><span> ${item.a}</span>
                </div>
                <div class="content-padded radio-pretty inline ">
                <input type="radio" name="radio+${item.itemId}" value="B"><span> ${item.b}</span>
                </div>
                <div class="content-padded radio-pretty inline">
                    <input type="radio" name="radio+${item.itemId}" value="C"><span> ${item.c}</span>
                </div>
                <div class="content-padded radio-pretty inline">
                    <input type="radio" name="radio+${item.itemId}" value="D"><span> ${item.d}</span>
                </div>
            </c:forEach>
                <div class="content-block">
                    <div class="row">
                        <div class="col-100"><input type="submit" class="button button-big button-fill button-success" value="交卷" id="submit-button"></div>
                    </div>
                </div>
            </form>



            <%--<form class="zform zform-radius" action="/review/examResult.j?id=${id}" method="post" id="form1">--%>
            <%--<c:forEach items="${exam}" var="item" varStatus="xh">--%>
            <%--<div class="content-padded"><p> ${item.context} </p></div>--%>
                <%--<div class="content-padded"><p> ${item.a} </p></div>--%>
                <%--<div class="content-padded"><p> ${item.b} </p></div>--%>
                <%--<div class="content-padded"><p> ${item.c} </p></div>--%>
                <%--<div class="content-padded"><p> ${item.d} </p></div>--%>
                    <%--<div class="item-input">--%>
                    <%--<input style="text-align: center" type="text" placeholder="选择答案" id="picker${item.itemId}" name="picker${item.itemId}" readonly="" />--%>
                    <%--</div>--%>
            <%--</c:forEach>--%>
                <%--<div class="content-block">--%>
                    <%--<div class="row">--%>
                        <%--<div class="col-100"><input type="submit" class="button button-big button-fill button-success" value="交卷" id="submit-button"></div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</form>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<%--<jsp:include page="../common/cmnjs.min.jsp"></jsp:include>--%>
<%--</body>--%>
<%--<script>--%>
        <%--$("#picker1").picker({--%>
            <%--toolbarTemplate: '<header class="bar bar-nav">\--%>
  <%--<button class="button button-link pull-right close-picker">确定</button>\--%>
  <%--<h1 class="title">请选择答案</h1>\--%>
  <%--</header>',--%>
            <%--cols: [--%>
                <%--{--%>
                    <%--textAlign: 'center',--%>
                    <%--values: ['A', 'B', 'C', 'D']--%>
                <%--}--%>
            <%--]--%>
        <%--});--%>
        <%--$("#picker2").picker({--%>
            <%--toolbarTemplate: '<header class="bar bar-nav">\--%>
  <%--<button class="button button-link pull-right close-picker">确定</button>\--%>
  <%--<h1 class="title">请选择答案</h1>\--%>
  <%--</header>',--%>
            <%--cols: [--%>
                <%--{--%>
                    <%--textAlign: 'center',--%>
                    <%--values: ['A', 'B', 'C', 'D']--%>
                <%--}--%>
            <%--]--%>
        <%--});--%>
        <%--$("#picker3").picker({--%>
            <%--toolbarTemplate: '<header class="bar bar-nav">\--%>
  <%--<button class="button button-link pull-right close-picker">确定</button>\--%>
  <%--<h1 class="title">请选择答案</h1>\--%>
  <%--</header>',--%>
            <%--cols: [--%>
                <%--{--%>
                    <%--textAlign: 'center',--%>
                    <%--values: ['A', 'B', 'C', 'D']--%>
                <%--}--%>
            <%--]--%>
        <%--});--%>
        <%--$("#picker4").picker({--%>
            <%--toolbarTemplate: '<header class="bar bar-nav">\--%>
  <%--<button class="button button-link pull-right close-picker">确定</button>\--%>
  <%--<h1 class="title">请选择答案</h1>\--%>
  <%--</header>',--%>
            <%--cols: [--%>
                <%--{--%>
                    <%--textAlign: 'center',--%>
                    <%--values: ['A', 'B', 'C', 'D']--%>
                <%--}--%>
            <%--]--%>
        <%--});--%>
        <%--$("#picker5").picker({--%>
            <%--toolbarTemplate: '<header class="bar bar-nav">\--%>
  <%--<button class="button button-link pull-right close-picker">确定</button>\--%>
  <%--<h1 class="title">请选择答案</h1>\--%>
  <%--</header>',--%>
            <%--cols: [--%>
                <%--{--%>
                    <%--textAlign: 'center',--%>
                    <%--values: ['A', 'B', 'C', 'D']--%>
                <%--}--%>
            <%--]--%>
        <%--});--%>

<%--</script>--%>

</html>
