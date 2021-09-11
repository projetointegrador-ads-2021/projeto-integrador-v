# -*- coding: utf-8 -*-
import mysql.connector as mysql

class conn:

    def __init__(self, config):
        self.config = config

    # Funcao para estabelecer e retornar a conexao
    def getConn(self):
        try:
            if 'database' in self.config:
                self.conn = mysql.connect(host=self.config['host'],
                                          user=self.config['user'],
                                          passwd=self.config['pass'],
                                          port=self.config['port'],
                                          database=self.config['database'],
                                          charset='utf8')
            else:
                self.conn = mysql.connect(host=self.config['host'],
                                          user=self.config['user'],
                                          passwd=self.config['pass'],
                                          port=self.config['port'],
                                          charset='utf8')

            self.cursor = self.conn.cursor(raw=True)
            self.isConnected = True
        except mysql.Error as err:
            if err.errno == mysql.errorcode.ER_ACCESS_DENIED_ERROR:
                print("Incorrect username/password")
                exit()
            elif err.errno == mysql.errorcode.ER_BAD_DB_ERROR:
                print("Database does not exists")
                exit()
            else:
                print("ERROR: Connect failed: " + str(err))
                exit()

        return self.conn
