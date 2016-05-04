/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.userlogin;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        //System.out.println(username+""+password);
        String status;
        int profileId;
        LogBean lb=new LogBean();
        RvaAttendanceBean rvaattend=new RvaAttendanceBean();
        AttendanceProcessing attnpro=new AttendanceProcessing();
        lb.setUserid(username);
        lb.setPassword(password);
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        lb=(new LoginCheckDAO()).loginCheck(lb);
        //LogBean lb=new LogBean();
        /*
        out.println("Welcome to Retel");
        out.println(lb.getUserid());
        out.println(lb.getPassword());
        */
        status=lb.getStatus();
        if(lb.isAvailable()&&status.equalsIgnoreCase("Active"))
        {
            HttpSession session=request.getSession(true);
            session.setAttribute("currloginsession", lb);
            profileId=lb.getProfileid();
            rvaattend.setprofileId(profileId);
            rvaattend=attnpro.checkStatus(rvaattend);
            status=rvaattend.getStatus();
           // if(status.equalsIgnoreCase("Alreadysignedin")){
              session.setAttribute("signin",status);
            response.sendRedirect("home.jsp");
            //}
         //   else{
            //  response.sendRedirect("home.jsp");
         //   }
        }
        else
        {
            response.sendRedirect("index.html");
        }  
    }
    }

