<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<script type='text/javascript' src='${ctx}/static/js/sm.min.js' charset='utf-8'></script>
<link rel="stylesheet" href="${ctx}/static/css/sm.min.css">
<script type='text/javascript' src='${ctx}/static/js/sm-city-picker.min.js' charset='utf-8'></script>