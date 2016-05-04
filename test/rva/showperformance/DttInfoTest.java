/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.showperformance;

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
public class DttInfoTest {
    
    public DttInfoTest() {
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
     * Test of getdtttaskname method, of class DttInfo.
     */
    @Test
    public void testGetdtttaskname() {
        System.out.println("getdtttaskname");
        DttInfo instance = new DttInfo();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getdtttaskname();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getdttaudname method, of class DttInfo.
     */
    @Test
    public void testGetdttaudname() {
        System.out.println("getdttaudname");
        DttInfo instance = new DttInfo();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getdttaudname();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
