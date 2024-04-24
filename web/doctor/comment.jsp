<%-- 
    Document   : comment
    Created on : Jan 21, 2024, 12:48:22 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entity.Appointment"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../Component/allcss.jsp" %>
    </head>
    <body>
     
       <%@include file="Navbar.jsp"%>

       
       <div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">

			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Patient Comment</p>
                                               <%  
                                                   int id = Integer.parseInt(request.getParameter("id"));
                                                    AppointmentDao apdao=new AppointmentDao();
                                                    Appointment ap = apdao.getAppointmentById(id);
                                                              
                                                    
                                               %>
						
						<form class="row" action="../UpdateStatus" method="post">
							<div class="col-md-6">
								<label>Patient Name</label> <input type="text" readonly
									value="<%=ap.getFullname()%>" class="form-control">
							</div>

							<div class="col-md-6">
                                                            <label>Age</label> <input type="text" value="<%=ap.getAge()%>"
									readonly class="form-control">
							</div>


							<div class="col-md-6">
								<br> <label>Mob No</label> <input type="text" readonly
									value="<%= ap.getMob()%>" class="form-control">
							</div>

							<div class="col-md-6">
								<br> <label>Diseases</label> <input type="text" readonly
									value="<%=ap.getDisease()%>" class="form-control">
							</div>

							<div class="col-md-12">
								<br> <label>Comment</label>
                                                                <textarea required name="comm" class="form-control" row="3">
								</textarea>
							</div>

                                                        <input type="hidden" name="id" value="<%=ap.getId()%>">
                                                        <input type="hidden" name="did" value="<%=ap.getDoctorId()%>">

								
							<button class=" mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>



    </body>
</html>
