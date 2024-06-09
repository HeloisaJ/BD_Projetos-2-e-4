import sqlite3, random, datetime
from models import Pessoa


def getNewId():
    return random.getrandbits(28)


pessoas = [
    {
        'p_nome': 'João Gabriel',
        'sobrenome': 'Torres do Nascimento',
        'genero': 'M',
        'p_tipo': 'aluno',
    },
    {
        "p_nome": "Maria Eduarda",
        "sobrenome": "Silva Fernandes",
        "genero": "F",
        "p_tipo": "aluno"
    },
    {
        "p_nome": "Carlos Henrique",
        "sobrenome": "Pereira Souza",
        "genero": "M",
        "p_tipo": "professor"
    },
    {
        "p_nome": "Ana Beatriz",
        "sobrenome": "Oliveira Costa",
        "genero": "F",
        "p_tipo": "aluno"
    },
    {
        "p_nome": "Lucas Matheus",
        "sobrenome": "Almeida Santos",
        "genero": "M",
        "p_tipo": "professor"
    },
    {
        "p_nome": "Fernanda Cristina",
        "sobrenome": "Barros Lima",
        "genero": "F",
        "p_tipo": "aluno"
    }
]    

def connect():
    conn = sqlite3.connect('Biblioteca.db')
    cur = conn.cursor()
    cur.execute("CREATE TABLE IF NOT EXISTS pessoa (p_nome VARCHAR(500) NOT NULL, sobrenome VARCHAR(500) NOT NULL, genero CHAR NOT NULL, p_tipo VARCHAR(50) NOT NULL, id_pessoa INTEGER auto_increment PRIMARY KEY, id_endereco INTEGER)")
    conn.commit()
    conn.close()
    for i in pessoas:
        pss = Pessoa(i['p_nome'], i['sobrenome'], i['genero'], i['p_tipo'], getNewId())
        insert(pss)

def insert(pessoa):
    conn = sqlite3.connect('Biblioteca.db')
    cur = conn.cursor()
    cur.execute("INSERT INTO books VALUES (?,?,?,?,?)", (
        pessoa.p_nome,
        pessoa.sobrenome,
        pessoa.genero,
        pessoa.p_tipo,
        pessoa.id_endereco
    ))
    conn.commit()
    conn.close()

def view():
    conn = sqlite3.connect('Biblioteca.db')
    cur = conn.cursor()
    cur.execute("SELECT * FROM pessoa")
    rows = cur.fetchall()
    pessoas = []
    for i in rows:
        pessoa = Pessoa(i[0], i[1], i[2], i[3], i[4])
        pessoas.append(pessoa)
    conn.close()
    return pessoas

def update(pessoa):
    conn = sqlite3.connect('Biblioteca.db')
    cur = conn.cursor()
    cur.execute("UPDATE pessoa SET p_nome=?, sobrenome=? WHERE id_endereco=?", (pessoa.p_nome, pessoa.sobrenome, pessoa.id_endereco))
    conn.commit()
    conn.close()

def delete(theId):
    conn = sqlite3.connect('Biblioteca.db')
    cur = conn.cursor()
    cur.execute("DELETE FROM pessoa WHERE id_endereco=?", (theId,))
    conn.commit()
    conn.close()

def deleteAll():
    conn = sqlite3.connect('Biblioteca.db')
    cur = conn.cursor()
    cur.execute("DELETE FROM pessoa")
    conn.commit()
    conn.close()