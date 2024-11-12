import 'dart:convert';
import 'package:http/http.dart' as http;


class NotificationService {
  final String _baseUrl = 'http://192.168.0.10:8080/api/alertas/obtener-notification';

  Future<List<NotificationAlarm>> fetchActiveAlerts() async {
    final response = await http.get(Uri.parse(_baseUrl));
    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      print('Data received: $data');  // Agrega un log aquí para ver los datos recibidos

      // Asegúrate de que la API devuelva un arreglo con al menos 1 notificación
      return data.map((alert) => NotificationAlarm.fromJson(alert)).toList();
    } else {
      throw Exception('Error al obtener las alertas activas');
    }
  }
}

class NotificationAlarm {
  final int id;
  final String tipo;
  final String mensaje;
  final String fecha;
  final List<String> imageUrls;

  NotificationAlarm({
    required this.id,
    required this.tipo,
    required this.mensaje,
    required this.fecha,
    required this.imageUrls,
  });

  factory NotificationAlarm.fromJson(Map<String, dynamic> json) {
    List<String> imageUrls = [];

    if (json['contenido'] != null) {
      // Verificar si es una lista o un solo elemento base64.
      if (json['contenido'] is List) {
        imageUrls = (json['contenido'] as List).cast<String>().toList();
      } else {
        imageUrls = [json['contenido']];
      }
    }

    return NotificationAlarm(
      id: json['id'],
      tipo: json['tipo'],
      mensaje: json['mensaje'],
      fecha: json['fecha'],
      imageUrls: imageUrls,  // Asignar lista de imágenes
    );
  }
}


