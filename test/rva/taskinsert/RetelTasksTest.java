/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.taskinsert;

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
public class RetelTasksTest {
    
    public RetelTasksTest() {
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
     * Test of getretTasks method, of class RetelTasks.
     */
    @Test
    public void testGetretTasks() {
        System.out.println("getretTasks");
        RetelTasks instance = new RetelTasks();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getretTasks();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getauditorName method, of class RetelTasks.
     */
    @Test
    public void testGetauditorName() {
        System.out.println("getauditorName");
        RetelTasks instance = new RetelTasks();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getauditorName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
