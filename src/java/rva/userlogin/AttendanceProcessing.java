/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.userlogin;
import java.sql.*;
import rva.administrator.ChangeDateFormat;
import rva.dbaccess.*;

/**
 *
 * @author RCT-456
 */
public class AttendanceProcessing {
  private int profileid;
  private String loginstatus="Notsignedin";
  private String loginDate=null;
  private String loginDateTime=null;
  private String workingTime=null;
  Connection con=DBConnect.startConnection();
  ChangeDateFormat cdf=new ChangeDateFormat();
  public RvaAttendanceBean checkStatus(RvaAttendanceBean rab){
    try{
      
      Statement st=con.createStatement();
      ResultSet res=null;
    profileid=rab.getprofileId();
    res=st.executeQuery("SELECT * FROM `rvaattandance` WHERE `logoutdate` is NULL and profid = "+profileid+" ");
    if(res.next()){
      loginstatus="Alreadysignedin";
    }
    else{ 
      res=st.executeQuery("SELECT * FROM `rvaattandance` WHERE `logindate` like concat(date(now()),'%') and profid="+profileid+" ");
      {
        if(res.next()){
          loginstatus="SignedOut";
        }
        
      } 
    }
    rab.setStatus(loginstatus);
    }
    catch(Exception e){
      System.out.println(e);
    }
    return rab;
  }
  public String getLoginDate(int profid){
  try{
    Statement st=con.createStatement();
    
    ResultSet res=st.executeQuery("SELECT date(logindate) from rvaattandance where profid like "+profid+" ORDER BY `logindate` DESC LIMIT 1 ");
    while(res.next()){
    loginDate=cdf.dbDatetoAppDate(res.getString("date(logindate)"));  
  }
  } catch(Exception e){
    e.printStackTrace();
  } 
    return loginDate;
  }
  public String getLoginDateTime(int profid){
  try{
    Statement st=con.createStatement();
    
    ResultSet res=st.executeQuery("SELECT time(logindate) from rvaattandance where profid like "+profid+" ORDER BY `logindate` DESC LIMIT 1 ");
    while(res.next()){
    loginDateTime=res.getString("time(logindate)");  
  }
  } catch(Exception e){
    e.printStackTrace();
  } 
    return loginDateTime;
  }
  public String getWorkingTime(int profid){
  try{
    Statement st=con.createStatement();
    
    ResultSet res=st.executeQuery("SELECT sec_to_time(TIMESTAMPDIFF(second,`logindate`,now())) FROM rvaattandance where profid like "+profid+" ORDER BY `logindate` DESC LIMIT 1 ");
    while(res.next()){
    workingTime=res.getString("sec_to_time(TIMESTAMPDIFF(second,`logindate`,now()))");  
  }
    System.out.println(workingTime);
  } catch(Exception e){
    e.printStackTrace();
  } 
    return workingTime;
  }
}
