import 'dart:convert';
import 'dart:io';

import 'package:desafio_dart/empresas_controller.dart';
import 'package:desafio_dart/models/empresa_model.dart';
import 'package:desafio_dart/uteis.dart';

void main(List<String> args) {
  Uteis.cleanTerminal();

  final controller = EmpresasController();

  final empresaList = <Empresa>[];

  String option;

  do {
    print(
      '''
      Selecione uma das opções abaixo:

      1)Cadastrar uma nova empresa
      2)Buscar Empresa cadastrada por CNPJ
      3)Buscar Empresa por CPF do Sócio
      4)Listar Empresas cadastradas em ordem alfabética
      5)Excluir uma empresa
      6)Sair
      ''',
    );

    option = stdin.readLineSync(encoding: utf8)!;

    switch (option) {
      case "1":
        Uteis.cleanTerminal();
        controller.addEmpresa(empresaList);
        break;

      case "2":
        Uteis.cleanTerminal();
        controller.buscarEmpresaCnpj(empresaList);
        break;

      case "3":
        Uteis.cleanTerminal();
        controller.buscarEmpresaCPF(empresaList);
        break;

      case "4":
        Uteis.cleanTerminal();
        controller.ordenarEmpresas(empresaList);
        break;

      case "5":
        Uteis.cleanTerminal();
        controller.deletarEmpresa(empresaList);
        break;

      case "6":
        Uteis.cleanTerminal;
        print("Obrigado por usar nosso app, volte sempre! \n\n");
        finish();
        break;

      default:
        Uteis.cleanTerminal();
        print("\nOpção inválida, digite uma das opções da lista. \n \n");
        break;
    }
  } while (option != "6");
}

void finish() {}
