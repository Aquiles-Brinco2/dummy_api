import 'package:dummy_api/domain/entities/employee.dart';

abstract class EmployeeRepository {
  Future<List<Employee>> getAllEmployees();
  Future<Employee> getEmployee(String id);
  Future<Employee> createEmployee(Employee employee);
  Future<Employee> updateEmployee(String id, Employee employee);
  Future<bool> deleteEmployee(String id);
}
