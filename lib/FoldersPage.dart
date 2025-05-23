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


class ViewFolders extends StatefulWidget {
  final String? tag;

  ViewFolders({this.tag});
  @override
  _ViewFoldersState createState() => _ViewFoldersState();
}

class _ViewFoldersState extends State<ViewFolders> {
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

  // void _Filtertag(String tag) {
  //   List<String> newFiltered = [];
  //   for (var file in name) {
  //     if (file.contains(tag)) {
  //       newFiltered.add(file);
  //     }
  //   }
  //   setState(() {
  //     filteredFiles = newFiltered;
  //   });
  // }

  void _loadData() async {
    tag = widget.tag;
    if (tag == null) {
      return;
    } else {
      String tog = tag!;
      print(tog);
      List<String> data = getFilesForTag(tog);
      print(data);

      name = data;
      filteredFiles = data;

      // Filter only if tag is passed
      // if (widget.tag != null) {
      //   filteredFiles =
      //       data.where((file) => file.contains(widget.tag!)).toList();
      // } else {
      //   filteredFiles = ['Loading Files Data...'];
      // }
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$tag'.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 12, 12, 56),
      ),
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
                children:
                    fileCategories.map((item) {
                      return GestureDetector(
                        onTap: (){
                          String query = item['type'];
                          setState(() {
                            filteredFiles =
                            filteredFiles
                              .where((entry) => entry.contains(query))
                              .toList();
                          });
                          print("Filtered Files: $filteredFiles");
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
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  item['icon'],
                                  size: 40,
                                  color: const Color.fromARGB(255, 12, 12, 56),
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
