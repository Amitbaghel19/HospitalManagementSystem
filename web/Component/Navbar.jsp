<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-house-medical"></i>  Hospital</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <c:if test="${empty loginobj}">
        <li class="nav-item">
  <a class="nav-link active" aria-current="page" href="Admin_login.jsp"><i class="fa-solid fa-right-to-bracket"></i> Admin</a>
        </li>
      
            
            
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="Doctor_login.jsp">Doctor</a>
        </li>
          <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="User_Appointment.jsp">Appointment</a>
        </li>
          <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="User_login.jsp">User</a>
        </li>
                </c:if>

        <c:if test="${not empty loginobj}">
            
              <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="User_Appointment.jsp">Appointment</a>
        </li>
          <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="view_appointment.jsp"> view Appointment</a>
        </li>
        <div class="dropdown active mr-3">
  <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    <i class="fa-regular fa-user "></i> ${loginobj.fullname}

  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    <li><a class="dropdown-item" href="ChangePassword.jsp">Change Password</a></li>
    <li><a class="dropdown-item" href="UserLogout">Logout</a></li>
  </ul>
</div>
       
            <%
              response.setHeader("cache-control","No-Store");
              response.setHeader("No-cache","No-Store");
          %>
        
            
        
        
            
        </c:if>
       
<!--        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>-->
        
      </ul>
    
    </div>
  </div>
</nav>