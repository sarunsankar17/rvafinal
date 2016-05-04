/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.userlogin;

import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author lenovo
 */
public class LogBean {
    private String userid;
    private String password;
    private String auditorname;
    private boolean availablity;
    private String status;
    private int profileid;
    private String accesslevel;
    private String profpic;
    private ArrayList<String> lauditorname=new ArrayList<String>();
    private ArrayList<String> ldesignation=new ArrayList<String>();
    
    public void setlauditorname(ArrayList<String> lauditorname){
      this.lauditorname=lauditorname;
    }
    public ArrayList<String> getlAuditorname(){
      return lauditorname;
    }
    public void setldesignation(ArrayList<String> ldesignation){
      this.ldesignation=ldesignation;
    }
    public ArrayList<String> getldesignation(){
      return ldesignation;
    }
    public void setProfpicture(String thisprofpic)
    {
        profpic=thisprofpic;
    }
    public String getProfpicture()
    {
        return profpic;
    }   
    public void setUserid(String thisuserid)
    {
        userid=thisuserid;
    }
    public String getUserid()
    {
        return userid;
    }
    public void setPassword(String thispassword)
    {
        password=thispassword;
    }
    public String getPassword()
    {
        return password;
    }
    public void setAuditorname(String thisauditorname)
    {
        auditorname=thisauditorname;
    }
    public String getAuditorname()
    {
        return auditorname;
    }
    public void setAvailablity(boolean thisavailablity)
    {
        availablity=thisavailablity;
    }
    public boolean isAvailable()
    {
        return availablity;
    }
    public void setStatus(String thisstatus)
    {
        status=thisstatus;
    }
    public String getStatus()
    {
        return status;
    }
    
    public void setProfileid(int thisprofileid)
    {
        profileid=thisprofileid;
    }
    public int getProfileid()
    {
        return profileid;
    }
    public void setAccesslevel(String thisaccesslevel)
    {
        accesslevel=thisaccesslevel;
    }
    public String getAccesslevel()
    {
        return accesslevel;
    }
}
