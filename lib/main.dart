import 'package:flutter/material.dart';
import 'Tags.dart';
import 'perms.dart';
import 'FileData.dart';
import 'HomePage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('tagFiles');
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

