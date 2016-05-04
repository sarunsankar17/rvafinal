/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.dbaccess;


import java.sql.*;

public class DBConnect {
    private static final String url="jdbc:mysql://localhost:3306/";
    private static final String dbName="rva";
    private static final String driver="com.mysql.jdbc.Driver";
    private static final String dbusername="root";
    private static final String dbpassword="";
    private static Connection conn=null;
    public static Connection startConnection()
    {
        try
        {
            Class.forName(driver).newInstance();
            conn=DriverManager.getConnection(url+dbName,dbusername,dbpassword);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return conn;
    }
}

