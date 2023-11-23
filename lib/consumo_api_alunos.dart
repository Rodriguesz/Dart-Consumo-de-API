import 'package:consumo_api_alunos/repositories/aluno_repository.dart';

void main() async {
  final alunoRepository = AlunoRepository();
  final alunos = await alunoRepository.buscarTodos();

  print(alunos);

  final aluno = await alunoRepository.buscarPorId(2);

  print(aluno.nome);
  print(aluno.nomeCursos);
  for (var curso in aluno.cursos) {
    if (curso.isAluno) {
      print(curso.nome);
    }
  }
}
