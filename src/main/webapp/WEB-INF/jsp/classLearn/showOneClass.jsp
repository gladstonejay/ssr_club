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

    var ap_name = navigator.appName;
    var ap_vinfo = navigator.appVersion;
    var ap_ver = parseFloat(ap_vinfo.substring(0,ap_vinfo.indexOf('(')));
    var time_start = new Date();
    var clock_start = time_start.getTime();
    var dl_ok=false;
    function init ()
    {
      if(ap_name=="Netscape" && ap_ver>=3.0)
        dl_ok=true;
      return true;
    }
    function get_time_spent ()
    {
      var time_now = new Date();
      return((time_now.getTime() - clock_start)/1000);
    }
    function show_secs () // show the time user spent on the side
    {
      var i_total_secs = Math.round(get_time_spent());
      var i_secs_spent = i_total_secs % 60;
      var i_mins_spent = Math.round((i_total_secs-30)/60);
      var s_secs_spent = "" + ((i_secs_spent>9) ? i_secs_spent : "0" + i_secs_spent);
      var s_mins_spent ="" + ((i_mins_spent>9) ? i_mins_spent : "0" + i_mins_spent);
      //alert(s_mins_spent);
      //alert(s_secs_spent);
      //document.fm0.time_spent.value = s_mins_spent + ":" + s_secs_spent;
      window.setTimeout('show_secs()',1000);
    }
  </script>
</head>
<body onLoad="init(); window.setTimeout('show_secs()',1);">
<div class="page-group">
  <div class="page page-current">

    <%@ include file="../common/bottom.jsp" %>
    <div class="content">
      <div id="wktvideo">
        <iframe width="100%" height="250" src="http://player.youku.com/embed/${videoInfo.videoId}"  frameborder="0" allowfullscreen="true"></iframe>
      </div>
      <div class="content-padded"><p> ${videoInfo.summary} </p></div>
    </div>
  </div>
</div>

<jsp:include page="../common/cmnjs.jsp"></jsp:include>

</body>
</html>
