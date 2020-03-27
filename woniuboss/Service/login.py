from woniuboss.Util.Service import Service

class Login:
    def __init__(self,driver):
        self.driver = driver
    # 输入用户名
    def input_uname(self, username):
        uname = self.driver.find_element_by_name('userName')
        Service.send_input(uname, username)

    # 输入密码
    def input_upass(self, password):
        upass = self.driver.find_element_by_name('userPass')
        Service.send_input(upass, password)

    # 输入验证码
    def input_vfcode(self, verifycode):
        vfcode = self.driver.find_element_by_name('checkcode')
        Service.send_input(vfcode, verifycode)

    # 点击登录按钮
    def click_button(self):
        self.driver.find_element_by_css_selector('.btn').click()

    def do_login(self, base_config_path, login_data):
        Service.open_page(self.driver, base_config_path)
        self.input_uname(login_data['username'])
        self.input_upass(login_data['password'])
        self.input_vfcode(login_data['verifycode'])
        self.click_button()