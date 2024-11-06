import 'dart:io';

import 'package:carnava_admin_panel/data/app_exceptions.dart';
import 'package:carnava_admin_panel/data/services/storage/storage_services.dart';
import 'package:carnava_admin_panel/repository/admin/admin_repository.dart';
import 'package:carnava_admin_panel/utils/utils.dart';
import 'package:get/get.dart';

class AdminProfileViewController extends GetxController {
  RxBool isLoading = false.obs;
  AdminRepository adminRepo = AdminRepository();

  Future<void> updateAdminImageAndUsername({
    File? image,
    String? username,
  }) async {
    try {
      isLoading.value = true;
      String? imageUrl;

      if (image != null) {
        imageUrl = await StorageServices().uploadFileImage(image);
      } else {
        imageUrl = await adminRepo.getCurrentImage();
      }

      username ??= await adminRepo.getCurrentUsername();

      if (imageUrl != null && username != null) {
        await adminRepo.updateAdminImageAndUsername(imageUrl, username);
        Utils.toastMessage("Changes Saved");
        Get.back();
      } else {
        throw Exception("Unable to fetch image or username for update.");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
