<%-- 
    Document   : patient
    Created on : Jan 20, 2024, 10:25:34 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.AppointmentDao"%>
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
                <%@include file="Navbar.jsp"%>
        <p class="text-center fs-3 mt-5">Doctor Dashboard</p>

          <c:if test="${empty doctorObj}">
            <c:redirect url="../Doctor_login.jsp"/>
            
        </c:if>
        
        <div class="col-md-12 mt-5">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center text-success">Patient Details</p>
                                  <c:if test="${not empty successmsg}">
                                                    <p class="text-center text-success fs-3">${successmsg}</p>   
                                                    <c:remove var="successmsg" scope="session"/>
                                                           
                                                </c:if>
                                                    
                                                <c:if test="${not empty errormsg}">
                                                    <p class="text-center text-danger fs-3">${errormsg}</p>   
                                                    <c:remove var="errormsg" scope="session"/>
                                                           
                                                </c:if> 
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
							<th scope="col">Address</th>
							<th scope="col">Status</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
                                                        Doctor doc=(Doctor)session.getAttribute("doctorObj");
                                                      AppointmentDao apdao=new AppointmentDao();
                                                      ArrayList<Appointment> al=apdao.getAppointmentByDoctorlogin(doc.getId());
                                                      for(Appointment ap:al){%>
                                                        <tr>
							<th><%=ap. getFullname()%></th>
							<td><%=ap. getGender()%></td>
							<td><%=ap. getAge()%></td>
							<td><%=ap. getAppoint_date()%></td>
							<td><%=ap. getEmail()%></td>
							<td><%=ap. getMob()%></td>
							<td><%=ap. getDisease()%></td>
							<td><%=ap. getAddress()%></td>
							<td><%=ap. getStatus()%></td>
                                                        <td>
                                                            <% if("pending".equals(ap.getStatus())){%>
                                                            <a href="comment.jsp?id=<%=ap.getId()%>" class="btn btn-success btn-sm">comment
                                                                
                                                            </a>
                                                            <%}else{%>
                                                                    
                                                        <a href="#" class="btn btn-success btn-sm disabled">comment
                                                                
                                                           </a>
                                                            <%}%>
                                                        </td>
						</tr>
                                              <% } %>
						
						


					</tbody>
				</table>

			</div>
		</div>
	</div>
    </body>
</html>
