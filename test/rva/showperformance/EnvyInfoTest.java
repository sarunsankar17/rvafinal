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
public class EnvyInfoTest {
    
    public EnvyInfoTest() {
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
     * Test of getencafename method, of class EnvyInfo.
     */
    @Test
    public void testGetencafename() {
        System.out.println("getencafename");
        EnvyInfo instance = new EnvyInfo();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getencafename();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getentaskname method, of class EnvyInfo.
     */
    @Test
    public void testGetentaskname() {
        System.out.println("getentaskname");
        EnvyInfo instance = new EnvyInfo();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getentaskname();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getenaudname method, of class EnvyInfo.
     */
    @Test
    public void testGetenaudname() {
        System.out.println("getenaudname");
        EnvyInfo instance = new EnvyInfo();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getenaudname();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
