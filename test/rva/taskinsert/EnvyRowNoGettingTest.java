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
public class EnvyRowNoGettingTest {
    
    public EnvyRowNoGettingTest() {
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
     * Test of getcafeId method, of class EnvyRowNoGetting.
     */
    @Test
    public void testGetcafeId() {
        System.out.println("getcafeId");
        String cafename = "";
        EnvyRowNoGetting instance = new EnvyRowNoGetting();
        int expResult = 0;
        int result = instance.getcafeId(cafename);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of gettaskDetails method, of class EnvyRowNoGetting.
     */
    @Test
    public void testGettaskDetails() {
        System.out.println("gettaskDetails");
        EnvysionBean envybean = null;
        EnvyRowNoGetting instance = new EnvyRowNoGetting();
        EnvysionBean expResult = null;
        EnvysionBean result = instance.gettaskDetails(envybean);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
