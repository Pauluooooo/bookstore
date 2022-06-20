package com.pauluooooo.servlet;

import com.pauluooooo.db.DBOper;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    public void destroy() {
        super.destroy();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String userpass = request.getParameter("password");
        ServletContext ctx = this.getServletContext();
        String user = ctx.getInitParameter("user");
        String pwd = ctx.getInitParameter("pwd");
        String dbname = ctx.getInitParameter("dbname");
        String server = ctx.getInitParameter("server");
        DBOper db = new DBOper();

        try {
            db.getConn(server, dbname, user, pwd);
            String sql = "SELECT username,userpass,role FROM userdetail WHERE username=? AND userpass=?";
            ResultSet rs = db.executeQuery(sql, new String[]{username, userpass});
            if (rs != null && rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                String logtime = dateFormat.format(new Date());
                session.setAttribute("logtime", logtime);
                Cookie cookie = new Cookie("userName", username);
                cookie.setMaxAge(60 * 60 * 24 * 30);
                response.addCookie(cookie);
                RequestDispatcher dispatcher = request.getRequestDispatcher("main.jsp");
                dispatcher.forward(request, response);
            } else {
                out.println("登录失败！");
                out.println("<br><a href='index.html'>重新登录</a>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void init() {
    }
}
