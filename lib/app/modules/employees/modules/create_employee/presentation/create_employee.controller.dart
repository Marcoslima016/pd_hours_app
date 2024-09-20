import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pd_hours_app/lib.exports.dart';

class CreateEmployeeController {
  //
  late TextEditingController? inputName;

  late TextEditingController? inputEstimatedHours;

  late TextEditingController? inputSquad;

  ValueNotifier<bool> validated = ValueNotifier(false);

  final formKey = GlobalKey<FormState>();

  bool errorSquadInvalid = false;

  Future run({
    required BuildContext context,
  }) async {
    inputName = TextEditingController();
    inputEstimatedHours = TextEditingController();
    inputSquad = TextEditingController();
    handleInputsUpdate();

    await CreateEmployeeModal(controller: this).show(context: context);
    dispose();
  }

  handleInputsUpdate() {
    bool success = true;
    inputName!.addListener(() {
      if (inputName!.text.isEmpty) success = false;
      if (inputEstimatedHours!.text.isEmpty) success = false;
      if (inputSquad!.text.isEmpty) success = false;
    });
    validated.value = success;
  }

  dispose() {
    inputName!.removeListener(() {});
    inputName = null;
  }

  Future onTapCreate(BuildContext context) async {
    if (validated.value == false) return;

    await AppController.instance.exibirLoadingPopup(context: context);

    bool fail = false;

    try {
      await EmployeesController.I.dependencies!.employeesRepository!.createEmployee(
        payload: PayloadCreateEmployee(
          name: inputName!.text,
          estimatedHours: int.parse(inputEstimatedHours!.text),
          squad: int.parse(inputSquad!.text),
        ),
      );
    } catch (e) {
      errorSquadInvalid = true;
      formKey.currentState!.validate();
      fail = true;
    }

    await AppController.instance.ocultarLoadingPopup();

    if (fail == false) {
      EmployeesController.I.refresh();
      if (context.mounted) Navigator.of(context).pop();
    }
  }
}
