/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.taskinsert;
import java.sql.*;
import java.util.*;
import rva.dbaccess.DBConnect;
/**
 *
 * @author Arun-S
 */

/**
 *
 * @author RCT-456
 */
public class RetelTasks {
  
  ArrayList<String> lauditorName=new ArrayList<String>();
  Connection con=DBConnect.startConnection();
  public ArrayList<String> getretTasks()
  {
    ArrayList<String> rettasks=new ArrayList<String>();
  try
  {
  Statement st=con.createStatement();
  ResultSet res=st.executeQuery("SELECT taskname from reteltaskname");
  while(res.next())
  {
    rettasks.add(res.getString("taskname"));
  }
  }
  
  catch(Exception e)
  {
    System.out.println(e);
  }
  return rettasks;
  }
public ArrayList<String> getauditorName()
{
  try
  {
    Statement st=con.createStatement();
    ResultSet res=st.executeQuery("Select * from retellog group by auditorname");
    while(res.next())
    {
      lauditorName.add(res.getString("auditorname"));
    }
  }
  catch(Exception e)
  {
    e.printStackTrace();
  }
  return lauditorName;
}
}
