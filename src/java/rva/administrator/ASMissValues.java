/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.administrator;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author Arun-S
 */
public class ASMissValues extends HttpServlet {

    static final long serialVersionUID = 1L;
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
        ASMissValRead.readMissVal();
        //asm.ReadValues();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        RequestDispatcher rd=request.getRequestDispatcher("asmissedvalues.jsp");
        rd.forward(request, response);
    }
}

