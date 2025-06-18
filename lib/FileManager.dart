import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'HomePage.dart';
import 'Menu.dart';
//import 'package:path/path_provider.dart';


class FileExplorer extends StatefulWidget {
  final Directory? directory;
  const FileExplorer({this.directory, super.key});

  @override
  State<FileExplorer> createState() => _FileExplorerState();
}

class _FileExplorerState extends State<FileExplorer> {
  Directory? currentDir;
  List<FileSystemEntity> items = [];

  @override
  void initState() {
    super.initState();
    Directory? dir = widget.directory??Directory('/storage/emulated/0');
    loadFiles(dir);
  }

  void loadFiles(Directory dir) {
    try {
      setState(() {
        currentDir = dir;
        items = dir.listSync();
      });
    } catch (e) {
      print('Error loading files: $e');
      setState(() {
        items = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentDir == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("Loading...")),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(currentDir!.path),
        actions: [
          AppMenu(
            onSelected: (value) {
              if (value == 'FileManager') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FileExplorer(directory: currentDir),
                  ),
                );
              } else if (value == 'Tags') {
                FileHome(
                  files: items.map((e) => e.path).toList(),
                  folderName: currentDir!.path.split('/').last,
                );
              }
            },
          ),
        ],
        leading: currentDir!.path != '/storage/emulated/0'
            ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => loadFiles(currentDir!.parent),
        )
            : null,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final entity = items[index];
          final isDir = FileSystemEntity.isDirectorySync(entity.path);
          //final isfile = FileSystemEntity.isFileSync(entity.path);
          print('Entity: ${entity.path}, isDir: $isDir');
          return ListTile(
            leading: Icon(isDir ? Icons.folder : Icons.insert_drive_file),
            title: Text(entity.path.split('/').last),
            onTap: isDir
                ? () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    FileExplorer(directory: Directory(entity.path)),
              ),
            )
                : () => OpenFile.open(entity.path),
            //onLongPress: ,
          );
        },
      ),
    );
  }
}
