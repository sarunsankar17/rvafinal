/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.userlogin;



import java.sql.*;
import rva.dbaccess.DBConnect;

public class LoginCheckDAO {

static Connection con;


public LogBean loginCheck(LogBean lb)
{
//String password;
    try
    {
        System.out.println("Welcome Here");
    String uid=lb.getUserid();
    String pword=lb.getPassword();
    String status;
    String accesslevel;
    String profpicture;
    int profileid;
    con=DBConnect.startConnection();
    Statement st=con.createStatement();
    ResultSet res=st.executeQuery("SELECT * FROM userprofilepersonal WHERE username='"+uid+"' AND password ='"+pword+"'");
    boolean ispresent=res.next();
    if(ispresent)
    {
        System.out.println("Welcome Here inside DB");
String auditorname=res.getString("fullname");
status=res.getString("profilestatus");
        uid=res.getString("username");
        profileid=res.getInt("profileid");
        profpicture=res.getString("profilepicture");
        lb.setAuditorname(auditorname);
        lb.setUserid(uid);
        lb.setAvailablity(true);
        lb.setStatus(status);
        lb.setProfileid(profileid);
        lb.setProfpicture(profpicture);
        ResultSet res1=st.executeQuery("SELECT * from userprofileofficial where profileid LIKE "+profileid+" ");
        if(res1.next()){
            accesslevel=res1.getString("accesslevel");
            lb.setAccesslevel(accesslevel);
        }
    }
    else if(!ispresent)
    {
       
        lb.setAvailablity(false);
    }
    }
catch(SQLException e)
{
    System.out.println("Welcome Here inside Catch");
    System.out.println(e);
}
   return lb;   
}    
}