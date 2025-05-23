import 'package:flutter/material.dart';
import 'Tags.dart';
import 'perms.dart';
import 'FileData.dart';
import 'HomePage.dart';
import 'LandingPage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class ViewFolders extends StatefulWidget {
  @override
  _ViewFoldersState createState() => _ViewFoldersState();
}
class _ViewFoldersState extends State<ViewFolders> {
  List<String> folders = [];
  List<String> recentFiles = [];
  String renameFolders = "Folder";
  String renameRecents = "Recent Files";
  
  final List<Map<String, dynamic>> fileCategories = [
    {'label': 'Videos', 'icon': Icons.movie, 'type': 'video'},
    {'label': 'Images', 'icon': Icons.image, 'type': 'image'},
    {'label': 'PDFs', 'icon': Icons.picture_as_pdf, 'type': 'pdf'},
    {'label': 'Music', 'icon': Icons.music_note, 'type': 'audio'},
    {'label': 'Archives', 'icon': Icons.archive, 'type': 'archive'},
    {'label': 'Others', 'icon': Icons.insert_drive_file, 'type': 'other'},
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
    loadTags();
  }

  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Folders'),
        backgroundColor: Color.fromARGB(255, 16, 51, 80),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children:
                  fileCategories.map((item) {
                    return Card(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item['icon'],
                            size: 40,
                            color: Colors.deepPurple,
                          ),
                          SizedBox(height: 10),
                          Text(
                            item['label'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            item['type'], 
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }