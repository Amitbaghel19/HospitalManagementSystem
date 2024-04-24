<%-- 
    Document   : index
    Created on : Jan 19, 2024, 2:56:52 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../Component/allcss.jsp" %>
     <style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
    </head>
    <body>
        <c:if test="${empty doctorObj}">
            <c:redirect url="../Doctor_login.jsp"/>
            
        </c:if>
        
        
        <%@include file="Navbar.jsp"%>
        <p class="text-center fs-3 mt-5">Doctor Dashboard</p>
        <% 
                 Doctor d =(Doctor)session.getAttribute("doctorObj");
            DoctorDao dao=new DoctorDao();
               
        %>
           <div class="container p-5">
            <div class="row">
                <div class="col-md-4 offset-md-2">
                    <div class="card paint-card">
                    <div class="card-body text-center text-success">
                        <i class="fas fa-user-md fa-3x">
                            
                        </i><br>
                        <p class="fs-4 text-center">Doctor<br><%= dao.countDoctor()%></p>
                    </div>
                </div>
                </div>
                
                
                <div class="col-md-4">
                    <div class="card paint-card">
                    <div class="card-body text-center text-success">
                        <i class="fas fa-calendar-check fa-3x">
                            
                        </i><br>
                        <p class="fs-4 text-center">Total Appointment<br><%= dao.countAppointmentByDoctorId(d.getId())%></p>
                    </div>
                </div>
                </div>
                
                
            </div>
            
        </div>
    </body>
</html>
