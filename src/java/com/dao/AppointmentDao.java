
package com.dao;

import com.db.DBConnect;
import com.entity.Appointment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class AppointmentDao {
    public boolean AddAppointment(Appointment ap){
    boolean b=false;
    try{
        Connection con=DBConnect.getConnection();
        String str="insert into appointment(user_id,fullname,gender,age,appoint_date,email,mob,disease,doctor_id,address,status)"
                + "values(?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps=con.prepareStatement(str);
        ps.setInt(1, ap.getUserId());
        ps.setString(2, ap.getFullname());
        ps.setString(3, ap.getGender());
        ps.setString(4, ap.getAge());
        ps.setString(5, ap.getAppoint_date());
        ps.setString(6, ap.getEmail());
        ps.setString(7, ap.getMob());
        ps.setString(8, ap.getDisease());
        ps.setInt(9, ap.getDoctorId());
        ps.setString(10, ap.getAddress());
        ps.setString(11, ap.getStatus());
        int result=ps.executeUpdate();
        if(result>0){
        b=true;
        }
    }
    catch(Exception e){
    
    }
    return b;
    }
    public ArrayList<Appointment> getAppointmentByUserlogin(int UserId){
        ArrayList<Appointment> al=new ArrayList<Appointment>();
             Appointment ap=null;
             try{
               Connection con=DBConnect.getConnection();
               String str="select * from appointment where user_id=?";
               PreparedStatement ps=con.prepareStatement(str);
               ps.setInt(1, UserId);
               ResultSet rs=ps.executeQuery();
               while(rs.next()){
                  ap=new Appointment();
                  ap.setId(rs.getInt(1));
                   ap.setUserId(rs.getInt(2));
                   ap.setFullname(rs.getString(3));
                   ap.setGender(rs.getString(4));
                   ap.setAge(rs.getString(5));
                   ap.setAppoint_date(rs.getString(6));
                   ap.setEmail(rs.getString(7));
                   ap.setMob(rs.getString(8));
                   ap.setDisease(rs.getString(9));
                   ap.setDoctorId(rs.getInt(10));
                   ap.setAddress(rs.getString(11));
                   ap.setStatus(rs.getString(12));
                   al.add(ap);
               }
             }
             catch(Exception e){
             
             }
             return al;
    }
    
     public ArrayList<Appointment> getAppointmentByDoctorlogin( int doctorId){
        ArrayList<Appointment> al=new ArrayList<Appointment>();
             Appointment ap=null;
             try{
               Connection con=DBConnect.getConnection();
               String str="select * from appointment where doctor_id=?";
               PreparedStatement ps=con.prepareStatement(str);
               ps.setInt(1, doctorId);
               ResultSet rs=ps.executeQuery();
               while(rs.next()){
                  ap=new Appointment();
                  ap.setId(rs.getInt(1));
                   ap.setUserId(rs.getInt(2));
                   ap.setFullname(rs.getString(3));
                   ap.setGender(rs.getString(4));
                   ap.setAge(rs.getString(5));
                   ap.setAppoint_date(rs.getString(6));
                   ap.setEmail(rs.getString(7));
                   ap.setMob(rs.getString(8));
                   ap.setDisease(rs.getString(9));
                   ap.setDoctorId(rs.getInt(10));
                   ap.setAddress(rs.getString(11));
                   ap.setStatus(rs.getString(12));
                   al.add(ap);
               }
             }
             catch(Exception e){
             
             }
             return al;
    }
     
     public Appointment getAppointmentById(int id){
     Appointment ap=null;
     
     try{
      Connection con=DBConnect.getConnection();
      String str="select * from appointment where id=?";
      PreparedStatement ps=con.prepareStatement(str);
      ps.setInt(1, id);
      ResultSet rs=ps.executeQuery();
      while(rs.next()){
      ap=new Appointment();
                   ap.setId(rs.getInt(1));
                   ap.setUserId(rs.getInt(2));
                   ap.setFullname(rs.getString(3));
                   ap.setGender(rs.getString(4));
                   ap.setAge(rs.getString(5));
                   ap.setAppoint_date(rs.getString(6));
                   ap.setEmail(rs.getString(7));
                   ap.setMob(rs.getString(8));
                   ap.setDisease(rs.getString(9));
                   ap.setDoctorId(rs.getInt(10));
                   ap.setAddress(rs.getString(11));
                   ap.setStatus(rs.getString(12));
      }
     }
     catch(Exception e){
     
     }
     return ap;
     }
     public boolean updateStatus(int id,int doctorId,String comm){
     boolean b=false;
     try{
             Connection con=DBConnect.getConnection();
             String str="update appointment set status=? where id=? and doctor_id=?";
             PreparedStatement ps=con.prepareStatement(str);
             ps.setString(1, comm);
             ps.setInt(2, id);
             ps.setInt(3, doctorId);
             int result=ps.executeUpdate();
             if(result>0){
             b=true;
             }
     }
     catch(Exception e){
     
     }
     return b;
     
     }
     
      public ArrayList<Appointment> getAppointment( ){
        ArrayList<Appointment> al=new ArrayList<Appointment>();
             Appointment ap=null;
             try{
               Connection con=DBConnect.getConnection();
               String str="select * from appointment";
               PreparedStatement ps=con.prepareStatement(str);
              
               ResultSet rs=ps.executeQuery();
               while(rs.next()){
                  ap=new Appointment();
                  ap.setId(rs.getInt(1));
                   ap.setUserId(rs.getInt(2));
                   ap.setFullname(rs.getString(3));
                   ap.setGender(rs.getString(4));
                   ap.setAge(rs.getString(5));
                   ap.setAppoint_date(rs.getString(6));
                   ap.setEmail(rs.getString(7));
                   ap.setMob(rs.getString(8));
                   ap.setDisease(rs.getString(9));
                   ap.setDoctorId(rs.getInt(10));
                   ap.setAddress(rs.getString(11));
                   ap.setStatus(rs.getString(12));
                   al.add(ap);
               }
             }
             catch(Exception e){
             
             }
             return al;
    }
}
