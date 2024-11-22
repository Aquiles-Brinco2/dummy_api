import 'package:dummy_api/infrastructure/datasource/employee_api.dart';
import 'package:dummy_api/infrastructure/repositories/employee_repository_iml.dart';
import 'package:dummy_api/presentation/pages/employee_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  final employeeApi = EmployeeApi();
  final employeeRepository = EmployeeRepositoryImpl(employeeApi);

  runApp(MaterialApp(
    title: 'Employee Management',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: EmployeeListPage(repository: employeeRepository),
  ));
}
