package com.pauluooooo.servlet;

import com.pauluooooo.db.DBOper;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "AddUserServlet", value = "/AddUserServlet")
public class AddUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        // 获取输出流
        PrintWriter out = response.getWriter();
        // 获得表单账户名密码
        String username = request.getParameter("userName");
        String userpass = request.getParameter("userPass");
        String role = request.getParameter("role");
        Date curTime = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String regtime = dateFormat.format(curTime);
        // 获取web.xml中设置的数据库参数
        ServletContext ctx = this.getServletContext();
        String user = ctx.getInitParameter("user");
        String pwd = ctx.getInitParameter("pwd");
        String dbname = ctx.getInitParameter("dbname");
        String server = ctx.getInitParameter("server");
        DBOper db = new DBOper();
        try {
            db.getConn(server, dbname, user, pwd);
            String sql = "INSERT INTO userdetail(username,userpass,role,regtime) values(?,?,?,?)";
            int rs = db.executeUpdate(sql, new String[]{username, userpass, role, regtime});
            if (rs > 0) {
                out.println("插入成功！");
                out.println("<br><a href='addUser.html>'返回</a>");
            }else {
                out.println("添加新用户失败!");
                out.println("<br><a href='addUser.html'>返回</a>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
