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
    <script>

        /*
         * 注意：
         * 1. 所有的JS接口只能在公众号绑定的域名下调用，公众号开发者需要先登录微信公众平台进入“公众号设置”的“功能设置”里填写“JS接口安全域名”。
         * 2. 如果发现在 Android 不能分享自定义内容，请到官网下载最新的包覆盖安装，Android 自定义分享接口需升级至 6.0.2.58 版本及以上。
         * 3. 常见问题及完整 JS-SDK 文档地址：http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html
         *
         * 开发中遇到问题详见文档“附录5-常见错误及解决办法”解决，如仍未能解决可通过以下渠道反馈：
         * 邮箱地址：weixin-open@qq.com
         * 邮件主题：【微信JS-SDK反馈】具体问题
         * 邮件内容说明：用简明的语言描述问题所在，并交代清楚遇到该问题的场景，可附上截屏图片，微信团队会尽快处理你的反馈。
         */
        //        wx.config({
        //            debug: false,
        //            appId: 'wxc26a9306faf76eef',
        //            timestamp: 1489641187,
        //            nonceStr: '3abb9cfb-e718-4646-a244-7eaf34fba23e',
        //            signature: '0baec92b430389a2a337138246c661037314978b',
        //            jsApiList: [
        //                'hideOptionMenu'
        //            ]
        //        });
        wx.config({
            debug: false,
            appId: 'wxc26a9306faf76eef',
            jsApiList: [
                'hideOptionMenu'
            ]
        });
        wx.ready(function(){
            wx.hideOptionMenu();
        })
    </script>

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

                    <%--搜索--%>
                    <form class="zform zform-radius" action="/heroShare/search.j" method="post" id="form1">
                        <div class="content-padded">
                            <div class="searchbar row">
                                <div class="search-input col-80">
                                    <label class="icon icon-search" for="search_industry"></label>
                                    <input type="text" id='search_industry' name='search_industry' placeholder='请输入关键字......'/>
                                </div>
                                <div class="col-20">
                                    <input type="submit" class="button button-fill col-20" value="搜索">
                                </div>
                            </div>
                        </div>
                    </form>

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
                        <img class='card-cover' src="../../../static/imags/shortIntro/brand1.png" alt="">
                    </div>
                </div>

                    <%--搜索--%>
                    <form class="zform zform-radius" action="/heroShare/search.j" method="post" id="form1">
                        <div class="content-padded">
                            <div class="searchbar row">
                                <div class="search-input col-80">
                                    <label class="icon icon-search" for="search_brand"></label>
                                    <input type="text" id='search_brand' name='search_brand' placeholder='请输入关键字......'/>
                                </div>
                                <div class="col-20">
                                    <input type="submit" class="button button-fill col-20" value="搜索">
                                </div>
                            </div>
                        </div>
                    </form>

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
                        <img class='card-cover' src="../../../static/imags/shortIntro/perfect1.png" alt="">
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
                                                    <div class="item-title"> ${item.title}</div>
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
