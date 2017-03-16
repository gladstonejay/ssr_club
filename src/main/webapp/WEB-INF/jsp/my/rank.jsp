<%--
  Created by IntelliJ IDEA.
  User: shuaizhiguo
  Date: 2017/2/11
  Time: 23:35
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
        <header class="bar bar-nav">
            <h1 class='title'><span class="icon" ><img src="../../../static/imags/tab/tab22-active.png" width="28" ></span> 学习排名 前十达人</h1>
        </header>
        <%@ include file="../common/bottom4.jsp" %>

        <div class="content">
                <div valign="bottom" class="card-header color-white no-border no-padding">
                    <img class='card-cover' src="../../../static/imags/rank/headP.png" alt="">
                </div>
            <div class="list-block">
                <ul>
                        <div valign="bottom" class="card-header color-white no-border no-padding">
                            <img class='card-cover' src="../../../static/imags/rank/rankTitle.png" alt="">
                        </div>
                    <c:forEach items="${rankList}" var="item" varStatus="xh">
                    <li class="item-content">
                        <div class="item-inner">
                        <div class="item-title"><span class="icon" ><img src="../../../static/imags/rank/rank-${xh.count}.png" width="28" ></span> ${item.userNname}(${item.city} ${item.county}店)</div>
                        <div class="item-after">${item.totalScore}</div>
                    </div>
                </li>
                    </c:forEach>
                </ul>
            </div>

        </div>
    </div>
</div>
