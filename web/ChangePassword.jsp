<%-- 
    Document   : ChangePassword
    Created on : Jan 22, 2024, 12:29:59 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Component/allcss.jsp" %>
        <script>
            function myfun(){
            var pass=document.getElementById("pass").value;
            var cpass=document.getElementById("cpass").value;
                if(pass!=cpass){
                   document.getElementById("message").innerHTML="*Both passwords are different";
                  return false; 
              }
    }
            
        </script>
    </head>
    <body>
        <c:if test="${empty loginobj}">
            <c:redirect url="User_login.jsp"></c:redirect>
            
        </c:if>
        <%@include file="Component/Navbar.jsp" %>
      
    
		<div class="row mt-5">
			<div class="col-md-4 offset-md-4 mt-5">
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
                                            <form action="changepassword" method="post" onsubmit="return myfun()">
							
							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text"
									name="oldPassword" class="form-control" required>
							</div>
                                                    <div class="mb-3">
								<label>Enter New Password</label> <input type="text"
								  id="pass"	name="newPassword" class="form-control" required>
							</div>
                                                      <div class="mb-3">
								<label>Enter confirm New Password</label> <input type="text"
								id="cpass"	name="CPassword" class="form-control" required>
							</div>
                                                    <span style="color: red" id="message"></span>
							<input type="hidden" value="${loginobj.id}" name="uid">
							<button class="btn btn-success col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>
		</div>
    </body>
</html>
