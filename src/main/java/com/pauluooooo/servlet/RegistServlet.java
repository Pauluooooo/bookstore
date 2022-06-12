package com.pauluooooo.servlet;

import com.pauluooooo.db.DBOper;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "RegistServlet", value = "/RegistServlet")
public class RegistServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        // 获取输出流
        PrintWriter out = response.getWriter();
        // 获得表单账户名密码
        String username = request.getParameter("username");
        String userpass = request.getParameter("password");
        // 获取web.xml中设置的数据库参数
        ServletContext ctx = this.getServletContext();
        String user = ctx.getInitParameter("user");
        String pwd = ctx.getInitParameter("pwd");
        String dbname = ctx.getInitParameter("dbname");
        String server = ctx.getInitParameter("server");
        // 创建数据库类，连接数据库
        DBOper db = new DBOper();
        try {
            db.getConn(server, dbname, user, pwd);
            // 向userdetail表插入记录的SQL命令
            String preparedSql = "INSERT INTO userdetail(username,userpass,regtime) values(?,?,?)";
            // 获取当前时间
            Date curTime = new Date();
            // 格式化日期
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String regtime = dateFormat.format(curTime);
            // 插入数据，根据返回值判断是否插入成功
            int rs = db.executeUpdate(preparedSql, new String[]{username, userpass, regtime});
            if (rs > 0) {
                out.println("注册成功！请记住用户名和密码");
                out.println("<br><a href='index.html'>请登录</a>");
            } else {
                out.println("注册失败");
                out.println("<br><a href='regist.html'>重新注册</a>");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
