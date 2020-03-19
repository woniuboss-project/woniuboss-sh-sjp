import xlrd


class Utility:

    # 读取json文件中的内容
    # json是用于存储和数据传递的格式之一.txt是无格式的，处理起来比较麻烦
    # excel，xml，json（key:value）
    @classmethod
    def get_json(cls, path):
        import json
        with open(path) as file:
            contents = json.load(file)
        return contents

    # 传入两个值，判断这两个值是否相同.断言相等
    @classmethod
    def assert_equals(cls, expect, actual):
        if expect == actual:
            return True
        else:
            return False

    # 获取数据库连接
    # 依赖于配置文件的规则
    @classmethod
    def getConn(cls, base_conf_path):
        import pymysql
        db_info = cls.get_json(base_conf_path)
        # 依赖于json数据格式
        return pymysql.connect(db_info['HOSTNAME'], db_info['DBUSER'], db_info['DBPASSWORD'], db_info['DBNAME'],
                               charset='utf8')

    # 查询一条记录
    @classmethod
    def query_one(cls, base_conf_path, sql):
        # 获取数据库连接对象
        conn = cls.getConn(base_conf_path)
        cursor = conn.cursor()
        cursor.execute(sql)
        result = cursor.fetchone()
        cursor.close()
        conn.close()
        # 返回一维元组
        return result

    # 查询多条记录
    @classmethod
    def query_all(cls, base_conf_path, sql):
        # 获取数据库连接对象
        conn = cls.getConn(base_conf_path)
        cursor = conn.cursor()
        cursor.execute(sql)
        result = cursor.fetchall()
        cursor.close()
        conn.close()
        # 返回二维元组
        return result

    # 更新记录
    @classmethod
    def update_data(cls, base_conf_path, sql):
        flag = False
        try:
            conn = cls.getConn(base_conf_path)
            cursor = conn.cursor()
            cursor.execute(sql)
            # 将数据真正提交到数据库中
            conn.commit()
            flag = True
        finally:
            cursor.close()
            conn.close()
            # 不管更新操作是否成功，都会返回真或假的结果
            return flag

    # 从excel中读取内容，读取结果为[{},{},{}]
    # 传递的参数是字典，包含的键是固定值
    @classmethod
    def get_excel_to_dict(cls, xls_file_info):
        # 将excel文件读取到内存中
        workbook = xlrd.open_workbook(xls_file_info['DATAPATH'])
        # 可以根据sheet页的下标或者名称读取sheet页中的内容.下标从0开始
        contents = workbook.sheet_by_name(xls_file_info['SHEETNAME'])
        # contents = workbook.sheet_by_index(0)
        # 读取的目标是[{},{},{}]
        # 定义列表用于存储当前sheet页中的测试信息（测试数据+预期结果）
        test_info = []

        # 按行读取每一条测试信息
        for i in range(xls_file_info['STARTROW'], xls_file_info['ENDROW']):
            # 读取单元格中的内容
            data = contents.cell(i, xls_file_info['DATACOL']).value
            # 读取期望结果列
            expect = contents.cell(i, xls_file_info['EXPECTCOL']).value
            # 获取的是列表
            temp = data.split('\n')
            d = {}
            for t in temp:
                # 给字典添加内容：dict[key] = value
                d[t.split('=')[0]] = t.split('=')[1]
            d['expect'] = expect
            test_info.append(d)
        # 将结果返回
        return test_info

    # 从excel中读取内容，读取结果为[(),(),()]
    @classmethod
    def get_excel_to_tuple(cls, xls_file_info):
        result = cls.get_excel_to_dict(xls_file_info)
        li = []
        for di in result:
            # 通过tuple(dict.vlues())将值集转化为元组
            tup = tuple(di.values())
            li.append(tup)
        return li

# if __name__ == '__main__':
#     test_info = Utility.get_json('..\\config\\testdata.conf')
#     Utility.get_excel_to_tuple(test_info[0])
