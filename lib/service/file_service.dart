import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_service.g.dart';

class FileService {
  Future<String> put(String filePath) async {
      final fileName =     basename(filePath);
      final imagesPath = join((await getApplicationDocumentsDirectory()).path, "images");

      await Directory(imagesPath).create();

      final imagePath = join(imagesPath, fileName);

      if (await (File(imagePath).exists())) return imagePath;

      final r= (await File(filePath).copy(imagePath)).path;
      return r;
  }
}

@riverpod
FileService fileService(FileServiceRef ref) =>
    FileService();

@Riverpod(dependencies: [])
class ChoteFilePicker extends _$ChoteFilePicker {
  @override
  Set<String> build() {
    return {};
  }

  void pickMultiImages() async {
    final files = await ImagePicker().pickMultiImage();
    state = {...state, ...files.map((e) => e.path)};
  }

  void pickImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) return;

    state = {...state, file.path};
  }

  void pickImageCamera() async {
    final file = await ImagePicker().pickImage(source: ImageSource.camera);

    if (file == null) return;

    state = {...state, file.path};
  }

  void removeFile(String path) {
    state = {
      for (final e in state)
        if (e != path) e,
    };
  }

  void clear() {
    state = {};
  }
}
