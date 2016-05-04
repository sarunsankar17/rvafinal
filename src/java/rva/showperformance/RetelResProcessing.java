/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.showperformance;

import java.util.*;
import java.sql.*;
import rva.dbaccess.DBConnect;
import java.text.*;
import java.util.Date;

/**
 *
 * @author Arun-S
 */
public class RetelResProcessing {
    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    
    SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
    SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
    
    private String auditorName;
    private String performDate;
    private String eperformDate;
    private String taskName; 
    private Date date;
    private Date edate;
    private String appDate;
    private String appeDate;
    private int radVal;
    private ArrayList<String> launame=new ArrayList<String>();
    private ArrayList<Integer> laucount=new ArrayList<Integer>();
    private ArrayList<String> ltname=new ArrayList<String>();
    private ArrayList<String> lperformdate=new ArrayList<String>();
    private ArrayList<String> lenddate=new ArrayList<String>();
    Connection con=DBConnect.startConnection();
    RetelBean processRetelCount(RetelBean rbe)
    {
        try
        {
        Statement st=con.createStatement();
        ResultSet res=null;
        auditorName=rbe.getAuditorName();
        performDate=rbe.getPerformDate();
        eperformDate=rbe.getEPerformDate();
        taskName=rbe.getTaskName();
        date=sdf1.parse(performDate);
        edate=sdf1.parse(eperformDate);
        appDate=sdf.format(date);
        appeDate=sdf.format(edate);
           if(auditorName.equalsIgnoreCase("-selectall-")&&taskName.equalsIgnoreCase("-selectall-"))
           {
               taskName="All";
            res=st.executeQuery("SELECT auditorname,count(auditorname) FROM `retellog` where performdate between '"+performDate+"' and '"+eperformDate+"' group by auditorname");
            while(res.next())
            {
               ltname.add(taskName);
               laucount.add(res.getInt("COUNT(auditorname)"));
               launame.add(res.getString("auditorname"));
               lperformdate.add(appDate);
               lenddate.add(appeDate);
            }
            res=st.executeQuery("SELECT COUNT(140store) FROM retellog WHERE performdate between'"+performDate+"' and '"+eperformDate+"' AND 140store = '140 Store' ");
            {
              while(res.next())
              {
                radVal=res.getInt("COUNT(140store)");
              }
            }
           rbe.setlAuditCount(laucount);
           rbe.setlAuditorName(launame);
           rbe.setlPerformDate(lperformdate);
           rbe.setlEDate(lenddate);
           rbe.setlTaskName(ltname);
           rbe.setRadVal(radVal);
        }
        else if(!auditorName.equalsIgnoreCase("-selectall-")&&taskName.equalsIgnoreCase("-selectall-"))
        {
        res=st.executeQuery("SELECT a.taskname,count(b.tasknameid) FROM reteltaskname as a JOIN `retellog` as b on a.tasknameid=b.tasknameid where auditorname LIKE '"+auditorName+"' and performdate between '"+performDate+"' and '"+eperformDate+"' group by a.taskname");
        while(res.next())
        {  
          ltname.add(res.getString("a.taskname"));
          laucount.add(res.getInt("COUNT(b.tasknameid)"));
          launame.add(auditorName);
          lperformdate.add(appDate);
          lenddate.add(appeDate);
        }
        res=st.executeQuery("SELECT COUNT(140store) FROM retellog WHERE performdate between'"+performDate+"' and '"+eperformDate+"' and auditorname LIKE '"+auditorName+"' AND 140store = '140 Store'  ");
            {
              while(res.next())
              {
                radVal=res.getInt("COUNT(140store)");
              }
            }
            rbe.setlAuditCount(laucount);
           rbe.setlAuditorName(launame);
           rbe.setlPerformDate(lperformdate);
           rbe.setlEDate(lenddate);
           rbe.setlTaskName(ltname);
           rbe.setRadVal(radVal);
        }
             else if(auditorName.equalsIgnoreCase("-selectall-")&&(!taskName.equalsIgnoreCase("-selectall-")))
        {
        res=st.executeQuery("SELECT a.auditorname, COUNT(a.auditorname) FROM retellog as a JOIN reteltaskname as b on a.tasknameid=b.tasknameid WHERE b.taskname LIKE '"+taskName+"' AND performdate between '"+performDate+"' and '"+eperformDate+"' GROUP BY auditorname");
        while(res.next())
        {  
          launame.add(res.getString("a.auditorname"));
          laucount.add(res.getInt("COUNT(a.auditorname)"));
          ltname.add(taskName);
          lperformdate.add(appDate);
          lenddate.add(appeDate);
        }
        if(taskName.equalsIgnoreCase("Demography Through The Store")){
        res=st.executeQuery("SELECT COUNT(140store) FROM retellog WHERE performdate between'"+performDate+"' and '"+eperformDate+"' and tasknameid =1 AND 140store = '140 Store'  ");
            {
              while(res.next())
              {
                radVal=res.getInt("COUNT(140store)");
              }
            }
        }
           rbe.setlAuditCount(laucount);
           rbe.setlAuditorName(launame);
           rbe.setlPerformDate(lperformdate);
           rbe.setlEDate(lenddate);
           rbe.setlTaskName(ltname);
           rbe.setRadVal(radVal);
        }
                else if((!auditorName.equalsIgnoreCase("-selectall-"))&&(!taskName.equalsIgnoreCase("-selectall-")))
        {
        res=st.executeQuery("SELECT a.taskname,auditorname,COUNT(a.taskname) FROM reteltaskname as a JOIN retellog as b ON a.tasknameid=b.tasknameid WHERE a.taskname LIKE '"+taskName+"' AND performdate between '"+performDate+"' and '"+eperformDate+"' AND auditorname LIKE '"+auditorName+"' group by auditorname ");
        while(res.next())
        {  
          launame.add(res.getString("auditorname"));
          laucount.add(res.getInt("COUNT(a.taskname)"));
          ltname.add(res.getString("a.taskname"));
          lperformdate.add(appDate);
          lenddate.add(appeDate);
        }
        if(taskName.equalsIgnoreCase("Demography Through The Store")){
        res=st.executeQuery("SELECT COUNT(140store) FROM retellog WHERE performdate between'"+performDate+"' and '"+eperformDate+"' and auditorname LIKE '"+auditorName+"' and tasknameid =1 AND 140store = '140 Store' ");
            {
              while(res.next())
              {
                radVal=res.getInt("COUNT(140store)");
              }
            }
        }
        
           rbe.setlAuditCount(laucount);
           rbe.setlAuditorName(launame);
           rbe.setlPerformDate(lperformdate);
           rbe.setlEDate(lenddate);
           rbe.setlTaskName(ltname);
           rbe.setRadVal(radVal);
        }
           
        }
        catch(Exception e)
        {
           e.printStackTrace(); 
        }
        return rbe;
    }
}
