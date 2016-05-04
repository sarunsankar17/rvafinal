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
public class ASQAChecklistBean {
    private String auditorName;
    private String clientName;
    private String startDate;
    private String endDate;
    private ArrayList<String> lauditorName=new ArrayList<String>();
    private ArrayList<String> lclientName=new ArrayList<String>();
    private ArrayList<Float> lasqaperformance=new ArrayList<Float>();
    public void setQAAuditorname(String auditorName)
    {
        this.auditorName=auditorName;
    }
    public String getQAAuditorname()
    {
        return auditorName;
    }
    public void setQAClientname(String clientName)
    {
        this.clientName=clientName;
    }
    public String getQAClientname()
    {
        return clientName;
    }
    public void setstartDate(String startDate)
    {
        this.startDate=startDate;
    }
    public String getstartDate()
    {
        return startDate;
    }
    public void setendDate(String endDate)
    {
        this.endDate=endDate;
    }
    public String getendDate()
    {
        return endDate;
    }
    public void setlAuditorName(ArrayList<String> lauditorName)
    {
        this.lauditorName=lauditorName;
    }
    public ArrayList<String> getlauditorName()
    {
        return lauditorName;
    }
    public void setlclientName(ArrayList<String> lclientName)
    {
        this.lclientName=lclientName;
    }
    public ArrayList<String> getlclientName()
    {
        return lclientName;
    }
        public void setlAsQAResults(ArrayList<Float> lasqaperformance)
    {
        this.lasqaperformance=lasqaperformance;
    }
        public ArrayList<Float> getlAsQAResults()
    {
        return lasqaperformance;
    }
}
