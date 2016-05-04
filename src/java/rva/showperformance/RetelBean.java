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
public class RetelBean {
    
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


    private String auditorName;
    private String performDate;
    private String eperformDate;
    private String taskName;    
    private int radVal;
    private ArrayList<String> launame=new ArrayList<String>();
    private ArrayList<Integer>  laucount=new ArrayList<Integer>();
    private ArrayList<String> ltname=new ArrayList<String>();
    private ArrayList<String> lperformdate=new ArrayList<String>();
    private ArrayList<String> lenddate=new ArrayList<String>();
    public void setAuditorName(String auditorName)
    {
        this.auditorName=auditorName;
    }
    public String getAuditorName()
    {
        return auditorName;
    }
    public void setRadVal(int radVal)
    {
        this.radVal=radVal;
    }
    public int getRadVal()
    {
        return radVal;
    }
    public void setTaskName(String taskName)
    {
        this.taskName=taskName;
    }
    public String getTaskName()
    {
        return taskName;
    }
    public void setPerformDate(String performDate)
    {
        this.performDate=performDate;
    }
    public String getPerformDate()
    {
        return performDate;
    }
    public void setEPerformDate(String eperformDate)
    {
        this.eperformDate=eperformDate;
    }
    public String getEPerformDate()
    {
        return eperformDate;
    }
    public void setlAuditorName(ArrayList<String> launame)
    {
        this.launame=launame;
    }
    public ArrayList<String> getlAuditorName()
    {
        return launame;
    }
    public void setlAuditCount(ArrayList<Integer> laucount)
    {
        this.laucount=laucount;
    }
    public ArrayList<Integer> getlAuditCount()
    {
        return laucount;
    }
    public void setlTaskName(ArrayList<String> ltname)
    {
        this.ltname=ltname;
    }
    public ArrayList<String> getlTaskName()
    {
        return ltname;
    }
    public void setlPerformDate(ArrayList<String> lperformdate)
    {
        this.lperformdate=lperformdate;
    }
    public ArrayList<String> getlPerformDate()
    {
        return lperformdate;
    }
    public void setlEDate(ArrayList<String> lenddate)
    {
        this.lenddate=lenddate;
    }
    public ArrayList<String> getlEDate()
    {
        return lenddate;
    }
}
