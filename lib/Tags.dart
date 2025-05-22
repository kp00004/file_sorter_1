import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';


Future<void> addFileToTag(String tag, String filePath) async {
  final box = Hive.box('tagFiles');
  List<String> files = List<String>.from(box.get(tag, defaultValue: []));
  if (!files.contains(filePath)) {
    files.add(filePath);
    await box.put(tag, files);
  }
}
List<String> getFilesForTag(String tag) {
  final box = Hive.box('tagFiles');
  return List<String>.from(box.get(tag, defaultValue: []));
}
List<String> getAllTags() {
  final box = Hive.box('tagFiles');
  return box.keys.cast<String>().toList();
}

Future<void> removeFileFromTag(String tag, String filePath) async {
  final box = Hive.box('tagFiles');
  List<String> files = List<String>.from(box.get(tag, defaultValue: []));
  if (files.contains(filePath)) {
    files.remove(filePath);
    await box.put(tag, files);
  }
}
// Example usage

// void yo() async {
// await addFileToTag('work', '/storage/emulated/0/.database_uuid');
// await addFileToTag('work', '/storage/emulated/0/.nomedia');
// await addFileToTag('personal', '/storage/emulated/0/.database_uuid');
//
// print(getFilesForTag('work'));
// // ['/storage/emulated/0/myfile.txt', '/storage/emulated/0/anotherfile.txt']
//
// print(getFilesForTag('personal'));
// // ['/storage/emulated/0/myfile.txt']
//
// print(getAllTags());}
// // ['work', 'personal']}
