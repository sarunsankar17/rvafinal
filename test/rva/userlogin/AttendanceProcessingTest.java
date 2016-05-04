/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.userlogin;

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
public class AttendanceProcessingTest {
    
    public AttendanceProcessingTest() {
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
     * Test of checkStatus method, of class AttendanceProcessing.
     */
    @Test
    public void testCheckStatus() {
        System.out.println("checkStatus");
        RvaAttendanceBean rab = null;
        AttendanceProcessing instance = new AttendanceProcessing();
        RvaAttendanceBean expResult = null;
        RvaAttendanceBean result = instance.checkStatus(rab);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getLoginDate method, of class AttendanceProcessing.
     */
    @Test
    public void testGetLoginDate() {
        System.out.println("getLoginDate");
        int profid = 0;
        AttendanceProcessing instance = new AttendanceProcessing();
        String expResult = "";
        String result = instance.getLoginDate(profid);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getLoginDateTime method, of class AttendanceProcessing.
     */
    @Test
    public void testGetLoginDateTime() {
        System.out.println("getLoginDateTime");
        int profid = 0;
        AttendanceProcessing instance = new AttendanceProcessing();
        String expResult = "";
        String result = instance.getLoginDateTime(profid);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getWorkingTime method, of class AttendanceProcessing.
     */
    @Test
    public void testGetWorkingTime() {
        System.out.println("getWorkingTime");
        int profid = 0;
        AttendanceProcessing instance = new AttendanceProcessing();
        String expResult = "";
        String result = instance.getWorkingTime(profid);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
