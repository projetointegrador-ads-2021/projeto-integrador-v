# -*- coding: utf-8 -*-
from flask import Flask, request
from flask_restful import Resource, Api
from flask_jsonpify import jsonify
from classes.bootstrap import bootstrap
import json

#Inicializa aplicacao
app = Flask(__name__)
app.classes = bootstrap()

#Inicializa flask restful
api = Api(app)

class GetAll(Resource):
    def get(self):
        cursor = app.classes.conn.cursor(dictionary=True, buffered=True)
        query = 'select * from tb_marca'
        cursor.execute(query)
        rows = cursor.fetchall()
        json_data=[]
        for result in rows:
           json_data.append(dict(zip(row_headers,result)))
        return json.dumps({'status': 'success', 'data': json_data})

class Insert(Resource):
    def post(self):
        data = request.get_json(force=True)
        try:
            cursor = app.classes.conn.cursor()
            sql = 'insert into tb_marca (nome_marca) values ("' + data['nome_marca'] + '")'
            cursor.execute(sql)
            app.classes.conn.commit()
            return json.dumps({'status': 'success', 'message': 'Marca inserida com sucesso!'})
        except:
            return json.dumps({'status': 'error', 'message': 'Ocorreu um erro inesperado!'})

class Update(Resource):
    def post(self):
        data = request.get_json(force=True)
        try:
            cursor = app.classes.conn.cursor()
            sql = 'update tb_marca set nome_marca = "' + data['nome_marca'] + '" where cod_marca = ' + data['cod_marca'] + ''
            cursor.execute(sql)            
            app.classes.conn.commit()
            return json.dumps({'status': 'success', 'message': 'Marca alterada com sucesso!'})
        except:
            return json.dumps({'status': 'error', 'message': 'Ocorreu um erro inesperado!'})

class Delete(Resource):
    def post(self):
        data = request.get_json(force=True)
        try:
            cursor = app.classes.conn.cursor()
            sql = 'delete from tb_marca where cod_marca = ' + data['cod_marca'] + ''
            cursor.execute(sql)            
            app.classes.conn.commit()
            return json.dumps({'status': 'success', 'message': 'Marca excluida com sucesso!'})
        except:
            return json.dumps({'status': 'error', 'message': 'Ocorreu um erro inesperado!'})

api.add_resource(GetAll, '/microservico/marca')
api.add_resource(Insert, '/microservico/marca/inserir') 
api.add_resource(Update, '/microservico/marca/alterar')
api.add_resource(Delete, '/microservico/marca/deletar')

if __name__ == '__main__':
    app.run(port='5002', debug=True)
