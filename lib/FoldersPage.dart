import 'package:flutter/material.dart';
import 'Tags.dart';
import 'perms.dart';
import 'FileData.dart';
import 'HomePage.dart';
import 'LandingPage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart' as p;
import 'SelectedFolder.dart';
import 'theme.dart'; // <-- Import your theme

class ViewFolders extends StatefulWidget {
  final String? tag;

  const ViewFolders({Key? key, this.tag}) : super(key: key);
  @override
  ViewFoldersState createState() => ViewFoldersState();
}

class ViewFoldersState extends State<ViewFolders> {
  List<String> name = [];
  String? tag;
  List<String> filteredFiles = ["Loading Files Data..."];
  String renameFolders = "Folder";
  String renameRecents = "Recent Files";

  final List<Map<String, dynamic>> fileCategories = [
    {'label': 'Videos', 'icon': Icons.movie, 'type': '.mp4'},
    {'label': 'Images', 'icon': Icons.image, 'type': '.jpg'},
    {'label': 'PDFs', 'icon': Icons.picture_as_pdf, 'type': '.pdf'},
    {'label': 'Music', 'icon': Icons.music_note, 'type': '.mp3'},
    {'label': 'Archives', 'icon': Icons.archive, 'type': 'archive'},
    {'label': 'Others', 'icon': Icons.insert_drive_file, 'type': 'other'},
  ];

  void _loadData() async {
    tag = widget.tag;
    if (tag == null) {
      return;
    } else {
      String tog = tag!;
      List<String> data = getFilesForTag(tog);
      name = data;
      filteredFiles = data;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$tag'.toUpperCase(),
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        backgroundColor: colorScheme.primaryContainer,
      ),
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: fileCategories.map((item) {
                  return GestureDetector(
                    onTap: () {
                      String query = item['type'];
                      setState(() {
                        filteredFiles = filteredFiles
                            .where((entry) => entry.contains(query))
                            .toList();
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectedFileFolder(
                            files: filteredFiles,
                            folderName: item['label'],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                      color: colorScheme.primaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              item['icon'],
                              size: 40,
                              color: colorScheme.tertiaryContainer,
                            ),
                            SizedBox(height: 10),
                            Text(
                              item['label'],
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.tertiaryContainer,
                              ),
                            ),
                            Text(
                              item['type'],
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
