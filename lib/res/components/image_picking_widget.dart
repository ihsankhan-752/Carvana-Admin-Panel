import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  Rx<File?> image = Rx<File?>(null);
  Rx<Uint8List?> imageWithoutBg = Rx<Uint8List?>(null);
  RxBool loading = false.obs;
  final ImagePicker _picker = ImagePicker();
  final String removeBgApiKey = "f2tih8DjzZQ6AM14vJ4mjHE4";
  Future<void> pickCarImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        image.value = File(pickedFile.path);
        loading.value = true;
        imageWithoutBg.value = await removeBackground(image.value!);

        loading.value = false;
      } else {
        if (kDebugMode) {
          print("No image was selected.");
        }
      }
    } catch (e) {
      loading.value = false;
      if (kDebugMode) {
        print("Error picking image: $e");
      }
    }
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  Future<Uint8List?> removeBackground(File imageFile) async {
    try {
      var request = http.MultipartRequest(
        "POST",
        Uri.parse("https://api.remove.bg/v1.0/removebg"),
      );
      request.files.add(await http.MultipartFile.fromPath("image_file", imageFile.path));
      request.headers.addAll({"X-API-Key": removeBgApiKey});

      final response = await request.send();
      if (response.statusCode == 200) {
        http.Response imgRes = await http.Response.fromStream(response);
        return imgRes.bodyBytes;
      } else {
        if (kDebugMode) {
          print("Background removal failed with status code: ${response.statusCode}");
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error in background removal: $e");
      }
      return null;
    }
  }

  String? getImageUrl() {
    return image.value?.path;
  }

  void clearUploadImage() {
    image.value = null;
  }
}
