/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.userlogin;
import rva.dbaccess.DBConnect;
import java.sql.*;
import java.util.*;
/**
 *
 * @author RCT-456
 */
public class UserInfo {
 private ArrayList<String> lbloodgroup=new ArrayList<String>();
 private ArrayList<String> ldesignation=new ArrayList<String>();
 private ArrayList<String> lrvaprojects=new ArrayList<String>();
 private ArrayList<String> lrvaauditors=new ArrayList<String>();
 private int auditorid;
 LogBean lb1=new LogBean();
 Connection con=DBConnect.startConnection();
  ResultSet res=null;
  
  public int getauditorid(String auditorname){
    try{
     Statement st=con.createStatement();
     res=st.executeQuery("SELECT * form auditors");
     while(res.next()){
       lbloodgroup.add(res.getString("bloodgroupname"));
     }
   }
   catch(Exception e){
     System.out.println(e);
   }
    return auditorid;
  }
 public ArrayList<String> getbloodgroup(){
   try{
     Statement st=con.createStatement();
     res=st.executeQuery("SELECT * form bloodgroup");
     while(res.next()){
       lbloodgroup.add(res.getString("bloodgroupname"));
     }
   }
   catch(Exception e){
     System.out.println(e);
   }
   return lbloodgroup;
 }
 public ArrayList<String> getDesignation(){
   try{
     Statement st=con.createStatement();
     res=st.executeQuery("SELECT * from empdesignation");
     while(res.next()){
       ldesignation.add(res.getString("designation"));
     }
   }
     catch(Exception e){
             System.out.println(e);
             }
   
   return ldesignation;
 }
 public ArrayList<String> getrvaprojects(){
   try{
     Statement st=con.createStatement();
     res=st.executeQuery("SELECT * from rvaprojects");
     while(res.next()){
       lrvaprojects.add(res.getString("rvaprojectname"));
     }
   }
     catch(Exception e){
             System.out.println(e);
             }
   
   return lrvaprojects;
 }
 public LogBean getrvaauditors(String startDate,String endDate){
   try{
     Statement st=con.createStatement();
     res=st.executeQuery("SELECT a.fullname,b.designation from userprofilepersonal as a join userprofileofficial as b on a.profileid=b.profileid where b.designation not like 'Manager' " );
     while(res.next()){
       lrvaauditors.add(res.getString("a.fullname"));
       ldesignation.add(res.getString("b.designation"));
     }
     res=st.executeQuery("SELECT fullname,designation from resignedemployees where designation not like 'Manager' and relievingdate between '"+startDate+"' and '"+endDate+"' ");
   while(res.next()){
     lrvaauditors.add(res.getString("fullname"));
     ldesignation.add(res.getString("designation"));
   }
   }
     catch(Exception e){
             System.out.println(e);
      }
   lb1.setlauditorname(lrvaauditors);
   lb1.setldesignation(ldesignation);
   return lb1;
 }
 }
