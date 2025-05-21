import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requestPermissions() async {
  if (Platform.isAndroid) {
    var status = await Permission.manageExternalStorage.status;

    if (status.isGranted) {
      return true;
    }

    // Request permission
    status = await Permission.manageExternalStorage.request();

    // If still denied, optionally open settings
    if (!status.isGranted) {
      await openAppSettings();
      return false;
    }

    return status.isGranted;
  }

  return true; // For non-Android platforms
}
