import 'dart:typed_data';

import '../data/services/storage_services.dart';

class StorageRepository {
  StorageServices storageServices = StorageServices();

  Future<String?> uploadImage(Uint8List? image) async {
    if (image == null) {
      return null;
    }
    String? imageUrl = await storageServices.uploadImage(image);
    return imageUrl;
  }
}
