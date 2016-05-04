/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.userlogin;

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
public class UserInfoTest {
    
    public UserInfoTest() {
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
     * Test of getauditorid method, of class UserInfo.
     */
    @Test
    public void testGetauditorid() {
        System.out.println("getauditorid");
        String auditorname = "";
        UserInfo instance = new UserInfo();
        int expResult = 0;
        int result = instance.getauditorid(auditorname);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getbloodgroup method, of class UserInfo.
     */
    @Test
    public void testGetbloodgroup() {
        System.out.println("getbloodgroup");
        UserInfo instance = new UserInfo();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getbloodgroup();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getDesignation method, of class UserInfo.
     */
    @Test
    public void testGetDesignation() {
        System.out.println("getDesignation");
        UserInfo instance = new UserInfo();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getDesignation();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getrvaprojects method, of class UserInfo.
     */
    @Test
    public void testGetrvaprojects() {
        System.out.println("getrvaprojects");
        UserInfo instance = new UserInfo();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getrvaprojects();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getrvaauditors method, of class UserInfo.
     */
    @Test
    public void testGetrvaauditors() {
        System.out.println("getrvaauditors");
        String startDate = "";
        String endDate = "";
        UserInfo instance = new UserInfo();
        LogBean expResult = null;
        LogBean result = instance.getrvaauditors(startDate, endDate);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
