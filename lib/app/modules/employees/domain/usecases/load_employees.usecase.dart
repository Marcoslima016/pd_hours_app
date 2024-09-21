import '../domain.exports.dart';

abstract class ILoadEmployees {
  Future<List<Employee>> call();
}

class LoadEmployees implements ILoadEmployees {
  final IEmployeesRepository employeesRepository;

  LoadEmployees({
    required this.employeesRepository,
  });

  @override
  Future<List<Employee>> call() async {
    try {
      return await employeesRepository.loadEmployees();
    } catch (e) {
      rethrow;
    }
  }
}
