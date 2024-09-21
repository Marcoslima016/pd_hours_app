import '../employees.exports.dart';

abstract class IEmployeesState {
  List<Employee>? get employeesList => null;
  Future initialize(EmployeesController controller) async {}

  Future refresh(EmployeesController controller) async {}
}

class InitialState extends IEmployeesState {
  @override
  Future initialize(EmployeesController controller) async {
    try {
      controller.value = Loading();
      controller.dependencies!.bind();

      List<Employee> employees = await controller.dependencies!.usecaseLoadEmployees!();

      controller.value = Loaded(
        employeesList: employees,
      );
    } catch (e) {
      rethrow;
    }
  }
}

class Loading extends IEmployeesState {}

class Loaded extends IEmployeesState {
  @override
  List<Employee> employeesList;

  Loaded({
    required this.employeesList,
  });

  @override
  Future refresh(EmployeesController controller) async {
    try {
      controller.value = Loading();

      List<Employee> employees = await controller.dependencies!.usecaseLoadEmployees!();

      controller.value = Loaded(
        employeesList: employees,
      );
    } catch (e) {
      rethrow;
    }
  }
}
