import 'dart:typed_data';

import '../../data/services/storage/storage_services.dart';

class StorageRepository {
  StorageServices storageServices = StorageServices();

  Future<String?> uploadImage(Uint8List? image) async {
    if (image == null) {
      return null;
    }
    String? imageUrl = await storageServices.uploadUintListImage(image);
    return imageUrl;
  }
}
