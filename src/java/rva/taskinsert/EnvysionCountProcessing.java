/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.taskinsert;

import java.util.ArrayList;
  import java.sql.*;
  import rva.dbaccess.DBConnect;
import rva.administrator.ChangeDateFormat;
/**
 *
 * @author RCT-456
 */
public class EnvysionCountProcessing {
 private String performdate;
 private String auditorname;
private String dbDatadate;
 private ArrayList<String> ltaskname=new ArrayList<String>();
 private ArrayList<String> lcafename=new ArrayList<String>();
 private ArrayList<String> ltaskcount=new ArrayList<String>();
 private ArrayList<String> ldatadate=new ArrayList<String>();
 ChangeDateFormat cdf=new ChangeDateFormat();
 private int cafeid;
 private int taskid;
 private int taskscount;
 private int timetoperform;
 PreparedStatement pstm=null;
 Connection con=DBConnect.startConnection();
 EnvyRowNoGetting envyrowno=new EnvyRowNoGetting();
 EnvysionBean insertValues(EnvysionBean envy){
   ltaskname=envy.gettasksName();
   lcafename=envy.getcafesName();
   ltaskcount=envy.gettaskCount();
   performdate=envy.geperformDate();
   auditorname=envy.getauditorName();
   ldatadate=envy.getlDatadate();
   for(int i=0;i<ltaskname.size();i++){
//envy.setcafeName(lcafename.get(i));
envy.settaskName(ltaskname.get(i));
this.taskscount=Integer.parseInt(ltaskcount.get(i));
cafeid=envyrowno.getcafeId(lcafename.get(i));

envy=envyrowno.gettaskDetails(envy);
taskid=envy.gettaskId();
timetoperform=envy.getTimetoperform();
try{
  dbDatadate=cdf.toDbDate(ldatadate.get(i));
  System.out.println("DATADATE"+dbDatadate);
  System.out.println("PerformDATE"+performdate);
  pstm=con.prepareStatement("INSERT INTO envysionperformancefinal(envysioncafesid,envysiontaskid,auditorname,performeddate,datadate,takscount,timetoperform)values(?,?,?,?,?,?,?)");
pstm.setInt(1,cafeid);
pstm.setInt(2,taskid);
pstm.setString(3,auditorname);
pstm.setString(4,performdate);
pstm.setString(5, dbDatadate);
pstm.setInt(6,taskscount);
pstm.setFloat(7,timetoperform);
pstm.executeUpdate();

}
catch(Exception e){
  System.out.println(e);
}
}
  return envy; 
 }
 
}
