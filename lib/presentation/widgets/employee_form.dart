import 'package:dummy_api/domain/entities/employee.dart';
import 'package:flutter/material.dart';

class EmployeeForm extends StatefulWidget {
  final Employee? employee;
  final Function(Employee) onSubmit;

  const EmployeeForm({Key? key, this.employee, required this.onSubmit})
      : super(key: key);

  @override
  _EmployeeFormState createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _salaryController;
  late TextEditingController _ageController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.employee?.name ?? '');
    _salaryController =
        TextEditingController(text: widget.employee?.salary.toString() ?? '');
    _ageController =
        TextEditingController(text: widget.employee?.age.toString() ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
          TextFormField(
            controller: _salaryController,
            decoration: const InputDecoration(labelText: 'Salary'),
            keyboardType: TextInputType.number,
            validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
          TextFormField(
            controller: _ageController,
            decoration: const InputDecoration(labelText: 'Age'),
            keyboardType: TextInputType.number,
            validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                final employee = Employee(
                  name: _nameController.text,
                  salary: int.parse(_salaryController.text),
                  age: int.parse(_ageController.text),
                );
                widget.onSubmit(employee);
              }
            },
            child: Text(widget.employee == null ? 'Create' : 'Update'),
          ),
        ],
      ),
    );
  }
}
