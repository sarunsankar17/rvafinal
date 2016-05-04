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
public class RetelInfoTest {
    
    public RetelInfoTest() {
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
     * Test of getrtaskname method, of class RetelInfo.
     */
    @Test
    public void testGetrtaskname() {
        System.out.println("getrtaskname");
        RetelInfo instance = new RetelInfo();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getrtaskname();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getraudname method, of class RetelInfo.
     */
    @Test
    public void testGetraudname() {
        System.out.println("getraudname");
        RetelInfo instance = new RetelInfo();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getraudname();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
