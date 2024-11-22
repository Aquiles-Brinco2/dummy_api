import 'package:dummy_api/domain/entities/employee.dart';
import 'package:dummy_api/domain/repositories/employee_repository.dart';
import 'package:dummy_api/presentation/widgets/employee_form.dart';
import 'package:flutter/material.dart';

class EmployeeEditPage extends StatelessWidget {
  final EmployeeRepository repository;
  final Employee employee;

  const EmployeeEditPage({
    Key? key,
    required this.repository,
    required this.employee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Employee')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: EmployeeForm(
          employee: employee,
          onSubmit: (updatedEmployee) async {
            try {
              await repository.updateEmployee(employee.id!, updatedEmployee);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Employee updated successfully')),
              );
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to update employee')),
              );
            }
          },
        ),
      ),
    );
  }
}
