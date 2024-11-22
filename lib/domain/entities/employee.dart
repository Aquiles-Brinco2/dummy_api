class Employee {
  final String? id;
  final String name;
  final int salary;
  final int age;

  Employee({
    this.id,
    required this.name,
    required this.salary,
    required this.age,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'].toString(),
      name: json['employee_name'],
      salary: int.parse(json['employee_salary'].toString()),
      age: int.parse(json['employee_age'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'salary': salary,
      'age': age,
    };
  }
}
