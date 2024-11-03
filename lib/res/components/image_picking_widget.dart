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

  // This method returns the file path of the picked image
  String? getImageUrl() {
    return image.value?.path; // Return the file path as URL
  }
}
