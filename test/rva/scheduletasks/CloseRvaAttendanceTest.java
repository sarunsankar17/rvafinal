/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.scheduletasks;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.quartz.JobExecutionContext;

/**
 *
 * @author admin
 */
public class CloseRvaAttendanceTest {
    
    public CloseRvaAttendanceTest() {
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
     * Test of execute method, of class CloseRvaAttendance.
     */
    @Test
    public void testExecute() throws Exception {
        System.out.println("execute");
        JobExecutionContext context = null;
        CloseRvaAttendance instance = new CloseRvaAttendance();
        instance.execute(context);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
