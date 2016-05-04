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
public class SetASBillingTest {
    
    public SetASBillingTest() {
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
     * Test of addbilling method, of class SetASBilling.
     */
    @Test
    public void testAddbilling() {
        System.out.println("addbilling");
        String billingmonth = "";
        float billinghours = 0.0F;
        SetASBilling instance = new SetASBilling();
        instance.addbilling(billingmonth, billinghours);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
