import 'dart:convert';
import 'package:http/http.dart' as http;

class AlertService {
  final String _baseUrl = 'http://192.168.0.10:8080/api/alertas/imagen';

  Future<List<ImageAlarm>> fetchActiveAlerts() async {
    final response = await http.get(Uri.parse(_baseUrl));
    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      print('Data received: $data');  // Agrega un log aquí para ver los datos recibidos

      // Asegúrate de que la API devuelva un arreglo con al menos 3 imágenes
      return data.take(1).map((alert) => ImageAlarm.fromJson(alert)).toList();
    } else {
      throw Exception('Error al obtener las alertas activas');
    }
  }

}


class ImageAlarm {
  final int id;
  final List<String> imageUrl;
  final String imageDate;

  ImageAlarm({
    required this.id,
    required this.imageUrl,
    required this.imageDate,
  });

  factory ImageAlarm.fromJson(Map<String, dynamic> json) {
    List<String> imageUrls = [];

    if (json['contenido'] != null) {
      // Suponiendo que `contenido` podría contener varias imágenes codificadas en base64.
      if (json['contenido'] is List) {
        imageUrls = (json['contenido'] as List).map((img) {
          return "data:image/jpeg;base64,$img";
        }).toList();
      } else {
        imageUrls = ["data:image/jpeg;base64,${json['contenido']}"];
      }
    }

    return ImageAlarm(
      id: json['id'],
      imageUrl: imageUrls,
      imageDate: json['fechaCaptura'] ?? 'Fecha no disponible',
    );
  }
}

