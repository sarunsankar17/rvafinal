/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.administrator;
import rva.taskinsert.EnvysionBean;
import java.util.*;
import java.util.Date;
import java.sql.*;
import java.text.*;
import rva.dbaccess.DBConnect;
import rva.administrator.ChangeDateFormat;

public class EnvyTaskPerformed {
  private String auditorName;
  private String cafeName;
  private String taskName;
  private String startDatedb;
  //private String endDatedb;
  private String startDateapp;
  private String endDateapp;
  private String datadate;
  private ArrayList<String> lauditorName=new ArrayList<String>();
  private ArrayList<String> lcafeName=new ArrayList<String>();
  private ArrayList<String> ltaskName=new ArrayList<String>();
  private ArrayList<String> lstartDateapp=new ArrayList<String>();
  private ArrayList<Float> lperformanceTime=new ArrayList<Float>();
  //private ArrayList<String> lendDateApp=new ArrayList<String>();
  private ArrayList<String> lRowno=new ArrayList<String>();
  private ArrayList<String> ldatadate=new ArrayList<String>();
  private ArrayList<String> ltaskcount=new ArrayList<String>();
  ChangeDateFormat cdf=new ChangeDateFormat();
  
  ResultSet res=null;
Connection con=DBConnect.startConnection();
  
  public EnvysionBean getTasksPerformed(EnvysionBean enbean){
    try{
     
    auditorName=enbean.getauditorName();
    cafeName=enbean.getcafeName();
    taskName=enbean.gettaskName();
    startDatedb=enbean.getstartDate();
    //endDatedb=enbean.getendDate();
     
    Statement st=con.createStatement();
    if(startDatedb!=null){
      startDateapp=cdf.dbDatetoAppDate(startDatedb);
      //endDateapp=cdf.dbDatetoAppDate(endDatedb);
    if(auditorName.equalsIgnoreCase("selectall")&&cafeName.equalsIgnoreCase("selectall")&&taskName.equalsIgnoreCase("selectall")){
      res=st.executeQuery("select a.envysionperformancefinalid,a.auditorname,a.datadate, a.timetoperform,a.takscount,b.envysiontaskname,c.envysioncafesname from envysionperformancefinal as a join envysiontasks as b join envysioncafes as c on a.`envysiontaskid`=b.`envysiontasksid` and a.`envysioncafesid`=c.`envysioncafesid`  where performeddate Like '"+startDatedb+"' ");
      while(res.next()){
        lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        datadate=cdf.dbDatetoAppDate(res.getString("datadate"));
        ltaskcount.add(res.getString("takscount"));
        ldatadate.add(datadate);
        lRowno.add(res.getString("a.envysionperformancefinalid"));
        lstartDateapp.add(startDateapp);
        //lendDateApp.add(endDateapp);
        lperformanceTime.add(res.getFloat("timetoperform"));
      }
      //System.out.println("SIZE"+lauditorName.size());
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.settaskCount(ltaskcount);
      enbean.setRowno(lRowno);
      enbean.setlDatadate(ldatadate);
      //enbean.setlEnddate(lendDateApp);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((auditorName.equalsIgnoreCase("selectall"))&&(cafeName.equalsIgnoreCase("selectall"))&&(!taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("select a.envysionperformancefinalid,a.auditorname,a.datadate, a.timetoperform,a.takscount,b.envysiontaskname,c.`envysioncafesname` from envysionperformancefinal as a join envysiontasks as b join envysioncafes as c on a.envysiontaskid=b.envysiontasksid and a.`envysioncafesid`=c.`envysioncafesid` where b.envysiontaskname LIKE '"+taskName+"' and a.performeddate Like '"+startDatedb+"' ");
      while(res.next()){
        lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        lstartDateapp.add(startDateapp);
        ltaskcount.add(res.getString("a.takscount"));
        //lendDateApp.add(endDateapp);
        datadate=cdf.dbDatetoAppDate(res.getString("datadate"));
        ldatadate.add(datadate);
        lRowno.add(res.getString("a.envysionperformancefinalid"));
        lperformanceTime.add(res.getFloat("a.timetoperform"));
      }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlDatadate(ldatadate);
      //enbean.setlEnddate(lendDateApp);
      enbean.setRowno(lRowno);
      enbean.settaskCount(ltaskcount);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((auditorName.equalsIgnoreCase("selectall"))&&(!cafeName.equalsIgnoreCase("selectall"))&&(taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("select a.envysionperformancefinalid,a.auditorname,a.datadate, a.timetoperform,a.takscount,b.envysioncafesname,c.envysiontaskname from envysionperformancefinal as a join envysioncafes as b join envysiontasks as c on a.envysioncafesid=b.envysioncafesid and a.`envysiontaskid`=c.`envysiontasksid` where b.envysioncafesname LIKE '"+cafeName+"' and a.performeddate Like '"+startDatedb+"' ");
      while(res.next()){
        lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("b.envysioncafesname"));
        ltaskName.add(res.getString("c.envysiontaskname"));
        datadate=cdf.dbDatetoAppDate(res.getString("datadate"));
        ltaskcount.add(res.getString("a.takscount"));
        ldatadate.add(datadate);
        lRowno.add(res.getString("a.envysionperformancefinalid"));
        lstartDateapp.add(startDateapp);
        //lendDateApp.add(endDateapp);
        lperformanceTime.add(res.getFloat("a.timetoperform"));
      }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setRowno(lRowno);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlDatadate(ldatadate);
      enbean.settaskCount(ltaskcount);
      //enbean.setlEnddate(lendDateApp);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((!auditorName.equalsIgnoreCase("selectall"))&&(cafeName.equalsIgnoreCase("selectall"))&&(taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("select a.envysionperformancefinalid,b.envysioncafesname,a.datadate, a.timetoperform,a.takscount,c.envysiontaskname,b.envysioncafesname from envysionperformancefinal as a join envysioncafes as b join envysiontasks as c on a.envysioncafesid=b.envysioncafesid and a.`envysiontaskid`=c.`envysiontasksid` where auditorname LIKE '"+auditorName+"' and a.performeddate Like '"+startDatedb+"' ");
      while(res.next()){
        lauditorName.add(auditorName);
        lcafeName.add(res.getString("b.envysioncafesname"));
        ltaskName.add(res.getString("c.envysiontaskname"));
        lstartDateapp.add(startDateapp);
        ltaskcount.add(res.getString("a.takscount"));
        lRowno.add(res.getString("a.envysionperformancefinalid"));
        //lendDateApp.add(endDateapp);
        datadate=cdf.dbDatetoAppDate(res.getString("datadate"));
        ldatadate.add(datadate);
        
        lperformanceTime.add(res.getFloat("a.timetoperform"));
      }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlDatadate(ldatadate);
      enbean.setRowno(lRowno);
      enbean.settaskCount(ltaskcount);
      //enbean.setlEnddate(lendDateApp);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((auditorName.equalsIgnoreCase("selectall"))&&(!cafeName.equalsIgnoreCase("selectall"))&&(!taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("select a.envysionperformancefinalid,a.auditorname,a.datadate, a.timetoperform,a.takscount,b.envysiontaskname,c.envysioncafesname from envysionperformancefinal as a join envysiontasks as b join envysioncafes as c on a.envysiontaskid=b.envysiontasksid and a.envysioncafesid=c.envysioncafesid where b.envysiontaskname LIKE '"+taskName+"' and c.envysioncafesname LIKE '"+cafeName+"' and a.performeddate Like '"+startDatedb+"' ");
      while(res.next()){
        lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        lstartDateapp.add(startDateapp);
        ltaskcount.add(res.getString("a.takscount"));
        lRowno.add(res.getString("a.envysionperformancefinalid"));
        datadate=cdf.dbDatetoAppDate(res.getString("datadate"));
        ldatadate.add(datadate);
        //lendDateApp.add(endDateapp);
        lperformanceTime.add(res.getFloat("a.timetoperform"));
      }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.setRowno(lRowno);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.settaskCount(ltaskcount);
      enbean.setlDatadate(ldatadate);
     // enbean.setlEnddate(lendDateApp);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((!auditorName.equalsIgnoreCase("selectall"))&&(cafeName.equalsIgnoreCase("selectall"))&&(!taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("select a.envysionperformancefinalid,a.datadate, a.timetoperform,a.takscount,b.envysiontaskname,c.envysioncafesname from envysionperformancefinal as a join envysiontasks as b join envysioncafes as c on a.envysiontaskid=b.envysiontasksid and a.envysioncafesid=c.envysioncafesid where b.envysiontaskname LIKE '"+taskName+"' and a.auditorname LIKE '"+auditorName+"' and a.performeddate Like '"+startDatedb+"' ");
      while(res.next()){
        lauditorName.add(auditorName);
         lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        lstartDateapp.add(startDateapp);
        datadate=cdf.dbDatetoAppDate(res.getString("datadate"));
        ltaskcount.add(res.getString("a.takscount"));
        lRowno.add(res.getString("a.envysionperformancefinalid"));
        ldatadate.add(datadate);
        //lendDateApp.add(endDateapp);
        lperformanceTime.add(res.getFloat("a.timetoperform"));
      }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.setRowno(lRowno);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlDatadate(ldatadate);
      enbean.settaskCount(ltaskcount);
      //enbean.setlEnddate(lendDateApp);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((!auditorName.equalsIgnoreCase("selectall"))&&(!cafeName.equalsIgnoreCase("selectall"))&&(taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("select a.envysionperformancefinalid,a.datadate, a.timetoperform,a.takscount,b.envysiontaskname,c.envysioncafesname from envysionperformancefinal as a join envysiontasks as b join envysioncafes as c on a.envysiontaskid=b.envysiontasksid and a.envysioncafesid=c.envysioncafesid where c.envysioncafesname LIKE '"+cafeName+"' and a.auditorname LIKE '"+auditorName+"' and a.performeddate Like '"+startDatedb+"' ");
      while(res.next()){
        lauditorName.add(auditorName);
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        datadate=cdf.dbDatetoAppDate(res.getString("datadate"));
        lRowno.add(res.getString("a.envysionperformancefinalid"));
        ldatadate.add(datadate);
        lstartDateapp.add(startDateapp);
        ltaskcount.add(res.getString("a.takscount"));
        //lendDateApp.add(endDateapp);
        lperformanceTime.add(res.getFloat("a.timetoperform"));
      }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.setRowno(lRowno);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlDatadate(ldatadate);
      enbean.settaskCount(ltaskcount);
      //enbean.setlEnddate(lendDateApp);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((!auditorName.equalsIgnoreCase("selectall"))&&(!cafeName.equalsIgnoreCase("selectall"))&&(!taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("select a.envysionperformancefinalid,a.timetoperform,a.datadate,a.takscount,b.envysiontaskname,c.envysioncafesname from envysionperformancefinal as a join envysiontasks as b join envysioncafes as c on a.envysiontaskid=b.envysiontasksid and a.envysioncafesid=c.envysioncafesid where c.envysioncafesname LIKE '"+cafeName+"' and a.auditorname LIKE '"+auditorName+"' and b.envysiontaskname LIKE '"+taskName+"' and  a.performeddate Like '"+startDatedb+"' ");
      while(res.next()){
        lauditorName.add(auditorName);
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        datadate=cdf.dbDatetoAppDate(res.getString("datadate"));
        lRowno.add(res.getString("a.envysionperformancefinalid"));
        ltaskcount.add(res.getString("a.takscount"));
        ldatadate.add(datadate);
       // ltaskName.add(taskName);
        lstartDateapp.add(startDateapp);
       // lendDateApp.add(endDateapp);
        lperformanceTime.add(res.getFloat("a.timetoperform"));
      }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setRowno(lRowno);
      enbean.setlDatadate(ldatadate);
      enbean.settaskCount(ltaskcount);
      //enbean.setlEnddate(lendDateApp);
      enbean.setperformancetime(lperformanceTime);
    }
    }
    else{
      datadate=enbean.getDatadate();
      if(auditorName.equalsIgnoreCase("selectall")&&cafeName.equalsIgnoreCase("selectall")&&taskName.equalsIgnoreCase("selectall")){
      res=st.executeQuery("SELECT a.envysionperformancefinalid,b.envysiontaskname,c.envysioncafesname,a.`takscount`,a.datadate,a.`timetoperform`,a.`performeddate`,a.`auditorname` FROM `envysionperformancefinal` as a join envysiontasks as b join envysioncafes as c on a.`envysiontaskid`=b.`envysiontasksid` and a.`envysioncafesid`=c.`envysioncafesid` WHERE `datadate` like '"+datadate+"' ");
      while(res.next()){
       lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        startDatedb=res.getString("a.performeddate");
        lstartDateapp.add(cdf.dbDatetoAppDate(startDatedb));
        lRowno.add(res.getString("a.envysionperformancefinalid"));
        datadate=res.getString("a.datadate");
        ldatadate.add(cdf.dbDatetoAppDate(datadate));
        ltaskcount.add(res.getString("a.takscount"));
        lperformanceTime.add(res.getFloat("a.timetoperform"));
     }
      enbean.setauditorsname(lauditorName);
      enbean.setRowno(lRowno);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlDatadate(ldatadate);
      enbean.settaskCount(ltaskcount);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((auditorName.equalsIgnoreCase("selectall"))&&(cafeName.equalsIgnoreCase("selectall"))&&(!taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("SELECT a.envysionperformancefinalid,b.envysiontaskname,c.envysioncafesname,a.`takscount`,a.datadate,a.`timetoperform`,a.`performeddate`,a.`auditorname` FROM `envysionperformancefinal` as a join envysiontasks as b join envysioncafes as c on a.`envysiontaskid`=b.`envysiontasksid` and a.`envysioncafesid`=c.`envysioncafesid` WHERE `datadate` like '"+datadate+"' and envysiontaskname like '"+taskName+"' ");
      while(res.next()){
        lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        startDatedb=res.getString("a.performeddate");
        lstartDateapp.add(cdf.dbDatetoAppDate(startDatedb));
        datadate=res.getString("a.datadate");
        lRowno.add(res.getString("a.envysionperformancefinalid"));
        ldatadate.add(cdf.dbDatetoAppDate(datadate));
        ltaskcount.add(res.getString("a.takscount"));
        lperformanceTime.add(res.getFloat("a.timetoperform"));
     }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.setRowno(lRowno);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlDatadate(ldatadate);
      enbean.settaskCount(ltaskcount);
      enbean.setperformancetime(lperformanceTime);
   }
    else if((auditorName.equalsIgnoreCase("selectall"))&&(!cafeName.equalsIgnoreCase("selectall"))&&(taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("SELECT a.envysionperformancefinalid,b.envysiontaskname,c.envysioncafesname,a.`takscount`,a.datadate,a.`timetoperform`,a.`performeddate`,a.`auditorname` FROM `envysionperformancefinal` as a join envysiontasks as b join envysioncafes as c on a.`envysiontaskid`= b.`envysiontasksid` and a.`envysioncafesid`=c.`envysioncafesid` WHERE `datadate` like '"+datadate+"' and envysioncafesname like '"+cafeName+"'");
      while(res.next()){
        lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        startDatedb=res.getString("a.performeddate");
        lstartDateapp.add(cdf.dbDatetoAppDate(startDatedb));
        datadate=res.getString("a.datadate");
        lRowno.add(res.getString("a.envysionperformancefinalid"));
        ldatadate.add(cdf.dbDatetoAppDate(datadate));
        ltaskcount.add(res.getString("a.takscount"));
        lperformanceTime.add(res.getFloat("a.timetoperform"));
     }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setRowno(lRowno);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlDatadate(ldatadate);
      enbean.settaskCount(ltaskcount);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((!auditorName.equalsIgnoreCase("selectall"))&&(cafeName.equalsIgnoreCase("selectall"))&&(taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("SELECT a.envysionperformancefinalid,b.envysiontaskname,c.envysioncafesname,a.`takscount`,a.datadate,a.`timetoperform`,a.`performeddate`,a.`auditorname` FROM `envysionperformancefinal` as a join envysiontasks as b join envysioncafes as c on a.`envysiontaskid`=b.`envysiontasksid` and a.`envysioncafesid`=c.`envysioncafesid` WHERE `datadate` like '"+datadate+"' and `auditorname` like '"+auditorName+"'");
      while(res.next()){
        lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        startDatedb=res.getString("a.performeddate");
        lRowno.add(res.getString("a.envysionperformancefinalid"));
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
      enbean.setRowno(lRowno);
      enbean.setlDatadate(ldatadate);
      enbean.settaskCount(ltaskcount);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((auditorName.equalsIgnoreCase("selectall"))&&(!cafeName.equalsIgnoreCase("selectall"))&&(!taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("SELECT a.envysionperformancefinalid,b.envysiontaskname,c.envysioncafesname,a.`takscount`,a.datadate,a.`timetoperform`,a.`performeddate`,a.`auditorname` FROM `envysionperformancefinal` as a join envysiontasks as b join envysioncafes as c on a.`envysiontaskid`=b.`envysiontasksid` and a.`envysioncafesid`=c.`envysioncafesid` WHERE `datadate` like '"+datadate+"' and `envysiontaskname` like '"+taskName+"' and envysioncafesname like '"+cafeName+"' ");
      while(res.next()){
        lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        startDatedb=res.getString("a.performeddate");
        lRowno.add(res.getString("a.envysionperformancefinalid"));
        lstartDateapp.add(cdf.dbDatetoAppDate(startDatedb));
        datadate=res.getString("a.datadate");
        ldatadate.add(cdf.dbDatetoAppDate(datadate));
        ltaskcount.add(res.getString("a.takscount"));
        lperformanceTime.add(res.getFloat("a.timetoperform"));
     }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.setRowno(lRowno);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlDatadate(ldatadate);
      enbean.settaskCount(ltaskcount);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((!auditorName.equalsIgnoreCase("selectall"))&&(cafeName.equalsIgnoreCase("selectall"))&&(!taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("SELECT a.envysionperformancefinalid,b.envysiontaskname,c.envysioncafesname,a.`takscount`,a.datadate,a.`timetoperform`,a.`performeddate`,a.`auditorname` FROM `envysionperformancefinal` as a join envysiontasks as b join envysioncafes as c on a.`envysiontaskid`=b.`envysiontasksid` and a.`envysioncafesid`=c.`envysioncafesid` WHERE `datadate` like '"+datadate+"' and `envysiontaskname` like '"+taskName+"' and `auditorname` like '"+auditorName+"' ");
      while(res.next()){
        lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        startDatedb=res.getString("a.performeddate");
        lstartDateapp.add(cdf.dbDatetoAppDate(startDatedb));
        lRowno.add(res.getString("a.envysionperformancefinalid"));
        datadate=res.getString("a.datadate");
        ldatadate.add(cdf.dbDatetoAppDate(datadate));
        ltaskcount.add(res.getString("a.takscount"));
        lperformanceTime.add(res.getFloat("a.timetoperform"));
     }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setRowno(lRowno);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlDatadate(ldatadate);
      enbean.settaskCount(ltaskcount);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((!auditorName.equalsIgnoreCase("selectall"))&&(!cafeName.equalsIgnoreCase("selectall"))&&(taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("SELECT a.envysionperformancefinalid,b.envysiontaskname,c.envysioncafesname,a.`takscount`,a.datadate,a.`timetoperform`,a.`performeddate`,a.`auditorname` FROM `envysionperformancefinal` as a join envysiontasks as b join envysioncafes as c on a.`envysiontaskid`=b.`envysiontasksid` and a.`envysioncafesid`=c.`envysioncafesid` WHERE `datadate` like '"+datadate+"' and envysioncafesname like '"+cafeName+"' and `auditorname` like '"+auditorName+"' ");
      while(res.next()){
        lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        startDatedb=res.getString("a.performeddate");
        lRowno.add(res.getString("a.envysionperformancefinalid"));
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
      enbean.setRowno(lRowno);
      enbean.setlDatadate(ldatadate);
      enbean.settaskCount(ltaskcount);
      enbean.setperformancetime(lperformanceTime);
    }
    else if((!auditorName.equalsIgnoreCase("selectall"))&&(!cafeName.equalsIgnoreCase("selectall"))&&(!taskName.equalsIgnoreCase("selectall"))){
      res=st.executeQuery("SELECT a.envysionperformancefinalid,b.envysiontaskname,c.envysioncafesname,a.`takscount`,a.datadate,a.`timetoperform`,a.`performeddate`,a.`auditorname` FROM `envysionperformancefinal` as a join envysiontasks as b join envysioncafes as c on a.`envysiontaskid`=b.`envysiontasksid` and a.`envysioncafesid`=c.`envysioncafesid` WHERE `datadate` like '"+datadate+"' and envysioncafesname like '"+cafeName+"' and `auditorname` like '"+auditorName+"' and `envysiontaskname` like '"+taskName+"' ");
      while(res.next()){
         lauditorName.add(res.getString("a.auditorname"));
        lcafeName.add(res.getString("c.envysioncafesname"));
        ltaskName.add(res.getString("b.envysiontaskname"));
        startDatedb=res.getString("a.performeddate");
        lstartDateapp.add(cdf.dbDatetoAppDate(startDatedb));
        datadate=res.getString("a.datadate");
        lRowno.add(res.getString("a.envysionperformancefinalid"));
        ldatadate.add(cdf.dbDatetoAppDate(datadate));
        ltaskcount.add(res.getString("a.takscount"));
        lperformanceTime.add(res.getFloat("a.timetoperform"));
     }
      enbean.setauditorsname(lauditorName);
      enbean.setcafesName(lcafeName);
      enbean.settasksName(ltaskName);
      enbean.setlStartdate(lstartDateapp);
      enbean.setlDatadate(ldatadate);
      enbean.setRowno(lRowno);
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
