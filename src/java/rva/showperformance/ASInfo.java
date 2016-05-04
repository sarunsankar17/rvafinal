/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.showperformance;
import java.sql.*;
import rva.dbaccess.DBConnect;
import java.util.*;
/**
 *
 * @author RCT-456
 */
public class ASInfo {
  ArrayList<String> lasauditorName=new ArrayList<String>();
  ArrayList<String> laslocationName=new ArrayList<String>();
  ArrayList<String> lasclientName=new ArrayList<String>();
  ArrayList<String> lasqaclientName=new ArrayList<String>();
  ArrayList<String> lasqaauditorName=new ArrayList<String>();
  ArrayList<String> lasshifttime=new ArrayList<String>();
  
  Connection con=DBConnect.startConnection();
  ResultSet res=null;
 
  public ArrayList<String> getasauditorsName(){
    try{
     Statement st=con.createStatement();
     res=st.executeQuery("SELECT * FROM auditors");
     while(res.next()){
       lasauditorName.add(res.getString("auditorsname"));
     }
     lasauditorName.remove("Nill");
     lasauditorName.add("-selectall-");
     Collections.sort(lasauditorName);
    }
    catch(Exception e){
      System.out.println(e);
    }
    return lasauditorName;
  }
  public ArrayList<String> getasclientName(){
    try{
     Statement st=con.createStatement();
     res=st.executeQuery("SELECT * FROM asclients");
     while(res.next()){
       lasclientName.add(res.getString("clientsname"));
     }
     lasclientName.add("-selectall-");
     Collections.sort(lasclientName);
    }
    catch(Exception e){
      System.out.println(e);
    }
    return lasclientName;
  }
  public ArrayList<String> getasqaclientName(){
    try{
     Statement st=con.createStatement();
     res=st.executeQuery("SELECT * FROM asqaclients");
     while(res.next()){
       lasqaclientName.add(res.getString("asqaclientsname"));
     }
     lasqaclientName.add("-selectall-");
     Collections.sort(lasqaclientName);
    }
    catch(Exception e){
      System.out.println(e);
    }
    return lasqaclientName;
  }
  public ArrayList<String> getasqaauditoName(){
    try{
     Statement st=con.createStatement();
     res=st.executeQuery("Select * from auditors where empcategory NOT LIKE 'auditor' ");
     while(res.next()){
       lasqaauditorName.add(res.getString("auditorsname"));
     }
     lasqaauditorName.add("-selectall-");
     lasqaauditorName.remove("Nill");
     Collections.sort(lasqaauditorName);
    }
    catch(Exception e){
      System.out.println(e);
    }
    return lasqaauditorName;
  }
  public ArrayList<String> getaslocationName(String cname){
try{
  Statement st=con.createStatement();
  res=st.executeQuery("SELECT a.locationsid, a.locationsname FROM aslocations as a JOIN asclients as b on a.clientsid=b.clientsid WHERE b.clientsname LIKE '"+cname+"' ");
  while(res.next()){
    laslocationName.add(res.getString("a.locationsname"));
  }
  laslocationName.add("-selectall-");
  Collections.sort(laslocationName);
} 
catch(Exception e){
  System.out.println(e);
}
    return laslocationName;
  }
  public ArrayList<String> getasshiftTime(){
try{
  Statement st=con.createStatement();
  res=st.executeQuery("SELECT * from shifttime ");
  while(res.next()){
    lasshifttime.add(res.getString("shiftname"));
  }
  lasshifttime.add("-selectall-");
  Collections.sort(lasshifttime);
} 
catch(Exception e){
  System.out.println(e);
}
    return lasshifttime;
  }
  
}
