package com.pauluooooo.db;

import java.sql.*;

public class DBOper {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;


    public Connection getConn(String server, String dbname, String user, String pwd) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String URL = "jdbc:mysql://" + server + ":3306/" + dbname + "?user=" + user + "&password=" + pwd;
        conn = DriverManager.getConnection(URL);
        return conn;
    }

    public void closeAll() {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                if (ps != null) {
                    try {
                        ps.close();
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    } finally {
                        try {
                            conn.close();
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                    }
                }
            }
        }
    }

    public ResultSet executeQuery(String preparedSql, String[] param) {
        try {
            ps = conn.prepareStatement(preparedSql);
            if (param != null) {
                for (int i = 0; i < param.length; i++) {
                    ps.setString(i + 1, param[i]);
                }
            }
            rs = ps.executeQuery();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rs;
    }

    public int executeUpdate(String preparedSql, String[] param) {
        int num = 0;
        try {
            ps = conn.prepareStatement(preparedSql);
            if (param != null) {
                for (int i = 0; i < param.length; i++) {
                    ps.setString(i + 1, param[i]);
                }
            }
            num = ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return num;
    }
}
