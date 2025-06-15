import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text('Inventario', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppStyles.textDark)),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: List.generate(4, (index) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppStyles.accentGreen,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Categoría ${index + 1}',
                      style: const TextStyle(fontSize: 18, color: AppStyles.textDark),
                    ),
                  ),
                );
              }),
            ),
          ),
          ElevatedButton(
            style: AppStyles.elevatedButtonStyle,
            onPressed: () {},
            child: const Text('Añadir producto'),
          ),
        ],
      ),
    );
  }
}