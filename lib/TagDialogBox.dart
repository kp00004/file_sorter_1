import 'package:flutter/material.dart';
import '../Tags.dart';

Future<String?> showTagDialogBox(BuildContext context, List<String> tags,String filepath) async {
  final colorScheme = Theme.of(context).colorScheme;
  final textTheme = Theme.of(context).textTheme;

  return await showDialog<String>(
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
          child: StatefulBuilder(
            builder: (context, setLocalState) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      children: tags.map((tag) {
                        return GestureDetector(
                          onTap: () async {
                            await addFileToTag(tag, filepath);
                            Navigator.of(context).pop(tag);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Added to '$tag'")),
                            );
                          },
                          child: Card(
                            color: colorScheme.primaryContainer,
                            child: Center(
                              child: Text(
                                tag.toUpperCase(),
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
                    top: 3,
                    right: 3,
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
                        final TextEditingController controller = TextEditingController();
                        String? tagName = await showDialog<String>(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Enter Tag Name"),
                              content: TextField(
                                controller: controller,
                                decoration: InputDecoration(hintText: "e.g. work"),
                              ),
                              actions: [
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                                TextButton(
                                  child: Text("Add"),
                                  onPressed: () {
                                    Navigator.of(context).pop(controller.text.trim());
                                  },
                                ),
                              ],
                            );
                          },
                        );

                        if (tagName != null && tagName.isNotEmpty) {
                          await addFileToTag(tagName, filepath);
                          Navigator.of(context).pop(tagName);// return new tag to caller
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Added to '$tagName'")),
                          );
                        }
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}
