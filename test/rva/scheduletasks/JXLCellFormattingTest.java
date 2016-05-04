/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.scheduletasks;

import jxl.write.DateTime;
import jxl.write.Number;
import jxl.write.WritableCellFormat;
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
public class JXLCellFormattingTest {
    
    public JXLCellFormattingTest() {
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
     * Test of getHeadFormat method, of class JXLCellFormatting.
     */
    @Test
    public void testGetHeadFormat() throws Exception {
        System.out.println("getHeadFormat");
        JXLCellFormatting instance = new JXLCellFormatting();
        WritableCellFormat expResult = null;
        WritableCellFormat result = instance.getHeadFormat();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getDTFormat method, of class JXLCellFormatting.
     */
    @Test
    public void testGetDTFormat() throws Exception {
        System.out.println("getDTFormat");
        int c = 0;
        int r = 0;
        String val = "";
        JXLCellFormatting instance = new JXLCellFormatting();
        DateTime expResult = null;
        DateTime result = instance.getDTFormat(c, r, val);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTimeFormat method, of class JXLCellFormatting.
     */
    @Test
    public void testGetTimeFormat() throws Exception {
        System.out.println("getTimeFormat");
        JXLCellFormatting instance = new JXLCellFormatting();
        WritableCellFormat expResult = null;
        WritableCellFormat result = instance.getTimeFormat();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getIntNumFormat method, of class JXLCellFormatting.
     */
    @Test
    public void testGetIntNumFormat() throws Exception {
        System.out.println("getIntNumFormat");
        int c = 0;
        int r = 0;
        int val = 0;
        JXLCellFormatting instance = new JXLCellFormatting();
        Number expResult = null;
        Number result = instance.getIntNumFormat(c, r, val);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getIntBNumFormat method, of class JXLCellFormatting.
     */
    @Test
    public void testGetIntBNumFormat() throws Exception {
        System.out.println("getIntBNumFormat");
        int c = 0;
        int r = 0;
        int val = 0;
        JXLCellFormatting instance = new JXLCellFormatting();
        Number expResult = null;
        Number result = instance.getIntBNumFormat(c, r, val);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getFPNumFormat method, of class JXLCellFormatting.
     */
    @Test
    public void testGetFPNumFormat() throws Exception {
        System.out.println("getFPNumFormat");
        int c = 0;
        int r = 0;
        float val = 0.0F;
        JXLCellFormatting instance = new JXLCellFormatting();
        Number expResult = null;
        Number result = instance.getFPNumFormat(c, r, val);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getFPBNumFormat method, of class JXLCellFormatting.
     */
    @Test
    public void testGetFPBNumFormat() throws Exception {
        System.out.println("getFPBNumFormat");
        int c = 0;
        int r = 0;
        float val = 0.0F;
        JXLCellFormatting instance = new JXLCellFormatting();
        Number expResult = null;
        Number result = instance.getFPBNumFormat(c, r, val);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTitleFormat method, of class JXLCellFormatting.
     */
    @Test
    public void testGetTitleFormat() {
        System.out.println("getTitleFormat");
        JXLCellFormatting instance = new JXLCellFormatting();
        WritableCellFormat expResult = null;
        WritableCellFormat result = instance.getTitleFormat();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getNameFormat method, of class JXLCellFormatting.
     */
    @Test
    public void testGetNameFormat() throws Exception {
        System.out.println("getNameFormat");
        JXLCellFormatting instance = new JXLCellFormatting();
        WritableCellFormat expResult = null;
        WritableCellFormat result = instance.getNameFormat();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getlabelFormat method, of class JXLCellFormatting.
     */
    @Test
    public void testGetlabelFormat() throws Exception {
        System.out.println("getlabelFormat");
        JXLCellFormatting instance = new JXLCellFormatting();
        WritableCellFormat expResult = null;
        WritableCellFormat result = instance.getlabelFormat();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
