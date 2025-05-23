import 'package:flutter/material.dart';
import 'Tags.dart';
import 'FoldersPage.dart';
import 'FileData.dart';
import 'package:path/path.dart' as p;
import 'theme.dart';

class SelectedFileFolder extends StatelessWidget {
  final String folderName;
  final List<String> files;

  SelectedFileFolder({required this.files, required this.folderName});

  @override
  Widget build(BuildContext context) {
    print("Selected Folder: $folderName");
    print("Files in Folder: $files");
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
         title: Text(
          '$folderName'.toUpperCase(),
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
      ),
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
                    leading: Icon(
                      getFileIcon(fileData),
                      color: colorScheme.tertiaryContainer,
                    ),
                    title: Text(fileData.split('/').last),
                    onTap: () {
                      // Implement file opening functionality here
                    },
                    trailing: Icon(
                      Icons.more_vert,
                      color: colorScheme.tertiaryContainer,
                    ),
                    tileColor: colorScheme.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
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

  if (['.jpg', '.jpeg', '.png', '.gif'].contains(ext)) {
    return Icons.image;
  } else if (['.mp4', '.avi', '.mov'].contains(ext)) {
    return Icons.movie;
  } else if (['.mp3', '.wav', '.m4a'].contains(ext)) {
    return Icons.music_note;
  } else if (['.pdf'].contains(ext)) {
    return Icons.picture_as_pdf;
  } else if (['.txt', '.doc', '.docx'].contains(ext)) {
    return Icons.description;
  } else if (['.zip', '.rar', '.7z'].contains(ext)) {
    return Icons.archive;
  } else {
    return Icons.insert_drive_file;
  }
}
