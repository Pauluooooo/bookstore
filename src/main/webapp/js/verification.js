var flag = 0;
function sub() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var passwordAgain = document.getElementById("passwordAgain").value;
    //    登录用户信息判断
    if (username != null && password != null && passwordAgain != null) {
        if (flag >= 3) {
            //    验证成功,提交表单
            document.regist.submit();
        } else {
            alert("请认真填写注册信息!");
            document.getElementById("username").value = "";
            document.getElementById("password").value = "";
            document.getElementById("passwordAgain").value = "";
            document.getElementById("usName").innerHTML = "";
            document.getElementById("ps1").innerHTML = "";
            document.getElementById("ps2").innerHTML = "";
        }
    }
}

function res() {
    document.getElementById("username").value = "";
    document.getElementById("password").value = "";
    document.getElementById("passwordAgain").value = "";
}

function chang1(obj) {
    var obValue = obj.value;
    if (obValue.length > 8 || obValue.length < 3) {
        document.getElementById("usName").innerHTML = "长度要求3~8位!";
        flag = 0;
    } else {
        document.getElementById("usName").innerHTML = "可以使用!";
        flag++;
    }
}

function chang2(obj) {
    var obValue = obj.value;
    if (obValue.length > 8 || obValue.length < 6) {
        document.getElementById("ps1").innerHTML = "长度要求6~8位!";
        flag = 0;
    } else {
        document.getElementById("ps1").innerHTML = "可以使用!";
        flag++;
    }
}

function chang3(obj) {
    var obValue = obj.value;
    var prrValue = document.getElementById("password").value;
    if (prrValue !== obValue) {
        document.getElementById("ps2").innerHTML = "请再次确认";
        flag = 0;
    } else {
        document.getElementById("ps2").innerHTML = "通过!";
        flag++;
    }
}