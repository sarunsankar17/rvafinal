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
import org.junit.runner.RunWith;
import org.junit.runners.Suite;

/**
 *
 * @author admin
 */
@RunWith(Suite.class)
@Suite.SuiteClasses({rva.scheduletasks.ScheduleReportSendingTest.class, rva.scheduletasks.QLRvaAttandanceTest.class, rva.scheduletasks.AutoReportGenerationTest.class, rva.scheduletasks.AutoReportBeanTest.class, rva.scheduletasks.AutoRepInfoTest.class, rva.scheduletasks.TestReportSendingTest.class, rva.scheduletasks.JXLCellFormattingTest.class, rva.scheduletasks.CloseRvaAttendanceTest.class})
public class ScheduletasksSuite {

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
    }

    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {
    }
    
}
