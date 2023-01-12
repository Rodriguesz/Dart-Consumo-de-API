// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Telefone {
  int ddd;
  String telefone;
  Telefone({
    required this.ddd,
    required this.telefone,
  });

  //? serialização: transforma o objeto em um json
  //? desserialização: transforma o json em um objeto

  // toMap()
  // metodo que pega o nosso objeto Telefone e transforma em um Objeto Map<String, dynamic>
  // metodo de instância (precisa ter os dados preenchidos no momento da instânciação para transformar)
  // passo 1 serialização
  Map<String, dynamic> toMapS() {
    return {
      'ddd': ddd,
      'telefone': telefone,
    };
  }

  // toJson
  // metodo que pega um Map<String, dynamic>  e transforma em um json pelo pacote convert (jsonEncode)
  // metodo de instância (precisa ter os dados preenchidos no momento da instânciação para transformar)
  // passo 2 serialização
  String toJsonS() {
    return jsonEncode(toMapS());
  }

  // Passo 2 da desserialização
  factory Telefone.fromMapD(Map<String, dynamic> map) {
    return Telefone(
      ddd: map['ddd'] ?? 0,
      telefone: map['telefone'] ?? '',
    );
  }

  // Passo 1 desserialização
  // factory Telefone.fromJson(String json) {
  //   final jsonMap =
  //       jsonDecode(json); // 1 passo: recebe a string json e transforma em um mapa com o jsonDecode
  //   return Telefone.fromMap(jsonMap);
  // }

  // mesma coisa q o código acima
  factory Telefone.fromJsonD(String json) => Telefone.fromMapD(jsonDecode(json));
}
