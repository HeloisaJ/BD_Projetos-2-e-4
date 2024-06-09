class Pessoa:
  def __init__(self, p_nome, sobrenome, genero, p_tipo, id_endereco):
    self.p_nome = p_nome
    self.sobrenome = sobrenome
    self.genero = genero
    self.p_tipo = p_tipo
    self.id_endereco = id_endereco

  def __repr__(self):
    return '<id {}>'.format(self.id)

  def serialize(self):
    return {
      'p_nome': self.p_nome,
      'sobrenome': self.sobrenome,
      'genero': self.genero,
      'p_tipo': self.p_tipo,
      'id_endereco': self.id_endereco
    }