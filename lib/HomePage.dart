import 'package:flutter/material.dart';
import 'perms.dart';
import 'FileData.dart';
import 'package:path/path.dart' as p;

class FileHome extends StatefulWidget {
  @override
  _FileHomeState createState() => _FileHomeState();
}

class _FileHomeState extends State<FileHome> {
  //String output = "Loading file metadata...";
  List<String> output = ["Loading file metadata..."];
  final TextEditingController _controller = TextEditingController();

  void _loadData() async {
    bool granted = await requestPermissions();
    if (granted) {
      // String data = await getFileMetadata();
      // setState(() {
      //   output = data;
      // });
      String data = await getFileMetadata();
      setState(() {
        output =
            data
                .split('---')
                .map((e) => e.trim())
                .where((e) => e.isNotEmpty)
                .toList();
      });
    } else {
      setState(() {
        output = ["Permission denied."];
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
      body: Column(
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
                    output.where((entry) => entry.contains(query)).toList();
              });
            },
          ),
          Padding(padding: const EdgeInsets.all(16)),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children:
                  output.map((entry) {
                    return Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            getFileIcon(entry), //icon getter
                            size: 36,
                            color: Colors.deepPurple,
                          ),
                          SizedBox(height: 8),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Text(
                                entry.split('/').last, //  short filename
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
            ),
          ),
        ],
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