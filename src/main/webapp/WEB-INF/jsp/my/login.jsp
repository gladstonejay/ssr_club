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
<body bgcolor="#229ddf">
<div class="page-group">
    <div class="page page-current">
        <header class="bar bar-nav" >
            <button class="button button-link button-nav pull-right"><a href="/my/chooseType.j" external style="color:#FFFFFF">
                注册
            </a><span class="icon icon-right"></span>
            </button>
            <h1 class='title'>登录</h1>
        </header>
        <%--<%@ include file="../common/bottom4.jsp" %>--%>
        <div class="content">
            <form class="zform zform-radius" action="/my/loginCheck.j" method="post" id="form1">
            <div class="list-block">
                <ul>
                    <!-- Text inputs -->
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-name"></i></div>
                            <div class="item-inner">
                                <div class="item-title label">电话</div>
                                <div class="item-input">
                                    <input type="text" placeholder="请输入电话号码" id="userId" name="userId" value=${userId}>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-email"></i></div>
                            <div class="item-inner">
                                <div class="item-title label">密码</div>
                                <div class="item-input">
                                    <input type="password" placeholder="请输入密码" id="password" name="password" value=${ubVo.password}>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li><p span style="color:red;" >${errorId}</p><p span style="color:red;">${errorNname}</p></li>
                </ul>
            </div>
            <div class="content-block">
                <div class="row">
                    <div class="col-100"><input type="submit" class="button button-big button-fill button-success" value="登录" id="submit-button"></div>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="../common/cmnjs.jsp"></jsp:include>

</body>
</html>