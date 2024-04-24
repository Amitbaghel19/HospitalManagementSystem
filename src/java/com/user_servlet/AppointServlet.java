/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.user_servlet;

import com.dao.AppointmentDao;
import com.entity.Appointment;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class AppointServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
           int userId=Integer.parseInt(request.getParameter("userid"));
         String fullname=request.getParameter("fullname");
         String gender=request.getParameter("gender");
         String age=request.getParameter("age");
         String appoint_date=request.getParameter("appointment");
         String email=request.getParameter("email");
         String mob=request.getParameter("mob");
         String disease=request.getParameter("disease");
         int doctorId=Integer.parseInt(request.getParameter("doctor"));
         String address=request.getParameter("address");
         Appointment ap=new Appointment();
         ap.setUserId(userId);
         ap.setFullname(fullname);
         ap.setGender(gender);
         ap.setAge(age);
         ap.setAppoint_date(appoint_date);
         ap.setEmail(email);
         ap.setMob(mob);
         ap.setDisease(disease);
         ap.setDoctorId(doctorId);
         ap.setAddress(address);
         ap.setStatus("pending");
         AppointmentDao apdao=new AppointmentDao();
         boolean b=apdao.AddAppointment(ap);
         HttpSession session=request.getSession();
         if(b){
         session.setAttribute("successmsg", "appointment successful");
         response.sendRedirect("User_Appointment.jsp");
         }
         else{
         session.setAttribute("errormsg", "something went wrong");
         response.sendRedirect("User_Appointment.jsp");
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
