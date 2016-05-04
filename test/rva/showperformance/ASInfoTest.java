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
public class ASInfoTest {
    
    public ASInfoTest() {
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
     * Test of getasauditorsName method, of class ASInfo.
     */
    @Test
    public void testGetasauditorsName() {
        System.out.println("getasauditorsName");
        ASInfo instance = new ASInfo();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getasauditorsName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getasclientName method, of class ASInfo.
     */
    @Test
    public void testGetasclientName() {
        System.out.println("getasclientName");
        ASInfo instance = new ASInfo();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getasclientName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getasqaclientName method, of class ASInfo.
     */
    @Test
    public void testGetasqaclientName() {
        System.out.println("getasqaclientName");
        ASInfo instance = new ASInfo();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getasqaclientName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getasqaauditoName method, of class ASInfo.
     */
    @Test
    public void testGetasqaauditoName() {
        System.out.println("getasqaauditoName");
        ASInfo instance = new ASInfo();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getasqaauditoName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getaslocationName method, of class ASInfo.
     */
    @Test
    public void testGetaslocationName() {
        System.out.println("getaslocationName");
        String cname = "";
        ASInfo instance = new ASInfo();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getaslocationName(cname);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getasshiftTime method, of class ASInfo.
     */
    @Test
    public void testGetasshiftTime() {
        System.out.println("getasshiftTime");
        ASInfo instance = new ASInfo();
        ArrayList<String> expResult = null;
        ArrayList<String> result = instance.getasshiftTime();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
