import 'dart:io';

import '../data/services/storage_services.dart';

class StorageRepository {
  StorageServices storageServices = StorageServices();

  Future<String?> uploadImage(File? image) async {
    if (image == null) {
      return null;
    }
    String? imageUrl = await storageServices.uploadImage(image);
    return imageUrl;
  }
}
