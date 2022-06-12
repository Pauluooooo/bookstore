var user = document.getElementById("username").value;
var pass = document.getElementById("password").value;

function loginClick() {
    if (user == null || user === "") {
        alert("请填写登录名");
        document.getElementById("username").focus();
    } else if (pass == null || pass === "") {
        alert("请填写密码");
        document.getElementById("password").focus();
    } else {
        document.Register.submit();
    }
}

function res() {
    document.getElementById("username").value = "";
    document.getElementById("password").value = "";
}
