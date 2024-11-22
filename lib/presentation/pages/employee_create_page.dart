import 'package:dummy_api/domain/repositories/employee_repository.dart';
import 'package:dummy_api/presentation/widgets/employee_form.dart';
import 'package:flutter/material.dart';

class EmployeeCreatePage extends StatelessWidget {
  final EmployeeRepository repository;

  const EmployeeCreatePage({Key? key, required this.repository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Employee')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: EmployeeForm(
          onSubmit: (employee) async {
            try {
              await repository.createEmployee(employee);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Employee created successfully')),
              );
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to create employee')),
              );
            }
          },
        ),
      ),
    );
  }
}
