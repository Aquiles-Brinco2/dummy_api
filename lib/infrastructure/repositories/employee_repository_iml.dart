import 'package:dummy_api/domain/entities/employee.dart';
import 'package:dummy_api/domain/repositories/employee_repository.dart';
import 'package:dummy_api/infrastructure/datasource/employee_api.dart';

class EmployeeRepositoryImpl implements EmployeeRepository {
  final EmployeeApi _api;

  EmployeeRepositoryImpl(this._api);

  @override
  Future<List<Employee>> getAllEmployees() => _api.getAllEmployees();

  @override
  Future<Employee> createEmployee(Employee employee) =>
      _api.createEmployee(employee);

  @override
  Future<Employee> updateEmployee(String id, Employee employee) =>
      _api.updateEmployee(id, employee);

  @override
  Future<bool> deleteEmployee(String id) => _api.deleteEmployee(id);

  @override
  Future<Employee> getEmployee(String id) async {
    final employees = await getAllEmployees();
    return employees.firstWhere((e) => e.id == id);
  }
}
