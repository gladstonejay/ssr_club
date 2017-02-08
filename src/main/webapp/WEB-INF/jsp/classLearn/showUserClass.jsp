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
        <header class="bar bar-nav">
            <h1 class="title"><span class="icon" ><img src="../../../static/imags/tab/tab4-active.png" width="22" ></span> 我的课程</h1>
        </header>
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

            <div class="tabs">
                <div id="tab4" class="tab active">
                    <div class="card demo-card-header-pic">
                        <div class="card-content">
                            <%--<div class="card-content-inner" style="text-align: center">--%>
                                <%--<p>还在比价格？比赠品？</p>--%>
                                <%--<p>那就被淘汰了！</p>--%>
                                <%--<p>你知道什么是奶粉销售的制胜法宝吗？</p>--%>
                                <%--<p>你知道如何才能成为老板满意、妈妈信赖的营养顾问吗？</p>--%>
                                <%--<P>欢迎来到母婴营养微课堂，开启你专业母婴营养顾问之旅。</P>--%>
                            <%--</div>--%>
                        </div>
                        <div>
                            <p style="text-align: center"> <img src="../../../static/imags/precast.png" width="296"></p>
                        </div>
                    </div>

                    <c:forEach items="${videoInfoList}" var="item" varStatus="xh">
                        <c:if test="${item.orderId=='1'}">
                            <p style="text-align: center"><img src="../../../static/imags/month/6.0.png"  width="163" ></p>
                        </c:if>
                        <c:if test="${item.orderId=='3' || item.orderId=='7' || item.orderId=='11' ||item.orderId=='15' ||item.orderId=='19' ||item.orderId=='23' ||item.orderId=='27'}">
                            <p style="text-align: center"><img src="../../../static/imags/month/${((item.orderId-3)/4+7)}.png"  width="163" ></p>
                        </c:if>
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
                                                        <img src="../../../static/imags/video1.png" width="44">
                                                    </div>
                                                    <div class="item-inner">
                                                        <div class="item-title-row">
                                                            <div class="item-title">第${item.orderId}讲</div>
                                                        </div>
                                                        <div class="item-subtitle">${item.title}</div>
                                                    </div>
                                                </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card-footer">
                                <span>${item.timestamp}</span>
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
                <div id="tab1" class="tab">
                    <c:forEach items="${examList}" var="item" varStatus="xh">
                        <div class="card">
                            <div class="card-content">
                                <div class="list-block media-list">
                                    <ul>
                                        <li >
                                            <a href="/classLearn/showOneExam.j?id=${item.orderId}" external class="item-link item-content">
                                                <div class="item-media">
                                                    <img src="../../../static/imags/video/video${item.orderId}.png" width="44" >
                                                </div>
                                                <div class="item-inner">
                                                    <div class="item-title-row">
                                                        <div class="item-title">第${item.orderId}次考试</div>
                                                    </div>
                                                    <div class="item-subtitle">${item.title}</div>
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
                <div id="tab3" class="tab">
                    <c:forEach items="${weixinList}" var="item" varStatus="xh">
                        <div class="card">
                            <div class="card-content">
                                <div class="list-block media-list">
                                    <ul>
                                        <li >
                                            <a href="/classLearn/showOneTip.j?id=${item.itemId}" external class="item-link item-content">
                                                <div class="item-media">
                                                    <img src="../../../static/imags/tab/tab3.png" width="44" >
                                                </div>
                                                <div class="item-inner">
                                                    <div class="item-title-row">
                                                        <div class="item-title">微信答疑第${item.itemId}篇</div>
                                                    </div>
                                                    <div class="item-subtitle">${item.title}</div>
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