import 'package:flutter/material.dart';
import 'Tags.dart';
import 'perms.dart';
import 'FileData.dart';
import 'HomePage.dart';
import 'LandingPage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'util.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('tagFiles');
  runApp(MyApp()); // Entry point of the app
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, "Bree Serif", "Pacifico");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(

      title: 'File Metadata Viewer',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: PageofLand(),
    );
  }
}

