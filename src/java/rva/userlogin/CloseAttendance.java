/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.userlogin;

import java.sql.*;
import java.text.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;
import rva.dbaccess.DBConnect;
public class CloseAttendance {
	public static void main(String args[]) throws InterruptedException {
		Timer time = new Timer(); // Instantiate Timer Object
		//ScheduledTask st = new ScheduledTask(); // Instantiate SheduledTask class
		time.schedule(new ScheduledTask(), 0, 1*60*1000); // Create Repetitively task for every 1 secs
	
//for demo only.
	}
}
class ScheduledTask extends TimerTask {
	Date now; 
       Connection con=DBConnect.startConnection();
       SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
       private ArrayList<String> lprofileid=new ArrayList<String>();
	public void run() {
         try{
            Statement st=con.createStatement();
           now=new Date();
           String res=date.format(now);
           String now="2015-10-08";
           String time=" 00:00:00";
           String result=now.concat(time);
           System.out.println(result);
           PreparedStatement pstm=con.prepareStatement("INSERT INTO test(testdate) values(?)");
           pstm.setString(1, res);
           pstm.executeUpdate();
           System.out.println(res);
         }
         catch(Exception e){   
           e.printStackTrace();
         }
       }
}