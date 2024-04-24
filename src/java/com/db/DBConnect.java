
package com.db;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnect {
//    private static Connection con;
       public static Connection getConnection(){
          Connection con=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital2","root","Amit94795@");
        }
        catch(Exception e){
            System.out.println(e);
        }
        return con;
}
}