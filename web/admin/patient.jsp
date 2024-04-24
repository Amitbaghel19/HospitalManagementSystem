<%-- 
    Document   : patient
    Created on : Jan 21, 2024, 3:32:53 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                     <style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
   <%@include file="../Component/allcss.jsp" %>
  
    </head>
    <body>
     <%@include file="NavbarAdmin.jsp"%>  
     
      <div class="col-md-12 mt-5">
		<div class="card paint-card mt-5">
			<div class="card-body">
				<p class="fs-3 text-center text-info">Patient Details</p>
                                <table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Gender</th>
							<th scope="col">Age</th>
							<th scope="col">Appointment_date</th>
							<th scope="col">Email</th>
							<th scope="col">Mob No</th>
							<th scope="col">Diseases</th>
							<th scope="col">Doctor Name</th>
							<th scope="col">Address</th>
							<th scope="col">Status</th>
						</tr>
					</thead>
					<tbody>
                                                        <%
						           AppointmentDao apdao=new AppointmentDao();
                                                           DoctorDao dao=new DoctorDao();
                                                               ArrayList<Appointment> al=apdao.getAppointment();
                                                               for(Appointment ap:al){
                                                               Doctor d=dao.getDoctorById(ap.getDoctorId());
                                                                            %>
                                                        <tr>
							<th><%= ap.getFullname()%></th>
							<td><%= ap.getGender()%></td>
							<td><%= ap.getAge()%></td>
							<td><%= ap. getAppoint_date()%></td>
							<td><%= ap.getEmail()%></td>
							<td><%= ap.getMob()%></td>
							<td><%= ap.getDisease()%></td>
							<td><%= d.getFullname()%></td>
							<td><%= ap.getAddress()%></td>
							<td><%= ap.getStatus()%></td>
                                                        
						</tr>
                                                <%} %>
						
						


					</tbody>
				</table>

			</div>
		</div>
	</div>
    </body>
</html>
