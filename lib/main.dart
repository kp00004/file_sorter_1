import 'package:flutter/material.dart';
import 'perms.dart';
import 'FileData.dart';
import 'HomePage.dart';

void main() {
  runApp(MyApp()); // Entry point of the app
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Metadata Viewer',
      home: FileHome(),
    );
  }
}

