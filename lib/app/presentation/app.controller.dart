import 'package:flutter/material.dart';
import 'package:pd_hours_app/lib.exports.dart';

class AppController {
  //

  static final AppController instance = AppController._();
  AppController._();

  //EXIBIR LOADING POPUP
  /// Metodo que exibe o modal de carregamento.
  Future exibirLoadingPopup({
    required BuildContext context,
  }) async {
    await const LoadingPopup().show(context: context);
  }

  //CULTAR LOADING POPUP
  Future ocultarLoadingPopup() async {
    await const LoadingPopup().hide();
  }
}
