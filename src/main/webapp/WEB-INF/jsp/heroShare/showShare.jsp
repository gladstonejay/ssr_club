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
        <%--<c:choose>--%>
            <%--<c:when test="${userBasic.userType == '3' ||  userBasic.userType == '4'}">--%>
                <%--<%@ include file="../common/bottom21.jsp" %>--%>
            <%--</c:when>--%>
            <%--<c:otherwise>--%>
                <%--<%@ include file="../common/bottom3.jsp" %>--%>
            <%--</c:otherwise></c:choose>--%>
        <%@ include file="../common/bottom3.jsp" %>
        <div class="content">
            <div class="card demo-card-header-pic">
                <div valign="bottom" class="card-header color-white no-border no-padding">
                    <img class='card-cover' src="../../../static/imags/heroShare/headP.png" alt="">
                </div>
            </div>
            <div class="buttons-tab">
                <a href="#tab1" class="tab-link active button">行业动态</a>
                <a href="#tab2" class="tab-link button">品牌中心</a>
                <a href="#tab3" class="tab-link button">完美门店</a>
            </div>
            <div class="tabs">
            <div id="tab1" class="tab active">
                <%--简介图--%>
                <div class="card demo-card-header-pic">
                    <div valign="bottom" class="card-header color-white no-border no-padding">
                        <img class='card-cover' src="../../../static/imags/shortIntro/industry.png" alt="">
                    </div>
                </div>
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
                                                    <div ><h4>${item.title}</h4></div>
                                                </div>
                                                <br />
                                                <div class="item-subtitle">
                                                    <img src="../../../static/imags/heroShare/time.png" width="16"> <span>${item.createTime}</span>
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
                <%--简介图--%>
                <div class="card demo-card-header-pic">
                    <div valign="bottom" class="card-header color-white no-border no-padding">
                        <img class='card-cover' src="../../../static/imags/shortIntro/brand.png" alt="">
                    </div>
                </div>
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
                                                    <div ><h4>${item.title}</h4></div>
                                                </div>
                                                <br />
                                                <div class="item-subtitle">
                                                    <img src="../../../static/imags/heroShare/time.png" width="16"> <span>${item.createTime}</span>
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
                        <img class='card-cover' src="../../../static/imags/shortIntro/perfect.png" alt="">
                    </div>
                </div>
                <c:forEach items="${content3}" var="item" varStatus="xh">
                    <div class="card">
                        <div class="card-content">
                            <div class="list-block media-list">
                                <ul>
                                    <li >
                                        <a href="/heroShare/showShareDetail.j?id=${item.item}&type=${item.type}" external class="item-link item-content">
                                            <div class="item-inner">
                                                <div class="item-title-row">
                                                    <div class="item-title"> Q${item.item}季度完美门店</div>
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
