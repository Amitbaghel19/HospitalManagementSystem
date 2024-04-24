<%-- 
    Document   : index
    Created on : Jan 16, 2024, 11:24:15 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<%@page import="com.dao.DoctorDao"%>
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
        <%@include file="NavbarAdmin.jsp" %>
        
        <c:if test="${empty adminObj}">
         <c:redirect url="../Admin_login.jsp"> </c:redirect>     
        </c:if>            
        <%response.setHeader("cache-control","No-Store");
        response.setHeader("No-cache","No-Store");
          
        %>
        <div class="container p-5 mt-5">
            <p class="text-center fs-3">Admin Dashbord</p>
            <c:if test="${ not empty successmsg}">
                <p class="fs-3 text-center text-success">${successmsg}</p>
                <c:remove var="successmsg" scope="session"/>
                
            </c:if>
                   <c:if test="${ not empty errormsg}">
                <p class="fs-3 text-center text-danger">${errormsg}</p>
                <c:remove var="errormsg" scope="session"/>
                
            </c:if>
                <%
                    DoctorDao dao=new DoctorDao();
                    
                %>
        <div class="row mt-5">
             <div class="col-md-4">
                 <div class="card paint-card">
                     <div class="card-body text-center text-success">
                         <i class="fas fa-user-md fa-3x"></i><br>
                         <p class="fs-4 text-center">
                             Doctor<br><%=dao.countDoctor()%>
                                     
                         </p>                         
                     </div>
                     
                 </div>
                
            </div>
            
        
        
             <div class="col-md-4">
                 <div class="card paint-card">
                     <div class="card-body text-center text-success">
                         <i class="fas fa-user-circle fa-3x"></i><br>
                         <p class="fs-4 text-center">
                             user<br><%=dao.countUser()%>
                         </p>                         
                     </div>
                     
                 </div>
                
            </div>
   
             <div class="col-md-4">
                 <div class="card paint-card">
                     <div class="card-body text-center text-success">
                         <i class="far fa-calendar-check fa-3x"></i><br>
                         <p class="fs-4 text-center">
                             Total appointment<br><%=dao.countAppointment()%>
                         </p>                         
                     </div>
                     
                 </div>
                
            </div>
            
             <div class="col-md-4 mt-2">
                 <div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
                     <div class="card-body text-center text-success">
                         <i class="far fa-calendar-check fa-3x"></i><br>
                         <p class="fs-4 text-center">
                             Specialist<br><%=dao.countSpecialist()%>
                         </p>                         
                     </div>
                     
                 </div>
                
            </div>
         </div>
        </div>
              
                       



<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <form action="../AddSpecialist" method="post">
              <div class="form-group">
                  <label>Enter Specialist Name</label>
                  <input type="text" name="specName" class="form-control">
              </div> 
              <div class="text-center mt-3"> <button type="submit" class="btn btn-success">Add</button></div>
          </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
       
      </div>
    </div>
  </div>
</div>
    </body>
</html>
