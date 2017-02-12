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

        <c:choose>
        <c:when test="${userShowInfo.userTypeEnum == '3' ||  userShowInfo.userTypeEnum == '4'}">
            <%@ include file="../common/bottom31.jsp" %>
            </c:when>
            <c:otherwise>
                <%@ include file="../common/bottom4.jsp" %>
                </c:otherwise></c:choose>
        <%--<%@ include file="../common/bottom4.jsp" %>--%>
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