/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva;

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
@Suite.SuiteClasses({rva.showperformance.ShowperformanceSuite.class, rva.scheduletasks.ScheduletasksSuite.class, rva.dbaccess.DbaccessSuite.class, rva.taskinsert.TaskinsertSuite.class, rva.administrator.AdministratorSuite.class, rva.userlogin.UserloginSuite.class})
public class RvaSuite {

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
