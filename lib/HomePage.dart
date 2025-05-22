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
          SizedBox(height: 12),
          Text(
            renameFolders,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children:
                  fileCategories.map((item) {
                    return Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
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
                    );
                  }).toList(),
            ),
          ),
          SizedBox(height: 12),
          Text(
            renameRecents,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: output.length,
              itemBuilder: (context, index) {
                String fileData = output[index];
                return ListTile(
                  leading: Icon(getFileIcon(fileData)),
                  title: Text(fileData.split('/').last,),
                  onTap: () {
                    // Implement file opening functionality here
                  },
                );
              },
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
