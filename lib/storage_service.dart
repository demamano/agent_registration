import 'dart:io';

import 'package:file_picker/file_picker.dart';

class StorageService {
  File file;

  StorageService(this.file);
  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path!);
    }
  }
}
