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
public class ASChecklistProcessingTest {
    
    public ASChecklistProcessingTest() {
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
     * Test of processValues method, of class ASChecklistProcessing.
     */
    @Test
    public void testProcessValues() {
        System.out.println("processValues");
        ASChecklistBean cb = null;
        ASChecklistProcessing instance = new ASChecklistProcessing();
        ASChecklistBean expResult = null;
        ASChecklistBean result = instance.processValues(cb);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
