<html>
<head>
    <title>Learn后台管理系统</title>
    <meta charset="utf-8">
    <style>
        .main_bar {
            background-color: #ffffff;
            margin-top: 10%;
        }

        #login_form {
            width: 40%;
            background-color: #112435;
            margin: 0 auto;
        }

        .title {
            width: 100%;
            height: 55px;
            color: #ffffff;
            border-bottom: 1px solid #ffffff;
            font-size: 20pt;
            font-family: "微软雅黑";
            line-height: 55px;
            text-align: center;
        }

        #form_widget {
            width: 100%;
            height: 295px;
            background-color: #808080;
        }

        .txt {
            display: block; /*设置为独立块（换行）*/
            width: 70%;
            margin: 0 auto;
            height: 35px;
            font-size: 15pt;
            border-radius: 5px; /*设置圆角样式*/
            border: 0;
            padding-left: 8px;
        }

        #vcode {
            height: 35px;
            width: 40%;
            font-size: 15pt;
            margin-left: 15%;
            border-radius: 5px;
            border: 0;
            padding-left: 8px;
        }

        #code {
            color: #ffffff; /*字体颜色白色*/
            background-color: #000000;
            font-size: 20pt;
            font-family: "华康娃娃体W5";
            padding: 5px 35px 10px 35px;
            margin-left: 5%;
            cursor: pointer;
        }

        #search_pass_link {
            width: 70%;
            text-align: right;
            margin: 0 auto;
            padding: 5px;
        }

        /*层级选择器*/
        #search_pass_link a {
            color: #000000;
            text-decoration: none;
        }

        /*伪类*/
        #search_pass_link a:hover {
            color: #ff0000;
            text-decoration: underline;
        }

        .btn {
            width: 70%;
            margin-left: 15%;
            height: 40px;
            border: 0;
            font-size: 14pt;
            font-family: "微软雅黑";
            background-color: #FC5628;
            color: #ffffff;
            cursor: pointer; /*设置指针鼠标的样式*/
            border-radius: 20px; /*设置圆角样式*/
            border: 0;
        }

        #copyright {
            width: 100%;
            text-align: center;
            padding-top: 20px;
            font-family: "微软雅黑";
            color: #e0e0e0;
        }
    </style>
</head>
<body leftmargin="0" onload="changeImg()">
<div class="main_bar">
    <div id="login_form">
        <div class="title">
            Learn系统登录
        </div>
        <form action="checkPassWord()" onsubmit="return check()">
            <div id="form_widget">
                <br>
                <input type="text" placeholder="请输入账号" id="box_name" class="txt" value="用户名" onfocus="this.value=''"
                       onblur="if(this.value=='')this.value='用户名'"/>
                <br>
                <input type="password" placeholder="请输入密码" id="box_pass" class="txt" value="password"
                       onfocus="this.value=''" onblur="if(this.value=='')this.value='password'"/>
                <br>
                <input type="text" id="vcode" placeholder="验证码" value="验证码" onfocus="this.value=''"
                       onblur="if(this.value=='')this.value='验证码'"/><span id="code" title="看不清，换一张"></span>
                <div id="search_pass_link">
                    <a href="../learn/forget.html">忘记密码？</a>
                </div>
                <input type="submit" value="登录" class="btn" onmouseover="this.style.backgroundColor='#FF8D00'"
                       onmouseout="this.style.backgroundColor='#FC5628'">
                <br>
                <div id="copyright">
                    Create By WJL &copy;CopyRight 2018
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script type="text/javascript">
    var code;//声明一个变量用于存储生成的验证码
    document.getElementById("code").onclick = changeImg;

    function changeImg() {
        //alert("换图片");
        var arrays = new Array(
            '1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
            'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
            'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
            'u', 'v', 'w', 'x', 'y', 'z',
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
            'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
            'U', 'V', 'W', 'X', 'Y', 'Z'
        );
        code = '';//重新初始化验证码
        //alert(arrays.length);
        //随机从数组中获取四个元素组成验证码
        for (var i = 0; i < 4; i++) {
            //随机获取一个数组的下标
            var r = parseInt(Math.random() * arrays.length);
            code += arrays[r];
        }
        document.getElementById('code').innerHTML = code;//将验证码写入指定区域
    }

    //效验验证码(表单被提交时触发)
    function check() {
        //获取用户输入的验证码
        var input_code = document.getElementById('vcode').value;
        //alert(input_code+"----"+code);
        if (input_code.toLowerCase() == code.toLowerCase()) {
            //验证码正确(表单提交)

            //验证账号密码
            checkPassWord();
            return true;
        }
        alert("请输入正确的验证码!");
        //验证码不正确,表单不允许提交
        return false;
    }

    //效验账号密码（验证码校验完成后检验）
    function checkPassWord() {
        //获取用户输入的账号
        var user_name = document.getElementById('box_name').value;
        var password = document.getElementById('box_name').value;

        return false;
    }

</script>
</html>
