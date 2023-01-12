// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cidade {
  int id;
  String nome;
  Cidade({
    required this.id,
    required this.nome,
  });

  //? serialização: transforma o objeto em um json
  //? desserialização: transforma o json em um objeto

  // toMap()
  // metodo que pega o nosso objeto Cidade e transforma em um Objeto Map<String, dynamic>
  // metodo de instância (precisa ter os dados preenchidos no momento da instânciação para transformar)
  // passo 1 serialização
  Map<String, dynamic> toMapS() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  // toJson
  // metodo que pega um Map<String, dynamic>  e transforma em um json pelo pacote convert (jsonEncode)
  // metodo de instância (precisa ter os dados preenchidos no momento da instânciação para transformar)
  // passo 2 serialização
  String toJsonS() => jsonEncode(toMapS());

  // Passo 2 da desserialização
  factory Cidade.fromMapD(Map<String, dynamic> map) {
    return Cidade(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
    );
  }

  // 1 passo desserialização: recebe a string json e transforma em um mapa com o jsonDecode
  factory Cidade.fromJsonD(String json) => Cidade.fromMapD(jsonDecode(json));
}
