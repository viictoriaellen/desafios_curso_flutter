import 'dart:convert';
import 'dart:io';

import 'package:desafio_dart/models/empresa_model.dart';
import 'package:desafio_dart/models/endereco_model.dart';
import 'package:desafio_dart/models/socio_model.dart';
import 'package:desafio_dart/uteis.dart';

class EmpresasController {
  void addEmpresa(List<Empresa> list) {
    String nomeFantasia = _getStringValueAndValidate('o nome fantasia');
    String cnpj = _getStringValueAndValidate('o CNPJ');
    Endereco enderecoEmpresa = _addEndereco();
    Socio? socio;

    print("""Deseja atribuir a um(a) sócio(a)?
    
        0) Sim
        1) Não""");

    String confirmacaoSocio = stdin.readLineSync(encoding: utf8)!;

    if (confirmacaoSocio == "0") {
      socio = _addSocio();
    }

    final empresa = Empresa(
        id: list.isEmpty ? 0 : list.last.id + 1,
        nomeFantasia: nomeFantasia,
        cnpj: cnpj,
        endereco: enderecoEmpresa,
        socio: socio);

    list.add(empresa);

    Uteis.cleanTerminal();
    print("\nEmpresa $nomeFantasia adicionada com sucesso!\n");
  }

  Socio _addSocio() {
    print("\nDigite o nome:\n");
    String nome = stdin.readLineSync(encoding: utf8)!;
    print("\nDigite o CPF:\n");
    String cpf = stdin.readLineSync(encoding: utf8)!;
    print("\nDigite o endereço:\n");
    final enderecoSocio = _addEndereco(eUmSocio: true);
    print("\nDigite o telefone:\n");
    String telefone = stdin.readLineSync(encoding: utf8)!;

    final socio = Socio(
      nome: nome,
      endereco: enderecoSocio,
      cpf: cpf,
      telefone: telefone,
    );

    return socio;
  }

  Endereco _addEndereco({bool eUmSocio = false}) {
    String logradouro = _getStringValueAndValidate('o nome da rua',
        mudarStringParaSocio: eUmSocio);
    String numero =
        _getStringValueAndValidate('o número', mudarStringParaSocio: eUmSocio);
    String complemento = _getStringValueAndValidate('o complemento',
        mudarStringParaSocio: eUmSocio);
    String bairro =
        _getStringValueAndValidate('o bairro', mudarStringParaSocio: eUmSocio);
    String estado =
        _getStringValueAndValidate('o estado', mudarStringParaSocio: eUmSocio);
    String cep =
        _getStringValueAndValidate('o CEP', mudarStringParaSocio: eUmSocio);

    final endereco = Endereco(
      logradouro: logradouro,
      numero: int.parse(numero),
      complemento: complemento,
      bairro: bairro,
      estado: estado,
      cep: cep,
    );

    return endereco;
  }

  String _getStringValueAndValidate(String dataName,
      {bool mudarStringParaSocio = false}) {
    if (mudarStringParaSocio) {
      print("\nDigite $dataName do(a) sócio(a):\n");
    } else {
      print("\nDigite $dataName da empresa a ser adicionada:\n");
    }
    String name = stdin.readLineSync(encoding: utf8)!;
    while (name.isEmpty) {
      print("\nDigite algo válido para $dataName:\n");
      name = stdin.readLineSync(encoding: utf8)!;
    }

    return name;
  }

  void ordenarEmpresas(List<Empresa> list) {
    print("\n\nEsta é a lista em ordem alfabética!");

    list.sort((empresa1, empresa2) => empresa1.nomeFantasia
        .toUpperCase()
        .compareTo(empresa2.nomeFantasia.toUpperCase()));

    _mostrarEmpresas(list);
  }

  void deletarEmpresa(List<Empresa> list) {
    if (list.isEmpty) {
      print("\n\nNão há empresas cadastradas.");
      return;
    }

    _mostrarEmpresas(list);
    print("\n\nDigite a posição da empresa a ser removida");
    String indexToRemove = stdin.readLineSync(encoding: utf8)!;

    int index = int.parse(indexToRemove) - 1;

    final empresaSelecionada = list[index];

    _mostrarEmpresa(empresaSelecionada, index);

    print(
        """Deseja realmente remover ${empresaSelecionada.nomeFantasia} da lista?
        
        0) Sim
        1) Não""");

    final opcaoParaDeletar = stdin.readLineSync(encoding: utf8)!;
    bool confirmado;

    if (opcaoParaDeletar == "0") {
      confirmado = true;
    } else {
      confirmado = false;
    }

    if (confirmado) {
      list.removeAt(index);
      print("\n\n${empresaSelecionada.nomeFantasia} deletada com sucesso!");
    }
  }

  void buscarEmpresaCnpj(List<Empresa> list) {
    print("\n\nDigite o CNPJ da empresa para consultá-la:");

    final cnpjEscolhido = stdin.readLineSync(encoding: utf8)!;

    bool achouAlgumCnpj = false;

    for (int i = 0; i < list.length; i++) {
      final empresa = list[i];

      if (cnpjEscolhido == empresa.cnpj) {
        achouAlgumCnpj = true;
        _mostrarEmpresa(empresa, i);
      }
    }

    if (achouAlgumCnpj == false) {
      print("\n\nNão há empresas cadastradas com este CNPJ");
    }
  }

  void buscarEmpresaCPF(List<Empresa> list) {
    print("\n\nDigite o CPF do sócio para consultar a empresa:");

    final cpfEscolhido = stdin.readLineSync(encoding: utf8)!;

    bool achouAlgumaEmpresa = false;

    for (int i = 0; i < list.length; i++) {
      final empresa = list[i];

      if (cpfEscolhido == empresa.socio?.cpf) {
        achouAlgumaEmpresa = true;
        _mostrarEmpresa(empresa, i);
      }
    }

    if (achouAlgumaEmpresa == false) {
      print("\n\nNenhuma empresa com este CPF foi encontrada.");
    }
  }

  void _mostrarEmpresas(List<Empresa> list) {
    if (list.isEmpty) {
      print("Não há empresas cadastradas.");
      return;
    }

    print("Seus itens são:");

    for (int i = 0; i < list.length; i++) {
      _mostrarEmpresa(list[i], i);
    }

    print('');
  }

  void _mostrarEmpresa(Empresa empresa, int index) {
    print("\n\nEmpresa ${index + 1}\n");
    print("Nome: ${empresa.nomeFantasia}");
    print("ID: ${empresa.id}");
    print("CNPJ: ${empresa.cnpj}");
    print(
        "Endereço: ${empresa.endereco.logradouro}, ${empresa.endereco.numero} - ${empresa.endereco.bairro}\n");
  }
}
