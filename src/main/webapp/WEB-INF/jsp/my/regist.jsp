<%--
  Created by IntelliJ IDEA.
  User: shuaizhiguo
  Date: 2016/3/29
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

    <jsp:include page="../common/head.jsp"></jsp:include>
    <jsp:include page="../common/cmnjs.jsp"></jsp:include>

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
        <header class="bar bar-nav">
            <button class="button button-link button-nav pull-left">
                <span class="icon icon-left"></span><a href="/my/login.j" external style="color:#FFFFFF" >
                返回
            </a></button>
            <h1 class='title'>注册</h1>
        </header>
        <div class="content">
            <form class="zform zform-radius" action="/my/registCheck.j" method="post" id="form1">
            <div class="list-block">
                <ul>
                    <!-- Text inputs -->
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-name"></i></div>
                            <div class="item-inner">
                                <div class="item-title label">电话</div>
                                <div class="item-input">
                                    <input type="text" placeholder="请输入您的电话号码" id="userId" name="userId" value="${ubVo.userId}" data-validate="userId" data-describedby="userId-description">
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-email"></i></div>
                            <div class="item-inner">
                                <div class="item-title label">昵称</div>
                                <div class="item-input">
                                    <input type="text" placeholder="请输入您想使用的昵称" id="userNname" name="userNname" value="${ubVo.userNname}"  data-validate="userNname" data-describedby="userNname-description">
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-email"></i></div>
                            <div class="item-inner">
                                <div class="item-title label">姓名</div>
                                <div class="item-input">
                                    <input type="text" placeholder="请输入您的真实姓名" id="realName" name="realName" value="${ubVo.realName}"  data-validate="realName" data-describedby="realName-description">
                                </div>
                            </div>
                        </div>
                    </li>
                    <c:if test="${userType == '1' || userType == '2'}">
                        <li>
                            <div class="item-content">
                                <div class="item-media"><i class="icon icon-form-email"></i></div>
                                <div class="item-inner">
                                    <div class="item-title label">店铺名称</div>
                                    <div class="item-input">
                                        <input type="text" placeholder="请输入您的店铺名称" id="location1" name="location1" value="${ubVo.locationDetail}"  data-validate="location1" data-describedby="location1-description">
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:if>
                    <c:if test="${userType == '4' }">
                        <li>
                            <div class="item-content">
                                <div class="item-media"><i class="icon icon-form-email"></i></div>
                                <div class="item-inner">
                                    <div class="item-title label">经销商名称</div>
                                    <div class="item-input">
                                        <input type="text" placeholder="请输入您的经销商名称" id="location4" name="location4" value="${ubVo.locationDetail}"  data-validate="location1" data-describedby="location4-description">
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:if>
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-password"></i></div>
                            <div class="item-inner">
                                <div class="item-title label">密码</div>
                                <div class="item-input">
                                    <input type="password" placeholder="请输入6-24位密码：字母或数字组合" id="password" name="password" value="${ubVo.password}" data-validate="password" data-describedby="password-description">
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-password"></i></div>
                            <div class="item-inner">
                                <div class="item-title label">密码确认</div>
                                <div class="item-input">
                                    <input type="password" placeholder="请再次输入密码" id="passwordSure" name="passwordSure" value="${ubVo.passwordSure}" data-required="true" data-descriptions="passwordSure" data-conditional="passwordSure">
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-email"></i></div>
                            <div class="item-inner">
                                <div class="item-title label">验证码</div>
                                <div class="item-input">
                                    <input type="text" placeholder="请输入验证码" name="code" value="${usVo.code}" id="code" data-conditional="code" data-descriptions="code">
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item-content">
                            <div class="item-media"><i class="icon icon-form-email"></i></div>
                            <div class="item-inner">
                                <div class="item-title"><img src="/my/captcha.j" /></div>
                            </div>
                        </div>
                    </li>
                    <li><input  type="hidden" value="${userType}" id="userType" name="userType" readonly="" /></li>
                    <li><p span style="color:red;" >${errorId}</p><p span style="color:red;">${errorNname}</p></li>
                    <li><input type="hidden" name="location" value="${location}"></li>
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
<script type="text/javascript">

    $(function () {
        $.mvalidateExtend({
            userId:{
                required : true,
                pattern : /^0?1[3|4|5|8][0-9]\d{8}$/,
                each:function(){
                },
                descriptions:{
                    required : '<div class="field-invalidmsg">请输入手机号码</div>',
                    pattern : '<div class="field-invalidmsg">手机号码格式不正确</div>',
                    valid : '<div class="field-validmsg">正确</div>'
                    }
                },
            userNname:{
                required : true,
                pattern :  /^\S{1,24}(?!_)(?!.*?_$)[\u4e00-\u9fa5a-zA-Z0-9_]+$/,
                each:function(){
                },
                descriptions:{
                    required : '<div class="field-invalidmsg">请输入昵称</div>',
                    pattern : '<div class="field-invalidmsg">昵称请输入2-24位字符：支持中文、英文、数字、“_”</div>',
                    valid : '<div class="field-validmsg">正确</div>'
                }
            },
            realName:{
                required : true,
                pattern :  /^\S{1,24}(?!_)(?!.*?_$)[\u4e00-\u9fa5a-zA-Z0-9_]+$/,
                each:function(){
                },
                descriptions:{
                    required : '<div class="field-invalidmsg">请输入姓名</div>',
                    pattern : '<div class="field-invalidmsg">请输入正确的姓名</div>',
                    valid : '<div class="field-validmsg">正确</div>'
                }
            },
            location1:{
                required : true,
                pattern :  /^\S{1,24}(?!_)(?!.*?_$)[\u4e00-\u9fa5a-zA-Z0-9_]+$/,
                each:function(){
                },
                descriptions:{
                    required : '<div class="field-invalidmsg">请输入门店名称</div>',
                    pattern : '<div class="field-invalidmsg">请输入正确的门店名称</div>',
                    valid : '<div class="field-validmsg">正确</div>'
                }
            },
            location3:{
                required : true,
                pattern :  /^\S{1,24}(?!_)(?!.*?_$)[\u4e00-\u9fa5a-zA-Z0-9_]+$/,
                each:function(){
                },
                descriptions:{
                    required : '<div class="field-invalidmsg">请输入负责区域</div>',
                    pattern : '<div class="field-invalidmsg">请输入正确的负责区域</div>',
                    valid : '<div class="field-validmsg">正确</div>'
                }
            },
            location4:{
                required : true,
                pattern :  /^\S{1,24}(?!_)(?!.*?_$)[\u4e00-\u9fa5a-zA-Z0-9_]+$/,
                each:function(){
                },
                descriptions:{
                    required : '<div class="field-invalidmsg">请输入经销商名称</div>',
                    pattern : '<div class="field-invalidmsg">请输入正确经销商名称</div>',
                    valid : '<div class="field-validmsg">正确</div>'
                }
            },
            password:{
                required : true,
                pattern :  /^\S{5,24}(?!_)(?!.*?_$)[a-zA-Z0-9]+$/,
                each:function(){
                },
                descriptions:{
                    required : '<div class="field-invalidmsg">请输入密码</div>',
                    pattern : '<div class="field-invalidmsg">密码请输入6-24位密码：支持英文、数字</div>',
                    valid : '<div class="field-validmsg">正确</div>'
                }
            }
        });
        $("#form1").mvalidate({
            type:1,
            validateInSubmit:true,
            sendForm:true,
            firstInvalidFocus:false,
            valid:function(event,options){
                //点击提交按钮时,表单通过验证触发函数
            },
            invalid:function(event, status, options){
                //点击提交按钮时,表单未通过验证触发函数
            },
            eachField:function(event,status,options){
                //点击提交按钮时,表单每个输入域触发这个函数 this 执向当前表单输入域，是jquery对象
            },
            eachValidField:function(val){},
            eachInvalidField:function(event, status, options){},
            conditional: {
                passwordSure: function (val) {
                    return val == $("#password").val();
                },
                code:function(val){
                    if(!val && !val.length) return false;
                    var flag
                    $.ajax({
                        url:"/my/captchaCheck.j",
                        type:"post",
                        async:false,
                        data:{code:val},
                        dataType: "json",
                        error:function(){
                            alert('error');
                        },
                        success:function(data){
                            flag=(data.success==0) ? true : false;
                        }
                    });
                    return flag;
                }
            },
            descriptions:{
                userId:{
                    required : '请输入手机号'
                },
                userNname:{
                    required : '请输入昵称'
                },
                realName:{
                    required : '请输入姓名'
                },
                location1:{
                    required : '请输入店铺名称'
                },
                location4:{
                    required : '请输入经销商名称'
                },
                password:{
                    required : '请输入密码'
                },
                passwordSure:{
                    required : '请再次输入密码',
                    conditional : '两次密码不一样'
                },
                code:{
                    required:  '请输入验证码',
                    conditional : '您输入的验证码不正确'
                }
            }
        });
    })

</script>
</body>
</html>