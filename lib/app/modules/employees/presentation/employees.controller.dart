import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pd_hours_app/lib.exports.dart';

import 'employees.state.dart';

class EmployeesController extends ValueNotifier<IEmployeesState> {
  EmployeesDependencies? dependencies;

  late TabController tabController;

  static EmployeesController get I => GetIt.I.get<EmployeesController>();

  EmployeesController({
    this.dependencies,
    required TickerProvider vsync,
  }) : super(InitialState()) {
    tabController = TabController(vsync: vsync, length: 2);
    GetIt.I.registerSingleton<EmployeesController>(this);
    dependencies ??= EmployeesDependencies();
  }

  Future initialize() async {
    await value.initialize(this);

    return true;
  }

  Future refresh() async {
    await value.refresh(this);
  }

  Future onTapRedirectToCreateEmployee(BuildContext context) async {
    try {
      await dependencies!.createEmployeeController!.run(context: context);
    } catch (e) {
      rethrow;
    }
  }
}
