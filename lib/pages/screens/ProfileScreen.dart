import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        automaticallyImplyLeading: false, // Oculta la flecha de retroceso
        title: Text(
          'Perfil',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              // Manejar las acciones de las opciones del menú
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'privacy',
                  child: Row(
                    children: [
                      Icon(Icons.security, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Privacidad'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'notifications',
                  child: Row(
                    children: [
                      Icon(Icons.notifications, color: Colors.blue),
                      SizedBox(width: 8),
                      Text('Notificaciones'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'update',
                  child: Row(
                    children: [
                      Icon(Icons.account_circle, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Actualizar perfil'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'logout',
                  child: Row(
                    children: [
                      Icon(Icons.logout, color: Colors.blue),
                      SizedBox(width: 8),
                      Text('Cerrar sesión'),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.blueAccent,
              height: 280,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/hom.webp'),
                      backgroundColor: Colors.white,
                    ),

                    SizedBox(height: 16),
                    Text(
                      'Juan Pérez Molina',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Teléfono: +51 978786735',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white ,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Correo: juan.perez@correo.com',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Dirección: Av. Universitaria 512',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: Colors.blue),
                  label: const Text(
                    'Editar Información',
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w700),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0, // Elimina la sombra para que se vea más limpio
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                ),

                ElevatedButton.icon(
                  onPressed: () {

                  },
                  icon: Icon(Icons.warning, color: Colors.white),
                  label: const Text('Emergencia', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.camera_alt, color: Colors.blue),
                    title: Text('Mantenimiento de Cámaras'),
                    subtitle: Text('Consejos para el cuidado y revisión de equipos.'),
                    onTap: () {
                      // Acción al presionar
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.shield, color: Colors.red),
                    title: Text('Protección y Seguridad'),
                    subtitle: Text('Asegura el acceso a tus cámaras de forma segura.'),
                    onTap: () {
                      // Acción al presionar
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.history, color: Colors.blue),
                    title: Text('Historial de Actividades'),
                    subtitle: Text('Revisa las actividades recientes en el sistema.'),
                    onTap: () {
                      // Acción al presionar
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}