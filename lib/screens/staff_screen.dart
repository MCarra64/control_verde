import 'package:flutter/material.dart';
import '../utils/app_styles.dart';
import 'edit_employee_screen.dart';

class StaffScreen extends StatelessWidget {
  const StaffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos simulados
    final List<Map<String, String>> employees = [
      {'username': 'jdoe', 'fullName': 'John Doe'},
      {'username': 'asmith', 'fullName': 'Alice Smith'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Control de personal'),
        backgroundColor: AppStyles.primaryGreen,
      ),
      backgroundColor: const Color(0xFFC8E6C9),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: employees.length,
            itemBuilder: (context, index) {
              final employee = employees[index];
              return Card(
                child: ListTile(
                  leading: Icon(Icons.person, color: AppStyles.primaryGreen),
                  title: Text(employee['fullName'] ?? ''),
                  subtitle: Text('Usuario: ${employee['username']}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EditEmployeeScreen(
                            username: employee['username']!,
                            fullName: employee['fullName']!,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 32,
            left: 16,
            right: 16,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppStyles.primaryGreen,
                padding: const EdgeInsets.symmetric(vertical: 14.0),
              ),
              onPressed: () {
                // Aquí puedes navegar a una pantalla de añadir empleado si quieres
              },
              child: const Text(
                'Añadir empleado',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
