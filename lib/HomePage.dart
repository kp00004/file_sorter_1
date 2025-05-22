import 'package:flutter/material.dart';
import 'perms.dart';
import 'FileData.dart';
import 'Tags.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:path/path.dart' as p;

class FileHome extends StatefulWidget {
  @override
  _FileHomeState createState() => _FileHomeState();
}

class _FileHomeState extends State<FileHome> {
  //String output = "Loading file metadata...";
  late final List<String> name;
  List<String> output = ["Loading file metadata..."];
  List<String> tags = [];
  var renameFolders = "Folder";
  var renameRecents = "Recent Files";
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> fileCategories = [
    {'label': 'Videos', 'icon': Icons.movie, 'type': 'video'},
    {'label': 'Images', 'icon': Icons.image, 'type': 'image'},
    {'label': 'PDFs', 'icon': Icons.picture_as_pdf, 'type': 'pdf'},
    {'label': 'Music', 'icon': Icons.music_note, 'type': 'audio'},
    {'label': 'Archives', 'icon': Icons.archive, 'type': 'archive'},
    {'label': 'Others', 'icon': Icons.insert_drive_file, 'type': 'other'},
  ];

  void _loadData() async {
    bool granted = await requestPermissions();
    if (granted) {
      String data = await getFileMetadata();
      print(files);
      setState(() {
        output =
            data
                .split('---')
                .map((e) => e.trim())
                .where((e) => e.isNotEmpty)
                .toList();
      });
      name = output;
    } else {
      setState(() {
        output = ["Permission denied."];
      });
    }
  }

  void loadTags() {
    setState(() {
      tags = getAllTags();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData(); // Safe: not async itself, just calls async function
    loadTags();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("File Metadata Viewer")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                SizedBox(height: 12),
                SearchBar(
                  controller: _controller,
                  hintText: "Search files...",
                  onTap: () {
                    // Implement search functionality here
                    String query = _controller.text;
                    setState(() {
                      output =
                          output
                              .where((entry) => entry.contains(query))
                              .toList();
                    });
                  },
                  onChanged: (value) {
                    // print(output);
                    // print(name);
                    setState(() {
                      if (value.isEmpty) {
                        output = name;
                      } else {
                        output =
                            name
                                .where((entry) => entry.contains(value))
                                .toList();
                      }
                    });
                  },
                ),
                //Padding(padding: const EdgeInsets.all(16)),
                SizedBox(height: 12),
                Text(
                  renameFolders,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  //textAlign: TextAlign.start,
                ),
                SizedBox(height: 12),

                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children:
                      tags.map((tag) {
                        return Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 16, 51, 80),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                '#',
                                style: TextStyle(color: Colors.white),
                                maxLines: 1,
                                minFontSize: 8,
                                overflow: TextOverflow.ellipsis,
                              ),

                              AutoSizeText(
                                tag.toString().toUpperCase(),
                                style: TextStyle(color: Colors.white),
                                maxLines: 1,
                                minFontSize: 8,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                ),

                SizedBox(height: 12),
                Text(
                  renameRecents,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  //textAlign: TextAlign.start,
                ),
                SizedBox(height: 12),

                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: output.length,
                  itemBuilder: (context, index) {
                    String fileData = output[index];
                    return ListTile(
                      leading: Icon(getFileIcon(fileData)),
                      title: Text(fileData.split('/').last),
                      onTap: () {
                        // Implement file opening functionality here
                      },
                      trailing: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () async {
                          String filePath =
                              output[index]; // assuming you're inside itemBuilder
                          await addFileToTag('work', filePath);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                "Added ${filePath.split('/').last} to 'work' tag",
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

IconData getFileIcon(String filename) {
  final ext = p.extension(filename).toLowerCase();

  if (['.jpg', '.jpeg', '.png', '.gif'].contains(ext)) return Icons.image;
  if (['.mp4', '.avi', '.mov'].contains(ext)) return Icons.movie;
  if (['.mp3', '.wav', '.m4a'].contains(ext)) return Icons.music_note;
  if (['.pdf'].contains(ext)) return Icons.picture_as_pdf;
  if (['.txt', '.doc', '.docx'].contains(ext)) return Icons.description;
  if (['.zip', '.rar', '.7z'].contains(ext)) return Icons.archive;
  return Icons.insert_drive_file;
}
