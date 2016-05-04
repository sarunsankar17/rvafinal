/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rva.userlogin;

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
public class LoginCheckDAOTest {
    
    public LoginCheckDAOTest() {
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
     * Test of loginCheck method, of class LoginCheckDAO.
     */
    @Test
    public void testLoginCheck() {
        System.out.println("loginCheck");
        LogBean lb = null;
        LoginCheckDAO instance = new LoginCheckDAO();
        LogBean expResult = null;
        LogBean result = instance.loginCheck(lb);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
