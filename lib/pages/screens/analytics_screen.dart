import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard de Análisis',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
        ),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sección de estadísticas
              Text(
                'Estadísticas Generales',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              const SizedBox(height: 10),
              // Wrap the Row in a SingleChildScrollView to handle overflow
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatCard('Cámaras Activas', '24', Icons.videocam),
                    _buildStatCard('Alertas Activas', '5', Icons.warning),
                    _buildStatCard('Usuarios Conectados', '12', Icons.person),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Sección de alertas de seguridad
              Text(
                'Alertas de Seguridad',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildAlertSection(),

              const SizedBox(height: 20),

              // Sección de tabla de cámaras
              Text(
                'Tabla de Cámaras',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildCameraTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String data, IconData icon) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.blueAccent),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              data,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertSection() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.redAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAlertRow('Alerta de movimiento en cámara 3', 'Hace 5 minutos'),
          const Divider(),
          _buildAlertRow('Rostro desconocido en cámara 7', 'Hace 15 minutos'),
          const Divider(),
          _buildAlertRow('Temperatura anormal en cámara 2', 'Hace 1 hora'),
        ],
      ),
    );
  }

  Widget _buildAlertRow(String alert, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(alert, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildCameraTable() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(3),
          2: FlexColumnWidth(1.5),
        },
        border: TableBorder.all(color: Colors.grey.shade300),
        children: [
          _buildTableRow('Cámara', 'Ubicación', 'Estado', isHeader: true),
          _buildTableRow('Cámara 1', 'Entrada Principal', 'Activa'),
          _buildTableRow('Cámara 2', 'Sala de Control', 'Inactiva'),
          _buildTableRow('Cámara 3', 'Estacionamiento', 'Activa'),
          _buildTableRow('Cámara 4', 'Oficina Principal', 'Activa'),
        ],
      ),
    );
  }

  TableRow _buildTableRow(String cam, String location, String status, {bool isHeader = false}) {
    return TableRow(
      decoration: isHeader
          ? BoxDecoration(color: Colors.blueAccent.withOpacity(0.3))
          : null,
      children: [
        _buildTableCell(cam, isHeader),
        _buildTableCell(location, isHeader),
        _buildTableCell(status, isHeader),
      ],
    );
  }

  Widget _buildTableCell(String text, bool isHeader) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          color: isHeader ? Colors.blueAccent : Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
