/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.showperformance;
import rva.taskinsert.EnvysionBean;
import java.util.*;
import java.util.Date;
import java.sql.*;
import java.text.*;
import rva.dbaccess.DBConnect;
import rva.administrator.ChangeDateFormat;

public class EnvyptProcessing {
  private String auditorName;
  private String cafeName;
  private String taskName;
  private String startDatedb;
  private String endDatedb;
  private String startDateapp;
  private String endDateapp;
  private String datadate;
  private ArrayList<String> lauditorName=new ArrayList<String>();
  private ArrayList<String> lcafeName=new ArrayList<String>();
  private ArrayList<String> ltaskName=new ArrayList<String>();
  private ArrayList<String> lstartDateapp=new ArrayList<String>();
  private ArrayList<Float> lperformanceTime=new ArrayList<Float>();
  private ArrayList<String> lendDateApp=new ArrayList<String>();
  private ArrayList<String> ldatadate=new ArrayList<String>();
  private ArrayList<String> ltaskcount=new ArrayList<String>();
  ChangeDateFormat cdf=new ChangeDateFormat();
  
  ResultSet res=null;
Connection con=DBConnect.startConnection();
  
  public EnvysionBean getenvyPT(EnvysionBean enbean){
    try{
     
    auditorName=enbean.getauditorName();
    cafeName=enbean.getcafeName();
    taskName=enbean.gettaskName();
    startDatedb=enbean.getstartDate();
    endDatedb=enbean.getendDate();
     
    Statement st=con.createStatement();
    if(startDatedb!=null){
      startDateapp=cdf.dbDatetoAppDate(startDatedb);
      endDateapp=cdf.dbDatetoAppDate(endDatedb);
    if(auditorName.equalsIgnoreCase("selectall")&&cafeName.equalsIgnoreCase("selectall")&&taskName.equalsIgnoreCase("selectall")){
      res=st.executeQuery("select auditorname, sum(timetoperform) from envysionperformancefinal where performeddate between '"+startDatedb+"' and '"+endDatedb+"' group by auditorname");
      while(res.next()){
        lauditorName.add(res.getString("auditorname"));
        lcafeName.add("Cafes");
        ltaskName.add("Tasks");
        lstartDateapp.add(startDateapp);
        lendDateApp.add(endDateapp);
        lperformanceTime.add(res.getFloat("sum(timetoperform)")/60);
      }
      //System.out.println("SIZE"+lauditorName.size());
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlEnddate(lendDateApp);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((auditorName.equalsIgnoreCase("selectall"))&&(cafeName.equalsIgnoreCase("selectall"))&&(!taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("select a.auditorname, sum(a.timetoperform) from envysionperformancefinal as a join envysiontasks as b on a.envysiontaskid=b.envysiontasksid where b.envysiontaskname LIKE '"+taskName+"' and a.performeddate between '"+startDatedb+"' and '"+endDatedb+"' group by a.auditorname");
      while(res.next()){
        lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add("Cafes");
        ltaskName.add(taskName);
        lstartDateapp.add(startDateapp);
        lendDateApp.add(endDateapp);
        lperformanceTime.add(res.getFloat("sum(a.timetoperform)")/60);
      }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlEnddate(lendDateApp);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((auditorName.equalsIgnoreCase("selectall"))&&(!cafeName.equalsIgnoreCase("selectall"))&&(taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("select a.auditorname, sum(a.timetoperform) from envysionperformancefinal as a join envysioncafes as b on a.envysioncafesid=b.envysioncafesid where b.envysioncafesname LIKE '"+cafeName+"' and a.performeddate between '"+startDatedb+"' and '"+endDatedb+"' group by a.auditorname");
      while(res.next()){
        lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(cafeName);
        ltaskName.add("Tasks");
        lstartDateapp.add(startDateapp);
        lendDateApp.add(endDateapp);
        lperformanceTime.add(res.getFloat("sum(a.timetoperform)")/60);
      }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlEnddate(lendDateApp);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((!auditorName.equalsIgnoreCase("selectall"))&&(cafeName.equalsIgnoreCase("selectall"))&&(taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("select b.envysioncafesname, sum(a.timetoperform) from envysionperformancefinal as a join envysioncafes as b on a.envysioncafesid=b.envysioncafesid where auditorname LIKE '"+auditorName+"' and a.performeddate between '"+startDatedb+"' and '"+endDatedb+"' group by b.envysioncafesname");
      while(res.next()){
        lauditorName.add(auditorName);
        lcafeName.add(res.getString("b.envysioncafesname"));
        ltaskName.add("Tasks");
        lstartDateapp.add(startDateapp);
        lendDateApp.add(endDateapp);
        lperformanceTime.add(res.getFloat("sum(a.timetoperform)")/60);
      }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlEnddate(lendDateApp);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((auditorName.equalsIgnoreCase("selectall"))&&(!cafeName.equalsIgnoreCase("selectall"))&&(!taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("select a.auditorname, sum(a.timetoperform) from envysionperformancefinal as a join envysiontasks as b join envysioncafes as c on a.envysiontaskid=b.envysiontasksid and a.envysioncafesid=c.envysioncafesid where b.envysiontaskname LIKE '"+taskName+"' and c.envysioncafesname LIKE '"+cafeName+"' and a.performeddate between '"+startDatedb+"' and '"+endDatedb+"' group by a.auditorname");
      while(res.next()){
        lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(cafeName);
        ltaskName.add(taskName);
        lstartDateapp.add(startDateapp);
        lendDateApp.add(endDateapp);
        lperformanceTime.add(res.getFloat("sum(a.timetoperform)")/60);
      }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlEnddate(lendDateApp);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((!auditorName.equalsIgnoreCase("selectall"))&&(cafeName.equalsIgnoreCase("selectall"))&&(!taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("select c.envysioncafesname, sum(a.timetoperform) from envysionperformancefinal as a join envysiontasks as b join envysioncafes as c on a.envysiontaskid=b.envysiontasksid and a.envysioncafesid=c.envysioncafesid where b.envysiontaskname LIKE '"+taskName+"' and a.auditorname LIKE '"+auditorName+"' and a.performeddate between '"+startDatedb+"' and '"+endDatedb+"' group by c.envysioncafesname");
      while(res.next()){
        lauditorName.add(auditorName);
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(taskName);
        lstartDateapp.add(startDateapp);
        lendDateApp.add(endDateapp);
        lperformanceTime.add(res.getFloat("sum(a.timetoperform)")/60);
      }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlEnddate(lendDateApp);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((!auditorName.equalsIgnoreCase("selectall"))&&(!cafeName.equalsIgnoreCase("selectall"))&&(taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("select b.envysiontaskname, sum(a.timetoperform) from envysionperformancefinal as a join envysiontasks as b join envysioncafes as c on a.envysiontaskid=b.envysiontasksid and a.envysioncafesid=c.envysioncafesid where c.envysioncafesname LIKE '"+cafeName+"' and a.auditorname LIKE '"+auditorName+"' and a.performeddate between '"+startDatedb+"' and '"+endDatedb+"' group by b.envysiontaskname");
      while(res.next()){
        lauditorName.add(auditorName);
        lcafeName.add(cafeName);
        ltaskName.add(res.getString("b.envysiontaskname"));
        lstartDateapp.add(startDateapp);
        lendDateApp.add(endDateapp);
        lperformanceTime.add(res.getFloat("sum(a.timetoperform)")/60);
      }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlEnddate(lendDateApp);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((!auditorName.equalsIgnoreCase("selectall"))&&(!cafeName.equalsIgnoreCase("selectall"))&&(!taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("select sum(a.timetoperform) from envysionperformancefinal as a join envysiontasks as b join envysioncafes as c on a.envysiontaskid=b.envysiontasksid and a.envysioncafesid=c.envysioncafesid where c.envysioncafesname LIKE '"+cafeName+"' and a.auditorname LIKE '"+auditorName+"' and b.envysiontaskname LIKE '"+taskName+"' and  a.performeddate between '"+startDatedb+"' and '"+endDatedb+"' ");
      while(res.next()){
        lauditorName.add(auditorName);
        lcafeName.add(cafeName);
        ltaskName.add(taskName);
        lstartDateapp.add(startDateapp);
        lendDateApp.add(endDateapp);
        lperformanceTime.add(res.getFloat("sum(a.timetoperform)")/60);
      }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlEnddate(lendDateApp);
      enbean.setperformancetime(lperformanceTime);
    }
    }
    else{
      datadate=enbean.getDatadate();
      if(auditorName.equalsIgnoreCase("selectall")&&cafeName.equalsIgnoreCase("selectall")&&taskName.equalsIgnoreCase("selectall")){
      res=st.executeQuery("SELECT b.envysiontaskname,c.envysioncafesname,a.`takscount`,a.datadate,a.`timetoperform`,a.`performeddate`,a.`auditorname` FROM `envysionperformancefinal` as a join envysiontasks as b join envysioncafes as c on a.`envysiontaskid`=b.`envysiontasksid` and a.`envysioncafesid`=c.`envysioncafesid` WHERE `datadate` like '"+datadate+"' ");
      while(res.next()){
       lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        startDatedb=res.getString("a.performeddate");
        lstartDateapp.add(cdf.dbDatetoAppDate(startDatedb));
        datadate=res.getString("a.datadate");
        ldatadate.add(cdf.dbDatetoAppDate(datadate));
        ltaskcount.add(res.getString("a.takscount"));
        lperformanceTime.add(res.getFloat("a.timetoperform"));
     }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlDatadate(ldatadate);
      enbean.settaskCount(ltaskcount);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((auditorName.equalsIgnoreCase("selectall"))&&(cafeName.equalsIgnoreCase("selectall"))&&(!taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("SELECT b.envysiontaskname,c.envysioncafesname,a.`takscount`,a.datadate,a.`timetoperform`,a.`performeddate`,a.`auditorname` FROM `envysionperformancefinal` as a join envysiontasks as b join envysioncafes as c on a.`envysiontaskid`=b.`envysiontasksid` and a.`envysioncafesid`=c.`envysioncafesid` WHERE `datadate` like '"+datadate+"' and envysiontaskname like '"+taskName+"' ");
      while(res.next()){
        lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        startDatedb=res.getString("a.performeddate");
        lstartDateapp.add(cdf.dbDatetoAppDate(startDatedb));
        datadate=res.getString("a.datadate");
        ldatadate.add(cdf.dbDatetoAppDate(datadate));
        ltaskcount.add(res.getString("a.takscount"));
        lperformanceTime.add(res.getFloat("a.timetoperform"));
     }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlDatadate(ldatadate);
      enbean.settaskCount(ltaskcount);
      enbean.setperformancetime(lperformanceTime);
   }
    else if((auditorName.equalsIgnoreCase("selectall"))&&(!cafeName.equalsIgnoreCase("selectall"))&&(taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("SELECT b.envysiontaskname,c.envysioncafesname,a.`takscount`,a.datadate,a.`timetoperform`,a.`performeddate`,a.`auditorname` FROM `envysionperformancefinal` as a join envysiontasks as b join envysioncafes as c on a.`envysiontaskid`=b.`envysiontasksid` and a.`envysioncafesid`=c.`envysioncafesid` WHERE `datadate` like '"+datadate+"' and envysioncafesname like '"+cafeName+"'");
      while(res.next()){
        lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        startDatedb=res.getString("a.performeddate");
        lstartDateapp.add(cdf.dbDatetoAppDate(startDatedb));
        datadate=res.getString("a.datadate");
        ldatadate.add(cdf.dbDatetoAppDate(datadate));
        ltaskcount.add(res.getString("a.takscount"));
        lperformanceTime.add(res.getFloat("a.timetoperform"));
     }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlDatadate(ldatadate);
      enbean.settaskCount(ltaskcount);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((!auditorName.equalsIgnoreCase("selectall"))&&(cafeName.equalsIgnoreCase("selectall"))&&(taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("SELECT b.envysiontaskname,c.envysioncafesname,a.`takscount`,a.datadate,a.`timetoperform`,a.`performeddate`,a.`auditorname` FROM `envysionperformancefinal` as a join envysiontasks as b join envysioncafes as c on a.`envysiontaskid`=b.`envysiontasksid` and a.`envysioncafesid`=c.`envysioncafesid` WHERE `datadate` like '"+datadate+"' and `auditorname` like '"+auditorName+"'");
      while(res.next()){
        lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        startDatedb=res.getString("a.performeddate");
        lstartDateapp.add(cdf.dbDatetoAppDate(startDatedb));
        datadate=res.getString("a.datadate");
        ldatadate.add(cdf.dbDatetoAppDate(datadate));
        ltaskcount.add(res.getString("a.takscount"));
        lperformanceTime.add(res.getFloat("a.timetoperform"));
     }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlDatadate(ldatadate);
      enbean.settaskCount(ltaskcount);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((auditorName.equalsIgnoreCase("selectall"))&&(!cafeName.equalsIgnoreCase("selectall"))&&(!taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("SELECT b.envysiontaskname,c.envysioncafesname,a.`takscount`,a.datadate,a.`timetoperform`,a.`performeddate`,a.`auditorname` FROM `envysionperformancefinal` as a join envysiontasks as b join envysioncafes as c on a.`envysiontaskid`=b.`envysiontasksid` and a.`envysioncafesid`=c.`envysioncafesid` WHERE `datadate` like '"+datadate+"' and `envysiontaskname` like '"+taskName+"' and envysioncafesname like '"+cafeName+"' ");
      while(res.next()){
        lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        startDatedb=res.getString("a.performeddate");
        lstartDateapp.add(cdf.dbDatetoAppDate(startDatedb));
        datadate=res.getString("a.datadate");
        ldatadate.add(cdf.dbDatetoAppDate(datadate));
        ltaskcount.add(res.getString("a.takscount"));
        lperformanceTime.add(res.getFloat("a.timetoperform"));
     }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlDatadate(ldatadate);
      enbean.settaskCount(ltaskcount);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((!auditorName.equalsIgnoreCase("selectall"))&&(cafeName.equalsIgnoreCase("selectall"))&&(!taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("SELECT b.envysiontaskname,c.envysioncafesname,a.`takscount`,a.datadate,a.`timetoperform`,a.`performeddate`,a.`auditorname` FROM `envysionperformancefinal` as a join envysiontasks as b join envysioncafes as c on a.`envysiontaskid`=b.`envysiontasksid` and a.`envysioncafesid`=c.`envysioncafesid` WHERE `datadate` like '"+datadate+"' and `envysiontaskname` like '"+taskName+"' and `auditorname` like '"+auditorName+"' ");
      while(res.next()){
        lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        startDatedb=res.getString("a.performeddate");
        lstartDateapp.add(cdf.dbDatetoAppDate(startDatedb));
        datadate=res.getString("a.datadate");
        ldatadate.add(cdf.dbDatetoAppDate(datadate));
        ltaskcount.add(res.getString("a.takscount"));
        lperformanceTime.add(res.getFloat("a.timetoperform"));
     }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlDatadate(ldatadate);
      enbean.settaskCount(ltaskcount);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((!auditorName.equalsIgnoreCase("selectall"))&&(!cafeName.equalsIgnoreCase("selectall"))&&(taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("SELECT b.envysiontaskname,c.envysioncafesname,a.`takscount`,a.datadate,a.`timetoperform`,a.`performeddate`,a.`auditorname` FROM `envysionperformancefinal` as a join envysiontasks as b join envysioncafes as c on a.`envysiontaskid`=b.`envysiontasksid` and a.`envysioncafesid`=c.`envysioncafesid` WHERE `datadate` like '"+datadate+"' and envysioncafesname like '"+cafeName+"' and `auditorname` like '"+auditorName+"' ");
      while(res.next()){
        lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        startDatedb=res.getString("a.performeddate");
        lstartDateapp.add(cdf.dbDatetoAppDate(startDatedb));
        datadate=res.getString("a.datadate");
        ldatadate.add(cdf.dbDatetoAppDate(datadate));
        ltaskcount.add(res.getString("a.takscount"));
        lperformanceTime.add(res.getFloat("a.timetoperform"));
     }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlDatadate(ldatadate);
      enbean.settaskCount(ltaskcount);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((!auditorName.equalsIgnoreCase("selectall"))&&(!cafeName.equalsIgnoreCase("selectall"))&&(!taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("SELECT b.envysiontaskname,c.envysioncafesname,a.`takscount`,a.datadate,a.`timetoperform`,a.`performeddate`,a.`auditorname` FROM `envysionperformancefinal` as a join envysiontasks as b join envysioncafes as c on a.`envysiontaskid`=b.`envysiontasksid` and a.`envysioncafesid`=c.`envysioncafesid` WHERE `datadate` like '"+datadate+"' and envysioncafesname like '"+cafeName+"' and `auditorname` like '"+auditorName+"' and `envysiontaskname` like '"+taskName+"' ");
      while(res.next()){
         lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        startDatedb=res.getString("a.performeddate");
        lstartDateapp.add(cdf.dbDatetoAppDate(startDatedb));
        datadate=res.getString("a.datadate");
        ldatadate.add(cdf.dbDatetoAppDate(datadate));
        ltaskcount.add(res.getString("a.takscount"));
        lperformanceTime.add(res.getFloat("a.timetoperform"));
     }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlDatadate(ldatadate);
      enbean.settaskCount(ltaskcount);
      enbean.setperformancetime(lperformanceTime);
    } 
    }
    }
    catch(Exception e){
      e.printStackTrace();
    }
  
    return enbean;
  }
  
}
