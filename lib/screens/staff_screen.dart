import 'package:flutter/material.dart';
import '../utils/app_styles.dart';
import 'edit_employee_screen.dart';
import 'add_employee_screen.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen({super.key});

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  final List<Map<String, String>> employees = [
    {'username': 'jdoe', 'fullName': 'John Doe'},
    {'username': 'asmith', 'fullName': 'Alice Smith'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.lightBackground,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
           
            const SizedBox(height: 8),
            const Text(
              'Control de personal',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppStyles.textDark,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  final employee = employees[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppStyles.primaryGreen,
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AddEmployeeScreen(),
                  ),
                );

                if (result == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Empleado agregado correctamente')),
                  );
                  // Aquí podrías refrescar datos si tuvieras backend
                  setState(() {
                    employees.add({
                      'username': 'nuevo',
                      'fullName': 'Nuevo Empleado',
                    });
                  });
                }
              },
              child: const Text(
                'Añadir empleado',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
