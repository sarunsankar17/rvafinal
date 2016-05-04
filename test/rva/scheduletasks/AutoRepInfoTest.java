/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.scheduletasks;

import java.util.ArrayList;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author admin
 */
public class AutoRepInfoTest {
    
    public AutoRepInfoTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getReportName method, of class AutoRepInfo.
     */
    @Test
    public void testGetReportName() {
        System.out.println("getReportName");
        AutoRepInfo instance = new AutoRepInfo();
        String expResult = "";
        String result = instance.getReportName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of attendanceDate method, of class AutoRepInfo.
     */
    @Test
    public void testAttendanceDate() {
        System.out.println("attendanceDate");
        AutoRepInfo instance = new AutoRepInfo();
        String expResult = "";
        String result = instance.attendanceDate();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getNewJoinees method, of class AutoRepInfo.
     */
    @Test
    public void testGetNewJoinees() {
        System.out.println("getNewJoinees");
        AutoRepInfo instance = new AutoRepInfo();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getNewJoinees();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getRelievedEmps method, of class AutoRepInfo.
     */
    @Test
    public void testGetRelievedEmps() {
        System.out.println("getRelievedEmps");
        AutoRepInfo instance = new AutoRepInfo();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getRelievedEmps();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of reportDate method, of class AutoRepInfo.
     */
    @Test
    public void testReportDate() {
        System.out.println("reportDate");
        AutoRepInfo instance = new AutoRepInfo();
        String expResult = "";
        String result = instance.reportDate();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
