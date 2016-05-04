/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.administrator;

import java.util.*;
import java.sql.*;
import rva.dbaccess.DBConnect;
public class ASMissedValDAO {
    
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.

 *
 * @author Arun-S
 */

  Connection con=DBConnect.startConnection();
    ASMissValuesBean asm=new ASMissValuesBean();
    ArrayList<String> lauditName=new ArrayList<String>();
  ArrayList<String> lclientName=new ArrayList<String>();
  ArrayList<String> llocationName=new ArrayList<String>();
  ArrayList<String> lperformDate=new ArrayList<String>();
  ArrayList<String> lauditorName=new ArrayList<String>();
  ArrayList<String> lchoiceName=new ArrayList<String>();
    public ASMissValuesBean getValues()
    {
        try
        {
            Statement st=con.createStatement();
            ResultSet res=st.executeQuery("SELECT * from asmismatcheddatas");
            while(res.next())
            {
                lauditName.add(res.getString("auditname"));
                lauditorName.add(res.getString("auditorname"));
                lclientName.add(res.getString("clientname"));
                llocationName.add(res.getString("locationname"));
                lperformDate.add(res.getString("performeddate"));
                lchoiceName.add(res.getString("choicename"));
          }
            asm.setlAuditName(lauditName);
            asm.setlAuditorName(lauditorName);
            asm.setlClientName(lclientName);
            asm.setlLocationName(llocationName);
            asm.setlPerformDate(lperformDate);
            asm.setlChoiceName(lchoiceName);
            
        }
        catch(Exception e)
        {
            
        }
        return asm;
    }
    
}