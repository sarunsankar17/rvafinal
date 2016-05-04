/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.scheduletasks;

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
public class AutoReportGenerationTest {
    
    public AutoReportGenerationTest() {
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
     * Test of getAttendanceDet method, of class AutoReportGeneration.
     */
    @Test
    public void testGetAttendanceDet() {
        System.out.println("getAttendanceDet");
        AutoReportGeneration instance = new AutoReportGeneration();
        AutoReportBean expResult = null;
        AutoReportBean result = instance.getAttendanceDet();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPerformanceReport method, of class AutoReportGeneration.
     */
    @Test
    public void testGetPerformanceReport() {
        System.out.println("getPerformanceReport");
        AutoReportGeneration instance = new AutoReportGeneration();
        AutoReportBean expResult = null;
        AutoReportBean result = instance.getPerformanceReport();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
