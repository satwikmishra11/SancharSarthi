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
