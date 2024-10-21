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
