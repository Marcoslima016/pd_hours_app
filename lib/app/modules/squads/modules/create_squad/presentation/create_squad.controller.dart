import 'package:flutter/material.dart';

import 'presentation.exports.dart';

class CreateSquadController {
  Future run({
    required BuildContext context,
  }) async {
    CreateSquadModal().show(context: context);
  }
}
