import 'package:flutter/material.dart';
import '../utils/app_styles.dart';
import 'product_detail_screen.dart';  // Importa la nueva pantalla de producto

class CategoryDetailScreen extends StatelessWidget {
  final String categoryName;

  const CategoryDetailScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: AppStyles.primaryGreen,
      ),
      backgroundColor: Colors.green[100],
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: 5, // Simula 5 productos
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              onTap: () {
                // Navegar al detalle del producto
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailScreen(
                      productName: 'Producto ${index + 1}',
                      salePrice: 50 + index * 10.0,
                      costPrice: 30 + index * 5.0,
                      quantity: 10 + index,
                      tags: ['Etiqueta A', 'Etiqueta B'],
                      imageUrl: 'https://via.placeholder.com/150', // Imagen de prueba
                    ),
                  ),
                );
              },
              leading: Icon(Icons.shopping_bag, color: AppStyles.primaryGreen),
              title: Text('Producto ${index + 1}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Precio venta: \$${50 + index * 10.0}'),
                  Text('Cantidad: ${10 + index}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
