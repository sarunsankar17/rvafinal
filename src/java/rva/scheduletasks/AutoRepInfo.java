/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rva.scheduletasks;
import java.util.*;
import java.util.Date;
import rva.administrator.*;
import java.sql.*;
import rva.dbaccess.DBConnect;

public class AutoRepInfo {
  private String reportName;
  private String repDate;
  private String attendanceDate;
  private String reportDate;
  private final String defName="RVA Daily Report For - ";
  ChangeDateFormat cdf=new ChangeDateFormat();
  private ArrayList<String> newjoinees=new ArrayList<String>();
  private ArrayList<String> resignedemps=new ArrayList<String>();
  
  
  public String getReportName(){
   
  Calendar cal=Calendar.getInstance();
  int y=cal.get(Calendar.YEAR);
  int m=cal.get(Calendar.MONTH);
  int d=cal.get(Calendar.DATE)-1;
  cal.set(y, m, d);
  Date date=cal.getTime();
  repDate=cdf.setRepDate(date).concat(".xls");
  reportName=defName.concat(repDate);
  return reportName;
  }
public String attendanceDate(){
  
  Calendar cal=Calendar.getInstance();
  int y=cal.get(Calendar.YEAR);
  int m=cal.get(Calendar.MONTH);
  int d=cal.get(Calendar.DATE)-1;
  cal.set(y, m, d);
  Date date=cal.getTime();
  //System.out.println(date);
  attendanceDate=cdf.toAppDate(cdf.setRepDate(date));
  //System.out.println(attendanceDate);
  return attendanceDate;
}
public ArrayList<String> getNewJoinees(){
  try{
    Connection con=DBConnect.startConnection();
    Statement st=con.createStatement();
    ResultSet res=st.executeQuery("SELECT fullname FROM userprofilepersonal as a join userprofileofficial as b on a.`profileid`=b.`profileid` where `doj` like date_sub(curdate(), interval 1 day) ");
    while(res.next()){
      newjoinees.add(res.getString("fullname"));
    } 
  }
  catch(Exception e){
    e.printStackTrace();
  }
  return newjoinees;
}
public ArrayList<String> getRelievedEmps(){
  try{
    Connection con=DBConnect.startConnection();
    Statement st=con.createStatement();
    ResultSet res=st.executeQuery("SELECT fullname FROM resignedemployees where `relievingdate` like date_sub(curdate(), interval 1 day) ");
    while(res.next()){
      resignedemps.add(res.getString("fullname"));
    } 
  }
  catch(Exception e){
    e.printStackTrace();
  }
  return resignedemps;
}
public String reportDate(){
  
  Calendar cal=Calendar.getInstance();
  int y=cal.get(Calendar.YEAR);
  int m=cal.get(Calendar.MONTH);
  int d=cal.get(Calendar.DATE)-2;
  cal.set(y, m, d);
  Date date=cal.getTime();
  //System.out.println(date);
  reportDate=cdf.toAppDate(cdf.setRepDate(date));
 //System.out.println(reportDate);
  return reportDate;
}
}
