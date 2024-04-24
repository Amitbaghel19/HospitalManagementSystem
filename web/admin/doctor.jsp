<%-- 
    Document   : doctor
    Created on : Jan 18, 2024, 3:02:34 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@page import="com.dao.SpecialistDao" %>
<%@page import="com.dao.DoctorDao" %>
<%@page import="com.entity.Specialist" %>
<%@page import="com.entity.Doctor" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../Component/allcss.jsp" %>
        <%@include file="NavbarAdmin.jsp" %>
        <style type="text/css">
            .paint-card {
                box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
            }
        </style>
    </head>
    <body>
                        
        <%response.setHeader("cache-control","No-Store");
        response.setHeader("No-cache","No-Store");
          
        %>
        <div class="container-fluid p-3 mt-5">
            <div class="row">

                <div class="col-md-3">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-3 text-center">Add Doctor</p>

                         

                            <form action="../AddDoctor" method="post">
                                <div class="mb-3">
                                    <label class="form-label">Full Name</label> <input type="text"
                                                                                       required name="fullname" class="form-control">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">DOB</label> <input type="date"
                                                                                 required name="dob" class="form-control">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Qualification</label> <input required
                                                                                           name="qualification" type="text" class="form-control">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Specialist</label> <select name="spec"
                                                                                         required class="form-control">
                                        <option>--select--</option>
                                        <% 
                                        SpecialistDao sdao=new SpecialistDao();
                                        ArrayList<Specialist> al=sdao. getSpecialist();
                                        for(Specialist s:al){
                                                                      
                                        %>

                                        <option><%= s.getSpecialist_name()%></option>
                                        <%}%>  
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Email</label> <input type="text"
                                                                                   required name="email" class="form-control">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Mob No</label> <input type="text"
                                                                                    required name="mobno" class="form-control">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Password</label> <input required
                                                                                      name="password" type="password" class="form-control">
                                </div>

                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>
                </div>
                                    <div class="col-md-9">
                                        <div class="card paint-card">
                                            <div class="card-body">
                                                <p class="fs-3 text-center"> Doctor Details </p>
                                                   <c:if test="${ not empty successmsg}">
                                <p class="fs-3 text-center text-success">${successmsg}</p>
                                <c:remove var="successmsg" scope="session"/>

                            </c:if>
                            <c:if test="${ not empty errormsg}">
                                <p class="fs-3 text-center text-danger">${errormsg}</p>
                                <c:remove var="errormsg" scope="session"/>

                            </c:if>
                                                
                                                
                                                <table class="table"> 
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Full Name</th>
                                                            <th scope="col">DOB</th>
                                                            <th scope="col">Qualification</th>
                                                            <th scope="col">Specialist</th>
                                                            <th scope="col">Email</th>
                                                            <th scope="col">Mobile No</th>
                                                            <th scope="col">Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <% 
                                                        DoctorDao dao=new DoctorDao();
                                                        ArrayList<Doctor> ar=dao.getDoctorDetails();
                                                        for(Doctor d:ar){%>
                                                        <tr>
                                                            <td><%= d.getFullname()%></td>
                                                            <td><%= d.getDob()%></td>
                                                            <td><%= d.getQualification()%></td>
                                                            <td><%= d.getSpecialist()%></td>
                                                            <td><%= d.getEmail()%></td>
                                                            <td><%= d.getMob()%></td>
                                                            <td>
                                                                <a href="EditDoctor.jsp?id=<%=d.getId()%>" class="btn btn-sm btn-primary ">Edit</a>
                                                                <a href="../DeleteDoctor?id=<%= d.getId()%>" class="btn btn-sm btn-danger">Delete</a>
                                                                    
                                                   
                                                            </td>
                                                        </tr>
                                                        <%}%>
                                                    </tbody>
                                                </table>    
                                              
                                            </div>
                                            
                                        </div>    
                                        
                                    </div>


            </div>
        </div>
    </body>
</html>
