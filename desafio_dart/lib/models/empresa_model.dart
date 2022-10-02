import 'package:desafio_dart/models/socio_model.dart';

import 'endereco_model.dart';

class Empresa {
  int id;
  String? razaoSocial;
  String nomeFantasia;
  String? cnpj;
  Endereco endereco;
  Socio? socio;

  Empresa({
    required this.id,
    this.razaoSocial,
    required this.nomeFantasia,
    required this.cnpj,
    required this.endereco,
    this.socio,
  });
}
