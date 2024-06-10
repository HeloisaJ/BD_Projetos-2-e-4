from flask import Flask, render_template, request, jsonify
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'admin'
app.config['MYSQL_PASSWORD'] = '1234'
app.config['MYSQL_DB'] = 'crud'

mysql = MySQL(app)

if __name__ == '__main__':
    app.run()

@app.route('/')
def hello_world():
    return 'Hello World!'

@app.route("/home")
def home():
    return render_template("index.html")



#------------------------ GET



@app.route('/pessoa', methods=['GET'])
def getPessoa():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM pessoa")
    data = cur.fetchall()
    cur.close()
    return jsonify(data)

@app.route('/endereco', methods=['GET'])
def getEndereco():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM endereco")
    data = cur.fetchall()
    cur.close()
    return jsonify(data)

@app.route('/endereco/<int:endereco_id>', methods=['GET'])
def getEnderecoById(endereco_id):
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM endereco WHERE id_endereco = %s", (endereco_id,))
    data = cur.fetchall()
    cur.close()
    return jsonify(data)

@app.route('/professor', methods=['GET'])
def getProfessor():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM professor")
    data = cur.fetchall()
    cur.close()
    return jsonify(data)



#----------------------------- POST



@app.route('/endereco', methods=['POST'])
def create_endereco():
    if request.method == 'POST':
        # Get data from the request
        data = request.get_json()

        rua = data.get('rua')
        bairro = data.get('bairro')
        estado = data.get('estado')
        cidade = data.get('cidade')
        numero = data.get('numero')
        
        # Insert data into the database
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO endereco (rua, bairro, estado, cidade, numero) VALUES (%s, %s, %s, %s, %s)", (rua, bairro, estado, cidade, numero))
        mysql.connection.commit()

        endereco_id = cur.lastrowid

        cur.execute("SELECT * FROM endereco WHERE id_endereco = %s", (endereco_id,))
        new_endereco = cur.fetchone()
        cur.close()

        return jsonify(new_endereco), 201
    else:
        return jsonify({"error": "Method not allowed"}), 405

@app.route('/pessoa', methods=['POST'])
def create_pessoa():
    if request.method == 'POST':
        # Get data from the request
        data = request.get_json()

        p_nome = data.get('p_nome')
        sobrenome = data.get('sobrenome')
        genero = data.get('genero')
        p_tipo = data.get('p_tipo')
        id_endereco = data.get('id_endereco')
        
        # Insert data into the database
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO pessoa (p_nome, sobrenome, genero, p_tipo, id_endereco) VALUES (%s, %s, %s, %s, %s)", (p_nome, sobrenome, genero, p_tipo, id_endereco))
        mysql.connection.commit()


        pessoa_id = cur.lastrowid

        cur.execute("SELECT * FROM pessoa WHERE id_pessoa = %s", (pessoa_id,))
        new_pessoa = cur.fetchone()
        cur.close()

        return jsonify(new_pessoa), 201
    else:
        return jsonify({"error": "Method not allowed"}), 405
    
@app.route('/professor', methods=['POST'])
def create_professor():
    if request.method == 'POST':
        # Get data from the request
        data = request.get_json()

        valor_hora = data.get('valor_hora')
        formacao = data.get('formacao')
        cpf = data.get('cpf')
        horas_trabalhadas = data.get('horas_trabalhadas')
        id_pessoa = data.get('id_pessoa')
        
        # Insert data into the database
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO professor (valor_hora, formacao, cpf, horas_trabalhadas, id_pessoa) VALUES (%s, %s, %s, %s, %s)", (valor_hora, formacao, cpf, horas_trabalhadas, id_pessoa))
        mysql.connection.commit()
        cur.close()

        return jsonify({"message": "Professor created successfully"}), 201
    else:
        return jsonify({"error": "Method not allowed"}), 405
    


#------------------- DELETE
    

@app.route('/endereco/<int:endereco_id>', methods=['DELETE'])
def delete_endereco(endereco_id):
    if request.method == 'DELETE':
        # Delete data from the database
        cur = mysql.connection.cursor()
        cur.execute("DELETE FROM endereco WHERE id_endereco = %s", (endereco_id,))
        mysql.connection.commit()
        cur.close()

        return jsonify({"message": f"Endereco with ID {endereco_id} deleted successfully"}), 200
    else:
        return jsonify({"error": "Method not allowed"}), 405

@app.route('/pessoa/<int:pessoa_id>', methods=['DELETE'])
def delete_pessoa(pessoa_id):
    if request.method == 'DELETE':
        # Delete data from the database
        cur = mysql.connection.cursor()
        cur.execute("DELETE FROM pessoa WHERE id_pessoa = %s", (pessoa_id,))
        mysql.connection.commit()
        cur.close()

        return jsonify({"message": f"Pessoa with ID {pessoa_id} deleted successfully"}), 200
    else:
        return jsonify({"error": "Method not allowed"}), 405
    

@app.route('/professor/<int:pessoa_id>', methods=['DELETE'])
def delete_professor(pessoa_id):
    if request.method == 'DELETE':
        # Delete data from the database
        cur = mysql.connection.cursor()
        cur.execute("DELETE FROM professor WHERE id_pessoa = %s", (pessoa_id,))
        mysql.connection.commit()
        cur.close()

        return jsonify({"message": f"Professor with ID {pessoa_id} deleted successfully"}), 200
    else:
        return jsonify({"error": "Method not allowed"}), 405



#---------------------- PUT


@app.route('/endereco/<int:endereco_id>', methods=['PUT'])
def update_endereco(endereco_id):
    if request.method == 'PUT':
        # Get data from the request
        data = request.get_json()

        id_endereco = data.get('id_endereco')
        rua = data.get('rua')
        bairro = data.get('bairro')
        estado = data.get('estado')
        cidade = data.get('cidade')
        numero = data.get('numero')
        # Add more fields as needed
        
        # Update data in the database
        cur = mysql.connection.cursor()
        cur.execute("UPDATE endereco SET rua = %s, bairro = %s, estado = %s, cidade = %s, numero = %s WHERE id_endereco = %s", (rua, bairro, estado, cidade, numero, endereco_id))
        mysql.connection.commit()
        cur.close()

        return jsonify({"message": "Pessoa updated successfully"}), 200
    else:
        return jsonify({"error": "Method not allowed"}), 405

@app.route('/pessoa/<int:pessoa_id>', methods=['PUT'])
def update_pessoa(pessoa_id):
    if request.method == 'PUT':
        # Get data from the request
        data = request.get_json()

        p_nome = data.get('p_nome')
        sobrenome = data.get('sobrenome')
        genero = data.get('genero')
        p_tipo = data.get('p_tipo')
        id_endereco = data.get('id_endereco')
        # Add more fields as needed
        
        # Update data in the database
        cur = mysql.connection.cursor()
        cur.execute("UPDATE pessoa SET p_nome = %s, sobrenome = %s, genero = %s, p_tipo = %s, id_endereco = %s WHERE id_pessoa = %s", (p_nome, sobrenome, genero, p_tipo, id_endereco, pessoa_id))
        mysql.connection.commit()
        cur.close()

        return jsonify({"message": "Pessoa updated successfully"}), 200
    else:
        return jsonify({"error": "Method not allowed"}), 405
    

@app.route('/professor/<int:pessoa_id>', methods=['PUT'])
def update_professor(pessoa_id):
    if request.method == 'PUT':
        # Get data from the request
        data = request.get_json()

        valor_hora = data.get('valor_hora')
        formacao = data.get('formacao')
        horas_trabalhadas = data.get('horas_trabalhadas')
        # Add more fields as needed
        
        # Update data in the database
        cur = mysql.connection.cursor()
        cur.execute("UPDATE professor SET valor_hora = %s, formacao = %s, horas_trabalhadas = %s WHERE id_pessoa = %s", (valor_hora, formacao, horas_trabalhadas, pessoa_id))
        mysql.connection.commit()
        cur.close()

        return jsonify({"message": "Professor updated successfully"}), 200
    else:
        return jsonify({"error": "Method not allowed"}), 405