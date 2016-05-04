/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.showperformance;
import java.sql.*;
import java.text.*;
import java.util.*;
import java.util.Date;
import rva.taskinsert.DTTBean;
import rva.taskinsert.DTTBean;
import rva.dbaccess.DBConnect;
/**
 *
 * @author RCT-456
 */
public class DTTResultProcessing {
  private String auditorname;
  private String taskname;
  private String appstartdate;
  private String appenddate;
  private String dbstartdate;
  private String dbenddate;
  private ArrayList<String> lauditorname=new ArrayList<String>();
  private ArrayList<String> ltaskname=new ArrayList<String>();
  private ArrayList<String> lappstartdate=new ArrayList<String>();
  private ArrayList<String> lappenddate=new ArrayList<String>();
  private ArrayList<Float> lperformancetime=new ArrayList<Float>();
  
  Date date;
 
  SimpleDateFormat db=new SimpleDateFormat("yyyy-MM-dd");
  SimpleDateFormat app=new SimpleDateFormat("MM/dd/yyyy");
  DTTBean dttresultProcessing(DTTBean dttbean){
    try{
      auditorname=dttbean.getauditorname();
      taskname=dttbean.gettaskname();
      appstartdate=dttbean.getstartdateapp();
      appenddate=dttbean.getenddateapp();
      date=app.parse(appstartdate);
      dbstartdate=db.format(date);
      date=app.parse(appenddate);
      dbenddate=db.format(date);
      Connection con=DBConnect.startConnection();
      Statement st=con.createStatement();
      ResultSet res=null;
      if(auditorname.equalsIgnoreCase("selectall")&&taskname.equalsIgnoreCase("selectall"))
      {
        res=st.executeQuery("SELECT sum(performancetime),auditorname from dttfinal where performdate between '"+dbstartdate+"' and '"+dbenddate+"' group by auditorname ");
        while(res.next()){
          lauditorname.add(res.getString("auditorname"));
          lperformancetime.add(res.getFloat("sum(performancetime)")/60);
          ltaskname.add("DTT Tasks");
          lappstartdate.add(appstartdate);
          lappenddate.add(appenddate);
        }
        dttbean.setauditorsname(lauditorname);
        dttbean.setperformancetime(lperformancetime);
        dttbean.settasksname(ltaskname);
        dttbean.setstartDateApp(lappstartdate);
        dttbean.setendDateApp(lappenddate);
      }
     else if((auditorname.equalsIgnoreCase("selectall"))&&(!taskname.equalsIgnoreCase("selectall")))
      {
        res=st.executeQuery("SELECT sum(a.performancetime),a.auditorname from dttfinal as a JOIN dtttaskdetails as b on a.dtttaskid=b.dtttasksid where b.dtttaskname LIKE '"+taskname+"' and a.performdate between '"+dbstartdate+"' and '"+dbenddate+"' group by a.auditorname ");
        while(res.next()){
          lauditorname.add(res.getString("auditorname"));
          ltaskname.add(taskname);
          lperformancetime.add(res.getFloat("sum(a.performancetime)")/60);
          lappstartdate.add(appstartdate);
          lappenddate.add(appenddate);
        }
        dttbean.setauditorsname(lauditorname);
         dttbean.setperformancetime(lperformancetime);
        dttbean.settasksname(ltaskname);
        dttbean.setstartDateApp(lappstartdate);
        dttbean.setendDateApp(lappenddate);
      }
      else if((!auditorname.equalsIgnoreCase("selectall"))&&(taskname.equalsIgnoreCase("selectall")))
      {
        res=st.executeQuery("SELECT sum(a.performancetime),b.dtttaskname from dttfinal as a JOIN dtttaskdetails as b on a.dtttaskid=b.dtttasksid where a.auditorname LIKE '"+auditorname+"' and a.performdate between '"+dbstartdate+"' and '"+dbenddate+"' group by b.dtttaskname ");
        while(res.next()){
          lauditorname.add(auditorname);
          ltaskname.add(res.getString("b.dtttaskname"));
          lperformancetime.add(res.getFloat("sum(a.performancetime)")/60);
          lappstartdate.add(appstartdate);
          lappenddate.add(appenddate);
        }
        dttbean.setauditorsname(lauditorname);
         dttbean.setperformancetime(lperformancetime);
        dttbean.settasksname(ltaskname);
        dttbean.setstartDateApp(lappstartdate);
        dttbean.setendDateApp(lappenddate);
      }
      else if((!auditorname.equalsIgnoreCase("selectall"))&&(!taskname.equalsIgnoreCase("selectall")))
      {
        res=st.executeQuery("SELECT sum(a.performancetime) from dttfinal as a JOIN dtttaskdetails as b on a.dtttaskid=b.dtttasksid where b.dtttaskname LIKE '"+taskname+"' and a.auditorname LIKE '"+auditorname+"' and a.performdate between '"+dbstartdate+"' and '"+dbenddate+"' ");
        while(res.next()){
          lauditorname.add(auditorname);
          ltaskname.add(taskname);
          lperformancetime.add(res.getFloat("sum(a.performancetime)")/60);
          lappstartdate.add(appstartdate);
          lappenddate.add(appenddate);
        }
        dttbean.setauditorsname(lauditorname);
         dttbean.setperformancetime(lperformancetime);
        dttbean.settasksname(ltaskname);
        dttbean.setstartDateApp(lappstartdate);
        dttbean.setendDateApp(lappenddate);
      }
    }
    catch(Exception e){
      System.out.println(e);
    }
    return dttbean;
  }
}
