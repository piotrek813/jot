import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_service.g.dart';

class FileService {
  final FirebaseStorage storage;

  FileService(this.storage);

  Stream<TaskSnapshot> put(String filePath,
      [List<String>? prefix, String? name]) {
    String path = p.basename(filePath);
    if (prefix != null) path = p.normalize(prefix.join('/'));
    if (name != null) path = p.join(path, name);
    return storage.ref(path).putFile(File(filePath)).snapshotEvents;
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
