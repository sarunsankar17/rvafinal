/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.taskinsert;
import java.sql.*;
import java.util.ArrayList;
import rva.administrator.ChangeDateFormat;
import rva.dbaccess.DBConnect;
/**
 *
 * @author RCT-456
 */
public class GettingDTTTaskId {
  private int taskid;
  private int timetoperform;
  private int processstageno;
  //private String auditorsname=null;
  private boolean auditoravail=false;
  private final String cltask="Upgrade to 3.56";
  private ArrayList<String> dttcltname=new ArrayList<String>();
  private ArrayList<String> dttcltaskstage=new ArrayList<String>();
  private ArrayList<String> lauditorname=new ArrayList<String>();
  private ArrayList<String> lperformdate=new ArrayList<String>();
  private ArrayList<String> logmeinname=new ArrayList<String>();
  private ArrayList<Integer> ldttmissedvalrn=new ArrayList<Integer>();
  private String appDate;
  ChangeDateFormat cdf=new ChangeDateFormat();
  Connection con=DBConnect.startConnection();
  DTTBean dttbean=new DTTBean();
  public DTTBean getTaskid(String taskname, String processstage){
    try{
      System.out.println("Getting Task Details/t:"+taskname+"/t:"+processstage);
      Statement st=con.createStatement();
      ResultSet res=st.executeQuery("SELECT a.`dtttaskid`,a.`dttprocessstageid`,a.`performancetime` FROM `dttprocessandpt` as a join dtttaskdetails as b join dttprocessstage as c on a.`dtttaskid`=b.dtttasksid and a.dttprocessstageid=c.dttprocessstageid WHERE b.dtttaskname like '"+taskname+"' and c.dttprocessstagename like '"+processstage+"' ");
      if(res.next()){
        dttbean.settaskId(res.getInt("a.dtttaskid"));
        dttbean.settimetoperform(res.getInt("a.performancetime"));
        dttbean.setprocessstageno(res.getInt("a.dttprocessstageid"));
      }
     else{
     dttbean.settaskId(taskid);
     dttbean.settimetoperform(timetoperform);
     dttbean.setprocessstageno(processstageno);
      }}
    catch(Exception e){
      System.out.println(e);
    }
    return dttbean;
  }
  public DTTBean getdttcltname(){
    try{
      Statement st=con.createStatement();
      ResultSet res=st.executeQuery("SELECT b.dtttaskname,c.dttprocessstagename FROM dttprocessandpt as a join dtttaskdetails as b join dttprocessstage as c on a.dtttaskid=b.dtttasksid and a.dttprocessstageid=c.dttprocessstageid WHERE b.dtttaskname like '"+cltask+"' ");
    while(res.next()){
      //dttcltname.add(res.getString("b.dtttaskname"));
      dttcltaskstage.add(res.getString("c.dttprocessstagename"));
    }
    dttcltname.add(cltask);
    dttbean.setprocessStage(dttcltaskstage);
    dttbean.settasksname(dttcltname);
    }
    catch(Exception e){
      e.printStackTrace();
    }
    return dttbean; 
  }
  public boolean getAuditorsName(String auditorname){
    try{
      Statement st=con.createStatement();
      ResultSet res=st.executeQuery("SELECT auditorsname from auditors where auditorsname like '"+auditorname+"' ");
      if(res.next()){
      auditoravail=true;
    }
      else{
        auditoravail=false;
      }
    }
    catch(Exception e){
      e.printStackTrace();
    }
    return auditoravail;
  }
  public DTTBean getdttmissedvalues(){
    try{
      Statement st=con.createStatement();
      ResultSet res=st.executeQuery("SELECT dttmissedvaluesid,logmeinname,taskname,auditorname,performeddate,processstage from dttmissedvalues");
    while(res.next()){
      dttcltname.add(res.getString("taskname"));
      dttcltaskstage.add(res.getString("processstage"));
      lauditorname.add(res.getString("auditorname"));
      appDate=cdf.dbDatetoAppDate(res.getString("performeddate"));
      lperformdate.add(appDate);
      logmeinname.add(res.getString("logmeinname"));
      ldttmissedvalrn.add(res.getInt("dttmissedvaluesid"));
    }
    if(dttcltname.size()>0){
      dttbean.setauditorsname(lauditorname);
      dttbean.settasksname(dttcltname);
      dttbean.setprocessStage(dttcltaskstage);
      dttbean.setstartDateApp(lperformdate);
      dttbean.setlogmeinname(logmeinname);
      dttbean.setdttmissedvalrn(ldttmissedvalrn);
    }
    else{
      dttbean.setauditorsname(lauditorname);
      dttbean.settasksname(dttcltname);
      dttbean.setprocessStage(dttcltaskstage);
      dttbean.setstartDateApp(lperformdate);
      dttbean.setlogmeinname(logmeinname);
      dttbean.setdttmissedvalrn(ldttmissedvalrn);
    }
    }
    catch(Exception e){
      e.printStackTrace();
    }
    return dttbean;
  }
}
