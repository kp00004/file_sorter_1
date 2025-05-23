import 'package:flutter/material.dart';
import 'Tags.dart';
import 'FoldersPage.dart';
import 'FileData.dart';

class TaggedFileFolder extends StatelessWidget {

  final List<String> files;

  TaggedFileFolder({required this.files});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: ListView.builder(
        itemCount: files.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(files[index]),
            onTap: () {
              // Handle file tap
            },
          );
        },
      ),
    );
  }
}