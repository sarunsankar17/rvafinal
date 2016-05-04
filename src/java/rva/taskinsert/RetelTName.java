/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.taskinsert;
import rva.dbaccess.DBConnect;
import java.util.*;
import java.sql.*;
/**
 *
 * @author Arun-S
 */
public class RetelTName {
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


ArrayList<String> lrtName=new ArrayList<String>(); 
ArrayList<String> lauditorName=new ArrayList<String>(); 
Connection con=DBConnect.startConnection();
public ArrayList<String> getrtname()
{
try
{
  Statement st=con.createStatement();
  ResultSet res=st.executeQuery("Select taskname from retellog group by taskname");
  while(res.next())
  {
    lrtName.add(res.getString("taskname"));
  }
}
catch(Exception e)
{
  System.out.println(e);
}
return lrtName;
}
public ArrayList<String> getauditorName()
{
  try
  {
    Statement st=con.createStatement();
    ResultSet res=st.executeQuery("Select auditorname from retellog group by auditorname");
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
