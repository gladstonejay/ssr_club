<%--
  Created by IntelliJ IDEA.
  User: shuaizhiguo
  Date: 2016/3/28
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

    <jsp:include page="../common/head.jsp"></jsp:include>

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
                            <div valign="bottom" class="card-header color-white no-border no-padding">
                                <img class='card-cover' src="../../../static/imags/month/class-${month}.png" alt="">
                            </div>
                    <c:forEach items="${videoInfoList}" var="item" varStatus="xh">
                        <div class="card">
                            <div class="card-content">
                                <div class="list-block media-list">
                                    <ul>
                                        <li>
                                            <c:choose>
                                            <c:when test="${item.videoId !=null }">
                                            <a href="/classLearn/showOneClass.j?id=${item.orderId}" external class="item-link item-content">
                                                </c:when>
                                                <c:otherwise>
                                                <a href="#" external class="item-link item-content">
                                                    </c:otherwise>
                                                    </c:choose>
                                                    <div class="item-media"><i class="icon icon-f7"></i></div>
                                                    <div class="item-media">
                                                            <%--<img src="../../../static/imags/video${item.orderId}.png" width="44">--%>
                                                        <img src="../../../static/imags/video/video${item.orderId}.png" width="64">
                                                    </div>
                                                        <div class="item-inner">
                                                            <div class="item-title-row">
                                                                <div >${item.title}</div>
                                                            </div>
                                                            <div class="item-subtitle"><img src="../../../static/imags/classLearn/writer.png" width="12"> ：${item.writer}</div>
                                                            <div class="item-subtitle">
                                                                <img src="../../../static/imags/heroShare/time.png" width="16"> <span>${item.timestamp}</span>
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <c:if test="${item.status=='1'}">
                                                                    <img src="../../../static/imags/classLearn/class_done.png" width="48">
                                                                </c:if>
                                                                <c:if test="${item.status=='2'}">
                                                                    <img src="../../../static/imags/classLearn/class_undo.png" width="48">
                                                                </c:if>
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
                                <a href="/classLearn/showHistory.j" external class="button button-big button-fill button-success">查看历史课程</a>
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
                                            <li >
                                                <a href="/classLearn/showOneExam.j?id=${item.orderId}&type=1" external class="item-link item-content">
                                                    <div class="item-media">
                                                        <img src="../../../static/imags/content/before_test_${item.orderId}.png" width="64" >
                                                    </div>
                                                    <div class="item-inner">
                                                        <div class="item-title-row">
                                                            <div class="item-title"><h4>第${item.orderId}次考试</h4></div>
                                                        </div>
                                                        <div class="item-subtitle" >
                                                            <span>题型：单选</span>
                                                        </div>
                                                        <div class="item-subtitle">
                                                            <span>难度：</span>
                                                                <img src="../../../static/imags/classLearn/star_${item.star}.png" width="64" >
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
                                            <li >
                                                <a href="/classLearn/showOneExam.j?id=${item.orderId}&type=2" external class="item-link item-content">
                                                    <div class="item-media">
                                                        <img src="../../../static/imags/content/after_test_${item.orderId}.png" width="64" >
                                                    </div>
                                                    <div class="item-inner">
                                                        <div class="item-title-row">
                                                            <div class="item-title"><h4>第${item.orderId}次考试</h4></div>
                                                        </div>
                                                        <div class="item-subtitle" >
                                                            <span>题型：单选</span>
                                                        </div>
                                                        <div class="item-subtitle">
                                                            <span>难度：</span>
                                                            <img src="../../../static/imags/classLearn/star_${item.star}.png" width="64" >
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
                                        <li >
                                            <a href="/classLearn/showOneTip.j?id=${item.itemId}&type=${item.type}" external class="item-link item-content">
                                                <div class="item-inner">
                                                    <div class="item-title-row">
                                                        <div ><h5>${item.title}</h5></div>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                                <%--<div class="card-footer">--%>
                                <%--<span>2016/04/12</span>--%>
                                <%--</div>--%>
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