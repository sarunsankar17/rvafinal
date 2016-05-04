/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.administrator;

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
public class CalculateExtraHoursTest {
    
    public CalculateExtraHoursTest() {
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
     * Test of getExtraHours method, of class CalculateExtraHours.
     */
    @Test
    public void testGetExtraHours() {
        System.out.println("getExtraHours");
        float individualhours = 0.0F;
        float astotalhours = 0.0F;
        float hoursdiff = 0.0F;
        CalculateExtraHours instance = new CalculateExtraHours();
        float expResult = 0.0F;
        float result = instance.getExtraHours(individualhours, astotalhours, hoursdiff);
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
