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
public class ASQAAuditors {
  private ArrayList<String> lqaAuditors=new ArrayList<String>();
  ASQAChecklistBean asqab=new ASQAChecklistBean();
  Connection con=DBConnect.startConnection();
  public ASQAChecklistBean getQAAuditors()
  {
    try
    {
      Statement st=con.createStatement();
      ResultSet res=st.executeQuery("Select * from auditors where empcategory NOT LIKE 'auditor' ");
      while(res.next())
      {
        lqaAuditors.add(res.getString("auditorsname"));
      }
      lqaAuditors.remove("Nill");
      asqab.setlAuditorName(lqaAuditors);
    }
    catch(Exception e)
    {
      System.out.println(e);
    }
    return asqab;
  }
}
