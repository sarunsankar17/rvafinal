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
public class AddExtraHoursTest {
    
    public AddExtraHoursTest() {
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
     * Test of addMFGHours method, of class AddExtraHours.
     */
    @Test
    public void testAddMFGHours() {
        System.out.println("addMFGHours");
        float indextrahours = 0.0F;
        String startDate = "";
        int auditorsid = 0;
        AddExtraHours instance = new AddExtraHours();
        instance.addMFGHours(indextrahours, startDate, auditorsid);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of addSBVHours method, of class AddExtraHours.
     */
    @Test
    public void testAddSBVHours() {
        System.out.println("addSBVHours");
        float indextrahours = 0.0F;
        String startDate = "";
        int auditorsid = 0;
        AddExtraHours instance = new AddExtraHours();
        instance.addSBVHours(indextrahours, startDate, auditorsid);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
