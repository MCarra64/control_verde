import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State <MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Control Verde', 
            style: TextStyle(fontSize: 25, color: Colors.white)
          ),
          backgroundColor: const Color.fromARGB(255, 49, 167, 13),
          bottom: const TabBar(
            // Propiedades de la barra de pestañas
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            labelStyle: TextStyle(fontSize: 18),
            unselectedLabelStyle: TextStyle(fontSize: 16),
            // Cambia el color de la barra de selección
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.inventory)),
              Tab(icon: Icon(Icons.show_chart_outlined)),
              Tab(icon: Icon(Icons.checklist)),
            ],
          ),
        ),
        body: TabBarView(
          // Propiedades de la vista de pestañas
          children: [

            // Contenido de la pestaña 1
            Stack(
              children: [
                Container(
                  color: Colors.white,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Recientes',
                          style: TextStyle(fontSize: 30, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ListTile(
                        leading: Text('🛒', style: TextStyle(fontSize: 30)),
                        title: const Text('Venta', style: TextStyle(fontSize: 20)),
                      ),
                      ListTile(
                        leading: Text('🛒', style: TextStyle(fontSize: 30)),
                        title: const Text('Venta', style: TextStyle(fontSize: 20)),
                      ),
                      ListTile(
                        leading: Text('📦', style: TextStyle(fontSize: 30)),
                        title: const Text('Inventario Añadido', style: TextStyle(fontSize: 20)),
                      ),
                      ListTile(
                        leading: Text('📦', style: TextStyle(fontSize: 30)),
                        title: const Text('Inventario Añadido', style: TextStyle(fontSize: 20)),
                      ),
                      ListTile(
                        leading: Text('📦', style: TextStyle(fontSize: 30)),
                        title: const Text('Inventario Añadido', style: TextStyle(fontSize: 20)),
                      ),
                      ListTile(
                        leading: Text('🛒', style: TextStyle(fontSize: 30)),
                        title: const Text('Venta', style: TextStyle(fontSize: 20)),
                      ),
                    
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    margin: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción del botón flotante
                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 49, 167, 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                      child: const Text('Agregar', style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                  )
                ),
              ],
            ),
            
          // Pestaña 2: Interfaz de "Verdureria el Ahorro"
Container(
  color: const Color(0xFFFDF1E7),
  child: Column(
    children: [
    
      Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          children: [
            Icon(Icons.search, color: Colors.white),
            SizedBox(width: 10),
            Text('Busqueda',
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ),
      Expanded(
        child: GridView.count(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: const [
            CategoryButton(text: 'Verduras'),
            CategoryButton(text: 'Lacteos'),
            CategoryButton(text: 'Carnes'),
            CategoryButton(text: 'Abarroteria'),
            CategoryButton(text: 'Limpieza'),
            CategoryButton(text: 'Verdura'),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: ElevatedButton(
          onPressed: () {
            // Acción para añadir producto
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2B5D4F),
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
          ),
          child: const Text('añadir producto',
              style: TextStyle(fontSize: 16, color: Colors.white)),
        ),
      ),
    ],
  ),
),


            // Contenido de la pestaña 3
            Container(
              color: Colors.white,
              child: const Center(child: Text('Contenido de Tab 3')),
            ),
            
            // Contenido de la pestaña 4
            Container(
              color: Colors.white,
              child: const Center(child: Text('Contenido de Tab 4')),
            ),
            
          ],
        )
    ));
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  const CategoryButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFA5C5A2),
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
