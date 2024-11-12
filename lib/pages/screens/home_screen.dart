import 'dart:convert';
import 'package:aegis_vision_app/pages/screens/service/AlertService.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'alert_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _AlertScreenState createState() => _AlertScreenState();
}

class _AlertScreenState extends State<HomeScreen> {
  final AlertService _alertService = AlertService();
  List<ImageAlarm> _alerts = [];

  bool _isNotificationsOn = true;

  DateTime _currentDate = DateTime.now();
  DateTime _firstDayOfWeek = DateTime.now();

  // Método para obtener el nombre corto del día
  String get currentDay => DateFormat('EEE').format(_currentDate); // Día corto
  String get currentDateFormatted =>
      DateFormat('dd').format(_currentDate); // Día numérico
  String get currentMonth =>
      DateFormat('MMM').format(_currentDate); // Nombre corto del mes
  String get currentYear => DateFormat('yyyy').format(_currentDate); // Año

  // Método para obtener los 7 días de la semana
  List<DateTime> get weekDays {
    List<DateTime> days = [];
    for (int i = 0; i < 7; i++) {
      days.add(_firstDayOfWeek.add(Duration(days: i)));
    }
    return days;
  }

  // Método para cambiar a la siguiente semana
  void _nextWeek() {
    setState(() {
      _firstDayOfWeek = _firstDayOfWeek.add(Duration(days: 7));
    });
  }

  // Método para cambiar a la semana anterior
  void _previousWeek() {
    setState(() {
      _firstDayOfWeek = _firstDayOfWeek.subtract(Duration(days: 7));
    });
  }

  // Método para actualizar el mes y año al primer día de la semana actual
  void _updateMonthYear() {
    setState(() {
      _currentDate = _firstDayOfWeek;
    });
  }

  @override
  Widget build(BuildContext context) {
    _updateMonthYear();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          // Barra de estado a blanco
          flexibleSpace: Stack(
            fit: StackFit.expand,
            children: [
              // Imagen de fondo
              Image.asset(
                'assets/house.jpg',
                fit: BoxFit.cover,
              ),

              Container(
                color: Colors.black.withOpacity(0.7),
              ),
              // Mensaje de bienvenida y nombre de usuario
              Positioned(
                top: 40, // Ajusta la posición hacia arriba
                left: 16,
                child: Row(
                  children: [
                    // Avatar del usuario
                    CircleAvatar(
                      radius: 22, // Ajusta el tamaño del avatar
                      backgroundImage:
                          AssetImage('assets/hom.webp'), // Ruta del avatar
                    ),
                    SizedBox(width: 10), // Espacio entre el avatar y el nombre
                    // Contenedor para el nombre del usuario
                    Container(
                      width: 200, // Ajusta el ancho según el espacio disponible
                      child: Text(
                        'Aegie Vision', // Nombre de usuario
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1, // Limita a una línea
                        overflow: TextOverflow
                            .ellipsis, // Muestra puntos suspensivos si es largo
                      ),
                    ),
                  ],
                ),
              ),

              // Botones en la parte inferior izquierda
              Positioned(
                bottom: 10,
                left: 16,
                child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 32,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildButton('Policia', Icons.local_police),
                      const SizedBox(width: 6),
                      _buildButton('Boton de Emergencia', Icons.call_end),
                      const SizedBox(width: 6),
                      _buildButton('Hospital', Icons.local_hospital),
                      const SizedBox(width: 6),
                      _buildButton('History', Icons.history),
                      const SizedBox(width: 6),
                      _buildButton('Settings', Icons.settings),
                      const SizedBox(width: 6),
                      _buildButton('', Icons.add),
                    ],
                  ),
                ),
              ),
            ],
          ),

          actions: [
            // Icono de notificación con punto rojo cuando está activado
            IconButton(
              icon: Stack(
                children: [
                  // Campana
                  Icon(
                    Icons.notifications,
                    color: _isNotificationsOn ? Colors.blue : Colors.grey,
                    // Azul cuando está activado, grey cuando está desactivado
                    size: 30,
                  ),
                  // Punto rojo
                  if (_isNotificationsOn)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                ],
              ),
              onPressed: () {
                setState(() {
                  if (_isNotificationsOn) {
                    // Desactiva las notificaciones y navega a AlertScreen
                    _isNotificationsOn = false;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AlertScreen()),
                    );
                  } else {
                    // Activa las notificaciones
                    _isNotificationsOn = true;
                    // Puedes agregar alguna lógica adicional si lo deseas
                    print('Notificaciones activadas');
                  }
                });
              },
            ),
            // Menú de opciones en el AppBar
            PopupMenuButton<String>(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 25,
              ),
              onSelected: (value) {
                // Lógica de las acciones del menú
                if (value == 'Configurar Cámara') {
                  // Acción para configurar la cámara de seguridad
                } else if (value == 'Ver Alertas') {
                  // Acción para ver alertas de movimiento
                } else if (value == 'Cerrar sesión') {
                  // Acción para cerrar sesión
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'Configurar Cámara',
                    child: Row(
                      children: [
                        Icon(Icons.camera_alt, color: Colors.black87),
                        SizedBox(width: 10),
                        Text('Configurar Cámara'),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'Ver Alertas',
                    child: Row(
                      children: [
                        Icon(Icons.notifications, color: Colors.black87),
                        SizedBox(width: 10),
                        Text('Ver Alertas'),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'Cerrar sesión',
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: Colors.black87),
                        SizedBox(width: 10),
                        Text('Cerrar sesión'),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Fila de flechas y texto del mes/año sin Padding extra
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () {
                  _previousWeek();
                  _updateMonthYear();
                },
              ),
              SizedBox(width: 4), // Espacio reducido entre la flecha y el texto
              Text(
                '$currentMonth $currentYear',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 4), // Espacio reducido entre el texto y la flecha
              IconButton(
                icon: Icon(Icons.arrow_forward),
                color: Colors.black,
                onPressed: () {
                  _nextWeek();
                  _updateMonthYear();
                },
              ),
            ],
          ),

          // Carrusel de los días de la semana sin Padding extra
          SizedBox(
            height: 60, // Ajusta la altura del carrusel
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                DateTime day = weekDays[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentDate = day;
                    });
                  },
                  child: Container(
                    width: 50,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    // Reduce el margen
                    decoration: BoxDecoration(
                      color: _currentDate.weekday == day.weekday
                          ? Colors.cyanAccent
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('EEE').format(day),
                          // Día corto (Mon, Tue, etc.)
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('dd').format(day), // Fecha del día
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Línea debajo de los días de la semana
          Container(
            margin: EdgeInsets.only(top: 8),
            height: 1,
            color: Colors.grey[400], // Color de la línea
          ),

          // Fondo tipo cuadrícula con el círculo de carga
          Expanded(
            child: FutureBuilder<List<ImageAlarm>>(
              future: AlertService().fetchActiveAlerts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No hay alertas activas.'));
                } else {
                  final _alerts = snapshot.data!;
                  return ListView.builder(
                    itemCount: _alerts.length,
                    itemBuilder: (context, index) {
                      final alert = _alerts[index];
                      return AlertCard(alert: alert);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          if (text.isNotEmpty) ...[
            const SizedBox(width: 5),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ],
        ],
      ),
    );
  }
}

class AlertCard extends StatelessWidget {
  final ImageAlarm alert;

  AlertCard({required this.alert});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Text(
                'Imágenes Recientes',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.expand_more,
                color: Colors.grey.shade600,
                size: 24,
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carrusel de imágenes si hay más de una
              if (alert.imageUrl.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: CarouselSlider.builder(
                    itemCount: alert.imageUrl.length,
                    options: CarouselOptions(
                      height: 220,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      viewportFraction: 1.0,
                    ),
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      return Image.memory(
                        base64Decode(alert.imageUrl[index].split(',')[1]),
                        width: double.infinity,
                        height: 220,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fecha: ${_formatDate(alert.imageDate)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDate(String date) {
    try {
      final DateTime parsedDate = DateTime.parse(date);
      return '${parsedDate.day}/${parsedDate.month}/${parsedDate.year} ${parsedDate.hour}:${parsedDate.minute}';
    } catch (e) {
      return date; // Si hay error en el formato, retorna el valor original
    }
  }
}
