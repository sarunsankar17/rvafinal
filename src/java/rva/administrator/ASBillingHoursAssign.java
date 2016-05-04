/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rva.administrator;

import java.sql.*;
import java.util.ArrayList;
import rva.dbaccess.DBConnect;

/**
 *
 * @author RCT-456
 */
public class ASBillingHoursAssign {
  private String billingHours=null;
  private String startDate=null;
  private String endDate=null;
  private float astotalhours=0.00f;
  
  private float asbillinghours=0.00f;
  private float hoursdiff=0.00f;
  private float individualhours=0.00f;
  private int auditorsid=0;
  private final String defpertime="06:00:00";
  private float indextrahours=0.00f;
  ChangeDateFormat cdf=new ChangeDateFormat();
  ArrayList<String> lauditors=new ArrayList<String>();
  ArrayList<Float> lpt=new ArrayList<Float>();
  ArrayList<Integer> lauditorsid=new ArrayList<Integer>();
  CalculateExtraHours ceh=new CalculateExtraHours();
  AddExtraHours aeh=new AddExtraHours();
  SetASBilling sab=new SetASBilling();
  public void setExtraHours(String startDate, float billingHours){
    try{
    startDate=startDate;
    endDate=cdf.setEndDate(startDate);
    asbillinghours=billingHours;
    
    sab.addbilling(startDate, asbillinghours);
    Connection con=DBConnect.startConnection();
    Statement st=con.createStatement();
    PreparedStatement pstm=null;
    ResultSet res=null;
    res=st.executeQuery("SELECT a.auditorsname,sum(`timetoperform`),a.auditorsid FROM auditors as a join `asauditsreportfinal` as b on a.auditorsid = b.`auditorsid` WHERE `performdate` between '"+startDate+"' and '"+endDate+"' group by a.auditorsname");
    while(res.next()){
      lauditors.add(res.getString("a.auditorsname"));
      lauditorsid.add(res.getInt("a.auditorsid"));
      lpt.add(res.getFloat("sum(`timetoperform`)")/3600);
    }
    res=st.executeQuery("select sum(timetoperform)from asauditsreportfinal where `performdate` between '"+startDate+"' and '"+endDate+"'");
    while(res.next()){
      astotalhours=res.getFloat("sum(timetoperform)")/3600;
    }
    hoursdiff=asbillinghours-astotalhours;
    System.out.println(hoursdiff);
    for(int i=0;i<lauditors.size();i++){
      auditorsid=lauditorsid.get(i);
      individualhours=lpt.get(i);
      indextrahours=((ceh.getExtraHours(individualhours, astotalhours, hoursdiff))/2)*3600;
      System.out.println(indextrahours);
      aeh.addMFGHours(indextrahours, startDate, auditorsid);
      aeh.addSBVHours(indextrahours, startDate, auditorsid);
    }
    }
    catch(Exception e){
      System.out.println(e);
    }
  }
}
class CalculateExtraHours{
  private float individualhours=0.00f;
  private float astotalhours=0.00f; 
  private float hoursdiff=0.00f;
  private float indivextrahours=0.00f;
  private float ptavg=0.00f;
  public float getExtraHours(float individualhours,float astotalhours,float hoursdiff){
    this.individualhours=individualhours;
    this.astotalhours=astotalhours;
    this.hoursdiff=hoursdiff;
    ptavg=(individualhours/astotalhours)*100;
    indivextrahours=(hoursdiff*ptavg)/100;
    return indivextrahours;
  }
}
class AddExtraHours{
  
  private final String defTime="06:00:00";
  private final int mfgcid=1;
  private final int mfgaid=1;
  private final int mfgchid=1;
  private final int mfglid=1;
  private final int sbvlid=7;
  private final int sbvcid=4;
  private final int sbvaid=40;
  private final int sbvchid=12;
  
  public void addMFGHours(float indextrahours,String startDate, int auditorsid){
    try{
      
      Connection con=DBConnect.startConnection();
    PreparedStatement  pstm=con.prepareStatement("INSERT INTO asauditsreportfinal(`auditsid`, `locationsid`, `clientsid`, `performdate`, `performtime`, `auditorsid`, `choicesid`, `timetoperform`) values(?,?,?,?,?,?,?,?)");
      pstm.setInt(1, mfgaid);
      pstm.setInt(2, mfglid);
      pstm.setInt(3, mfgcid);
      pstm.setString(4, startDate);
      pstm.setString(5, defTime);
      pstm.setInt(6, auditorsid);
      pstm.setInt(7, mfgchid);
      pstm.setFloat(8, indextrahours);
      pstm.executeUpdate();
      System.out.println(startDate+"\t"+indextrahours+"\t"+auditorsid);
    }
    catch(Exception e){
      e.printStackTrace();
    }
  }
  public void addSBVHours(float indextrahours,String startDate, int auditorsid){
    try{
      
      Connection con=DBConnect.startConnection();
   
    PreparedStatement  pstm=con.prepareStatement("INSERT INTO asauditsreportfinal(`auditsid`, `locationsid`, `clientsid`, `performdate`, `performtime`, `auditorsid`, `choicesid`, `timetoperform`) values(?,?,?,?,?,?,?,?)");
      pstm.setInt(1, sbvaid);
      pstm.setInt(2, sbvlid);
      pstm.setInt(3, sbvcid);
      pstm.setString(4, startDate);
      pstm.setString(5, defTime);
      pstm.setInt(6, auditorsid);
      pstm.setInt(7, sbvchid);
      pstm.setFloat(8, indextrahours);
      pstm.executeUpdate();
      System.out.println(startDate+"\t"+indextrahours+"\t"+auditorsid);
    }
    catch(Exception e){
      e.printStackTrace();
    }
  }
}
class SetASBilling{
  public void addbilling(String billingmonth,float billinghours){
    try{
      Connection con=DBConnect.startConnection();
      PreparedStatement pstm=con.prepareStatement("INSERT INTO `asbilling`(`billingmonth`, `billinghours`) values(?,?)");
      pstm.setString(1, billingmonth);
      pstm.setFloat(2, billinghours);
      pstm.executeUpdate();
    }
    catch(Exception e){
      e.printStackTrace();
    }
  }
}
