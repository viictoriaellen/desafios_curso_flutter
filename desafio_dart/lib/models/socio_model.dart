import 'package:desafio_dart/models/endereco_model.dart';

class Socio {
  String nome;
  String cpf;
  Endereco endereco;
  String? telefone;

  Socio({
    required this.nome,
    required this.endereco,
    required this.cpf,
    required this.telefone,
  });
}
