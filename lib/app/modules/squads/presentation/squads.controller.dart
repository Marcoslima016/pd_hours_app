import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'presentation.exports.dart';

class SquadsController extends ValueNotifier<ISquadsState> {
  SquadsDependencies? dependencies;

  static SquadsController get I => GetIt.I.get<SquadsController>();

  SquadsController({this.dependencies}) : super(InitialState()) {
    GetIt.I.registerSingleton<SquadsController>(this);
    dependencies ??= SquadsDependencies();
  }

  Future initialize() async {
    await value.initialize(this);

    return true;
  }

  Future onTapCreateSquad(BuildContext context) async {
    try {
      await dependencies!.createSquadController!.run(context: context);
    } catch (e) {
      rethrow;
    }
  }
}
