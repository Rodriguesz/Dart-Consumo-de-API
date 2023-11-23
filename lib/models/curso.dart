// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Curso {
  int id;
  String nome;
  bool isAluno;
  Curso({
    required this.id,
    required this.nome,
    required this.isAluno,
  });

  //? serialização: transforma o objeto em um json

  // toMap()
  // metodo que pega o nosso objeto Curso e transforma em um Objeto Map<String, dynamic>
  // metodo de instância (precisa ter os dados preenchidos no momento da instânciação para transformar)
  // passo 1 serialização
  Map<String, dynamic> toMapS() {
    return {
      'id': id,
      'nome': nome,
      'isAluno': isAluno,
    };
  }

  // toJson
  // metodo que pega um Map<String, dynamic>  e transforma em um json pelo pacote convert (jsonEncode)
  // metodo de instância (precisa ter os dados preenchidos no momento da instânciação para transformar)
  // passo 2 serialização
  String toJsonS() => jsonEncode(toMapS());

  //? desserialização: transforma o json em um objeto

  // passo 2
  factory Curso.fromMapD(Map<String, dynamic> map) {
    return Curso(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
      isAluno: map['isAluno'] ?? false,
    );
  }

  // 1 passo: recebe a string json e transforma em um mapa com o jsonDecode
  factory Curso.fromJsonD(String json) => Curso.fromMapD(jsonDecode(json));
}
