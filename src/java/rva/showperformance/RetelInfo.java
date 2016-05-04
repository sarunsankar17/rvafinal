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
 * @author Aruns
 */
public class RetelInfo {
    private ArrayList<String> rtname=new ArrayList<String>();
    private ArrayList<String> raudname=new ArrayList<String>();
    //private final String def="-selectall-";
    Connection con=DBConnect.startConnection();
    ResultSet res=null;
    public ArrayList<String> getrtaskname(){
        try{
            Statement st=con.createStatement();
            res=st.executeQuery("SELECT * from reteltaskname");
            while(res.next()){
                rtname.add(res.getString("taskname"));
            }
            
            Collections.sort(rtname);
            
        }
        catch(Exception e){
            System.out.println(e);
        }
        return rtname;
    }
    public ArrayList<String> getraudname(){
        try{
            Statement st=con.createStatement();
            res=st.executeQuery("SELECT auditorname from retellog group by auditorname");
            while(res.next()){
                raudname.add(res.getString("auditorname"));
            }
            Collections.sort(raudname);
        }
        catch(Exception e){
            System.out.println(e);
        }
        return raudname;
    }
}
