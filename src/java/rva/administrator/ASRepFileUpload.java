/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.administrator;

import java.io.*;
import java.util.*;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jxl.*; 
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.output.*;
import javax.servlet.http.HttpSession;
/**
 *
 * @author Arun-S
 */
public class ASRepFileUpload extends HttpServlet {

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
*/
   
private boolean isMultipart;
   private String filePath;
   private int maxFileSize = 100000000 * 1024;
   private int maxMemSize = 1000000000 * 1024;
   private File file ;

   public void init( ){
      // Get the file location where it would be stored.
      filePath = getServletContext().getInitParameter("asfileuploadingpath"); 
   }
   public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, java.io.IOException {
      // Check that we have a file upload request
      isMultipart = ServletFileUpload.isMultipartContent(request);
      response.setContentType("text/html");
      java.io.PrintWriter out = response.getWriter( );
      if( !isMultipart ){
         out.println("<html>");
         out.println("<head>");
         out.println("<title>Servlet upload</title>");  
         out.println("</head>");
         out.println("<body>");
         out.println("<p>No file uploaded</p>"); 
         out.println("</body>");
         out.println("</html>");
         return;
      }
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));
      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      upload.setSizeMax(maxFileSize);
      try{ 
      // Parse the request to get file items.
      List fileItems = upload.parseRequest(request);
      // Process the uploaded file items
      Iterator i = fileItems.iterator();
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      while ( i.hasNext () ) 
      {
         FileItem fi = (FileItem)i.next();
         if ( !fi.isFormField () )	
         {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
            String contentType = fi.getContentType();
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
            if( fileName.lastIndexOf("\\") >= 0 ){
               file = new File( filePath + fileName.substring( fileName.lastIndexOf("\\"))) ;
            }else{
               file = new File( filePath + fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
            fi.write( file ) ;
                    String upfile=filePath+fileName;
                    ReadExcels.readExcels(upfile);
                    out.println("<html>");
                    out.println("<body>");
                    HttpSession session=request.getSession();
                 response.sendRedirect("fileuploading.jsp");
                 session.setAttribute("filepathas",upfile);
                   // RequestDispatcher rd=request.getRequestDispatcher("fileuploading.jsp");
                   // rd.include(request, response);
                   //out.println("Uploaded Filename:" +upfile+ "<br>");
            out.println("</body>");
            out.println("</html>");
         }
      }
      out.println("</body>");
      out.println("</html>");
   }catch(Exception ex) {
       System.out.println(ex);
   }
   }
   public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, java.io.IOException {
        throw new ServletException("GET method used with " +getClass( ).getName( )+": POST method required.");  
   } 
}
