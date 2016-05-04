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
public class RvaAttendanceBeanTest {
    
    public RvaAttendanceBeanTest() {
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
     * Test of setprofileId method, of class RvaAttendanceBean.
     */
    @Test
    public void testSetprofileId() {
        System.out.println("setprofileId");
        int profileId = 0;
        RvaAttendanceBean instance = new RvaAttendanceBean();
        instance.setprofileId(profileId);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setloginDate method, of class RvaAttendanceBean.
     */
    @Test
    public void testSetloginDate() {
        System.out.println("setloginDate");
        String loginDate = "";
        RvaAttendanceBean instance = new RvaAttendanceBean();
        instance.setloginDate(loginDate);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setStatus method, of class RvaAttendanceBean.
     */
    @Test
    public void testSetStatus() {
        System.out.println("setStatus");
        String status = "";
        RvaAttendanceBean instance = new RvaAttendanceBean();
        instance.setStatus(status);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getprofileId method, of class RvaAttendanceBean.
     */
    @Test
    public void testGetprofileId() {
        System.out.println("getprofileId");
        RvaAttendanceBean instance = new RvaAttendanceBean();
        int expResult = 0;
        int result = instance.getprofileId();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getloginDate method, of class RvaAttendanceBean.
     */
    @Test
    public void testGetloginDate() {
        System.out.println("getloginDate");
        RvaAttendanceBean instance = new RvaAttendanceBean();
        String expResult = "";
        String result = instance.getloginDate();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getStatus method, of class RvaAttendanceBean.
     */
    @Test
    public void testGetStatus() {
        System.out.println("getStatus");
        RvaAttendanceBean instance = new RvaAttendanceBean();
        String expResult = "";
        String result = instance.getStatus();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
