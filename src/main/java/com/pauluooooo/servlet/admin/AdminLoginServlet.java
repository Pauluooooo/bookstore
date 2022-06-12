package com.pauluooooo.servlet.admin;

import com.pauluooooo.db.DBOper;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "AdminLoginServlet", value = "/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        // 获取输出流
        PrintWriter out = response.getWriter();
        // 获得表单账户名密码
        String username = request.getParameter("userName");
        String userpass = request.getParameter("userPass");
        // 获取web.xml中设置的数据库参数
        ServletContext ctx = this.getServletContext();
        String user = ctx.getInitParameter("user");
        String pwd = ctx.getInitParameter("pwd");
        String dbname = ctx.getInitParameter("dbname");
        String server = ctx.getInitParameter("server");
        DBOper db = new DBOper();

        try {
            db.getConn(server, dbname, user, pwd);
            String sql = "SELECT username,userpass,role FROM userdetail WHERE username=? AND userpass=? AND role=1";
            ResultSet rs = db.executeQuery(sql, new String[]{username, userpass});
            if (rs != null && rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("adminuser", username);
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                String logtime = dateFormat.format(new Date());
                session.setAttribute("logtime", logtime);
                response.sendRedirect("adminMain.jsp");
            } else {
                out.println("登录失败");
                out.println("<br /><a href='index.html'>重新登录</a>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
