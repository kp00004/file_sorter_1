import 'package:flutter/material.dart';
import 'perms.dart';
import 'FileData.dart';

class FileHome extends StatefulWidget {
  @override
  _FileHomeState createState() => _FileHomeState();
}

class _FileHomeState extends State<FileHome> {
  String output = "Loading file metadata...";

  void _loadData() async {
    bool granted = await requestPermissions();
    if (granted) {
      String data = await getFileMetadata();
      setState(() {
        output = data;
      });
    } else {
      setState(() {
        output = "Permission denied.";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData(); // Safe: not async itself, just calls async function
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("File Metadata Viewer")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(child: Text(output)),
      ),
    );
  }
}
