/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.administrator;

import java.util.Date;
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
public class ChangeDateFormatTest {
    
    public ChangeDateFormatTest() {
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
     * Test of toTime method, of class ChangeDateFormat.
     */
    @Test
    public void testToTime() {
        System.out.println("toTime");
        String time = "";
        ChangeDateFormat instance = new ChangeDateFormat();
        String expResult = "";
        String result = instance.toTime(time);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of toAppDate method, of class ChangeDateFormat.
     */
    @Test
    public void testToAppDate() {
        System.out.println("toAppDate");
        String dbDate = "";
        ChangeDateFormat instance = new ChangeDateFormat();
        String expResult = "";
        String result = instance.toAppDate(dbDate);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of toDbDate method, of class ChangeDateFormat.
     */
    @Test
    public void testToDbDate() {
        System.out.println("toDbDate");
        String appDate = "";
        ChangeDateFormat instance = new ChangeDateFormat();
        String expResult = "";
        String result = instance.toDbDate(appDate);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of toAppDateTime method, of class ChangeDateFormat.
     */
    @Test
    public void testToAppDateTime() {
        System.out.println("toAppDateTime");
        String dbDateTime = "";
        ChangeDateFormat instance = new ChangeDateFormat();
        String expResult = "";
        String result = instance.toAppDateTime(dbDateTime);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of todbDateTimeAttend method, of class ChangeDateFormat.
     */
    @Test
    public void testTodbDateTimeAttend() {
        System.out.println("todbDateTimeAttend");
        Date date = null;
        ChangeDateFormat instance = new ChangeDateFormat();
        String expResult = "";
        String result = instance.todbDateTimeAttend(date);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of todbdateformat method, of class ChangeDateFormat.
     */
    @Test
    public void testTodbdateformat() {
        System.out.println("todbdateformat");
        String my = "";
        ChangeDateFormat instance = new ChangeDateFormat();
        String expResult = "";
        String result = instance.todbdateformat(my);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setEndDate method, of class ChangeDateFormat.
     */
    @Test
    public void testSetEndDate() {
        System.out.println("setEndDate");
        String startDate = "";
        ChangeDateFormat instance = new ChangeDateFormat();
        String expResult = "";
        String result = instance.setEndDate(startDate);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setRepDate method, of class ChangeDateFormat.
     */
    @Test
    public void testSetRepDate() {
        System.out.println("setRepDate");
        Date date = null;
        ChangeDateFormat instance = new ChangeDateFormat();
        String expResult = "";
        String result = instance.setRepDate(date);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of toRepDateTime method, of class ChangeDateFormat.
     */
    @Test
    public void testToRepDateTime() {
        System.out.println("toRepDateTime");
        String appdt = "";
        ChangeDateFormat instance = new ChangeDateFormat();
        Date expResult = null;
        Date result = instance.toRepDateTime(appdt);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of todbDate method, of class ChangeDateFormat.
     */
    @Test
    public void testTodbDate() {
        System.out.println("todbDate");
        Date date = null;
        ChangeDateFormat instance = new ChangeDateFormat();
        String expResult = "";
        String result = instance.todbDate(date);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of dbDatetoAppDate method, of class ChangeDateFormat.
     */
    @Test
    public void testDbDatetoAppDate() {
        System.out.println("dbDatetoAppDate");
        String dbdate = "";
        ChangeDateFormat instance = new ChangeDateFormat();
        String expResult = "";
        String result = instance.dbDatetoAppDate(dbdate);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
