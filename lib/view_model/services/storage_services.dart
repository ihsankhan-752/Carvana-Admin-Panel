import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

class StorageServices {
  Future<String?> uploadImage(File imageFile) async {
    try {
      final bytes = await imageFile.readAsBytes();
      final base64Image = base64Encode(bytes);

      return base64Image;
    } catch (e) {
      if (kDebugMode) {
        print("Failed to upload image: $e");
      }
      return null;
    }
  }
}
