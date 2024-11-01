import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  final String studentUid;

  ProgressScreen({required this.studentUid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Progress")),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('progress').doc(studentUid).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          var progressData = snapshot.data!;
          return Column(
            children: [
              Text('Math Progress: ${progressData['math_progress'].toString()}'),
              Text('Science Progress: ${progressData['science_progress'].toString()}'),
            ],
          );
        },
      ),
    );
  }
}
