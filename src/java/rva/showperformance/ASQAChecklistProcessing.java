/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.showperformance;

import java.util.ArrayList;
import java.sql.*;
import rva.dbaccess.DBConnect;
import java.util.Date;
import java.text.*;
/**
 *
 * @author RCT-456
 */
public class ASQAChecklistProcessing {
  private String auditorName;
    private String clientName;
    private String startDate;
    private String endDate;
    private float asqaperformanceTime;
    private ArrayList<String> lauditorName=new ArrayList<String>();
    private ArrayList<String> lqaauditorsName=new ArrayList<String>();
    private ArrayList<String> lclientName=new ArrayList<String>();
    private ArrayList<Float> lasqaResults=new ArrayList<Float>();
    ASQAChecklistBean asqaclb=new ASQAChecklistBean();
    ASQAAuditors asqaauditors=new ASQAAuditors();
    Connection con=DBConnect.startConnection();
    private Date sdbDate;
    private Date edbDate;
   // private String dbsDate;
    //private String dbeDate;
    SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
    SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
    public ASQAChecklistBean processASQAChecklist(ASQAChecklistBean asqacl)
    {
      try
      {
        auditorName=asqacl.getQAAuditorname();
        clientName=asqacl.getQAClientname();
        startDate=asqacl.getstartDate();
        endDate=asqacl.getendDate();
        Statement st=con.createStatement();
        sdbDate=sdf.parse(startDate);
        startDate=sdf1.format(sdbDate);
        edbDate=sdf.parse(endDate);
        endDate=sdf1.format(edbDate);
        if(auditorName.equalsIgnoreCase("-selectall-")&&clientName.equalsIgnoreCase("-selectall-"))
        {
          asqaclb=asqaauditors.getQAAuditors();
          lqaauditorsName=asqaclb.getlauditorName();
         
            ResultSet res=st.executeQuery("SELECT SUM(`qaperformancetime`), qaauditorname FROM `asqafinal` WHERE qaperformeddate BETWEEN  '"+startDate+"' AND  '"+endDate+"' Group by qaauditorname ");
            while(res.next())
            {
              asqaperformanceTime=res.getFloat("SUM(`qaperformancetime`)")/3600;
                lasqaResults.add(asqaperformanceTime);
                lauditorName.add(res.getString("qaauditorname"));
            lclientName.add("AS");
            }
          asqacl.setlAsQAResults(lasqaResults);
          asqacl.setlAuditorName(lauditorName);
          asqacl.setlclientName(lclientName);
        }
        else if(!auditorName.equalsIgnoreCase("-selectall-")&&clientName.equalsIgnoreCase("-selectall-"))
        {
          asqaclb=asqaauditors.getQAAuditors();
          lqaauditorsName=asqaclb.getlauditorName();
          
            //auditorName=lqaauditorsName.get(i);
            ResultSet res=st.executeQuery("SELECT SUM(a.qaperformancetime),b.asqaclientsname FROM `asqafinal` as a JOIN asqaclients as b ON a.asqaclientsid=b.asqaclientsid WHERE qaperformeddate BETWEEN  '"+startDate+"' AND  '"+endDate+"' and qaauditorname like '"+auditorName+"' group by a.asqaclientsid");
            while(res.next())
            {
              asqaperformanceTime=res.getFloat("SUM(a.qaperformancetime)")/3600;
              lasqaResults.add(asqaperformanceTime);
              lclientName.add(res.getString("b.asqaclientsname"));
              lauditorName.add(auditorName);
            }
          asqacl.setlAsQAResults(lasqaResults);
          asqacl.setlAuditorName(lauditorName);
          asqacl.setlclientName(lclientName);
          }
        else if(auditorName.equalsIgnoreCase("-selectall-")&&!clientName.equalsIgnoreCase("-selectall-"))
        {
          asqaclb=asqaauditors.getQAAuditors();
          lqaauditorsName=asqaclb.getlauditorName();
           
            
            ResultSet res=st.executeQuery("SELECT SUM(a.qaperformancetime),b.asqaclientsname,qaauditorname FROM `asqafinal` as a JOIN asqaclients as b ON a.asqaclientsid=b.asqaclientsid WHERE b.asqaclientsname LIKE '"+clientName+"' and qaperformeddate BETWEEN  '"+startDate+"' AND  '"+endDate+"' group by qaauditorname ");
            while(res.next())
            {
              asqaperformanceTime=res.getFloat("SUM(a.qaperformancetime)")/3600;
              lasqaResults.add(asqaperformanceTime);
              lclientName.add(clientName);
              lauditorName.add(res.getString("qaauditorname"));
            }
          
         asqacl.setlAsQAResults(lasqaResults);
          asqacl.setlAuditorName(lauditorName);
          asqacl.setlclientName(lclientName);
        }
         else if(!auditorName.equalsIgnoreCase("-selectall-")&&!clientName.equalsIgnoreCase("-selectall-"))
        {
          asqaclb=asqaauditors.getQAAuditors();
          lqaauditorsName=asqaclb.getlauditorName();
           
            ResultSet res=st.executeQuery("SELECT SUM(a.qaperformancetime),b.asqaclientsname,qaauditorname FROM `asqafinal` as a JOIN asqaclients as b ON a.asqaclientsid=b.asqaclientsid WHERE b.asqaclientsname LIKE '"+clientName+"' and qaperformeddate BETWEEN  '"+startDate+"' AND  '"+endDate+"' and qaauditorname like '"+auditorName+"' ");
            while(res.next())
            {
              asqaperformanceTime=res.getFloat("SUM(a.qaperformancetime)")/3600;
              lasqaResults.add(asqaperformanceTime);
              lclientName.add(res.getString("b.asqaclientsname"));
              lclientName.remove(null);
              lauditorName.add(res.getString("qaauditorname"));
              lauditorName.remove(null);
            }
          
         asqacl.setlAsQAResults(lasqaResults);
          asqacl.setlAuditorName(lauditorName);
          asqacl.setlclientName(lclientName);
        }
      }
      catch(Exception e){
        System.out.println(e);
      }
      return asqacl;
    }
}
