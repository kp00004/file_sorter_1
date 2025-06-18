import 'package:flutter/material.dart';
import 'perms.dart';
import 'FileData.dart';
import 'Tags.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'FoldersPage.dart';
import 'package:path/path.dart' as p;
import 'TagDialogBox.dart';

class FileHome extends StatefulWidget {
  const FileHome({Key? key}) : super(key: key);

  @override
  FileHomeState createState() => FileHomeState();
}

class FileHomeState extends State<FileHome> {
  late final List<String> name;
  List<String> output = ["Loading file metadata..."];
  List<String> tags = [];
  var renameFolders = "Tags";
  var renameRecents = "Recent Files";
  final TextEditingController _controller = TextEditingController();

  void _loadData() async {
    bool granted = await requestPermissions();
    if (granted) {
      getFileMetadata().then(((data) {
        setState(() {
          output = data
              .split('---')
              .map((e) => e.trim())
              .where((e) => e.isNotEmpty)
              .toList();
          name = output;
        });
      }));
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
    _loadData();
    loadTags();
  }


  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: SearchBar(
                        controller: _controller,
                        hintText: "Search files...",
                        onTap: () {
                          String query = _controller.text;
                          setState(() {
                            output =
                                output.where((entry) => entry.contains(query)).toList();
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty) {
                              output = name;
                            } else {
                              output = name
                                  .where((entry) => entry.contains(value))
                                  .toList();
                            }
                          });
                        },
                        backgroundColor: WidgetStateProperty.all(
                          colorScheme.surfaceContainer,
                        ),
                        hintStyle: WidgetStateProperty.all(
                          textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        textStyle: WidgetStateProperty.all(
                          textTheme.bodyMedium,
                        ),
                        elevation: WidgetStateProperty.all(0),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        side: WidgetStateProperty.all(
                          BorderSide(color: colorScheme.outlineVariant),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  renameFolders,
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 12),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: tags.map((tag) {
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
                          color: colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              '#${tag.toUpperCase()}',
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onPrimaryContainer,
                              ),
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
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: output.length,
                  itemBuilder: (context, index) {
                    String fileData = output[index];
                    return ListTile(
                      leading: Icon(
                        getFileIcon(p.basename(fileData)),
                        color: colorScheme.tertiaryContainer,
                      ),
                      title: Text(
                        fileData.split('/').last,
                        style: textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                      onTap: () {},
                      trailing: IconButton(
                        icon: Icon(
                          Icons.add,
                          color: colorScheme.tertiaryContainer,
                        ),
                        onPressed: () async {
                          String filePath = output[index];
                          String? selectedTag = await showTagDialogBox(
                            context,
                            tags,
                            filePath
                          );
                          if (selectedTag == null) return;

                          await addFileToTag(selectedTag, filePath);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                "Added ${p.basename(filePath)} to '$selectedTag' tag",
                              ),
                            ),
                          );
                          setState(() {
                            tags = getAllTags();
                          });
                        },
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
