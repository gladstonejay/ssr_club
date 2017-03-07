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
        <%@ include file="../common/bottom.jsp" %>

        <div class="content">

            <form class="zform zform-radius" action="/classLearn/examResult.j?id=${id}&type=${type}" method="post" id="form1">
            <c:forEach items="${exam}" var="item" varStatus="xh">
                <div class="content-padded"><p> ${item.context} </p></div>
                <div class="content-padded radio-pretty inline ">
                    <input type="radio"  name="radio+${item.itemId}" value="A"><span> ${item.a}</span>
                </div>
                <div class="content-padded radio-pretty inline ">
                <input type="radio" name="radio+${item.itemId}" value="B"><span> ${item.b}</span>
                </div>
                <div class="content-padded radio-pretty inline">
                    <input type="radio" name="radio+${item.itemId}" value="C"><span> ${item.c}</span>
                </div>
                <div class="content-padded radio-pretty inline">
                    <input type="radio" name="radio+${item.itemId}" value="D"><span> ${item.d}</span>
                </div>
            </c:forEach>
                <div class="content-block">
                    <div class="row">
                        <div class="col-100"><input type="submit" class="button button-big button-fill button-success" value="交卷" id="submit-button"></div>
                    </div>
                </div>
            </form>



            <%--<form class="zform zform-radius" action="/review/examResult.j?id=${id}" method="post" id="form1">--%>
            <%--<c:forEach items="${exam}" var="item" varStatus="xh">--%>
            <%--<div class="content-padded"><p> ${item.context} </p></div>--%>
                <%--<div class="content-padded"><p> ${item.a} </p></div>--%>
                <%--<div class="content-padded"><p> ${item.b} </p></div>--%>
                <%--<div class="content-padded"><p> ${item.c} </p></div>--%>
                <%--<div class="content-padded"><p> ${item.d} </p></div>--%>
                    <%--<div class="item-input">--%>
                    <%--<input style="text-align: center" type="text" placeholder="选择答案" id="picker${item.itemId}" name="picker${item.itemId}" readonly="" />--%>
                    <%--</div>--%>
            <%--</c:forEach>--%>
                <%--<div class="content-block">--%>
                    <%--<div class="row">--%>
                        <%--<div class="col-100"><input type="submit" class="button button-big button-fill button-success" value="交卷" id="submit-button"></div>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</form>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<%--<jsp:include page="../common/cmnjs.min.jsp"></jsp:include>--%>
<%--</body>--%>
<%--<script>--%>
        <%--$("#picker1").picker({--%>
            <%--toolbarTemplate: '<header class="bar bar-nav">\--%>
  <%--<button class="button button-link pull-right close-picker">确定</button>\--%>
  <%--<h1 class="title">请选择答案</h1>\--%>
  <%--</header>',--%>
            <%--cols: [--%>
                <%--{--%>
                    <%--textAlign: 'center',--%>
                    <%--values: ['A', 'B', 'C', 'D']--%>
                <%--}--%>
            <%--]--%>
        <%--});--%>
        <%--$("#picker2").picker({--%>
            <%--toolbarTemplate: '<header class="bar bar-nav">\--%>
  <%--<button class="button button-link pull-right close-picker">确定</button>\--%>
  <%--<h1 class="title">请选择答案</h1>\--%>
  <%--</header>',--%>
            <%--cols: [--%>
                <%--{--%>
                    <%--textAlign: 'center',--%>
                    <%--values: ['A', 'B', 'C', 'D']--%>
                <%--}--%>
            <%--]--%>
        <%--});--%>
        <%--$("#picker3").picker({--%>
            <%--toolbarTemplate: '<header class="bar bar-nav">\--%>
  <%--<button class="button button-link pull-right close-picker">确定</button>\--%>
  <%--<h1 class="title">请选择答案</h1>\--%>
  <%--</header>',--%>
            <%--cols: [--%>
                <%--{--%>
                    <%--textAlign: 'center',--%>
                    <%--values: ['A', 'B', 'C', 'D']--%>
                <%--}--%>
            <%--]--%>
        <%--});--%>
        <%--$("#picker4").picker({--%>
            <%--toolbarTemplate: '<header class="bar bar-nav">\--%>
  <%--<button class="button button-link pull-right close-picker">确定</button>\--%>
  <%--<h1 class="title">请选择答案</h1>\--%>
  <%--</header>',--%>
            <%--cols: [--%>
                <%--{--%>
                    <%--textAlign: 'center',--%>
                    <%--values: ['A', 'B', 'C', 'D']--%>
                <%--}--%>
            <%--]--%>
        <%--});--%>
        <%--$("#picker5").picker({--%>
            <%--toolbarTemplate: '<header class="bar bar-nav">\--%>
  <%--<button class="button button-link pull-right close-picker">确定</button>\--%>
  <%--<h1 class="title">请选择答案</h1>\--%>
  <%--</header>',--%>
            <%--cols: [--%>
                <%--{--%>
                    <%--textAlign: 'center',--%>
                    <%--values: ['A', 'B', 'C', 'D']--%>
                <%--}--%>
            <%--]--%>
        <%--});--%>

<%--</script>--%>

</html>
