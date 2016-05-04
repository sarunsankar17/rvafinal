/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.showperformance;
import java.util.*;
/**
 *
 * @author Arun-S
 */
public class ASChecklistBean {
    
  private ArrayList<String> laudName=new ArrayList<String>();
  private ArrayList<String> lcliName=new ArrayList<String>();
  private ArrayList<String> llocateName=new ArrayList<String>();
  private ArrayList<String> lstartDate=new ArrayList<String>();
  private ArrayList<String> lendDate=new ArrayList<String>();
  private ArrayList<Float> ltimetoPerform=new ArrayList<Float>();
  private ArrayList<String> lshiftTime=new ArrayList<String>();
  
  private String auditorName;
  private String clientName;
  private String locationName;
  private String startDate;
  private String endDate;
  private String shiftTime;
  private String dst;
  
  public void setDst(String dst){
    this.dst=dst;
  }
  public String getDst(){
    return dst;
  }
  
  public void setauditorName(String audName)
  {
    this.auditorName=audName;
  }
  public String getauditorName()
  {
    return auditorName;
  }
  public void setshiftTime(String shiTime)
  {
      this.shiftTime=shiTime;
  }
  public String getshiftTime()
  {
      return shiftTime;
  }
  public void setclientName(String cliName)
  {
    this.clientName=cliName;
  }
  public String getcleintName()
  {
    return clientName;
  }
  public void setlocationName(String locName)
  {
    this.locationName=locName;
  }
  public String getlocationName()
  {
    return locationName;
  }
  public void setstartDate(String stDate)
  {
    this.startDate=stDate;
  }
  public String getstartDate()
  {
    return startDate;
  }
   public void setendDate(String enDate)
  {
    this.endDate=enDate;
  }
  public String getendDate()
  {
    return endDate;
  }
   
  public void setlauditorName(ArrayList<String> laudName)
  {
    this.laudName=laudName;
  }
  public ArrayList<String> getlauditorName()
  {
    return laudName;
  }
  public void setlshiftTime(ArrayList<String> lshiTime)
  {
    this.lshiftTime=lshiTime;
  }
  public ArrayList<String> getlshiftTime()
  {
    return lshiftTime;
  }
  public void setlclientName(ArrayList<String> lcliName)
  {
    this.lcliName=lcliName;
  }
  public ArrayList<String> getlclientName()
  {
    return lcliName;
  }
  public void setllocationName(ArrayList<String> llocationName)
  {
    this.llocateName=llocationName;
  }
 public ArrayList<String> getllocationName()
  {
    return llocateName;
  }
  public void setlstartDate(ArrayList<String> lstDate)
  {
    this.lstartDate=lstDate;
  }
  public ArrayList<String> getlstartDate()
  {
    return lstartDate;
  }
  public void setlendDate(ArrayList<String> lendDate)
  {
    this.lendDate=lendDate;
  }
  public ArrayList<String> getlendDate()
  {
    return lendDate;
  }
  public void setltimetoPerform(ArrayList<Float> lttPerform)
  {
    this.ltimetoPerform=lttPerform;
  }
  public ArrayList<Float> getltimetoPerform()
  {
    return ltimetoPerform;
  }
}