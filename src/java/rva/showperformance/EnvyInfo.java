/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.showperformance;
import java.util.*;
import java.sql.*;
import rva.dbaccess.DBConnect;
/**
 *
 * @author RCT-456
 */
public class EnvyInfo {
  private ArrayList<String> lecafename=new ArrayList<String>();
  private ArrayList<String> letaskname=new ArrayList<String>();
  private ArrayList<String> leaudname=new ArrayList<String>();
  Connection con=DBConnect.startConnection();
  ResultSet res=null;
  public ArrayList<String> getencafename(){
    try{
      Statement st=con.createStatement();
      res=st.executeQuery("SELECT * FROM `envysioncafes`");
      while(res.next()){
      lecafename.add(res.getString("envysioncafesname"));
    }
    }
    catch(Exception e){
      System.out.println(e);
    }
    return lecafename;
  }
  public ArrayList<String> getentaskname(){
    try{
      Statement st=con.createStatement();
      res=st.executeQuery("SELECT * FROM `envysiontasks`");
      while(res.next()){
      letaskname.add(res.getString("envysiontaskname"));
    }
    }
    catch(Exception e){
      System.out.println(e);
    }
    return letaskname;
  }
  public ArrayList<String> getenaudname(){
    try{
      Statement st=con.createStatement();
      res=st.executeQuery("SELECT auditorname FROM `envysionperformancefinal` group by auditorname");
      while(res.next()){
      leaudname.add(res.getString("auditorname"));
    }
    }
    catch(Exception e){
      System.out.println(e);
    }
    return leaudname;
  }
}
