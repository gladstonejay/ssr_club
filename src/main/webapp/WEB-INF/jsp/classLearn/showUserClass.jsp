<%--
  Created by IntelliJ IDEA.
  User: shuaizhiguo
  Date: 2016/3/28
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
        wx.ready(function () {
            wx.hideOptionMenu();
        })
    </script>

</head>
<body>
<div class="page-group">
    <div class="page page-current">

        <%@ include file="../common/bottom.jsp" %>
        <div class="content">

            <div class="card demo-card-header-pic">
                <div valign="bottom" class="card-header color-white no-border no-padding">
                    <img class='card-cover' src="../../../static/imags/classLearn/headP.png" alt="">
                </div>
            </div>
            <div class="buttons-tab">
                <a href="#tab4" class="tab-link active button">我的课程</a>
                <a href="#tab1" class="tab-link button">课程考核</a>
                <a href="#tab3" class="tab-link button">答疑精选</a>
            </div>
            <%--我的课程--%>
            <div class="tabs">
                <div id="tab4" class="tab active">
                    <%--简介图--%>
                    <div class="card demo-card-header-pic">
                        <div valign="bottom" class="card-header color-white no-border no-padding">
                            <img class='card-cover' src="../../../static/imags/shortIntro/myClass.png" alt="">
                        </div>
                    </div>

                    <%--搜索--%>
                        <form class="zform zform-radius" action="/classLearn/search.j" method="post" id="form1">
                    <div class="content-padded">
                        <div class="searchbar row">
                            <div class="search-input col-80">
                                <label class="icon icon-search" for="search"></label>
                                <input type="text" id='search' name='search' placeholder='请输入关键字......'/>
                            </div>
                            <div class="col-20">
                            <input type="submit" class="button button-fill col-20" value="搜索">
                            </div>
                        </div>
                    </div>
                        </form>

                    <%--题图--%>
                    <div valign="bottom" class="card-header color-white no-border no-padding">
                        <c:if test="${month != null}">
                        <img class='card-cover' src="../../../static/imags/month/class-${month}.png" alt="">
                        </c:if>
                    </div>
                    <c:forEach items="${videoInfoList}" var="item" varStatus="xh">
                        <div class="card">
                            <div class="card-content">
                                <div class="list-block media-list">
                                    <ul>
                                        <li>
                                            <c:choose>
                                            <c:when test="${item.videoId !=null }">
                                            <a href="/classLearn/showOneClass.j?id=${item.orderId}" external
                                               class="item-link item-content">
                                                </c:when>
                                                <c:otherwise>
                                                <a href="#" external class="item-link item-content">
                                                    </c:otherwise>
                                                    </c:choose>
                                                    <div class="item-media"><i class="icon icon-f7"></i></div>
                                                    <div class="item-media">
                                                            <%--<img src="../../../static/imags/video${item.orderId}.png" width="44">--%>
                                                        <img src="../../../static/imags/video/video${item.orderId}.png"
                                                             width="64">
                                                    </div>
                                                    <div class="item-inner">
                                                        <div class="item-title-row">
                                                            <div>${item.title}</div>
                                                        </div>
                                                        <div class="item-subtitle"><img
                                                                src="../../../static/imags/classLearn/writer.png"
                                                                width="12"> ：${item.writer}</div>
                                                        <div class="item-subtitle">
                                                            <img src="../../../static/imags/heroShare/time.png"
                                                                 width="16"> <span>${item.timestamp}</span>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <c:choose>
                                                                <c:when test="${item.watched=='1'}">
                                                                    <img src="../../../static/imags/classLearn/class_done.png"
                                                                         width="48">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <img src="../../../static/imags/classLearn/class_undo.png"
                                                                         width="48">
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                    </div>
                                                </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="content-block">
                        <div class="row">
                            <div class="col-100">
                                <a href="/classLearn/showHistory.j" external
                                   class="button button-big button-fill button-success">查看历史课程</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%--课程考核--%>
                <div id="tab1" class="tab">
                    <%--简介图--%>
                    <div class="card demo-card-header-pic">
                        <div valign="bottom" class="card-header color-white no-border no-padding">
                            <img class='card-cover' src="../../../static/imags/shortIntro/exam.png" alt="">
                        </div>
                    </div>
                    <%--课前测试的一坨--%>
                    <div valign="bottom" class="card-header color-white no-border no-padding">
                        <img class='card-cover' src="../../../static/imags/classLearn/lesson_before.png" alt="">
                    </div>
                    <c:forEach items="${examListBefore}" var="item" varStatus="xh">
                        <div class="card">
                            <div class="card-content">
                                <div class="list-block media-list">
                                    <ul>
                                        <li>
                                            <a href="/classLearn/showOneExam.j?id=${item.orderId}&type=1" external
                                               class="item-link item-content">
                                                <div class="item-media">
                                                    <img src="../../../static/imags/content/before_test_${item.orderId}.png"
                                                         width="64">
                                                </div>
                                                <div class="item-inner">
                                                    <div class="item-title-row">
                                                        <div class="item-title"><h4>${item.title}</h4></div>
                                                    </div>
                                                    <div class="item-subtitle">
                                                        <span>题型：单选</span>
                                                    </div>
                                                    <div class="item-subtitle">
                                                        <span>难度：</span>
                                                        <img src="../../../static/imags/classLearn/star_${item.star}.png"
                                                             width="64">
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <%--课程测试的一坨--%>
                    <div valign="bottom" class="card-header color-white no-border no-padding">
                        <img class='card-cover' src="../../../static/imags/classLearn/lesson_after.png" alt="">
                    </div>
                    <c:forEach items="${examListAfter}" var="item" varStatus="xh">
                        <div class="card">
                            <div class="card-content">
                                <div class="list-block media-list">
                                    <ul>
                                        <li>
                                            <a href="/classLearn/showOneExam.j?id=${item.orderId}&type=2" external
                                               class="item-link item-content">
                                                <div class="item-media">
                                                    <img src="../../../static/imags/content/after_test_${item.orderId}.png"
                                                         width="64">
                                                </div>
                                                <div class="item-inner">
                                                    <div class="item-title-row">
                                                        <div class="item-title"><h4>${item.title}</h4></div>
                                                    </div>
                                                    <div class="item-subtitle">
                                                        <span>题型：单选</span>
                                                    </div>
                                                    <div class="item-subtitle">
                                                        <span>难度：</span>
                                                        <img src="../../../static/imags/classLearn/star_${item.star}.png"
                                                             width="64">
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div id="tab3" class="tab">
                    <%--简介图--%>
                    <div class="card demo-card-header-pic">
                        <div valign="bottom" class="card-header color-white no-border no-padding">
                            <img class='card-cover' src="../../../static/imags/shortIntro/answer.png" alt="">
                        </div>
                    </div>
                    <c:forEach items="${weixinList}" var="item" varStatus="xh">
                        <div class="card">
                            <div class="card-content">
                                <div class="list-block media-list">
                                    <ul>
                                        <li>
                                            <a href="/classLearn/showOneTip.j?id=${item.itemId}&type=${item.type}"
                                               external class="item-link item-content">
                                                <div class="item-inner">
                                                    <div class="item-title-row">
                                                        <div><h5>${item.title}</h5></div>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>


        </div>
    </div>
</div>

<jsp:include page="../common/cmnjs.jsp"></jsp:include>

</body>
</html>