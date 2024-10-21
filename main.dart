void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gujarati Learning App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gujarati Learning App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlphabetScreen()),
                );
              },
              child: Text('Learn Alphabets'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MathScreen()),
                );
              },
              child: Text('Learn Mathematics'),
            ),
          ],
        ),
      ),
    );
  }
}

class AlphabetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gujarati Alphabets'),
      ),
      body: Center(
        child: Text('Alphabet learning goes here...'),
      ),
    );
  }
}

class MathScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mathematics'),
      ),
      body: Center(
        child: Text('Math learning goes here...'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class WritingPad extends StatefulWidget {
  @override
  _WritingPadState createState() => _WritingPadState();
}

class _WritingPadState extends State<WritingPad> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Practice Writing")),
      body: Column(
        children: [
          Signature(
            controller: _controller,
            height: 400,
            backgroundColor: Colors.grey[200]!,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  _controller.clear();
                },
                child: Text("Clear"),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_controller.isNotEmpty) {
                    final signature = await _controller.toPngBytes();
                    if (signature != null) {
                      // Store the signature or display it.
                    }
                  }
                },
                child: Text("Save"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SignLanguageScreen extends StatefulWidget {
  final String gujaratiText;

  SignLanguageScreen({required this.gujaratiText});

  @override
  _SignLanguageScreenState createState() => _SignLanguageScreenState();
}

class _SignLanguageScreenState extends State<SignLanguageScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Example: Load a pre-recorded sign language video based on the input text
    _controller = VideoPlayerController.asset('assets/sign_language/word1.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Language")),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

