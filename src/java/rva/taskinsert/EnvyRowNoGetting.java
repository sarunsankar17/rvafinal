/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.taskinsert;

/**
 *
 * @author RCT-456
 */
import java.sql.*;
import rva.dbaccess.DBConnect;
public class EnvyRowNoGetting {
  private int cafeid;
  private int taskid;
  private String taskname;
  private String cafename;
  private int timetoperform;
  Connection con=DBConnect.startConnection();
  ResultSet res=null;
 public int getcafeId(String cafename){
 try{
   Statement st=con.createStatement();
   this.cafename=cafename;
   res=st.executeQuery("SELECT * from envysioncafes where envysioncafesname like '"+this.cafename+"' ");
   while(res.next()){
     cafeid=res.getInt("envysioncafesid");
   }
   
}
  catch(Exception e){
  System.out.println(e); 
}
 return cafeid;
 }
 public EnvysionBean gettaskDetails(EnvysionBean envybean){
   try{
     this.taskname=envybean.gettaskName();
     Statement st=con.createStatement();
     res=st.executeQuery("SELECT * from envysiontasks where envysiontaskname like '"+this.taskname+"' ");
   while(res.next()){
     taskid=res.getInt("envysiontasksid");
     timetoperform=res.getInt("timetoperform");
     envybean.settaskId(taskid);
     envybean.setTimetoperform(timetoperform);   
     System.out.println(taskid);
     System.out.println(timetoperform);
   }
   res=st.executeQuery("");
   }
   catch(Exception e){
     
   }
   return envybean;
 }
}
