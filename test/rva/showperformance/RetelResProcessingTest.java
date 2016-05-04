/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.showperformance;

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
public class RetelResProcessingTest {
    
    public RetelResProcessingTest() {
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
     * Test of processRetelCount method, of class RetelResProcessing.
     */
    @Test
    public void testProcessRetelCount() {
        System.out.println("processRetelCount");
        RetelBean rbe = null;
        RetelResProcessing instance = new RetelResProcessing();
        RetelBean expResult = null;
        RetelBean result = instance.processRetelCount(rbe);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
