import 'package:carnava_admin_panel/data/services/admin/firestore_admin_services.dart';

class AdminRepository {
  final FireStoreAdminServices adminServices = FireStoreAdminServices();

  Future<void> updateAdminImageAndUsername(String image, String username) async {
    await adminServices.updateAdminImageAndUsername(image, username);
  }

  Future<String?> getCurrentImage() async {
    String? image = await adminServices.currentImage();
    return image;
  }

  Future<String?> getCurrentUsername() async {
    String? username = await adminServices.currentUsername();
    return username;
  }
}
