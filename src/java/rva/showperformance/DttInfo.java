/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.showperformance;
import java.sql.*;
import java.util.*;
import rva.dbaccess.DBConnect;
/**
 *
 * @author RCT-456
 */
public class DttInfo {
  private ArrayList<String> ldtaskname=new ArrayList<String>();
  private ArrayList<String> ldaudname=new ArrayList<String>();
  Connection con=DBConnect.startConnection();
  ResultSet res=null;
  public ArrayList<String> getdtttaskname(){
    try{
      Statement st=con.createStatement();
      res=st.executeQuery("SELECT * from dtttaskdetails");
      while(res.next()){
        ldtaskname.add(res.getString("dtttaskname"));
      }
    }
    catch(Exception e){
      System.out.println(e);
    }
    return ldtaskname;
  }
  public ArrayList<String> getdttaudname(){
    try{
      Statement st=con.createStatement();
      res=st.executeQuery("SELECT * from dttfinal group by auditorname");
      while(res.next()){
        ldaudname.add(res.getString("auditorname"));
      }
    }
    catch(Exception e){
      System.out.println(e);
    }
    return ldaudname;
  }
}
