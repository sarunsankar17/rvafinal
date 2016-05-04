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
import java.text.*;
import java.sql.*;
import java.util.Date;
import java.util.regex.*;
import rva.administrator.ChangeDateFormat;
import rva.dbaccess.DBConnect;
public class Registration extends HttpServlet {
  private String userID;
  private String auditorName;
  private String fatherName;
  private String password;
  private String mailID;
  private String dob;
  private String gender;
  private String mobno;
  private String emermobno;
  private String bloodgroup;
  private String address;
  private String status="Active";
  private String defAccess="Auditor";
  private String designation=null;
  private String defDate=null;
  private String doj=null;
  private String accessLevel;
  private PreparedStatement pstm=null;
  private String team="RVA";
  private Date dbDate;
  private String appDate;
  private int profId;
  private String department="KPO";
  private String dedicatedproj=null;
  private String empId=null;
  private String marritalstatus=null;
  String dom=null;
  static Connection con;
  String defuid="KPR";
  SimpleDateFormat appsdf=new SimpleDateFormat("MM/dd/yyyy");
  SimpleDateFormat dbsdf=new SimpleDateFormat("yyyy-MM-dd");
  DecimalFormat dc=new DecimalFormat("0000");
  
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {   
   ChangeDateFormat cdf=new ChangeDateFormat();
   auditorName= request.getParameter("fullname");
   fatherName= request.getParameter("fathername");
   password=request.getParameter("password");
   dob= request.getParameter("dob");
   mailID= request.getParameter("umail");
   mobno=request.getParameter("umobno");
   gender=request.getParameter("ugender");
   address=request.getParameter("address");
   bloodgroup=request.getParameter("bgroup");
   emermobno=request.getParameter("uemobno");
   marritalstatus=request.getParameter("marstatus");
   doj=request.getParameter("doj");
   doj=cdf.toDbDate(doj);
   department=request.getParameter("department");
   team=request.getParameter("team");
   designation=request.getParameter("designation");
   accessLevel=request.getParameter("acclevel");
   dedicatedproj=request.getParameter("dedicatedproj");
   empId =request.getParameter("kpoid");
   
   response.setContentType("text/html");
   
   PrintWriter out=response.getWriter();
   
try
   {
     System.out.println(userID);
    dbDate=appsdf.parse(dob);
    appDate=dbsdf.format(dbDate);
    con=DBConnect.startConnection();
    Statement st=con.createStatement();
   
    //st.executeUpdate("UPDATE userprofilepersonal set fullname='"+auditorName+"', password='"+password+"', fathername='"+fatherName+"',address='"+address+"',mailid='"+mailID+"',mobno='"+mobno+"',emergencymobno='"+emermobno+"',dob='"+appDate+"',gender='"+gender+"',bloodgroup='"+bloodgroup+"',profilestatus='"+status+"', marritalstatus='"+marritalstatus+"' where username LIKE '"+userID+"' ");
     pstm=con.prepareStatement("INSERT INTO `userprofilepersonal` (fullname, password, fathername,address,mailid,mobno,emergencymobno, dob,gender, bloodgroup, profilestatus, marritalstatus, dom) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");
     pstm.setString(1,auditorName);
     //pstm.setString(2,userID);
     pstm.setString(2,password);
     pstm.setString(3,fatherName);
     pstm.setString(4,address);
     pstm.setString(5, mailID);
     pstm.setString(6, mobno);
     pstm.setString(7, emermobno);
     pstm.setString(8, appDate);
     pstm.setString(9, gender);
     pstm.setString(10, bloodgroup);
     pstm.setString(11, status);
     pstm.setString(12,marritalstatus);
     pstm.setString(13,dom);
     pstm.executeUpdate();
     
     ResultSet res=st.executeQuery("SELECT profileid from userprofilepersonal where fullname LIKE '"+auditorName+"' ");
      if(res.next()){
       profId=res.getInt("profileid");
       userID=defuid.concat(dc.format(profId));
       st.executeUpdate("UPDATE userprofilepersonal set username='"+userID+"' where profileid LIKE "+profId+" ");
        HttpSession session=request.getSession();
        session.setAttribute("uid", userID);
        session.setAttribute("name",auditorName);
        session.setAttribute("password",password);
     }
     pstm=con.prepareStatement("INSERT INTO `userprofileofficial` (profileid, doj, department,team, dedicatedproject,kpoempid,designation,accesslevel,targetpermonth,relievingdate) VALUES(?,?,?,?,?,?,?,?,?,?)");
     pstm.setInt(1,profId);
     pstm.setString(2,doj);
     pstm.setString(3,department);
     pstm.setString(4,team);
     pstm.setString(5,dedicatedproj);
     pstm.setString(6,empId);
     pstm.setString(7,designation);
     pstm.setString(8,accessLevel);
     pstm.setInt(9, 0);
     pstm.setString(10,defDate);
     pstm.executeUpdate();
     ResultSet res1=st.executeQuery("Select * from auditors where auditorsname like '"+auditorName+"' ");
     if(res1.next()){
       
     }
     else{
       designation="Trainee";
       pstm=con.prepareStatement("INSERT into auditors(auditorsname,empcategory) values(?,?)");
       pstm.setString(1, auditorName);
       pstm.setString(2,designation);
       pstm.executeUpdate();
     }
   }
   catch(Exception e)
   {
     System.out.println(e);
   }
    response.sendRedirect("newuserdetails.jsp");
  }
}
