import 'dart:io';
import 'Perms.dart';

Future<String> getFileMetadata() async {
  final root = Directory('/storage/emulated/0');
  if (!await root.exists()) return "Root directory not found.";

  final buffer = StringBuffer();

  Future<void> scanDir(Directory dir) async {
    try {
      await for (var entity in dir.list(followLinks: false)) {
        if (entity is File) {
          try {
            final stat = await entity.stat();
            while (entity.path.contains("WhatsApp")){
              // Avoid WhatsApp folder
              return;
            }
            buffer.writeln('📄 ${entity.path}');
            buffer.writeln('  Size: ${stat.size} bytes');
            buffer.writeln('  Modified: ${stat.modified}');
            buffer.writeln('---');
          } catch (_) {
            // Ignore unreadable file
          }
        } else if (entity is Directory) {
          // Avoid restricted folders like Android/data
          if (entity.path.contains('/Android/data') || entity.path.contains('/Android/obb')) {
            continue;
          }
          await scanDir(entity); // Recursively scan safe folders
        }
      }
    } catch (_) {
      // Ignore permission-denied directories
    }
  }

  await scanDir(root);

  return buffer.isEmpty ? "No accessible files found." : buffer.toString();
}

