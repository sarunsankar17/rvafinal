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
public class RetelTNameTest {
    
    public RetelTNameTest() {
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
     * Test of getrtname method, of class RetelTName.
     */
    @Test
    public void testGetrtname() {
        System.out.println("getrtname");
        RetelTName instance = new RetelTName();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getrtname();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getauditorName method, of class RetelTName.
     */
    @Test
    public void testGetauditorName() {
        System.out.println("getauditorName");
        RetelTName instance = new RetelTName();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getauditorName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
