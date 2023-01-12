//! ISSO NÃO FAZ PARTE DO PROJETO
//! É APENAS UMA EXPLICAÇÃO SOBRE MAPAS E CONVERSÕES POIS ESTOU COM DIFICULDADE DE ENTENDER!!!!
//! IREI ANOTAR TUDO DA AULA

void main() {
  /// MAP É UMA CLASSE (ASSIM COMO TUDO EM DART)
  /// É REPRESENTADO POR CHAVES {} (ASSIM COMO O SET)
  /// POR ISSO PARA SER UM MAP PRECISA TER 2 TIPOS
  /// EX:
  final paciente = <String, String>{
    'nome': 'Leonardo',
    'sobrenome': 'Rodrigues',
  };

  /// NULL SAFETY
  // Map<String, String>? pacienteNullSafety = null; // AQUI PODE SER NULO!
  // Map<String?, String> pacienteNullSafety3 = {
  //   null: 'value não nulo'
  // }; // SOMENTE CHAVE PODE SER NULA!
  // Map<String, String> pacienteNullSafety2 = {}; // AQUI NÃO PODE SER NULO!

  var produtos = <String, String>{};

  /// put.IfAbsent
  /// CRIA A CHAVE E VALOR CASO ELA NÃO EXISTA
  produtos.putIfAbsent('nome', () => 'Cerveja'); // CRIA A CHAVE 'nome' COM O VALUE 'Cerveja'
  produtos.putIfAbsent('nome', () => 'Refrigerante'); // NÃO FAZ NADA POS A CHAVE 'nome' JA EXISTE]
  print(produtos);

  produtos.update(
      'nome', (value) => 'Refrigerante'); // ALTERA O VALUE DO NOME DE 'Cerveja' para 'Refrigerante'

  produtos.update('preco', (value) => '10',
      ifAbsent: (() =>
          '10')); // ALTERA O VALUE DO preco PARA '10' E CASO A CHAVE NÃO EXISTA, ELA É CRIADA PASSANDO '10' COMO VALUE (ifAbsent)
  print(produtos);

  /// VARRER TOD0 O MAPA (CASO ELE NÃO SEJA ASSINCRONO)
  produtos.forEach((key, value) {
    print('Chave: $key, Valor: $value');
  });

  /// VARRER TOD0 O MAPA (CASO ELE SEJA ASSINCRONO)
  ///
  for (var entry in produtos.entries) {
    print('Chave: ${entry.key}, Valor: ${entry.value}');
  }

  //! UM BREVE EXEMPLO DE INTERABLE  map
  var numeros = List.generate(10, (index) => index + 1); // cria uma lista de 1 a 10
  print(numeros);

  /// MAP PEGA UMA LISTA E TRANSFORMA EM UMA OUTRA LISTA FAZENDO ALGO QUE VC QUEIRA
  /// NO EXEMPLO ABAIXO, PEGAMOS A LISTA DE INTEIROS E TRANSFORMAMOS
  /// EM UMA LISTA DE String
  /// A FUNÇÃO MAP RETORNA UM INTERABLE, ENTÃO DEVE-SE USAR O .toList NO FINAL
  /// PARA TRANSFORMA-LA CASO VC QUEIRA USAR AS PROPRIEDADES DE UMA LISTA
  var numeroStrList = numeros.map((value) => 'Numero é $value').toList();
  print(numeroStrList);

  //! FIM DA BREVE EXPLICAÇÃO SOBRE O INTERABLE map
  //! RETORNANDO PARA OS MAPS

  /// TRANSFORMANDO UM MAPA UTILIZANDO A FACUNÇÃO .map()
  /// NESTE EXEMPLO ELE RETORNA UM MAPA DE <String, String> TRANSFORMANDO TODAS AS CHAVES
  /// PARA 'novo' MAIS A CHAVE ANTIGA ex: 'Novo_nome' ('nome' era umas das chaves antigas)
  /// E TODOS OS VALORES VÃO FICAR EM MAIUSCULO
  var novoMapaDeProdutos = produtos.map((key, value) {
    return MapEntry('Novo_' + key, value.toUpperCase());
  });
  print(novoMapaDeProdutos);
}
