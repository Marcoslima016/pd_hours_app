import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pd_hours_app/lib.exports.dart';

class SquadsController extends ValueNotifier<ISquadsState> {
  SquadsDependencies? dependencies;

  late TabController tabController;

  static SquadsController get I => GetIt.I.get<SquadsController>();

  Squad? focusedSquad;

  SquadsController({
    this.dependencies,
    required TickerProvider vsync,
  }) : super(InitialState()) {
    tabController = TabController(vsync: vsync, length: 2);
    GetIt.I.registerSingleton<SquadsController>(this);
    dependencies ??= SquadsDependencies();
  }

  Future initialize() async {
    await value.initialize(this);

    return true;
  }

  Future refresh() async {
    await value.refresh(this);
  }

  Future onTapVisitSquad(Squad squad) async {
    focusedSquad = squad;
    tabController.animateTo(1);
  }

  Future onTapRedirectToCreateSquad(BuildContext context) async {
    try {
      await dependencies!.createSquadController!.run(context: context);
    } catch (e) {
      rethrow;
    }
  }
}
