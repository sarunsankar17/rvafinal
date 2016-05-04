/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.showperformance;

import java.sql.*;
import java.util.*;
import java.util.Date;
import java.text.*;
import rva.dbaccess.DBConnect;
import rva.showperformance.ASChecklistBean;

public class ASChecklistProcessing {
    
  private String auditorName;
  private String clientName;
  private String shiftTime;
  private String locationName;
  private String startDate;
  private String endDate;
  private String fsstartDate;
  private String fsendDate;
  private String dst;
  private String fsteTime;
  private String fessTime;
  private String setsTime;
  private String fsstarttimeday1;
  private String fsendtimeday1;
  private String fsstarttimeday2;
  private String fsendtimeday2;
  
  
  //ChecklistBean clb=new ChecklistBean();
  Date sDate;
  Date eDate;
  String appsDate;
  String appeDate;
  SimpleDateFormat appDate=new SimpleDateFormat("MM/dd/yyyy");
  SimpleDateFormat dbDate=new SimpleDateFormat("yyyy-MM-dd");
  ArrayList<String> lauditorName=new ArrayList<String>();
  ArrayList<String> lclientName=new ArrayList<String>();
  ArrayList<String> llocationName=new ArrayList<String>();
  ArrayList<String> lstartDate=new ArrayList<String>();
  ArrayList<String> lendDate=new ArrayList<String>();
  ArrayList<Float> ltimetoPerform=new ArrayList<Float>();
  ArrayList<String> lshiftTime=new ArrayList<String>();
  Map<String, Float> firstshift1=new LinkedHashMap<String, Float>();
  Map<String, Float> firstshift2=new LinkedHashMap<String, Float>();
  String client=null;
  String auditor=null;
  float perftimeday1=0;
  float perftimeday2=0;
  float perftime=0;
  String location=null;
  String fsincstartdate;
  String fsincenddate;
  String flagvar=null;
  
  Connection con=DBConnect.startConnection();
  ASChecklistBean processValues(ASChecklistBean cb)
  {
    try
    {
      dst=cb.getDst();
      /*if(dst.equals("Spring")){
        fsteTime="20:00:00";
        fessTime="03:30:00";
        setsTime="11:30:00";
        fsstarttimeday1="20:00:00";
        fsendtimeday1="24:00:00";
        fsstarttimeday2="00:00:00";
        fsendtimeday2="03:30:00";
      }
      else if(dst.equals("Winter")){*/
        fsteTime="21:00:00";
        fessTime="04:30:00";
        setsTime="12:30:00";
        fsstarttimeday1="21:00:00";
        fsendtimeday1="24:00:00";
        fsstarttimeday2="00:00:00";
        fsendtimeday2="04:30:00";
     // }
    auditorName=cb.getauditorName();
    clientName=cb.getcleintName();
    startDate=cb.getstartDate();
    endDate=cb.getendDate();
    shiftTime=cb.getshiftTime();
    locationName=cb.getlocationName();
    Statement st=con.createStatement();
    sDate=dbDate.parse(startDate);
    appsDate=appDate.format(sDate);
    eDate=dbDate.parse(endDate);
    appeDate=appDate.format(eDate);
    if((auditorName.equals("-selectall-"))&&(clientName.equals("-selectall-"))&&(shiftTime.equals("-selectall-")))
    {
      clientName="Arrowsight";
      locationName="AS";
      shiftTime="All Shift";
      ResultSet res=st.executeQuery("SELECT a.auditorsname, sum(b.timetoperform) FROM auditors AS a JOIN asauditsreportfinal AS b ON a.auditorsid=b.auditorsid WHERE `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' GROUP BY a.auditorsname");
      while(res.next())
      {
        lauditorName.add(res.getString("a.auditorsname"));
        ltimetoPerform.add(res.getFloat("sum(b.timetoperform)")/3600);
        lclientName.add(clientName);
        llocationName.add(locationName);
        lstartDate.add(appsDate);
        lendDate.add(appeDate);
        lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
    else if((auditorName.equals("-selectall-"))&&(clientName.equals("-selectall-"))&&(!shiftTime.equals("-selectall-")))
    {
        if(shiftTime.equals("First"))
        {
      clientName="Arrowsight";
      locationName="AS";
      shiftTime="First";
      fsincstartdate=DateIncrement.increaseDate(startDate);
      fsincenddate=DateIncrement.increaseDate(endDate);
      ResultSet res=st.executeQuery("SELECT a.auditorsname, sum(b.timetoperform) FROM auditors AS a JOIN asauditsreportfinal AS b ON a.auditorsid=b.auditorsid WHERE `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' AND `performtime` BETWEEN '"+fsstarttimeday1+"' and '"+fsendtimeday1+"' GROUP BY a.auditorsname");
      while(res.next())
      {
        flagvar=res.getString("a.auditorsname");
        perftimeday1=res.getFloat("sum(b.timetoperform)")/3600;
        firstshift1.put(flagvar, perftimeday1);
      }
      ResultSet res1=st.executeQuery("SELECT a.auditorsname, sum(b.timetoperform) FROM auditors AS a JOIN asauditsreportfinal AS b ON a.auditorsid=b.auditorsid WHERE `performdate` BETWEEN '"+fsincstartdate+"' AND '"+fsincenddate+"' AND `performtime` BETWEEN '"+fsstarttimeday2+"' and '"+fsendtimeday2+"' GROUP BY a.auditorsname");
      while(res1.next())
      {
        flagvar=res1.getString("a.auditorsname");
        perftimeday2=res1.getFloat("sum(b.timetoperform)")/3600;
        firstshift2.put(flagvar, perftimeday2);
      }
      for(Map.Entry<String, Float> result:firstshift1.entrySet()){
        flagvar=result.getKey();
        if(firstshift2.containsKey(flagvar)){
          perftimeday1=firstshift1.get(flagvar);
          perftimeday2=firstshift2.get(flagvar);
          perftime=perftimeday1+perftimeday2;
          
          
          lauditorName.add(flagvar);
          ltimetoPerform.add(perftime);
          lclientName.add(clientName);
          llocationName.add(locationName);
          lstartDate.add(appsDate);
          lendDate.add(appeDate);
          lshiftTime.add(shiftTime);
         
          firstshift2.remove(flagvar);
        }
        else{
          perftime=firstshift1.get(flagvar);
          
          lauditorName.add(flagvar);
          ltimetoPerform.add(perftime);
          lclientName.add(clientName);
          llocationName.add(locationName);
          lstartDate.add(appsDate);
          lendDate.add(appeDate);
          lshiftTime.add(shiftTime);
        }
      }
      for(Map.Entry<String, Float> result1:firstshift2.entrySet()){
        flagvar=result1.getKey();
          perftime=firstshift2.get(flagvar);
          
          lauditorName.add(flagvar);
          ltimetoPerform.add(perftime);
          lclientName.add(clientName);
          llocationName.add(locationName);
          lstartDate.add(appsDate);
          lendDate.add(appeDate);
          lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
        else if(shiftTime.equals("Second"))
        {
      clientName="Arrowsight";
      locationName="AS";
      shiftTime="Second";
      ResultSet res=st.executeQuery("SELECT a.auditorsname, sum(b.timetoperform) FROM auditors AS a JOIN asauditsreportfinal AS b ON a.auditorsid=b.auditorsid WHERE `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' AND `performtime` BETWEEN '"+fessTime+"' AND '"+setsTime+"' GROUP BY a.auditorsname");
      while(res.next())
      {
        lauditorName.add(res.getString("a.auditorsname"));
        ltimetoPerform.add(res.getFloat("sum(b.timetoperform)")/3600);
        lclientName.add(clientName);
        llocationName.add(locationName);
        lstartDate.add(appsDate);
        lendDate.add(appeDate);
        lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
        else if(shiftTime.equals("Third"))
        {
      clientName="Arrowsight";
      locationName="AS";
      shiftTime="Third";
      ResultSet res=st.executeQuery("SELECT a.auditorsname, sum(b.timetoperform) FROM auditors AS a JOIN asauditsreportfinal AS b ON a.auditorsid=b.auditorsid WHERE `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' AND `performtime` BETWEEN '"+setsTime+"' AND '"+fsteTime+"' GROUP BY a.auditorsname");
      while(res.next())
      {
        lauditorName.add(res.getString("a.auditorsname"));
        ltimetoPerform.add(res.getFloat("sum(b.timetoperform)")/3600);
        lclientName.add(clientName);
        llocationName.add(locationName);
        lstartDate.add(appsDate);
        lendDate.add(appeDate);
        lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
    }
    else if((!auditorName.equals("-selectall-"))&&(clientName.equals("-selectall-"))&&(shiftTime.equals("-selectall-")))
    {
      clientName="Arrowsight";
      locationName="AS";
      shiftTime="All Shift";
      ResultSet res=st.executeQuery("SELECT a.auditorsname, sum(b.timetoperform),c.clientsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c ON a.auditorsid=b.auditorsid and b.clientsid=c.clientsid WHERE a.auditorsname ='"+auditorName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' GROUP BY c.clientsname");
      while(res.next())
      {
        lauditorName.add(res.getString("a.auditorsname"));
        ltimetoPerform.add(res.getFloat("sum(b.timetoperform)")/3600);
        lclientName.add(res.getString("c.clientsname"));
        llocationName.add(locationName);
        lstartDate.add(appsDate);
        lendDate.add(appeDate);
        lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
    else if((!auditorName.equals("-selectall-"))&&(clientName.equals("-selectall-"))&&(!shiftTime.equals("-selectall-")))
    {
        if(shiftTime.equals("First"))
        {
      clientName="Arrowsight";
      locationName="AS";
      shiftTime="First";
      fsincstartdate=DateIncrement.increaseDate(startDate);
      fsincenddate=DateIncrement.increaseDate(endDate);
      ResultSet res=st.executeQuery("SELECT a.auditorsname, sum(b.timetoperform),c.clientsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c ON a.auditorsid=b.auditorsid and b.clientsid=c.clientsid WHERE a.auditorsname ='"+auditorName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' and `performtime` BETWEEN '"+fsstarttimeday1+"' and '"+fsendtimeday1+"' GROUP BY c.clientsname");
      while(res.next())
      {
        flagvar=res.getString("c.clientsname");
        perftimeday1=res.getFloat("sum(b.timetoperform)")/3600;
        firstshift1.put(flagvar, perftimeday1);
      }
      ResultSet res1=st.executeQuery("SELECT a.auditorsname, sum(b.timetoperform),c.clientsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c ON a.auditorsid=b.auditorsid and b.clientsid=c.clientsid WHERE a.auditorsname ='"+auditorName+"' and `performdate` BETWEEN '"+fsincstartdate+"' AND '"+fsincenddate+"' and `performtime` BETWEEN '"+fsstarttimeday2+"' and '"+fsendtimeday2+"' GROUP BY c.clientsname");
      while(res1.next())
      {
        flagvar=res1.getString("c.clientsname");
        perftimeday2=res1.getFloat("sum(b.timetoperform)")/3600;
        firstshift2.put(flagvar, perftimeday2);
      }
      for(Map.Entry<String, Float> result:firstshift1.entrySet()){
        flagvar=result.getKey();
        if(firstshift2.containsKey(flagvar)){
          
          perftimeday1=firstshift1.get(flagvar);
          perftimeday2=firstshift2.get(flagvar);
          perftime=perftimeday1+perftimeday2;
          
          lauditorName.add(auditorName);
          ltimetoPerform.add(perftime);
          lclientName.add(flagvar);
          llocationName.add(locationName);
          lstartDate.add(appsDate);
          lendDate.add(appeDate);
          lshiftTime.add(shiftTime);
          //firstshift1.remove(flagvar);
          firstshift2.remove(flagvar);
        }
        else{
          perftime=firstshift1.get(flagvar);
          lauditorName.add(auditorName);
          ltimetoPerform.add(perftime);
          lclientName.add(flagvar);
          llocationName.add(locationName);
          lstartDate.add(appsDate);
          lendDate.add(appeDate);
          lshiftTime.add(shiftTime);
        }
      }
      for(Map.Entry<String, Float> result1:firstshift2.entrySet()){
        flagvar=result1.getKey();
          perftime=firstshift2.get(flagvar);
          lauditorName.add(auditorName);
          ltimetoPerform.add(perftime);
          lclientName.add(flagvar);
          llocationName.add(locationName);
          lstartDate.add(appsDate);
          lendDate.add(appeDate);
          lshiftTime.add(shiftTime);
      }
      
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
        else if(shiftTime.equals("Second"))
        {
      clientName="Arrowsight";
      locationName="AS";
      shiftTime="Second";
      ResultSet res=st.executeQuery("SELECT a.auditorsname, sum(b.timetoperform),c.clientsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c ON a.auditorsid=b.auditorsid and b.clientsid=c.clientsid WHERE a.auditorsname ='"+auditorName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' and performtime between '"+fessTime+"' and '"+setsTime+"' GROUP BY c.clientsname");
      while(res.next())
      {
        lauditorName.add(res.getString("a.auditorsname"));
        ltimetoPerform.add(res.getFloat("sum(b.timetoperform)")/3600);
        lclientName.add(res.getString("c.clientsname"));
        llocationName.add(locationName);
        lstartDate.add(appsDate);
        lendDate.add(appeDate);
        lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
        else if(shiftTime.equals("Third"))
        {
      clientName="Arrowsight";
      locationName="AS";
      shiftTime="Third";
      ResultSet res=st.executeQuery("SELECT a.auditorsname, sum(b.timetoperform),c.clientsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c ON a.auditorsid=b.auditorsid and b.clientsid=c.clientsid WHERE a.auditorsname ='"+auditorName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' and performtime between '"+setsTime+"' and '"+fsteTime+"' GROUP BY c.clientsname");
      while(res.next())
      {
        lauditorName.add(res.getString("a.auditorsname"));
        ltimetoPerform.add(res.getFloat("sum(b.timetoperform)")/3600);
        lclientName.add(res.getString("c.clientsname"));
        llocationName.add(locationName);
        lstartDate.add(appsDate);
        lendDate.add(appeDate);
        lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
    }
    else if((auditorName.equals("-selectall-"))&&(!clientName.equals("-selectall-"))&&(locationName.equals("-selectall-"))&&(shiftTime.equals("-selectall-")))
    {
      //clientName="allclinets";
      locationName="AS";
      shiftTime="All Shift";
      ResultSet res=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform) FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid WHERE c.clientsname LIKE '"+clientName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' GROUP BY a.auditorsname");
      while(res.next())
      {
        lauditorName.add(res.getString("a.auditorsname"));
        ltimetoPerform.add(res.getFloat("sum(b.timetoperform)")/3600);
        lclientName.add(res.getString("c.clientsname"));
        llocationName.add(locationName);
        lstartDate.add(appsDate);
        lendDate.add(appeDate);
        lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
    else if((!auditorName.equals("-selectall-"))&&(!clientName.equals("-selectall-"))&&(locationName.equals("-selectall-"))&&(shiftTime.equals("-selectall-")))
    {
      //clientName="allclinets";
      locationName="AS";
      shiftTime="All Shift";
      ResultSet res=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform),d.locationsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c JOIN aslocations as d ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid and b.locationsid=d.locationsid WHERE a.auditorsname LIKE '"+auditorName+"' and c.clientsname LIKE '"+clientName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' GROUP BY d.locationsname");
      while(res.next())
      {
        lauditorName.add(res.getString("a.auditorsname"));
        ltimetoPerform.add(res.getFloat("sum(b.timetoperform)")/3600);
        lclientName.add(res.getString("c.clientsname"));
        llocationName.add(res.getString("d.locationsname"));
        lstartDate.add(appsDate);
        lendDate.add(appeDate);
        lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
    else if((!auditorName.equals("-selectall-"))&&(!clientName.equals("-selectall-"))&&(locationName.equals("-selectall-"))&&(!shiftTime.equals("-selectall-")))
    {
       if(shiftTime.equals("First"))
       {
      //clientName="allclinets";
      //locationName="AS";
      shiftTime="First";
      fsincstartdate=DateIncrement.increaseDate(startDate);
      fsincenddate=DateIncrement.increaseDate(endDate);
      ResultSet res=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform),d.locationsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c JOIN aslocations as d ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid and b.locationsid=d.locationsid WHERE a.auditorsname LIKE '"+auditorName+"' and c.clientsname LIKE '"+clientName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' and `performtime` BETWEEN '"+fsstarttimeday1+"' AND '"+fsendtimeday1+"' GROUP BY d.locationsname");
      while(res.next())
      {
        flagvar=res.getString("d.locationsname");
        perftimeday1=res.getFloat("sum(b.timetoperform)")/3600;
        firstshift1.put(flagvar, perftimeday1);
      }
      ResultSet res1=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform),d.locationsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c JOIN aslocations as d ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid and b.locationsid=d.locationsid WHERE a.auditorsname LIKE '"+auditorName+"' and c.clientsname LIKE '"+clientName+"' and `performdate` BETWEEN '"+fsincstartdate+"' AND '"+fsincenddate+"' and `performtime` BETWEEN '"+fsstarttimeday2+"' AND '"+fsendtimeday2+"' GROUP BY d.locationsname");
      while(res1.next())
      {
        flagvar=res1.getString("d.locationsname");
        perftimeday2=res1.getFloat("sum(b.timetoperform)")/3600;
        firstshift2.put(flagvar, perftimeday2);
      }
      for(Map.Entry<String, Float> result:firstshift1.entrySet()){
        flagvar=result.getKey();
        if(firstshift2.containsKey(flagvar)){
          perftimeday1=firstshift1.get(flagvar);
          perftimeday2=firstshift2.get(flagvar);
          perftime=perftimeday1+perftimeday2;
          lauditorName.add(auditorName);
          ltimetoPerform.add(perftime);
          lclientName.add(clientName);
          llocationName.add(flagvar);
          lstartDate.add(appsDate);
          lendDate.add(appeDate);
          lshiftTime.add(shiftTime);
         // firstshift1.remove(flagvar);
          firstshift2.remove(flagvar);
        }
        else{
          perftime=firstshift1.get(flagvar);
          lauditorName.add(auditorName);
          ltimetoPerform.add(perftime);
          lclientName.add(clientName);
          llocationName.add(flagvar);
          lstartDate.add(appsDate);
          lendDate.add(appeDate);
          lshiftTime.add(shiftTime);
        }
      }
      for(Map.Entry<String, Float> result1:firstshift2.entrySet()){
        flagvar=result1.getKey();
          perftime=firstshift2.get(flagvar);
          lauditorName.add(auditorName);
          ltimetoPerform.add(perftime);
          lclientName.add(clientName);
          llocationName.add(flagvar);
          lstartDate.add(appsDate);
          lendDate.add(appeDate);
          lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
       else if(shiftTime.equals("Second"))
       {
      //clientName="allclinets";
      locationName="AS";
      shiftTime="Second";
      ResultSet res=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform),d.locationsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c JOIN aslocations as d ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid and b.locationsid=d.locationsid WHERE a.auditorsname LIKE '"+auditorName+"' and c.clientsname LIKE '"+clientName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' and performtime between '"+fessTime+"' and '"+setsTime+"' GROUP BY d.locationsname");
      while(res.next())
      {
        lauditorName.add(res.getString("a.auditorsname"));
        ltimetoPerform.add(res.getFloat("sum(b.timetoperform)")/3600);
        lclientName.add(res.getString("c.clientsname"));
        llocationName.add(res.getString("d.locationsname"));
        lstartDate.add(appsDate);
        lendDate.add(appeDate);
        lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
        else if(shiftTime.equals("Third"))
       {
      //clientName="allclinets";
      locationName="AS";
      shiftTime="Third";
      ResultSet res=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform),d.locationsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c JOIN aslocations as d ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid and b.locationsid=d.locationsid WHERE a.auditorsname LIKE '"+auditorName+"' and c.clientsname LIKE '"+clientName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' and performtime between '"+setsTime+"' and '"+fsteTime+"' GROUP BY d.locationsname");
      while(res.next())
      {
        lauditorName.add(res.getString("a.auditorsname"));
        ltimetoPerform.add(res.getFloat("sum(b.timetoperform)")/3600);
        lclientName.add(res.getString("c.clientsname"));
        llocationName.add(res.getString("d.locationsname"));
        lstartDate.add(appsDate);
        lendDate.add(appeDate);
        lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
   }
    else if((auditorName.equals("-selectall-"))&&(!clientName.equals("-selectall-"))&&(locationName.equals("-selectall-"))&&(!shiftTime.equals("-selectall-")))
    {
       if(shiftTime.equals("First"))
       {
      //clientName="allclinets";
      locationName="AS";
      shiftTime="First";
      fsincstartdate=DateIncrement.increaseDate(startDate);
      fsincenddate=DateIncrement.increaseDate(endDate);
      ResultSet res=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform) FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid WHERE c.clientsname LIKE '"+clientName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' and `performtime` BETWEEN '"+fsstarttimeday1+"' AND '"+fsendtimeday1+"' GROUP BY a.auditorsname");
      while(res.next())
      {
        flagvar=res.getString("a.auditorsname");
        perftimeday1=res.getFloat("sum(b.timetoperform)")/3600;
        firstshift1.put(flagvar, perftimeday1);
      }
      ResultSet res1=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform) FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid WHERE c.clientsname LIKE '"+clientName+"' and `performdate` BETWEEN '"+fsincstartdate+"' AND '"+fsincenddate+"' and `performtime` BETWEEN '"+fsstarttimeday2+"' AND '"+fsendtimeday2+"' GROUP BY a.auditorsname");
      while(res1.next())
      {
        flagvar=res1.getString("a.auditorsname");
        perftimeday2=res1.getFloat("sum(b.timetoperform)")/3600;
        firstshift2.put(flagvar, perftimeday2);
      }
      for(Map.Entry<String, Float> result:firstshift1.entrySet()){
        flagvar=result.getKey();
        if(firstshift2.containsKey(flagvar)){
          perftimeday1=firstshift1.get(flagvar);
          perftimeday2=firstshift2.get(flagvar);
          perftime=perftimeday1+perftimeday2;
          lauditorName.add(flagvar);
          ltimetoPerform.add(perftime);
          lclientName.add(clientName);
          llocationName.add(locationName);
          lstartDate.add(appsDate);
          lendDate.add(appeDate);
          lshiftTime.add(shiftTime);
         // firstshift1.remove(flagvar);
          firstshift2.remove(flagvar);
        }
        else{
          perftime=firstshift1.get(flagvar);
          lauditorName.add(flagvar);
          ltimetoPerform.add(perftime);
          lclientName.add(clientName);
          llocationName.add(locationName);
          lstartDate.add(appsDate);
          lendDate.add(appeDate);
          lshiftTime.add(shiftTime);
        }
      }
      for(Map.Entry<String, Float> result1:firstshift2.entrySet()){
        flagvar=result1.getKey();
          perftime=firstshift2.get(flagvar);
          lauditorName.add(flagvar);
          ltimetoPerform.add(perftime);
          lclientName.add(clientName);
          llocationName.add(locationName);
          lstartDate.add(appsDate);
          lendDate.add(appeDate);
          lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
       else if(shiftTime.equals("Second"))
       {
      //clientName="allclinets";
      locationName="AS";
      shiftTime="Second";
      ResultSet res=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform) FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid WHERE c.clientsname LIKE '"+clientName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' and performtime between '"+fessTime+"' and '"+setsTime+"' GROUP BY a.auditorsname");
      while(res.next())
      {
        lauditorName.add(res.getString("a.auditorsname"));
        ltimetoPerform.add(res.getFloat("sum(b.timetoperform)")/3600);
        lclientName.add(res.getString("c.clientsname"));
        llocationName.add(locationName);
        lstartDate.add(appsDate);
        lendDate.add(appeDate);
        lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
        else if(shiftTime.equals("Third"))
       {
      //clientName="allclinets";
      locationName="AS";
      shiftTime="Third";
      ResultSet res=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform) FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid WHERE c.clientsname LIKE '"+clientName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' and performtime between '"+setsTime+"' and '"+fsteTime+"' GROUP BY a.auditorsname");
      while(res.next())
      {
        lauditorName.add(res.getString("a.auditorsname"));
        ltimetoPerform.add(res.getFloat("sum(b.timetoperform)")/3600);
        lclientName.add(res.getString("c.clientsname"));
        llocationName.add(locationName);
        lstartDate.add(appsDate);
        lendDate.add(appeDate);
        lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
   }
    else if((auditorName.equals("-selectall-"))&&(!clientName.equals("-selectall-"))&&(!locationName.equals("-selectall-"))&&(shiftTime.equals("-selectall-")))
    {
      //clientName="allclinets";
      //locationName="allocation";
      shiftTime="All Shift";
      ResultSet res=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform),d.locationsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c JOIN aslocations as d ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid and b.locationsid=d.locationsid WHERE c.clientsname LIKE '"+clientName+"' and d.locationsname LIKE '"+locationName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' GROUP BY a.auditorsname");
      while(res.next())
      {
        lauditorName.add(res.getString("a.auditorsname"));
        ltimetoPerform.add(res.getFloat("sum(b.timetoperform)")/3600);
        lclientName.add(res.getString("c.clientsname"));
        llocationName.add(res.getString("d.locationsname"));
        lstartDate.add(appsDate);
        lendDate.add(appeDate);
        lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
    else if((!auditorName.equals("-selectall-"))&&(!clientName.equals("-selectall-"))&&(!locationName.equals("-selectall-"))&&(shiftTime.equals("-selectall-")))
    {
      //clientName="allclinets";
      //locationName="allocation";
      shiftTime="All Shift";
      ResultSet res=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform),d.locationsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c JOIN aslocations as d ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid and b.locationsid=d.locationsid WHERE a.auditorsname LIKE '"+auditorName+"' and c.clientsname LIKE '"+clientName+"' and d.locationsname LIKE '"+locationName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' GROUP BY a.auditorsname");
      while(res.next())
      {
        lauditorName.add(res.getString("a.auditorsname"));
        ltimetoPerform.add(res.getFloat("sum(b.timetoperform)")/3600);
        lclientName.add(res.getString("c.clientsname"));
        llocationName.add(res.getString("d.locationsname"));
        lstartDate.add(appsDate);
        lendDate.add(appeDate);
        lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
    else if((auditorName.equals("-selectall-"))&&(!clientName.equals("-selectall-"))&&(!locationName.equals("-selectall-"))&&(!shiftTime.equals("-selectall-")))
    {
        if(shiftTime.equals("First"))
        {
      fsincstartdate=DateIncrement.increaseDate(startDate);
      fsincenddate=DateIncrement.increaseDate(endDate);
      //clientName="allclinets";
      //locationName="allocation";
      shiftTime="First";
      ResultSet res=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform),d.locationsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c JOIN aslocations as d ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid and b.locationsid=d.locationsid WHERE c.clientsname LIKE '"+clientName+"' and d.locationsname LIKE '"+locationName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' and `performtime` BETWEEN '"+fsstarttimeday1+"' AND '"+fsendtimeday1+"' GROUP BY a.auditorsname");
      while(res.next())
      {
         flagvar=res.getString("a.auditorsname");
        perftimeday1=res.getFloat("sum(b.timetoperform)")/3600;
        firstshift1.put(flagvar, perftimeday1);
      }
      ResultSet res1=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform),d.locationsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c JOIN aslocations as d ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid and b.locationsid=d.locationsid WHERE c.clientsname LIKE '"+clientName+"' and d.locationsname LIKE '"+locationName+"' and `performdate` BETWEEN '"+fsincstartdate+"' AND '"+fsincenddate+"' and `performtime` BETWEEN '"+fsstarttimeday2+"' AND '"+fsendtimeday2+"' GROUP BY a.auditorsname");
      while(res1.next())
      {
        flagvar=res1.getString("a.auditorsname");
        perftimeday2=res1.getFloat("sum(b.timetoperform)")/3600;
        firstshift2.put(flagvar, perftimeday2);
      }
      for(Map.Entry<String, Float> result:firstshift1.entrySet()){
        flagvar=result.getKey();
        if(firstshift2.containsKey(flagvar)){
          perftimeday1=firstshift1.get(flagvar);
          perftimeday2=firstshift2.get(flagvar);
          perftime=perftimeday1+perftimeday2;
          lauditorName.add(flagvar);
          ltimetoPerform.add(perftime);
          lclientName.add(clientName);
          llocationName.add(locationName);
          lstartDate.add(appsDate);
          lendDate.add(appeDate);
          lshiftTime.add(shiftTime);
          //firstshift1.remove(flagvar);
          firstshift2.remove(flagvar);
        }
        else{
          perftime=firstshift1.get(flagvar);
          lauditorName.add(flagvar);
          ltimetoPerform.add(perftime);
          lclientName.add(clientName);
          llocationName.add(locationName);
          lstartDate.add(appsDate);
          lendDate.add(appeDate);
          lshiftTime.add(shiftTime);
        }
      }
      for(Map.Entry<String, Float> result1:firstshift2.entrySet()){
        flagvar=result1.getKey();
          perftime=firstshift2.get(flagvar);
          lauditorName.add(flagvar);
          ltimetoPerform.add(perftime);
          lclientName.add(clientName);
          llocationName.add(locationName);
          lstartDate.add(appsDate);
          lendDate.add(appeDate);
          lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
       else if(shiftTime.equals("Second"))
        {
            
      //clientName="allclinets";
      //locationName="allocation";
      shiftTime="Second";
      ResultSet res=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform),d.locationsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c JOIN aslocations as d ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid and b.locationsid=d.locationsid WHERE c.clientsname LIKE '"+clientName+"' and d.locationsname LIKE '"+locationName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' and performtime between '"+fessTime+"' and '"+setsTime+"' GROUP BY a.auditorsname");
      while(res.next())
      {
        lauditorName.add(res.getString("a.auditorsname"));
        ltimetoPerform.add(res.getFloat("sum(b.timetoperform)")/3600);
        lclientName.add(res.getString("c.clientsname"));
        llocationName.add(res.getString("d.locationsname"));
        lstartDate.add(appsDate);
        lendDate.add(appeDate);
        lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
        else if(shiftTime.equals("Third"))
        {
            
      //clientName="allclinets";
      //locationName="allocation";
      shiftTime="Third";
      ResultSet res=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform),d.locationsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c JOIN aslocations as d ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid and b.locationsid=d.locationsid WHERE c.clientsname LIKE '"+clientName+"' and d.locationsname LIKE '"+locationName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' and performtime between '"+setsTime+"' and '"+fsteTime+"' GROUP BY a.auditorsname");
      while(res.next())
      {
        lauditorName.add(res.getString("a.auditorsname"));
        ltimetoPerform.add(res.getFloat("sum(b.timetoperform)")/3600);
        lclientName.add(res.getString("c.clientsname"));
        llocationName.add(res.getString("d.locationsname"));
        lstartDate.add(appsDate);
        lendDate.add(appeDate);
        lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
    }
    else if((!auditorName.equals("-selectall-"))&&(!clientName.equals("-selectall-"))&&(!locationName.equals("-selectall-"))&&(!shiftTime.equals("-selectall-")))
    {
        if(shiftTime.equals("First"))
        {
      //clientName="allclinets";
      //locationName="allocation";
      shiftTime="First";
      fsincstartdate=DateIncrement.increaseDate(startDate);
      fsincenddate=DateIncrement.increaseDate(endDate);
      ResultSet res=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform),d.locationsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c JOIN aslocations as d ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid and b.locationsid=d.locationsid WHERE a.auditorsname LIKE '"+auditorName+"' and c.clientsname LIKE '"+clientName+"' and d.locationsname LIKE '"+locationName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' and `performtime` BETWEEN '"+fsstarttimeday1+"' AND '"+fsendtimeday1+"' GROUP BY a.auditorsname");
      while(res.next())
      {
        flagvar=res.getString("d.locationsname");
        perftimeday1=res.getFloat("sum(b.timetoperform)")/3600;
        firstshift1.put(flagvar, perftimeday1);
      }
      ResultSet res1=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform),d.locationsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c JOIN aslocations as d ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid and b.locationsid=d.locationsid WHERE a.auditorsname LIKE '"+auditorName+"' and c.clientsname LIKE '"+clientName+"' and d.locationsname LIKE '"+locationName+"' and `performdate` BETWEEN '"+fsincstartdate+"' AND '"+fsincenddate+"' and `performtime` BETWEEN '"+fsstarttimeday2+"' AND '"+fsendtimeday2+"' GROUP BY a.auditorsname");
      while(res1.next())
      {
        flagvar=res1.getString("d.locationsname");
        perftimeday2=res1.getFloat("sum(b.timetoperform)")/3600;
        firstshift2.put(flagvar, perftimeday2);
      }
      for(Map.Entry<String, Float> result:firstshift1.entrySet()){
        flagvar=result.getKey();
        if(firstshift2.containsKey(flagvar)){
          perftimeday1=firstshift1.get(flagvar);
          perftimeday2=firstshift2.get(flagvar);
          perftime=perftimeday1+perftimeday2;
          lauditorName.add(auditorName);
          ltimetoPerform.add(perftime);
          lclientName.add(clientName);
          llocationName.add(flagvar);
          lstartDate.add(appsDate);
          lendDate.add(appeDate);
          lshiftTime.add(shiftTime);
         // firstshift1.remove(flagvar);
          firstshift2.remove(flagvar);
        }
        else{
          perftime=firstshift1.get(flagvar);
          lauditorName.add(auditorName);
          ltimetoPerform.add(perftime);
          lclientName.add(clientName);
          llocationName.add(flagvar);
          lstartDate.add(appsDate);
          lendDate.add(appeDate);
          lshiftTime.add(shiftTime);
        }
      }
      for(Map.Entry<String, Float> result1:firstshift2.entrySet()){
        flagvar=result1.getKey();
          perftime=firstshift2.get(flagvar);
          lauditorName.add(auditorName);
          ltimetoPerform.add(perftime);
          lclientName.add(clientName);
          llocationName.add(flagvar);
          lstartDate.add(appsDate);
          lendDate.add(appeDate);
          lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
       else if(shiftTime.equals("Second"))
        {
            
      //clientName="allclinets";
      //locationName="allocation";
      shiftTime="Second";
      ResultSet res=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform),d.locationsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c JOIN aslocations as d ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid and b.locationsid=d.locationsid WHERE a.auditorsname LIKE '"+auditorName+"' and c.clientsname LIKE '"+clientName+"' and d.locationsname LIKE '"+locationName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' and performtime between '"+fessTime+"' and '"+setsTime+"' GROUP BY a.auditorsname");
      while(res.next())
      {
        lauditorName.add(res.getString("a.auditorsname"));
        ltimetoPerform.add(res.getFloat("sum(b.timetoperform)")/3600);
        lclientName.add(res.getString("c.clientsname"));
        llocationName.add(res.getString("d.locationsname"));
        lstartDate.add(appsDate);
        lendDate.add(appeDate);
        lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
        else if(shiftTime.equals("Third"))
        {
            
      //clientName="allclinets";
      //locationName="allocation";
      shiftTime="Third";
      ResultSet res=st.executeQuery("SELECT a.auditorsname, c.clientsname, sum(b.timetoperform),d.locationsname FROM auditors AS a JOIN asauditsreportfinal AS b JOIN asclients as c JOIN aslocations as d ON a.auditorsid=b.auditorsid and c.clientsid=b.clientsid and b.locationsid=d.locationsid WHERE a.auditorsname LIKE '"+auditorName+"' and c.clientsname LIKE '"+clientName+"' and d.locationsname LIKE '"+locationName+"' and `performdate` BETWEEN '"+startDate+"' AND '"+endDate+"' and performtime between '"+setsTime+"' and '"+fsteTime+"' GROUP BY a.auditorsname");
      while(res.next())
      {
        lauditorName.add(res.getString("a.auditorsname"));
        ltimetoPerform.add(res.getFloat("sum(b.timetoperform)")/3600);
        lclientName.add(res.getString("c.clientsname"));
        llocationName.add(res.getString("d.locationsname"));
        lstartDate.add(appsDate);
        lendDate.add(appeDate);
        lshiftTime.add(shiftTime);
      }
      cb.setlauditorName(lauditorName);
      cb.setltimetoPerform(ltimetoPerform);
      cb.setllocationName(llocationName);
      cb.setlclientName(lclientName);
      cb.setlstartDate(lstartDate);
      cb.setlendDate(lendDate);
      cb.setlshiftTime(lshiftTime);
    }
    }
    }
    catch(Exception e)
    {
      System.out.println(e);
    }
     return cb;
  }
  
}
