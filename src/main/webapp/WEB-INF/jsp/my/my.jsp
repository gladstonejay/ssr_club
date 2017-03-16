<%--
  Created by IntelliJ IDEA.
  User: shuaizhiguo
  Date: 2016/3/29
  Time: 18:35
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
            <button class="button button-link button-nav pull-right"><a href="/my/loginOut.j" external style="color:#FFFFFF">
                注销
            </a><span class="icon icon-right"></span>
            </button>
            <h1 class='title'>我的微课堂</h1>
        </header>

        <%--<c:choose>--%>
        <%--<c:when test="${userShowInfo.userTypeEnum == '3' ||  userShowInfo.userTypeEnum == '4'}">--%>
            <%--<%@ include file="../common/bottom31.jsp" %>--%>
            <%--</c:when>--%>
            <%--<c:otherwise>--%>
                <%--<%@ include file="../common/bottom4.jsp" %>--%>
                <%--</c:otherwise></c:choose>--%>
        <%@ include file="../common/bottom4.jsp" %>
        <div class="content">

            <div class="card demo-card-header-pic">
                <div valign="bottom" class="card-header color-white no-border no-padding">
                    <img class='card-cover' src="../../../static/imags/my/my_headP.png" alt="">
                </div>
            </div>



            <div class="list-block">
                <ul>
                    <li class="item-content">
                        <div class="item-media"><img src="../../../static/imags/my/type.png" width="34"></div>
                        <div class="item-inner">
                            <div class="item-title">身份 : ${userShowInfo.userType}</div>
                        </div>
                    </li>
                    <li class="item-content">
                        <div class="item-media"><img src="../../../static/imags/my/telephone.png" width="34"></div>
                        <div class="item-inner">
                            <div class="item-title">联系方式 : ${userId}</div>
                        </div>
                    </li>
                    <li class="item-content">
                        <div class="item-media"><img src="../../../static/imags/my/nick_name.png" width="34"></div>
                        <div class="item-inner">
                            <div class="item-title">昵称 ：${userShowInfo.userNickName}</div>
                        </div>
                    </li>
                </ul>
            </div>

            <c:if test="${userShowInfo.userTypeEnum == '1' || userShowInfo.userTypeEnum == '2'}">
            <div class="card">
                <div class="card-content">
                    <div class="list-block media-list">
                        <ul>
                            <li>
                                <a href="/my/rank.j" external class="item-link item-content">
                                    <div class="item-media">
                                        <img src="../../../static/imags/my/score.png" width="34">
                                    </div>
                                    <div class="item-inner">
                                        <div class="item-title-row">
                                            <div class="item-title">我的积分 : ${userShowInfo.score}</div>
                                        </div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-content">
                    <div class="list-block media-list">
                        <ul>
                            <li>
                                <a href="/my/rank.j" external class="item-link item-content">
                                    <div class="item-media">
                                        <img src="../../../static/imags/my/rank.png" width="34">
                                    </div>
                                    <div class="item-inner">
                                        <div class="item-title-row">
                                            <div class="item-title">我的排名 : ${userShowInfo.rank}</div>
                                        </div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            </c:if>

    </div>
</div>

<jsp:include page="../common/cmnjs.jsp"></jsp:include>

</body>
</html>