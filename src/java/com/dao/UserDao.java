package com.dao;

import com.db.DBConnect;
import com.entity.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

public class UserDao {

    public boolean UserRegistration(User u) {
        boolean b = false;
        try {
            Connection con = DBConnect.getConnection();
            String str = "insert into hospital (fullname,email,password) values (?,?,?)";
            PreparedStatement ps = con.prepareStatement(str);
            ps.setString(1, u.getFullname());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            int result = ps.executeUpdate();
            if (result > 0) {
                b = true;
            }
        } catch (Exception e) {

        }
        return b;
    }

    public User Login(String email, String password) {
        User u = null;
        try {
            Connection con = DBConnect.getConnection();
            String str = "select * from hospital where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(str);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                u = new User();
                u.setId(rs.getInt(1));
                u.setFullname(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPassword(rs.getString(4));
            }
        } catch (Exception e) {
        }
        return u;
    }

    public boolean CheckOldPassword(int id, String OldPassword) {
        boolean b = false;
        try {
            Connection con = DBConnect.getConnection();
            String str = "select * from hospital where id=? and password=?";
            PreparedStatement ps = con.prepareStatement(str);
            ps.setInt(1, id);
            ps.setString(2, OldPassword);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = true;
            }

        } catch (Exception e) {

        }
        return b;

    }
    
    public boolean UpdateNewPassword(int id,String NewPassword){
        boolean f=false;
        try{
           Connection con = DBConnect.getConnection();
           String str="update hospital set password=? where id=?";
           PreparedStatement ps=con.prepareStatement(str);
           ps.setString(1, NewPassword);
           ps.setInt(2, id);
           int result=ps.executeUpdate();
           if(result>0){
             f=true;
           }
        }
        catch(Exception e){
        
        }
        return f;

   }
}
