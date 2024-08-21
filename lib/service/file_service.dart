import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_service.g.dart';

class FileService {
  final FirebaseStorage storage;

  FileService(this.storage);

  Future<String> put(String filePath, [String? path]) async {
    final basename = p.basename(filePath);
    final remotePath = path == null ? basename : p.join(path, basename);

    final ref = storage.ref(remotePath);

    final uploadedFile = await ref.putFile(File(filePath));

    return uploadedFile.ref.getDownloadURL();
  }
}

@riverpod
FileService fileService(FileServiceRef ref) =>
    FileService(FirebaseStorage.instance);

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
