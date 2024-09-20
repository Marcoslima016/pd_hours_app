import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pd_hours_app/lib.exports.dart';

class CreateSquadController {
  //
  late TextEditingController? inputName;

  ValueNotifier<bool> validated = ValueNotifier(false);

  Future run({
    required BuildContext context,
  }) async {
    inputName = TextEditingController();
    handleInputsUpdate();
    await CreateSquadModal(controller: this).show(context: context);
    var p = "";
    dispose();
  }

  handleInputsUpdate() {
    inputName!.addListener(() {
      if (inputName!.text.isNotEmpty) {
        validated.value = true;
      } else {
        validated.value = false;
      }
    });
  }

  dispose() {
    inputName!.removeListener(() {});
    inputName = null;
  }

  Future onTapCreate(BuildContext context) async {
    if (validated.value == false) return;

    await AppController.instance.exibirLoadingPopup(context: context);

    await SquadsController.I.dependencies!.squadsRepository!.createSquad(
      payload: PayloadCreateSquad(
        name: inputName!.text,
      ),
    );

    await AppController.instance.ocultarLoadingPopup();

    SquadsController.I.refresh();

    if (context.mounted) Navigator.of(context).pop();
  }
}
