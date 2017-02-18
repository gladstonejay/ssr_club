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
                <%--<%@ include file="../common/bottom11.jsp" %>--%>
            <%--</c:when>--%>
            <%--<c:otherwise>--%>
                <%--<%@ include file="../common/bottom2.jsp" %>--%>
            <%--</c:otherwise>--%>
        <%--</c:choose>--%>
        <%@ include file="../common/bottom2.jsp" %>
        <div class="content">
            <div class="card demo-card-header-pic">
                <div valign="bottom" class="card-header color-white no-border no-padding">
                    <img class='card-cover' src="../../../static/imags/heroCollection/headP.png" alt="">
                </div>
            </div>
            <c:forEach items="${content}" var="item" varStatus="xh">
                <div class="card">
                    <div class="card-content">
                        <div class="list-block media-list">
                            <ul>
                                <li >
                                    <a href="/heroCollection/showHeroDetail.j?id=${item.item}&type=${item.type}" external class="item-link item-content">
                                        <%--<div class="item-media">--%>
                                            <%--<img src="../../../static/imags/content/content${item.type}-${item.item}.png" width="44" >--%>
                                        <%--</div>--%>
                                        <div class="item-inner">
                                            <div class="item-title-row">
                                                <div ><h4>${item.title}</h4></div>
                                            </div>
                                            <%--<div class="item-subtitle">${item.subTitle}</div>--%>
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

<jsp:include page="../common/cmnjs.min.jsp"></jsp:include>

</body>
</html>
