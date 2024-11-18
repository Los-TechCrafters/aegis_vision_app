import 'package:flutter/material.dart';

class CamerasScreen extends StatelessWidget {
  const CamerasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Analysis'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Camera View Section
            _buildCameraView(),
            const SizedBox(height: 20),

            // Sensor Locations Section
            const Text(
              'Sensor Locations',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildSensorTile(Colors.blue, 'Main Entrance'),
            _buildSensorTile(Colors.green, 'Backyard'),
            _buildSensorTile(Colors.red, 'Windows'),
            const SizedBox(height: 20),

            // Motion Detected Section
            const Text(
              'Motion Detected',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMotionCard('Living Room', '2', 'Increased'),
                _buildMotionCard('Backyard', '1', 'Stable'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCameraView() {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.videocam, color: Colors.white),
            ),
            title: Text('AI Analysis'),
            subtitle: Text('Real-time Movement Patterns'),
            trailing: Icon(Icons.more_vert),
          ),
          Container(
            height: 200,
            color: Colors.grey[200],
            child: const Center(
              child: Text(
                'Camera View',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSensorTile(Color color, String location) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        radius: 8,
      ),
      title: Text(location),
    );
  }

  Widget _buildMotionCard(String location, String count, String status) {
    return Expanded(
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                location,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                count,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                status,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
