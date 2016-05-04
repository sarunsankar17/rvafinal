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
public class ASQAChecklistProcessingTest {
    
    public ASQAChecklistProcessingTest() {
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
     * Test of processASQAChecklist method, of class ASQAChecklistProcessing.
     */
    @Test
    public void testProcessASQAChecklist() {
        System.out.println("processASQAChecklist");
        ASQAChecklistBean asqacl = null;
        ASQAChecklistProcessing instance = new ASQAChecklistProcessing();
        ASQAChecklistBean expResult = null;
        ASQAChecklistBean result = instance.processASQAChecklist(asqacl);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
