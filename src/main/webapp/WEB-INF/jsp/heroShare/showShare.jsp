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

</head>
<body>
<div class="page-group">
    <div class="page page-current">
        <header class="bar bar-nav">
            <h1 class='title'>精英分享</h1>
        </header>

        <c:choose>
            <c:when test="${userBasic.userType == '3' ||  userBasic.userType == '4'}">
                <%@ include file="../common/bottom21.jsp" %>
            </c:when>
            <c:otherwise>
                <%@ include file="../common/bottom3.jsp" %>
            </c:otherwise></c:choose>

        <div class="content">
            <div class="card demo-card-header-pic">
                <div valign="bottom" class="card-header color-white no-border no-padding">
                    <img class='card-cover' src="../../../static/imags/tab1_milk.png" alt="">
                </div>
            </div>
            <div class="buttons-tab">
                <a href="#tab1" class="tab-link active button">行业动态</a>
                <a href="#tab2" class="tab-link button">品牌中心</a>
                <a href="#tab3" class="tab-link button">完美门店</a>
            </div>
            <div class="tabs">
            <div id="tab1" class="tab active">
                <c:forEach items="${content1}" var="item" varStatus="xh">
                    <div class="card">
                        <div class="card-content">
                            <div class="list-block media-list">
                                <ul>
                                    <li >
                                        <a href="/heroShare/showShareDetail.j?id=${item.item}&type=${item.type}" external class="item-link item-content">
                                            <div class="item-media">
                                                <img src="../../../static/imags/content/content${item.type}-${item.item}.png" width="44" >
                                            </div>
                                            <div class="item-inner">
                                                <div class="item-title-row">
                                                    <div class="item-title">${item.title}</div>
                                                </div>
                                                <div class="item-subtitle">${item.subTitle}</div>
                                                <br />
                                                <div class="item-subtitle">
                                                    <span>${item.createTime}</span>
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
            <div id="tab2" class="tab">
                <c:forEach items="${content2}" var="item" varStatus="xh">
                    <div class="card">
                        <div class="card-content">
                            <div class="list-block media-list">
                                <ul>
                                    <li >
                                        <a href="/heroShare/showShareDetail.j?id=${item.item}&type=${item.type}" external class="item-link item-content">
                                            <div class="item-media">
                                                <img src="../../../static/imags/content/content${item.type}-${item.item}.png" width="44" >
                                            </div>
                                            <div class="item-inner">
                                                <div class="item-title-row">
                                                    <div class="item-title">${item.title}</div>
                                                </div>
                                                <div class="item-subtitle">${item.subTitle}</div>
                                                <br />
                                                <div class="item-subtitle">
                                                    <span>${item.createTime}</span>
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
                <c:forEach items="${content3}" var="item" varStatus="xh">
                    <div class="card">
                        <div class="card-content">
                            <div class="list-block media-list">
                                <ul>
                                    <li >
                                        <a href="/heroShare/showShareDetail.j?id=${item.item}&type=${item.type}" external class="item-link item-content">
                                            <div class="item-media">
                                                <img src="../../../static/imags/content/content${item.type}-${item.item}.png" width="44" >
                                            </div>
                                            <div class="item-inner">
                                                <div class="item-title-row">
                                                    <div class="item-title">${item.title}</div>
                                                </div>
                                                <div class="item-subtitle">${item.subTitle}</div>
                                                <br />
                                                <div class="item-subtitle">
                                                    <span>${item.createTime}</span>
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

<jsp:include page="../common/cmnjs.min.jsp"></jsp:include>

</body>
</html>
