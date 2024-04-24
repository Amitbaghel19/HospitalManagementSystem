
package com.dao;

import com.db.DBConnect;
import com.entity.Specialist;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SpecialistDao {
    public boolean addSpecialist(String specialist_name){
    boolean b=false;
    try{
        Connection con=DBConnect.getConnection();
        String str="insert into specialist(specialistName) values(?)";
        PreparedStatement ps=con.prepareStatement(str);
        ps.setString(1, specialist_name);
       int result=ps.executeUpdate();
       if(result>0){
           b=true;
       }
          
    }
   
    catch(Exception e){
    }
    return b;
    
    }
    
    public ArrayList<Specialist> getSpecialist(){
    ArrayList<Specialist> al=new ArrayList<Specialist>();
    Specialist s=null;
    try{
    Connection con=DBConnect.getConnection();
    String str="select * from specialist";
    PreparedStatement ps=con.prepareStatement(str);
    ResultSet rs=ps.executeQuery();
    while(rs.next()){
        s=new Specialist();
        s.setId(rs.getInt(1));
        s.setSpecialist_name(rs.getString(2));
        al.add(s);
    }
    }
    catch(Exception e){
    }
    return al;
    
    } 
    
}
