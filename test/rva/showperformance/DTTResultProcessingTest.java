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
import rva.taskinsert.DTTBean;

/**
 *
 * @author admin
 */
public class DTTResultProcessingTest {
    
    public DTTResultProcessingTest() {
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
     * Test of dttresultProcessing method, of class DTTResultProcessing.
     */
    @Test
    public void testDttresultProcessing() {
        System.out.println("dttresultProcessing");
        DTTBean dttbean = null;
        DTTResultProcessing instance = new DTTResultProcessing();
        DTTBean expResult = null;
        DTTBean result = instance.dttresultProcessing(dttbean);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
