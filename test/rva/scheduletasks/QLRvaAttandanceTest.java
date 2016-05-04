/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.scheduletasks;

import javax.servlet.ServletContextEvent;
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
public class QLRvaAttandanceTest {
    
    public QLRvaAttandanceTest() {
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
     * Test of contextInitialized method, of class QLRvaAttandance.
     */
    @Test
    public void testContextInitialized() {
        System.out.println("contextInitialized");
        ServletContextEvent servletContext = null;
        QLRvaAttandance instance = new QLRvaAttandance();
        instance.contextInitialized(servletContext);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of contextDestroyed method, of class QLRvaAttandance.
     */
    @Test
    public void testContextDestroyed() {
        System.out.println("contextDestroyed");
        ServletContextEvent servletContext = null;
        QLRvaAttandance instance = new QLRvaAttandance();
        instance.contextDestroyed(servletContext);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
