/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.taskinsert;

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
public class GettingDTTTaskIdTest {
    
    public GettingDTTTaskIdTest() {
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
     * Test of getTaskid method, of class GettingDTTTaskId.
     */
    @Test
    public void testGetTaskid() {
        System.out.println("getTaskid");
        String taskname = "";
        String processstage = "";
        GettingDTTTaskId instance = new GettingDTTTaskId();
        DTTBean expResult = null;
        DTTBean result = instance.getTaskid(taskname, processstage);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getdttcltname method, of class GettingDTTTaskId.
     */
    @Test
    public void testGetdttcltname() {
        System.out.println("getdttcltname");
        GettingDTTTaskId instance = new GettingDTTTaskId();
        DTTBean expResult = null;
        DTTBean result = instance.getdttcltname();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAuditorsName method, of class GettingDTTTaskId.
     */
    @Test
    public void testGetAuditorsName() {
        System.out.println("getAuditorsName");
        String auditorname = "";
        GettingDTTTaskId instance = new GettingDTTTaskId();
        boolean expResult = false;
        boolean result = instance.getAuditorsName(auditorname);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getdttmissedvalues method, of class GettingDTTTaskId.
     */
    @Test
    public void testGetdttmissedvalues() {
        System.out.println("getdttmissedvalues");
        GettingDTTTaskId instance = new GettingDTTTaskId();
        DTTBean expResult = null;
        DTTBean result = instance.getdttmissedvalues();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
