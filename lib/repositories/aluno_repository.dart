import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/aluno.dart';

class AlunoRepository {
  Future<List<Aluno>> buscarTodos() async {
    final alunosResponse = await http.get(Uri.parse('http://localhost:8080/alunos'));

    /// TRANSFORMA O body EM UM MAPA DE <String, dynamic>
    final alunosList = jsonDecode(alunosResponse.body);

    ///CONVERTENDO O MAPA DE <String, dynamic> EM UMA LISTA DE ALUNOS
    final todosAlunos = alunosList.map<Aluno>((alunoMap) {
      return Aluno.fromMapD(alunoMap);
    }).toList();

    return todosAlunos;
  }

  Future<Aluno> buscarPorId(int id) async {
    final alunosResponse = await http.get(Uri.parse('http://localhost:8080/alunos/$id'));

    return Aluno.fromJsonD(alunosResponse.body);
  }
}
