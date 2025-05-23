import 'package:flutter/material.dart';
import 'perms.dart';
import 'FileData.dart';
import 'Tags.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'FoldersPage.dart';
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

  Future<String?> _showHoverBox(BuildContext context, List<String> tags) {
    return showDialog<String>(
      context: context,
      barrierDismissible: true, // Tap outside to close
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          elevation: 8,
          child: Container(
            width: 300,
            height: 400,
            color: Color.fromARGB(255, 16, 51, 80),
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children:
                        tags.map((tag) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(
                                context,
                              ).pop(tag); // Close the dialog
                            },
                            child: Card(
                              color: Color.fromARGB(255, 83, 130, 169),
                              child: Center(
                                child: Text(
                                  tag.toString().toUpperCase(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),
                // Add a close button
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _loadData() async {
    bool granted = await requestPermissions();
    if (granted) {
      String data = await getFileMetadata();
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
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewFolders(tag: tag),
                              ),
                            );
                          },
                          child: Container(
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
                              output[index]; // Assuming this is the file path
                          String? selectedTag = await _showHoverBox(
                            context,
                            tags,
                          );
                          if (selectedTag == null) {
                            return;
                          } else {
                            await addFileToTag(selectedTag, filePath);
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text(
                                  "Added ${filePath.split('/').last} to '$selectedTag' tag",
                                ),
                              ),
                            );
                          }
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
