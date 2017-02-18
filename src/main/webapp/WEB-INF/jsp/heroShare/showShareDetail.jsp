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
            <div class="item-media">
                <div valign="bottom" class="card-header color-white no-border no-padding">
                <img class='card-cover' src="../../../static/imags/content/content-big${content.type}-${content.imageName}.png" >
                    </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/cmnjs.min.jsp"></jsp:include>

</body>
</html>
