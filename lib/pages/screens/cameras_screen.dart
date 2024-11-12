import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CamerasScreen extends StatefulWidget {
  const CamerasScreen({super.key});

  @override
  _CamerasScreenState createState() => _CamerasScreenState();
}

class _CamerasScreenState extends State<CamerasScreen> {
  String selectedFilter = 'Person';
  List<String> videoPaths = [
    'assets/video/vi1.mp4',
    'assets/video/vi2.mp4',
    'assets/video/vi3.mp4',
    'assets/video/vi4.mp4',
    'assets/video/vi5.mp4'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Events',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),
        ),
        actions: [
          IconButton(icon: Icon(Icons.filter_list, color: Colors.white), onPressed: () {}),
          IconButton(icon: Icon(Icons.settings, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterChip(
                  label: Text('Person'),
                  selected: selectedFilter == 'Person',
                  onSelected: (selected) => setState(() => selectedFilter = 'Person'),
                ),
                FilterChip(
                  label: Text('Motion'),
                  selected: selectedFilter == 'Motion',
                  onSelected: (selected) => setState(() => selectedFilter = 'Motion'),
                ),
                FilterChip(
                  label: Text('Cameras'),
                  selected: selectedFilter == 'Cameras',
                  onSelected: (selected) => setState(() => selectedFilter = 'Cameras'),
                ),
              ],
            ),
          ),
          Divider(),
          Expanded(
            child: ListView(
              children: videoPaths.map((path) {
                return VideoCard(videoPath: path);
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.videocam), label: 'Events'),
          BottomNavigationBarItem(icon: Icon(Icons.shield), label: 'Monitoring'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
        currentIndex: 1,
        onTap: (index) {},
      ),
    );
  }
}

class VideoCard extends StatefulWidget {
  final String videoPath;

  const VideoCard({required this.videoPath});

  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.videoPath),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.5) {
          _videoController.play();
        } else {
          _videoController.pause();
        }
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: ListTile(
          leading: _videoController.value.isInitialized
              ? AspectRatio(
            aspectRatio: _videoController.value.aspectRatio,
            child: VideoPlayer(_videoController),
          )
              : CircularProgressIndicator(),
          title: Text(widget.videoPath.split('/').last),
        ),
      ),
    );
  }
}
