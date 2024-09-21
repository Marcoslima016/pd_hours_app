import '../domain.exports.dart';

abstract class IEmployeesRepository {
  Future<List<Employee>> loadEmployees();

  Future createEmployee({required PayloadCreateEmployee payload});
}
