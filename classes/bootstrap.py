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

        # Importa arquivo de configuração de ambiente da aplicação
        with open(current_path + '/../config/env.json', 'r') as f:
            env = json.load(f)

        # Importa arquivo de configuração do banco
        with open(current_path + '/../config/database.json', 'r') as f:
            database = json.load(f)

        # Carrega o ambiente que estiver definido na configuração(Banco de dados)
        database = database[env['environment']]

        self.config = {"env": env, "database": database}

    def initDependencies(self):
        # Inicializa a conexão
        self.conn = conn(self.config['database']).getConn()
