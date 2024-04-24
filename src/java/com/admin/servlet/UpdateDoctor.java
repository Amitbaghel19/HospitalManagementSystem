package com.admin.servlet;

import com.dao.DoctorDao;
import com.entity.Doctor;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author dell
 */
public class UpdateDoctor extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String fullname=request.getParameter("fullname");
           String dob=request.getParameter("dob");
           String qualification=request.getParameter("qualification");
           String specialist=request.getParameter("spec");
           String email=request.getParameter("email");
           String mob=request.getParameter("mobno");
           String password=request.getParameter("password");
           int id=Integer.parseInt(request.getParameter("id"));
           Doctor d=new Doctor();
           d.setFullname(fullname);
           d.setDob(dob);
           d.setQualification(qualification);
           d.setSpecialist(specialist);
           d.setEmail(email);
           d.setMob(mob);
           d.setPassword(password);
           d.setId(id);
           DoctorDao dao=new DoctorDao();
            boolean b=dao.UpdateDoctor(d);
            HttpSession session=request.getSession();
              if(b){
              session.setAttribute("successmsg", "updated successfully");
              response.sendRedirect("admin/doctor.jsp");
              }
              else{
              session.setAttribute("errormsg", "something went wrong");
              response.sendRedirect("admin/doctor.jsp");
              }
                   
                    }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
