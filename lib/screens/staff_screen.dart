import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

class StaffScreen extends StatelessWidget {
  const StaffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text('Control de Personal', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppStyles.textDark)),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 6, //placeholder mientas se integra con la base de datos
              itemBuilder: (context, index) => Card(
                color: AppStyles.cardBackground,
                child: ListTile(
                  leading: const Icon(Icons.person, color: AppStyles.primaryGreen),
                  title: Text('Empleado ${index + 1}', style: const TextStyle(color: AppStyles.textDark)), //placeholder mientas se integra con la base de datos
                  trailing: IconButton(
                    icon: const Icon(Icons.edit, color: AppStyles.accentGreen),
                    onPressed: () {}, //placeholder para editar empleado
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            style: AppStyles.elevatedButtonStyle,
            onPressed: () {},
            child: const Text('Añadir empleado'),
          ),
        ],
      ),
    );
  }
}
