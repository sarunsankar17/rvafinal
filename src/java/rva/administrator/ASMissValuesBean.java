/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.administrator;

import java.util.*;
import java.sql.*;
import rva.dbaccess.DBConnect;
public class ASMissValuesBean {

    
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



  ArrayList<String> lauditName=new ArrayList<String>();
  ArrayList<String> lclientName=new ArrayList<String>();
  ArrayList<String> llocationName=new ArrayList<String>();
  ArrayList<String> lperformDate=new ArrayList<String>();
  ArrayList<String> lauditorName=new ArrayList<String>();
  ArrayList<String> lchoiceName=new ArrayList<String>();
  
  private String auditName;
  private String clientName;
  private String locationName;
  private String performDate;
  private String auditorName;
  private String choiceName;
  
  public void setAuditName(String auditName)
  {
      this.auditName=auditName;
  }
  public String getAuditName()
  {
      return auditName;
  }
  public void setClientName(String clientName)
  {
      this.clientName=clientName;
  }
  public String getClientName()
  {
      return clientName;
  }
  public void setLocationName(String locationName)
  {
      this.locationName=locationName;
  }
  public String getLocationName()
  {
      return locationName;
  }
  public void setPerformDate(String performDate)
  {
      this.performDate=performDate;
  }
  public String getPerformDate()
  {
      return performDate;
  }
  public void setAuditorName(String auditorName)
  {
      this.auditorName=auditorName;
  }
  public String getAuditorName()
  {
      return auditorName;
  }
  public void setChoiceName(String choiceName)
  {
      this.choiceName=choiceName;
  }
  public String getChoiceName()
  {
      return choiceName;
  }
  public void setlAuditName(ArrayList<String> lauditName)
  {
      this.lauditName=lauditName;
  }
  public ArrayList<String> getlAuditName()
  {
      return lauditName;
  }
  public void setlClientName(ArrayList<String> lclientName)
  {
      this.lclientName=lclientName;
  }
  public ArrayList<String> getlClientName()
  {
      return lclientName;
  }
  public void setlLocationName(ArrayList<String> llocationName)
  {
      this.llocationName=llocationName;
  }
  public ArrayList<String> getlLocationName()
  {
      return llocationName;
  }
  public void setlPerformDate(ArrayList<String> lperformDate)
  {
      this.lperformDate=lperformDate;
  }
  public ArrayList<String> getlPerformDate()
  {
      return lperformDate;
  }
  public void setlChoiceName(ArrayList<String> lchoiceName)
  {
      this.lchoiceName=lchoiceName;
  }
  public ArrayList<String> getlChoiceName()
  {
      return lchoiceName;
  }
  public void setlAuditorName(ArrayList<String> lauditorName)
  {
      this.lauditorName=lauditorName;
  }
  public ArrayList<String> getlAuditorName()
  {
      return lauditorName;
  }
}
