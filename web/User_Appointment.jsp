<%-- 
    Document   : User_Appointment
    Created on : Jan 19, 2024, 9:57:57 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@page import="java.util.ArrayList" %>
<%@page import="com.dao.DoctorDao" %>
<%@page import="com.entity.Doctor" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Component/allcss.jsp"  %>
       
        
    </head>
    <body>
       <%@include file="Component/Navbar.jsp"  %>
       
       <div class="container p-3 mt-5" >
           <div class="row">
               <div class="col-md-6 p-5 mt-5">
                   <img src="img/doctor.jpg" alt="alt"/>
                   
               </div>
               <div class="col-md-6 mt-5">
                   <div class="card paint-card">
                       <div class="card-body">
                           <p class="text-center fs-3">User Appointment</p>
                           <c:if test="${not empty successmsg}">
                               <p class="fs-4 text-center text-success">${successmsg}</p>
                               <c:remove var="successmsg" scope="session"/>
                               
                           </c:if>
                                <c:if test="${not empty errormsg}">
                               <p class="fs-4 text-center text-danger">${errormsg}</p>
                               <c:remove var="errormsg" scope="session"/>
                               
                           </c:if>
                           <form class="row g-3" action="AppointServlet" method="post">
                               <input type="hidden" name="userid" value="${loginobj.id}">
                               <div class="col-md-6">
                                   <label for="inputname" class="form-label">Full Name </label>
                                       <input required type="text" name="fullname" class="form-control">
                                       </div>    
                                    
                                    <div class="col-md-6">
                                        <label>Gender</label><select class="form-control" name="gender" required>
                                            <option value="male">Male</option>
                                            <option value="female">Female</option>
                                        </select>
                                       </div>   
                                <div class="col-md-6">
                                   <label for="inputage" class="form-label">Age </label>
                                       <input type="number" name="age" class="form-control" required>
                                       </div>  
                                  <div class="col-md-6">
                                   <label for="inputEmail4" class="form-label">Appointment </label>
                                       <input type="date" name="appointment" class="form-control" required>
                                       </div>  
                                <div class="col-md-6">
                                   <label for="inputEmail4" class="form-label">Email </label>
                                       <input type="email" name="email" class="form-control" required>
                                       </div>  
                                <div class="col-md-6">
                                   <label for="inputEmail4" class="form-label">Phone Number</label>
                                   <input type="number" maxlength="10" name="mob" class="form-control" required>
                                       </div>  
                                <div class="col-md-6">
                                   <label for="inputEmail4" class="form-label">Disease</label>
                                       <input type="text" name="disease" class="form-control" required>
                                       </div>  
                                  <div class="col-md-6">
                                   <label for="inputEmail4" class="form-label">Doctor</label>
                                   <select  name="doctor" class="form-control" required>
                                       <option>---select----</option>
                                       <% DoctorDao dao=new DoctorDao();
                                                ArrayList<Doctor> al=dao.getDoctorDetails();
                                                for(Doctor d:al){%>
                                                <option value="<%=d.getId()%>"><%= d.getFullname()%>(<%=d.getSpecialist()%>)</option>

                                       <%}%>
                                   </select>
                                       </div>  
                                 <div class="col-md-12">
                                   <label for="inputEmail4" class="form-label">Full Address</label>
                                   <textarea required name="address" class="form-control" rows="2" ></textarea>
                                       </div> 
                                       <c:if test="${empty loginobj}">
                                           <a href="User_login.jsp" class="col-md-6 offset-md-3 btn btn-success">submit</a>
                                       </c:if>
                                           
                                     <c:if test="${not empty loginobj}">
                               <button class="col-md-6 offset-md-3 btn btn-success" >submit</button>
                                     </c:if>
                                           </form>
                       </div>
                   </div>   
               </div>
           </div>
       </div>
       
    </body>
</html>
