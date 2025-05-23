import 'package:flutter/material.dart';
import 'perms.dart';
import 'FileData.dart';
import 'Tags.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'FoldersPage.dart';
import 'package:path/path.dart' as p;
import 'theme.dart';

class FileHome extends StatefulWidget {
  @override
  _FileHomeState createState() => _FileHomeState();
}

class _FileHomeState extends State<FileHome> {
  late final List<String> name;
  List<String> output = ["Loading file metadata..."];
  List<String> tags = [];
  var renameFolders = "Folder";
  var renameRecents = "Recent Files";
  final TextEditingController _controller = TextEditingController();

  Future<String?> _showHoverBox(BuildContext context, List<String> tags) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          elevation: 8,
          child: Container(
            width: 300,
            height: 400,
            color: colorScheme.surfaceContainerHigh,
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: tags.map((tag) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(tag);
                        },
                        child: Card(
                          color: colorScheme.primaryContainer,
                          child: Center(
                            child: Text(
                              tag.toString().toUpperCase(),
                              style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: Icon(Icons.close, color: colorScheme.onSurface),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: colorScheme.primary,
                      semanticLabel: "Add Tag",
                    ),
                    onPressed: () async {
                      String? tagName = await showDialog<String>(
                        context: context,
                        builder: (context) {
                          TextEditingController controller =
                              TextEditingController();
                          return AlertDialog(
                            title: Text("Enter Tag Name"),
                            content: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                hintText: "e.g. work",
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: Text("Cancel"),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                              TextButton(
                                child: Text("Add"),
                                onPressed: () {
                                  loadTags();
                                  Navigator.of(context)
                                      .pop(controller.text.trim());
                                },
                              ),
                            ],
                          );
                        },
                      );
                      setState(() {
                        tags = getAllTags();
                      });
                      if (tagName != null && tagName.isNotEmpty) {
                        await addFileToTag(
                          tagName,
                          '/storage/emulated/0/.database_uuid',
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("File added to tag '$tagName'"),
                          ),
                        );
                      }
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
                            output = output
                                .where((entry) => entry.contains(query))
                                .toList();
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
                        backgroundColor: MaterialStateProperty.all(
                            colorScheme.surfaceContainer),
                        hintStyle: MaterialStateProperty.all(
                          textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        textStyle: MaterialStateProperty.all(
                          textTheme.bodyMedium,
                        ),
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        side: MaterialStateProperty.all(
                          BorderSide(
                            color: colorScheme.outlineVariant,
                          ),
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
                              '#',
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onPrimaryContainer,
                              ),
                              maxLines: 1,
                              minFontSize: 8,
                              overflow: TextOverflow.ellipsis,
                            ),
                            AutoSizeText(
                              tag.toString().toUpperCase(),
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
                SizedBox(height: 12),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: output.length,
                  itemBuilder: (context, index) {
                    String fileData = output[index];
                    return ListTile(
                      leading: Icon(
                        getFileIcon(fileData),
                        color: colorScheme.primary,
                      ),
                      title: Text(
                        fileData.split('/').last,
                        style: textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurface,
                        ),
                      ),
                      onTap: () {},
                      trailing: IconButton(
                        icon: Icon(Icons.add, color: colorScheme.primary),
                        onPressed: () async {
                          String filePath = output[index];
                          String? selectedTag = await _showHoverBox(
                            context,
                            tags,
                          );
                          if (selectedTag == null) {
                            return;
                          } else {
                            await addFileToTag(selectedTag, filePath);
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
