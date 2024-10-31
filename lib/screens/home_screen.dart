import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Security'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User greeting
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text('Welcome back!', style: TextStyle(fontSize: 16)),

            const SizedBox(height: 20),

            // Recent Alerts
            const Text(
              'Recent Alerts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // View More Button
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('View More'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Live Camera Feeds Placeholder
            Container(
              height: 100,
              color: Colors.grey[300],
              child: const Center(
                child: Text(
                  'Live Camera Feeds',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Security Overview
            const Text(
              'Security Overview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                OverviewCard(title: 'Total Alerts', count: '23'),
                OverviewCard(title: 'Locked Doors', count: '4'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                OverviewCard(title: 'Unlocked Doors', count: '1'),
                OverviewCard(title: 'Cameras Active', count: '6'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget for overview cards
class OverviewCard extends StatelessWidget {
  final String title;
  final String count;

  const OverviewCard({required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              count,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
