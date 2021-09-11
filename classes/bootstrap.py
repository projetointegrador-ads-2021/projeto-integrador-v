# -*- coding: utf-8 -*-
import os.path
import json
from .conn import conn

class bootstrap():
    def __init__(self):
        self.initConf()
        self.initDependencies()

    def initConf(self):
        current_path = os.path.dirname(os.path.abspath(__file__))

        # Importa arquivo de configura��o de ambiente da aplica��o
        with open(current_path + '/../config/env.json', 'r') as f:
            env = json.load(f)

        # Importa arquivo de configura��o do banco
        with open(current_path + '/../config/database.json', 'r') as f:
            database = json.load(f)

        # Carrega o ambiente que estiver definido na configura��o(Banco de dados)
        database = database[env['environment']]

        self.config = {"env": env, "database": database}

    def initDependencies(self):
        # Inicializa a conex�o
        self.conn = conn(self.config['database']).getConn()
