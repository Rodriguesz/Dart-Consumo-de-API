// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:consumo_api_alunos/models/curso.dart';

import 'endereco.dart';

class Aluno {
  int id;
  String nome;
  int? idade;
  List<String> nomeCursos;
  List<Curso> cursos;
  Endereco endereco;
  Aluno({
    required this.id,
    required this.nome,
    this.idade,
    required this.nomeCursos,
    required this.cursos,
    required this.endereco,
  });

  Map<String, dynamic> toMapS() {
    final map = <String, dynamic>{
      'id': id,
      'nome': nome,
      'nomeCursos': nomeCursos,
      'cursos': cursos
          .map((curso) => curso.toMapS())
          .toList(), // transforma a lista de curso em lisa de <String, dynamic>
      'endereco': endereco.toMapS(),
    };

    if (idade != null) {
      map['idade'] = idade;
    }
    return map;
  }

  String toJsonS() => jsonEncode(toMapS());

  // 2 passo
  factory Aluno.fromMapD(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
      idade: map['idade'],
      nomeCursos: List<String>.from(map['nomeCursos'] ??
          <String>[]), // arruma o possivel erro que fala que isso é uma list<dynamic> e não uma list<String> convertendo a lista
      cursos:
          map['cursos']?.map<Curso>((cursoMap) => Curso.fromMapD(cursoMap)).toList() ?? <Curso>[],
      endereco: Endereco.fromMapD(map['endereco'] ?? <String, dynamic>{}),
    );
  }

  // 1 passo: recebe a string json e transforma em um mapa com o jsonDecode
  factory Aluno.fromJsonD(String json) => Aluno.fromMapD(jsonDecode(json));

  @override
  String toString() {
    // TODO: implement toString
    return 'Aluno: $nome ($id)';
  }
}
