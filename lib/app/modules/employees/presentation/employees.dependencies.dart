import 'package:get_it/get_it.dart';
import 'package:pd_hours_app/lib.exports.dart';

class EmployeesDependencies {
  late IEmployeesRepository? employeesRepository;
  late ILoadEmployees? usecaseLoadEmployees;

  late CreateEmployeeController? createEmployeeController;

  EmployeesDependencies({
    this.employeesRepository,
    this.usecaseLoadEmployees,
    this.createEmployeeController,
  });

  bind() {
    createEmployeeController ??= CreateEmployeeController();

    employeesRepository ??= EmployeesRepository(client: DIORESTClient());
    GetIt.I.registerFactory<IEmployeesRepository>(() => employeesRepository!);

    usecaseLoadEmployees ??= LoadEmployees(employeesRepository: employeesRepository!);
    GetIt.I.registerFactory<ILoadEmployees>(() => usecaseLoadEmployees!);
  }
}
