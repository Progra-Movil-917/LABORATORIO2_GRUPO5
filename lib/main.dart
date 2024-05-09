import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PodcastPlayerScreen(),
    );
  }
}

class PodcastPlayerScreen extends StatefulWidget {
  @override
  _PodcastPlayerScreenState createState() => _PodcastPlayerScreenState();
}

class _PodcastPlayerScreenState extends State<PodcastPlayerScreen> {
  bool _isPlaying = false;
  double _progress = 0.0;

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Podcast Player'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Nombre del Podcast',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Icon(
            _isPlaying ? Icons.pause : Icons.play_arrow,
            size: 80.0,
            color: Colors.blue,
          ),
          SizedBox(height: 20.0),
          Text(
            '00:00 / 25:30',
            style: TextStyle(fontSize: 16.0),
          ),
          Slider(
            value: _progress,
            min: 0.0,
            max: 100.0,
            onChanged: (value) {
              setState(() {
                _progress = value;
              });
            },
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous),
                iconSize: 40.0,
                onPressed: () {
                  // Implement skip to previous logic
                },
              ),
              IconButton(
                icon: _isPlaying ? Icon(Icons.pause_circle_filled) : Icon(Icons.play_circle_filled),
                iconSize: 60.0,
                onPressed: _togglePlayPause,
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                iconSize: 40.0,
                onPressed: () {
                  // Implement skip to next logic
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
