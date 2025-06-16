import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

class TagManagementScreen extends StatelessWidget {
  final List<String> tags;            // Etiquetas que ya están asignadas al producto
  final List<String> availableTags;   // Etiquetas existentes en el sistema

  static const Color greenBackground = Color(0xFFC8E6C9);

  const TagManagementScreen({
    super.key,
    required this.tags,
    required this.availableTags,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestionar etiquetas'),
        backgroundColor: AppStyles.primaryGreen,
      ),
      backgroundColor: greenBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                GestureDetector(
                  onTap: () {
                    _showAddTagDialog(context);
                  },
                  child: Chip(
                    label: const Text(
                      'Añadir etiqueta',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: AppStyles.primaryGreen,
                    avatar: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1.5, color: Colors.grey),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: tags.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.label, color: AppStyles.primaryGreen),
                    title: Text(tags[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () {
                        _showConfirmDeleteDialog(context, tags[index]);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showConfirmDeleteDialog(BuildContext context, String tag) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmar eliminación'),
          content: Text('¿Estás seguro que deseas eliminar la etiqueta "$tag"?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () {
                Navigator.pop(context);
                // Lógica para eliminar la etiqueta del producto
              },
              child: const Text('Eliminar', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  void _showAddTagDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Selecciona una etiqueta o crea nueva'),
          children: [
            ...availableTags.map(
              (tag) => SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                  // Lógica para añadir esta etiqueta al producto
                },
                child: Text(tag),
              ),
            ),
            const Divider(),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
                _showCreateNewTagDialog(context);
              },
              child: const Row(
                children: [
                  Icon(Icons.add, color: AppStyles.primaryGreen),
                  SizedBox(width: 8),
                  Text('Crear nueva etiqueta', style: TextStyle(color: AppStyles.primaryGreen)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _showCreateNewTagDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Nueva etiqueta'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Ingrese el nombre de la etiqueta',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppStyles.primaryGreen),
              onPressed: () {
                Navigator.pop(context);
                // Lógica para añadir nueva etiqueta: controller.text
              },
              child: const Text('Crear', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
