
package rva.administrator;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ASBillingHours extends HttpServlet {
  public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
    ChangeDateFormat cdf=new ChangeDateFormat();
    String billingmonth=request.getParameter("date");
  String date=cdf.todbdateformat(billingmonth);
    float billhours=Float.parseFloat(request.getParameter("billinghours"));
    ASBillingHoursAssign asbillhours=new ASBillingHoursAssign();
    asbillhours.setExtraHours(date, billhours);
    response.setContentType("text/html");
    PrintWriter out=response.getWriter();
    response.sendRedirect("aschecklist.jsp");
  }
}
