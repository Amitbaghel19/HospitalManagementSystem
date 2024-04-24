<%-- 
    Document   : view_appointment
    Created on : Jan 20, 2024, 1:46:11 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Component/allcss.jsp" %>
                         <style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
    </head>
    <body>
         <c:if test="${empty loginobj}">
            <c:redirect url="User_login.jsp"></c:redirect>
            
        </c:if>
        <%@include file="Component/Navbar.jsp" %>
        <div class="container p-3 mt-5">
            <div class="row mt-5">
                <div class="col-md-9">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-4 fw-bold text-center text-success">Appointment
                                List</p>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Full Name</th>
                                        <th scope="col">Gender</th>
                                        <th scope="col">Age</th>
                                        <th scope="col">Appoint Date</th>
                                        <th scope="col">Diseases</th>
                                        <th scope="col">Doctor Name</th>
                                        <th scope="col">Status</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                            User user=(User)session.getAttribute("loginobj");
                                            AppointmentDao apdao=new AppointmentDao();
                                            DoctorDao dao=new DoctorDao();
                                             ArrayList<Appointment> al=apdao.getAppointmentByUserlogin(user.getId());
                                                  for(Appointment ap:al){
                                          Doctor d=dao.getDoctorById(ap.getDoctorId());%>
                                    <tr>
                                        <th><%=ap.getFullname()%></th>
                                        <td><%=ap.getGender()%></td>
                                        <td><%=ap.getAge()%></td>
                                        <td><%=ap.getAppoint_date()%></td>
                                        <td><%=ap.getDisease()%></td>
                                        <td><%=ap.getFullname()%></td>
                                        <td>
                                           <% if("pending".equals((ap.getStatus()))){
                                           %>
                                            
                                            <a href="#" class="btn btn-sm btn-warning">Pending</a> 
                                                <%}else{%>
                                                <%=ap.getStatus()%>
                                               <% }%>
                                        </td>
                                    </tr>
                                        <%}%>





                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <img alt="" src="img/doctor2.jpg">
                </div>
            </div>
        </div>

    </body>
</html>
