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

</head>
<body>

<div class="page-group">
    <div class="page page-current">
        <header class="bar bar-nav">
            <h1 class='title'><span class="icon" ><img src="../../../static/imags/tab/tab2-active.png" width="28" ></span> 学习排名 前十达人</h1>
        </header>
        <%@ include file="../common/bottom4.jsp" %>

        <div class="content">
            <div class="card demo-card-header-pic">
                <div valign="bottom" class="card-header color-white no-border no-padding">
                    <img class='card-cover' src="../../../static/imags/rank/headP.png" alt="">
                </div>
            </div>
            <c:forEach items="${rankList}" var="item" varStatus="xh">
                <li class="item-content">
                    <div class="item-inner">
                        <div class="item-title"><span class="icon" ><img src="../../../static/imags/cups/tab2-${xh.count}.png" width="28" ></span> ${item.userNname}</div>
                        <div class="item-after">${item.score}</div>
                    </div>
                </li>
            </c:forEach>
        </div>
    </div>
</div>
