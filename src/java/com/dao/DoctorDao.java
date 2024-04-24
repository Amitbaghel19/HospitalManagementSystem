
package com.dao;

import com.db.DBConnect;
import com.entity.Doctor;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DoctorDao {
   public boolean registerDoctor(Doctor d){
   boolean b=false;
   try{
   Connection con =DBConnect.getConnection();
   String str="insert into doctor(fullname,dob,qualification,specialist,email,mob,password) values(?,?,?,?,?,?,?)";
   PreparedStatement ps=con.prepareStatement(str);
   ps.setString(1, d.getFullname());
   ps.setString(2,d.getDob());
   ps.setString(3,d.getQualification());
   ps.setString(4,d.getSpecialist());
   ps.setString(5,d.getEmail());
   ps.setString(6,d.getMob());
   ps.setString(7,d.getPassword());
   int result=ps.executeUpdate();
   if(result>0)
       b=true;
   }
   catch(Exception e){
   
   }
   return b;
   }
   
   public ArrayList<Doctor> getDoctorDetails(){
   ArrayList<Doctor> al=new ArrayList<Doctor>();
   Doctor d=null;
   try{
        Connection con=DBConnect.getConnection();
        String str="select * from doctor";
        PreparedStatement ps=con.prepareStatement(str);
        ResultSet rs=ps.executeQuery();
        while(rs.next()){
        d=new Doctor();
        d.setId(rs.getInt(1));
        d.setFullname(rs.getString(2));
        d.setDob(rs.getString(3));
        d.setQualification(rs.getString(4));
        d.setSpecialist(rs.getString(5));
        d.setEmail(rs.getString(6));
        d.setMob(rs.getString(7));
        d.setPassword(rs.getString(8));
        al.add(d);
        }
   }
   catch(Exception e){
   }
   return al;
   }
   
   public Doctor getDoctorById(int id){
   Doctor d=null;
   try{
        Connection con=DBConnect.getConnection();
        String str="select * from doctor where id=?";
        PreparedStatement ps=con.prepareStatement(str);
        ps.setInt(1, id);
        ResultSet res=ps.executeQuery();
        while(res.next()){
        d=new Doctor();
        d.setId(res.getInt(1));
        d.setFullname(res.getString(2));
        d.setDob(res.getString(3));
        d.setQualification(res.getString(4));
        d.setSpecialist(res.getString(5));
        d.setEmail(res.getString(6));
        d.setMob(res.getString(7));
        d.setPassword(res.getString(8));
      
        }
   }
   catch(Exception e){
   }
   return d;
   }

   
     public boolean UpdateDoctor(Doctor d){
   boolean f=false;
   try{
   Connection con =DBConnect.getConnection();
   String str="update doctor set fullname=?,dob=?,qualification=?,specialist=?,email=?,mob=?,password=? where id=?";
   PreparedStatement ps=con.prepareStatement(str);
   ps.setString(1, d.getFullname());
   ps.setString(2,d.getDob());
   ps.setString(3,d.getQualification());
   ps.setString(4,d.getSpecialist());
   ps.setString(5,d.getEmail());
   ps.setString(6,d.getMob());
   ps.setString(7,d.getPassword());
   ps.setInt(8, d.getId());
   int result1=ps.executeUpdate();
   if(result1>0)
       f=true;
   }
   catch(Exception e){
   
   }
   return f;
   }
     
     public boolean DeleteDoctor(int id){
     boolean b=false;
     try{
         Connection con=DBConnect.getConnection();
          String str="delete from doctor where id=?";
          PreparedStatement ps=con.prepareStatement(str);
          ps.setInt(1, id);
          int result=ps.executeUpdate();
          if(result>0){
               b=true;
          }
     }
     catch(Exception e){
     
     }
     return b;
     }
     public Doctor login(String email,String password){
     Doctor d=null;
     
     try{
     Connection con=DBConnect.getConnection();
       String str="select * from doctor where email=? and password=?";
       PreparedStatement ps=con.prepareStatement(str);
       ps.setString(1, email);
       ps.setString(2, password);
       ResultSet rs=ps.executeQuery();
       while(rs.next()){
           d=new Doctor();
        d.setId(rs.getInt(1));
        d.setFullname(rs.getString(2));
        d.setDob(rs.getString(3));
        d.setQualification(rs.getString(4));
        d.setSpecialist(rs.getString(5));
        d.setEmail(rs.getString(6));
        d.setMob(rs.getString(7));
        d.setPassword(rs.getString(8));
       }
     }
     catch(Exception e){}
     
     return d;
     }
     public int countDoctor(){
     int i=0;
     try{
         Connection con=DBConnect.getConnection();
         String str="select * from doctor";
         PreparedStatement ps=con.prepareStatement(str);
         ResultSet rs=ps.executeQuery();
         while(rs.next()){
           i++;
         }
     }
     catch(Exception e){
     }
     return i;
     }
     
      public int countAppointment(){
     int i=0;
     try{
         Connection con=DBConnect.getConnection();
         String str="select * from appointment";
         PreparedStatement ps=con.prepareStatement(str);
         ResultSet rs=ps.executeQuery();
         while(rs.next()){
           i++;
         }
     }
     catch(Exception e){
     }
     return i;
     }
       public int countUser(){
     int i=0;
     try{
         Connection con=DBConnect.getConnection();
         String str="select * from hospital";
         PreparedStatement ps=con.prepareStatement(str);
         ResultSet rs=ps.executeQuery();
         while(rs.next()){
           i++;
         }
     }
     catch(Exception e){
     }
     return i;
     }
        public int countSpecialist(){
     int i=0;
     try{
         Connection con=DBConnect.getConnection();
         String str="select * from specialist";
         PreparedStatement ps=con.prepareStatement(str);
         ResultSet rs=ps.executeQuery();
         while(rs.next()){
           i++;
         }
     }
     catch(Exception e){
     }
     return i;
     }
        
     public int countAppointmentByDoctorId(int did){
     int i=0;
     try{
         Connection con=DBConnect.getConnection();
         String str="select * from appointment where doctor_id=?";
         PreparedStatement ps=con.prepareStatement(str);
         ps.setInt(1, did);
         ResultSet rs=ps.executeQuery();
         while(rs.next()){
           i++;
         }
     }
     catch(Exception e){
         
     }
     return i;
}
         public boolean CheckOldPassword(int id, String OldPassword) {
        boolean b = false;
        try {
            Connection con = DBConnect.getConnection();
            String str = "select * from doctor where id=? and password=?";
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
         
         
     public boolean EditDoctor(Doctor d){
   boolean f=false;
   try{
   Connection con =DBConnect.getConnection();
   String str="update doctor set fullname=?,dob=?,qualification=?,specialist=?,email=?,mob=? where id=?";
   PreparedStatement ps=con.prepareStatement(str);
   ps.setString(1, d.getFullname());
   ps.setString(2,d.getDob());
   ps.setString(3,d.getQualification());
   ps.setString(4,d.getSpecialist());
   ps.setString(5,d.getEmail());
   ps.setString(6,d.getMob());
   ps.setInt(7, d.getId());
   int result1=ps.executeUpdate();
   if(result1>0)
       f=true;
   }
   catch(Exception e){
   
   }
   return f;
   }
         
        public boolean UpdateNewPassword(int id,String NewPassword){
        boolean f=false;
        try{
           Connection con = DBConnect.getConnection();
           String str="update doctor set password=? where id=?";
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