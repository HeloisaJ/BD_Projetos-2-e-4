from flask import Flask, render_template, request, jsonify
import os, re
import db
from models import Pessoa

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World!'

if __name__ == '__main__':
    app.run()

if not os.path.isfile('Biblioteca.db'):
    db.connect()

@app.route("/")
def index():
    return render_template("index.html")

def isValid(email):
    regex = re.compile(r'([A-Za-z0-9]+[.-_])*[A-Za-z0-9]+@[A-Za-z0-9-]+(\.[A-Z|a-z]{2,})+')
    if re.fullmatch(regex, email):
      return True
    else:
      return False


@app.route("/request", methods=['POST'])
def postRequest():
    req_data = request.get_json()
    email = req_data['email']
    if not isValid(email):
        return jsonify({
            'status': '422',
            'res': 'failure',
            'error': 'Invalid email format. Please enter a valid email address'
        })
    
    p_nome = req_data['p_nome']
    sobrenome = req_data['sobrenome']
    genero = req_data['genero']
    p_tipo = req_data['p_tipo']

    pessoas = [p.serialize() for p in db.view()]
    for p in pessoas:
        if p['p_nome'] == p_nome and p['sobrenome'] == sobrenome:
            return jsonify({
                # 'error': '',
                'res': f'Erro ⛔❌! Pessoa {p_nome} {sobrenome} já está registrada!',
                'status': '404'
            })

    pss = Pessoa(p_nome, sobrenome, genero, p_tipo, db.getNewId())
    print('Nova pessoa: ', pss.serialize())
    db.insert(pss)
    new_people = [p.serialize() for p in db.view()]
    print('Pessoas registradas: ', new_people)
    
    return jsonify({
                # 'error': '',
                'res': pss.serialize(),
                'status': '200',
                'msg': 'Success creating a new book!👍😀'
            })


@app.route('/request', methods=['GET'])
def getRequest():
    content_type = request.headers.get('Content-Type')
    pessoas = [p.serialize() for p in db.view()]
    if (content_type == 'application/json'):
        json = request.json
        for p in pessoas:
            if p['id_endereco'] == int(json['id_endereco']):
                return jsonify({
                    # 'error': '',
                    'res': p,
                    'status': '200',
                    'msg': 'Success getting all books in library!👍😀'
                })
        return jsonify({
            'error': f"Error ⛔❌! Book with id '{json['id_endereco']}' not found!",
            'res': '',
            'status': '404'
        })
    else:
        return jsonify({
                    # 'error': '',
                    'res': pessoas,
                    'status': '200',
                    'msg': 'Success getting all books in library!👍😀',
                    'no_of_books': len(pessoas)
                })


@app.route('/request/<id_endereco>', methods=['GET'])
def getRequestId(id_endereco):
    req_args = request.view_args
    # print('req_args: ', req_args)
    pessoas = [p.serialize() for p in db.view()]
    if req_args:
        for p in pessoas:
            if p['id_endereco'] == int(req_args['id_endereco']):
                return jsonify({
                    # 'error': '',
                    'res': p,
                    'status': '200',
                    'msg': 'Success getting book by ID!👍😀'
                })
        return jsonify({
            'error': f"Error ⛔❌! Book with id '{req_args['id_endereco']}' was not found!",
            'res': '',
            'status': '404'
        })
    else:
        return jsonify({
                    # 'error': '',
                    'res': pessoas,
                    'status': '200',
                    'msg': 'Success getting book by ID!👍😀',
                    'no_of_books': len(pessoas)
                })

@app.route("/request", methods=['PUT'])
def putRequest():
    req_data = request.get_json()

    p_nome = req_data['p_nome']
    sobrenome = req_data['sobrenome']
    genero = req_data['genero']
    p_tipo = req_data['p_tipo']
    id_endereco = req_data['id_endereco']
    pessoas = [p.serialize() for p in db.view()]

    for p in pessoas:
        if p['id'] == id_endereco:
            pss = Pessoa(
                p_nome, 
                sobrenome, 
                genero, 
                p_tipo,
                id_endereco
            )
            print('new book: ', pss.serialize())
            db.update(pss)
            new_people = [b.serialize() for b in db.view()]
            print('Usuários registrados: ', new_people)
            return jsonify({
                # 'error': '',
                'res': pss.serialize(),
                'status': '200',
                'msg': f'Usuário {p_nome} {sobrenome} atualizado!👍😀'
            })        
    return jsonify({
                # 'error': '',
                'res': f'Error ⛔❌! Falha ao atualizar: {p_nome} {sobrenome}!',
                'status': '404'
            })
    
    


@app.route('/request/<id_endereco>', methods=['DELETE'])
def deleteRequest(id_endereco):
    req_args = request.view_args
    print('req_args: ', req_args)
    pessoas = [p.serialize() for p in db.view()]
    if req_args:
        for p in pessoas:
            if p['id_endereco'] == int(req_args['id']):
                db.delete(p['id_endereco'])
                usuarios_att = [p.serialize() for p in db.view()]
                print('updated_bks: ', usuarios_att)
                return jsonify({
                    'res': usuarios_att,
                    'status': '200',
                    'msg': 'Success deleting book by ID!👍😀',
                    'no_of_books': len(usuarios_att)
                })
    else:
        return jsonify({
            'error': f"Error ⛔❌! No Book ID sent!",
            'res': '',
            'status': '404'
        })

if __name__ == '__main__':
    app.run()