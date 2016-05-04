/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.taskinsert;

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
public class EnvysionCountProcessingTest {
    
    public EnvysionCountProcessingTest() {
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
     * Test of insertValues method, of class EnvysionCountProcessing.
     */
    @Test
    public void testInsertValues() {
        System.out.println("insertValues");
        EnvysionBean envy = null;
        EnvysionCountProcessing instance = new EnvysionCountProcessing();
        EnvysionBean expResult = null;
        EnvysionBean result = instance.insertValues(envy);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
