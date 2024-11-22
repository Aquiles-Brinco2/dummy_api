import 'dart:convert';
import 'package:dummy_api/domain/entities/employee.dart';
import 'package:http/http.dart' as http;

class EmployeeApi {
  static const String baseUrl = 'https://dummy.restapiexample.com/api/v1';

  // Headers actualizados incluyendo la Cookie necesaria
  final Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Cookie': 'humans_21909=1', // Header crucial para que funcione la API
  };

  Future<List<Employee>> getAllEmployees() async {
    final response = await http.get(
      Uri.parse('$baseUrl/employees'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'] as List;
      return data.map((json) => Employee.fromJson(json)).toList();
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      throw Exception('Failed to load employees: ${response.statusCode}');
    }
  }

  Future<Employee> createEmployee(Employee employee) async {
    final response = await http.post(
      Uri.parse('$baseUrl/create'),
      headers: _headers,
      body: json.encode(employee.toJson()),
    );

    if (response.statusCode == 200) {
      return Employee.fromJson(json.decode(response.body)['data']);
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      throw Exception('Failed to create employee: ${response.statusCode}');
    }
  }

  Future<Employee> updateEmployee(String id, Employee employee) async {
    final response = await http.put(
      Uri.parse('$baseUrl/update/$id'),
      headers: _headers,
      body: json.encode(employee.toJson()),
    );

    if (response.statusCode == 200) {
      return Employee.fromJson(json.decode(response.body)['data']);
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      throw Exception('Failed to update employee: ${response.statusCode}');
    }
  }

  Future<bool> deleteEmployee(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/delete/$id'),
      headers: _headers,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      throw Exception('Failed to delete employee: ${response.statusCode}');
    }
  }
}
