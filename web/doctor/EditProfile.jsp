<%-- 
    Document   : EditProfile
    Created on : Jan 22, 2024, 3:15:25 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../Component/allcss.jsp"%>
    </head>
    <body>
        <%@include file="Navbar.jsp" %>
        
        
        <p class="text-center fs-3 mt-5 p-3 text-success">Edit profile</p>
        <div class="container p-4 mt-5">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>
					<c:if test="${not empty successmsg }">
						<p class="text-center text-success fs-3">${successmsg}</p>
						<c:remove var="successmsg" scope="session" />
					</c:if>

					<c:if test="${not empty errormsg }">
						<p class="text-center text-danger fs-5">${errormsg}</p>
						<c:remove var="errormsg" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../ChangeDoctorPassword" method="post">
							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newPassword" class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${doctorObj.id}" name="uid">
							<button class="btn btn-success col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-5 offset-md-2">
				<div class="card paint-card">
					<p class="text-center fs-3">Edit Profile</p>
					<c:if test="${not empty successmsgs }">
						<p class="text-center text-success fs-3">${successmsgs}</p>
						<c:remove var="successmsgs
                                                          " scope="session" />
					</c:if>

					<c:if test="${not empty errormsgs }">
						<p class="text-center text-danger fs-5">${errormsgs}</p>
						<c:remove var="errormsgs" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="../EditProfileServlet" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control"
									value="${doctorObj.fullname }">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control"
									value="${doctorObj.dob}">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									name="qualification" type="text" class="form-control"
									value="${doctorObj.qualification}">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control">
									<option>${doctorObj.specialist}</option>
                                                                   <%
                                                                       SpecialistDao sdao=new SpecialistDao();
                                                                           ArrayList<Specialist> al =sdao.getSpecialist();
                                                                           for(Specialist s:al){%>
                                                                            
                                                                       
                                                                           <option><%= s.getSpecialist_name()%></option>
                                                                   <%}%>              
									


								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									readonly required name="email" class="form-control"
									value="${doctorObj.email}">
							</div>

							<div class="mb-3">
								<label class="form-label">Mob No</label> <input type="text"
									required name="mobno" class="form-control"
									value="${doctorObj.mob}">
							</div>

							<input type="hidden" name="id" value="${doctorObj.id}">

							<button type="submit" class="btn btn-primary">Update</button>
						</form>

					</div>
				</div>
			</div>


		</div>
	</div>
        
        
        
    </body>
</html>
