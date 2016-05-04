/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.scheduletasks;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import java.util.*;
import java.sql.*;
import rva.dbaccess.DBConnect;
public class CloseRvaAttendance implements Job{
  public void execute(JobExecutionContext context) throws JobExecutionException{
    try{
      ArrayList<Integer> lprofid=new ArrayList<Integer>();
      String currdate=null;
      Connection con=DBConnect.startConnection();
      Statement st=con.createStatement();
      PreparedStatement pstm=null;
      ResultSet res=null;
      String attendanceStatus="Absent";
      String deftime=" 00:00:00";
     
      String logindt=null;
      String signintime=null;
      res=st.executeQuery("select profileid,DATE_SUB(curdate(),Interval 1 day) from userprofilepersonal where profileid not in (SELECT `profid` FROM `rvaattandance` WHERE logindate like concat(DATE_SUB(curdate(),Interval 1 day),'%'))");
    while(res.next()){
      lprofid.add(res.getInt("profileid"));
      currdate=res.getString("DATE_SUB(curdate(),Interval 1 day)");
    }
    for(int i=0;i<lprofid.size();i++){
      res=st.executeQuery("SELECT logindate FROM `rvaattandance` WHERE `logoutdate` is null and `profid` = "+lprofid.get(i)+" and logindate like concat(DATE_SUB(curdate(),interval 2 day),'%')");
      if(res.next()){
        
        logindt=res.getString("logindate");
        signintime=currdate.concat(deftime);
        st.executeUpdate("UPDATE rvaattandance set logoutdate =date_add('"+logindt+"',Interval 8 hour) where profid like '"+lprofid.get(i)+"' and `logoutdate` is null ");
        pstm=con.prepareStatement("Insert into rvaattandance (`profid`, `logindate`, `logoutdate`, `todayshift`, `attendancestatus`) value(?,?,?,?,?)");
        pstm.setInt(1,lprofid.get(i));
        pstm.setString(2,signintime);
        pstm.setString(3,signintime);
        pstm.setString(4,attendanceStatus);
        pstm.setString(5,attendanceStatus);
        pstm.executeUpdate();
      }
      else{
        signintime=currdate.concat(deftime);
        st.executeUpdate("UPDATE rvaattandance set logoutdate =date_add('"+logindt+"',Interval 8 hour) where profid like '"+lprofid.get(i)+"' and `logoutdate` is null ");
        pstm=con.prepareStatement("Insert into rvaattandance (`profid`, `logindate`, `logoutdate`, `todayshift`, `attendancestatus`) value(?,?,?,?,?)");
        pstm.setInt(1,lprofid.get(i));
        pstm.setString(2,signintime);
        pstm.setString(3,signintime);
        pstm.setString(4,attendanceStatus);
        pstm.setString(5,attendanceStatus);
        pstm.executeUpdate();
      }
    }
    }
    catch(Exception e){
      System.out.println(e);
    }
  }
  
}
