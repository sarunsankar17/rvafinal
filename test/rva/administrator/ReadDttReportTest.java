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
public class ReadDttReportTest {
    
    public ReadDttReportTest() {
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
     * Test of readDTTReport method, of class ReadDttReport.
     */
    @Test
    public void testReadDTTReport() throws Exception {
        System.out.println("readDTTReport");
        String filepath = "";
        ReadDttReport instance = new ReadDttReport();
        instance.readDTTReport(filepath);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of readDTTMissedValues method, of class ReadDttReport.
     */
    @Test
    public void testReadDTTMissedValues() {
        System.out.println("readDTTMissedValues");
        ReadDttReport instance = new ReadDttReport();
        instance.readDTTMissedValues();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
