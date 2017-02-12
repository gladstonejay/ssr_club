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

            <c:forEach items="${videoInfoList}" var="item" varStatus="xh">
                <%--<c:if test="${item.orderId=='1'}">--%>
                    <%--<p style="text-align: center"><img src="../../../static/imags/month/6.0.png"  width="163" ></p>--%>
                <%--</c:if>--%>
                <%--<c:if test="${item.orderId=='3' || item.orderId=='7' || item.orderId=='11' ||item.orderId=='15' ||item.orderId=='19' ||item.orderId=='23' ||item.orderId=='27'}">--%>
                    <%--<p style="text-align: center"><img src="../../../static/imags/month/${((item.orderId-3)/4+7)}.png"  width="163" ></p>--%>
                <%--</c:if>--%>
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
                                            <div class="item-media">
                                                <img src="../../../static/imags/video/video${item.orderId}.png" width="64">
                                            </div>
                                            <div class="item-inner">
                                                <div class="item-title-row">
                                                    <div >${item.title}</div>
                                                </div>
                                                <div class="item-subtitle"><img src="../../../static/imags/classLearn/writer.png" width="12"> ：${item.writer}</div>
                                                <div class="item-subtitle">
                                                    <img src="../../../static/imags/heroShare/time.png" width="16"> <span>${item.timestamp}</span>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <img src="../../../static/imags/classLearn/class_done.png" width="48">
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

<jsp:include page="../common/cmnjs.jsp"></jsp:include>

</body>
</html>