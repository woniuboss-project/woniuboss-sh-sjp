import time
import unittest
from parameterized import parameterized
from woniuboss.Util.Service import Service
from woniuboss.Util.Utils import Utility
test_data = Utility.get_json('..\\config\\testdata.conf')
login_info = Utility.get_excel_to_tuple(test_data[0])

class LoginTest(unittest.TestCase):

    @classmethod
    def setUp(cls):
        cls.driver = Service.get_driver('..\\config\\base.conf')
        from woniuboss.Service.login import Login
        cls.login = Login(cls.driver)

    @classmethod
    def tearDown(cls):
        cls.driver.quit()

    @parameterized.expand(login_info)
    def test_login(self,uname,upass,vfcode,expect):
        login_data = {'username': uname, 'password': upass, 'verifycode': vfcode}
        self.login.do_login('..\\config\\base.conf',login_data)
        from selenium.webdriver.common.by import By
        if Service.is_element_present(self.driver, By.LINK_TEXT, '注销'):
            actual = 'login-pass'
            self.driver.find_element_by_link_text('注销').click()
        else:
            actual = 'login-fail'
            self.driver.refresh()
        self.assertEqual(actual, expect)