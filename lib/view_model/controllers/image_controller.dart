import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  Rx<File?> image = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        print("Picked file path: ${pickedFile.path}"); // Debugging line
        image.value = File(pickedFile.path); // Assign the picked file to the Rx variable
        print("Image successfully picked: ${image.value!.path}"); // Debugging line
      } else {
        print("No image was selected."); // Debugging line
      }
    } catch (e) {
      print("Error picking image: $e"); // Debugging line
    }
  }

  Future<String?> uploadImage() async {
    if (image.value == null) {
      print("No image to upload."); // Debugging line
      return null;
    }

    final file = File(image.value!.path);
    if (!await file.exists()) {
      print("File does not exist at path: ${file.path}"); // Debugging line
      return null;
    }

    try {
      final bytes = await file.readAsBytes();
      if (bytes.isEmpty) {
        print("Image bytes are empty."); // Debugging line
        return null;
      }

      String base64Image = base64Encode(bytes);
      print("Base64 Image: $base64Image"); // Debugging line
      return base64Image;
    } catch (e) {
      print("Error converting image to Base64: $e"); // Debugging line
      return null;
    }
  }
}
