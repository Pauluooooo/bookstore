function sub() {
    var user = document.regist.userName.value;
    var pass = document.regist.userPass.value;
    var repass = document.regist.rePass.value;

    if (user == null || user === "") {
        alert("请填写用户名");
        document.regist.userName.focus();
    } else if (pass == null || pass === "") {
        alert("请填写密码");
        document.regist.userPass.focus();
    } else if (repass == null || repass === "") {
        alert("请填写确认密码");
        document.regist.rePass.focus();
    } else if (pass !== repass) {
        alert("确认密码必须和密码相同！");
        document.regist.rePass.value = "";
        document.regist.rePass.focus();
    } else {
        document.regist.submit();
    }
}

function res() {
    document.getElementById("userName").value = "";
    document.getElementById("userPass").value = "";
    document.getElementById("rePass").value = "";
    var chs = document.getElementById("role");
    for (let i = 0; i < chs.length.length; i++) {
        chs[i].status = 'false';
    }
}
