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
    <jsp:include page="../common/cmnjs.min.jsp"></jsp:include>

</head>
<body bgcolor="#229ddf">
<div class="page-group">
    <div class="page page-current">
        <header class="bar bar-nav" >
            <h1 class='title'>雀巢销售选择区域</h1>
        </header>
        <%--<%@ include file="../common/bottom4.jsp" %>--%>
        <div class="content">
            <form class="zform zform-radius" action="/my/saleLocationCheck.j" method="post" id="form1">
                <div class="list-block">
                    <ul>
                        <!-- Text inputs -->
                        <li>
                            <div class="item-content">
                                <div class="item-media"><i class="icon icon-form-email"></i></div>
                                <div class="item-inner">
                                    <div class="item-title label">请选择区域</div>
                                    <div class="item-input">
                                        <input  type="text" placeholder="请选择区域" id="location" name="location" readonly="" />
                                        <input  type="hidden" value="${userType}" id="userType" name="userType" readonly="" />
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li><p span style="color:red;" >${errorId}</p><p span style="color:red;">${errorNname}</p></li>
                    </ul>
                </div>
                <div class="content-block">
                    <div class="row">
                        <div class="col-100"><input type="submit" class="button button-big button-fill button-success" value="注册" id="submit-button"></div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="../common/city.jsp"></jsp:include>
</body>
<script>
    $(function () {
        $("#location").picker({
            toolbarTemplate: '<header class="bar bar-nav">\
    <button class="button button-link pull-right close-picker">确定</button>\
    <h1 class="title">请选择区域</h1>\
    </header>',
            cols: [
                {
                    textAlign: 'center',
                    values: ['北二', '北三', '西北']
                    //如果你希望显示文案和实际值不同，可以在这里加一个displayValues: [.....]
                },
                {
                    textAlign: 'center',
                    values: ['河北', '山东', '山西', '宁夏', '新疆', '甘肃', '陕西','青海']
                },
                {
                    textAlign: 'center',
                    values: ['保定', '唐山','石家庄','济南','济宁','青岛','潍坊','烟台','太原','长治','临汾','银川','新疆','兰州','咸阳','西安','西宁']
                }
            ]
        });
    })
</script>
</html>