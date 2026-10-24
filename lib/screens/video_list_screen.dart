import 'package:flutter/material.dart';
import 'video_player_screen.dart';

class VideoListScreen extends StatelessWidget {
  const VideoListScreen({super.key});

  // Replace each videoId with a real YouTube video ID
  static const videos = [
    {'title': 'Alphabet Song', 'videoId': 'ccEpTTZW34g'},
    {'title': 'Counting 1 to 10', 'videoId': 'Yt8GFgxlITs'},
    {'title': 'Colours Song', 'videoId': 'k7npO4Hc8vA'},
    {'title': 'Ghana Animals', 'videoId': 'uSdXATigBPc'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Videos')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: videos.length,
        itemBuilder: (context, i) {
          final v = videos[i];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.play_circle_fill,
                  size: 48, color: Colors.red),
              title: Text(v['title']!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => VideoPlayerScreen(
                      title: v['title']!, videoId: v['videoId']!),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}