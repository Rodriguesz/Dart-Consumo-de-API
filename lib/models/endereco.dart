// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:consumo_api_alunos/models/telefone.dart';

import 'cidade.dart';

class Endereco {
  String rua;
  int numero;
  String cep;
  Cidade cidade;
  Telefone telefone;
  Endereco({
    required this.rua,
    required this.numero,
    required this.cep,
    required this.cidade,
    required this.telefone,
  });

  //? serialização: transforma o objeto em um json
  //? desserialização: transforma o json em um objeto

  // toMap()
  // metodo que pega o nosso objeto Endereco e transforma em um Objeto Map<String, dynamic>
  // metodo de instância (precisa ter os dados preenchidos no momento da instânciação para transformar)
  // passo 1 serialização
  ///cidade é um objeto complexo, portanto devemos chamar o método toMapS() para transforma-la de um objeto para um mapa de <String, dynamic>
  Map<String, dynamic> toMapS() {
    return {
      'rua': rua,
      'numero': numero,
      'CEP': cep,

      'cidade': cidade.toMapS(),
      'telefone': telefone.toMapS(),
      //? MESMA COISA QUE:
      /*
      'cidade':{
        'id': cidade.id
        'nome: cidade.nome
      }
    */
      //? O toMapS só facilita a nossa vida
    };
  }

  // toJson
  // metodo que pega um Map<String, dynamic>  e transforma em um json pelo pacote convert (jsonEncode)
  // metodo de instância (precisa ter os dados preenchidos no momento da instânciação para transformar)
  // passo 2 serialização

  String toJsonS() => jsonEncode(toMapS());

  //  Passo 2 da desserialização
  factory Endereco.fromMapD(Map<String, dynamic> map) {
    return Endereco(
      rua: map['rua'] ?? '',
      numero: map['numero'] ?? 0,
      cep: map['CEP'] ?? '',
      cidade: Cidade.fromMapD(map['cidade'] ?? <String, dynamic>{}),
      telefone: Telefone.fromMapD(map['telefone'] ?? <String, dynamic>{}),
    );
  }

  // 1 passo: recebe a string json e transforma em um mapa com o jsonDecode
  factory Endereco.fromJsonD(String json) => Endereco.fromMapD(jsonDecode(json));
}
