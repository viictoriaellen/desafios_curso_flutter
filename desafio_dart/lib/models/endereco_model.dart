class Endereco {
  String logradouro;
  int numero;
  String? complemento;
  String bairro;
  String estado;
  String? cep;

  Endereco({
    required this.logradouro,
    required this.numero,
    this.complemento,
    required this.bairro,
    required this.estado,
    this.cep,
  });
}
