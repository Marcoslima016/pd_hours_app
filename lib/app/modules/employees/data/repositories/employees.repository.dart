import 'package:pd_hours_app/lib.exports.dart';

import '../../domain/domain.exports.dart';

class EmployeesRepository implements IEmployeesRepository {
  //

  final IRESTClient client;

  EmployeesRepository({
    required this.client,
  });

  @override
  Future<List<Employee>> loadEmployees() async {
    try {
      Map<String, dynamic> response = await client.get(
        endpoint: "/employees",
      );

      List<Employee> result = [];

      for (Map<String, dynamic> responseItem in response["data"]) {
        Employee employee = Employee.fromMap(responseItem);
        result.add(employee);
      }

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future createEmployee({required PayloadCreateEmployee payload}) async {
    try {
      Map<String, dynamic> requestBody = {
        "name": payload.name,
      };

      Map<String, dynamic> response = await client.post(
        endpoint: "/employee",
        data: requestBody,
      );

      var p = "";
    } catch (e) {
      rethrow;
    }
  }
}
