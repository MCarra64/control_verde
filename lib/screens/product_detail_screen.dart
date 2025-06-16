import 'package:flutter/material.dart';
import '../utils/app_styles.dart';
import 'tag_management_screen.dart';  // Importa la nueva pantalla

class ProductDetailScreen extends StatelessWidget {
  final String productName;
  final double costPrice;
  final double salePrice;
  final int quantity;
  final List<String> tags;
  final String imageUrl;

  static const Color greenBackground = Color(0xFFC8E6C9);

  const ProductDetailScreen({
    super.key,
    required this.productName,
    required this.costPrice,
    required this.salePrice,
    required this.quantity,
    required this.tags,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
        backgroundColor: AppStyles.primaryGreen,
      ),
      backgroundColor: greenBackground,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.image,
                  size: 60,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Nombre: $productName',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const Divider(thickness: 1.5, color: Colors.grey),

            Text(
              'Precio de costo: \$${costPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Precio de venta: \$${salePrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Cantidad: $quantity',
              style: const TextStyle(fontSize: 16),
            ),

            const Divider(thickness: 1.5, color: Colors.grey),

            const SizedBox(height: 8),
            const Text(
              'Etiquetas:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ...tags.map((tag) => Chip(label: Text(tag))),
                GestureDetector(
                  onTap: () {
                    // Navegar a la pantalla de gestión de etiquetas
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TagManagementScreen(
                          tags: tags,
                          availableTags: ['Etiqueta A', 'Etiqueta B', 'Etiqueta C'], // Ejemplo de etiquetas disponibles
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: AppStyles.primaryGreen,
                    child: const Icon(Icons.edit, color: Colors.white, size: 18),
                  ),
                )
              ],
            ),

            const Divider(thickness: 1.5, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
