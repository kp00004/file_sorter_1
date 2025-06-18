import 'package:flutter/material.dart';

class AppMenu extends StatelessWidget {
  final void Function(String)? onSelected;
  const AppMenu({this.onSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onSelected,
      itemBuilder: (context) => const [
        PopupMenuItem(value: 'FileManager', child: Text('FileManager')),
        PopupMenuItem(value: 'Tags', child: Text('Tags')),
      ],
    );
  }
}
