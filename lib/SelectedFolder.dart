import 'package:flutter/material.dart';
import 'Tags.dart';
import 'FoldersPage.dart';
import 'FileData.dart';
import 'package:path/path.dart' as p;

class SelectedFileFolder extends StatelessWidget {
  final String folderName;
  final List<String> files;

  SelectedFileFolder({required this.files, required this.folderName});

  @override
  Widget build(BuildContext context) {
    print("Selected Folder: $folderName");
    print("Files in Folder: $files");
    return Scaffold(
      appBar: AppBar(title: Text('$folderName'.toUpperCase())),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: files.length,
                itemBuilder: (context, index) {
                  String fileData = files[index];
                  return ListTile(
                    leading: Icon(getFileIcon(fileData)),
                    title: Text(fileData.split('/').last),
                    onTap: () {
                      // Implement file opening functionality here
                    },
                  );
                },
              ),
            ],
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
