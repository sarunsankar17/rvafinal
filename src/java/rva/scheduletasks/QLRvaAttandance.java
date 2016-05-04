/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.scheduletasks;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static org.quartz.JobBuilder.newJob;
import static org.quartz.TriggerBuilder.newTrigger;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletContextEvent;
import org.quartz.CronScheduleBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.impl.StdSchedulerFactory;
 
public class QLRvaAttandance extends HttpServlet implements ServletContextListener {

 Scheduler schedule=null;
  public void contextInitialized(ServletContextEvent servletContext){
    System.out.println("Context Initialized");
    try{
      JobDetail job=newJob(CloseRvaAttendance.class).withIdentity("CronQuartzJob","Group").build();
      Trigger trigger=newTrigger().withIdentity("TriggerName","Group").withSchedule(CronScheduleBuilder.cronSchedule("0 0 0 * *  ?")).build();
      schedule=new StdSchedulerFactory().getScheduler();
      schedule.start();
      schedule.scheduleJob(job, trigger);
      JobDetail job1=newJob(TestReportSending.class).withIdentity("CronQuartzJob","Group1").build();
      Trigger trigger1=newTrigger().withIdentity("TriggerName","Group1").withSchedule(CronScheduleBuilder.cronSchedule("0 0 0 * *  ?")).build();
      schedule=new StdSchedulerFactory().getScheduler();
      schedule.start();
      schedule.scheduleJob(job1, trigger1);
    }
    catch(Exception e){
      System.out.println(e);
    }
  }
  public void contextDestroyed(ServletContextEvent servletContext){
    System.out.println("Context Destroyed");
    try{
      schedule.shutdown();
      System.out.println("Context Destroyed in try");
    }
    catch(Exception e){
      System.out.println(e);
    }
  }
}
