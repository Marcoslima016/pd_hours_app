import 'package:flutter/material.dart';
import 'package:pd_hours_app/lib.exports.dart';
import 'package:flutter/foundation.dart';

class AppController {
  //

  static final AppController instance = AppController._();
  AppController._();

  bool get runningInMobile {
    return true;
    if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) {
      return true;
    } else {
      return false;
    }
  }

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
