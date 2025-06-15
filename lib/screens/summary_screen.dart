import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Resumen de Ventas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppStyles.textDark)),
          SizedBox(height: 16),
          Text('Bruto: Lps. 100,000', style: TextStyle(fontSize: 18, color: AppStyles.textDark)),
          Text('Neto: Lps. 20,000', style: TextStyle(fontSize: 18, color: AppStyles.textDark)),
          Text('Gasto: Lps. 80,000', style: TextStyle(fontSize: 18, color: AppStyles.textDark)),
        ],
      ),
    );
  }
}