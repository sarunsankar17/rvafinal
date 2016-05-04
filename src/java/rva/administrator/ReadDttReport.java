/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rva.administrator;
import rva.dbaccess.DBConnect;
import jxl.Workbook;
import jxl.Sheet;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import jxl.DateCell;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.TimeZone;
import java.sql.*;
import rva.taskinsert.DTTBean;
import rva.taskinsert.GettingDTTTaskId;
/**
 *
 * @author RCT-456
 */
public class ReadDttReport {
  private String filepath;
  Connection conn=null;
  PreparedStatement pstm=null;
  ChangeDateFormat cdf=new ChangeDateFormat();
    ArrayList<String> logmein=new ArrayList<String>();
    ArrayList<String> auditorName=new ArrayList<String>();
    ArrayList<String> taskname=new ArrayList<String>();
    ArrayList<String> performdate=new ArrayList<String>();
    ArrayList<String> processtill=new ArrayList<String>();
    DateCell jxldc=null;
    Date date=new Date();
    int taskcount=1;
    String dbDate=null;
    int taskid=0;
    int timetoperform=0;
    int processstageno=0;
    boolean auditoravail=false;
    Connection con=DBConnect.startConnection();
    GettingDTTTaskId gdt=new GettingDTTTaskId();
DTTBean dttbean=new DTTBean();
  public void readDTTReport(String filepath) throws Exception
  { 
this.filepath=filepath;
File file=new File(this.filepath);
Workbook wb=Workbook.getWorkbook(file);
Sheet s=wb.getSheet(0);
int noofrows=s.getRows();
for(int i=1;i<noofrows;i++){
  logmein.add(s.getCell(1, i).getContents());
  taskname.add(s.getCell(2,i).getContents());
  auditorName.add(s.getCell(3,i).getContents());
  jxldc=(DateCell) s.getCell(4,i);
  dbDate=cdf.todbDate(jxldc.getDate());
  performdate.add(dbDate);
  processtill.add(s.getCell(5,i).getContents());

}

for(int i=0;i<logmein.size();i++){
  System.out.println(i+":/t"+taskname.get(i));
  dttbean=gdt.getTaskid(taskname.get(i),processtill.get(i));
  taskid=dttbean.gettaskid();
  auditoravail=gdt.getAuditorsName(auditorName.get(i));
  try{
  if(taskid!=0&&auditoravail==true){
     timetoperform=dttbean.timetoperform();
    processstageno=dttbean.getprocessstageno();
      pstm=con.prepareStatement("INSERT INTO dttfinal(logmeinname,`dtttaskid`, `auditorname`, `performdate`,processstageno, `nooftasksperformed`, `performancetime`) VALUES(?,?,?,?,?,?,?) ");
      pstm.setString(1, logmein.get(i));
      pstm.setInt(2, taskid);
      pstm.setString(3,auditorName.get(i));
      pstm.setString(4, performdate.get(i));
      pstm.setInt(5, processstageno);
      pstm.setInt(6, taskcount);
      pstm.setInt(7, timetoperform);
      pstm.executeUpdate();
    }
  else{
   pstm=con.prepareStatement("INSERT INTO dttmissedvalues(logmeinname,taskname, auditorname, performeddate,processstage) VALUES(?,?,?,?,?) ");
      pstm.setString(1, logmein.get(i));
      pstm.setString(2, taskname.get(i));
      pstm.setString(3,auditorName.get(i));
      pstm.setString(4, performdate.get(i));
      pstm.setString(5, processtill.get(i));
      pstm.executeUpdate();
    }
    }
    catch(Exception e){
      e.printStackTrace();
    }
  }
}
  
  public void readDTTMissedValues(){
    
    try{
      Statement st=con.createStatement();
      ResultSet res=st.executeQuery("select * from dttmissedvalues");
      while(res.next()){
        logmein.add(res.getString("logmeinname"));
        auditorName.add(res.getString("auditorname"));
        taskname.add(res.getString("taskname"));
        performdate.add(res.getString("performeddate"));
        processtill.add(res.getString("processstage"));
      }
      st.executeUpdate("TRUNCATE dttmissedvalues");
  for(int i=0;i<logmein.size();i++){
  System.out.println(i+":/t"+taskname.get(i));
  dttbean=gdt.getTaskid(taskname.get(i),processtill.get(i));
  taskid=dttbean.gettaskid();
  auditoravail=gdt.getAuditorsName(auditorName.get(i));
  try{
  if(taskid!=0&&auditoravail==true){
     timetoperform=dttbean.timetoperform();
    processstageno=dttbean.getprocessstageno();
      pstm=con.prepareStatement("INSERT INTO dttfinal(logmeinname,`dtttaskid`, `auditorname`, `performdate`,processstageno, `nooftasksperformed`, `performancetime`) VALUES(?,?,?,?,?,?,?) ");
      pstm.setString(1, logmein.get(i));
      pstm.setInt(2, taskid);
      pstm.setString(3,auditorName.get(i));
      pstm.setString(4, performdate.get(i));
      pstm.setInt(5, processstageno);
      pstm.setInt(6, taskcount);
      pstm.setInt(7, timetoperform);
      pstm.executeUpdate();
    }
  else{
   pstm=con.prepareStatement("INSERT INTO dttmissedvalues(logmeinname,taskname, auditorname, performeddate,processstage) VALUES(?,?,?,?,?) ");
      pstm.setString(1, logmein.get(i));
      pstm.setString(2, taskname.get(i));
      pstm.setString(3,auditorName.get(i));
      pstm.setString(4, performdate.get(i));
      pstm.setString(5, processtill.get(i));
      pstm.executeUpdate();
    }
    }
    catch(Exception e){
      e.printStackTrace();
    }
  }
      
    }
    catch(Exception e){
      e.printStackTrace();
    }
  }
}

