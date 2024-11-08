import 'package:carnava_admin_panel/models/contact_us_model.dart';
import 'package:carnava_admin_panel/repository/settings/settings_repository.dart';
import 'package:carnava_admin_panel/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SettingViewController extends GetxController {
  final SettingsRepository settingsRepository = SettingsRepository();
  final termsAndConditionTextController = TextEditingController().obs;
  final emailTextController = TextEditingController().obs;
  final phoneTextController = TextEditingController().obs;
  final whatsAppTextController = TextEditingController().obs;
  final websiteTextController = TextEditingController().obs;
  RxBool isLoading = false.obs;

  clearTextInput() {
    termsAndConditionTextController.value.clear();
    emailTextController.value.clear();
    phoneTextController.value.clear();
    whatsAppTextController.value.clear();
    websiteTextController.value.clear();
  }

  Future<void> addTermsAndConditions(String termsAndCondition) async {
    if (termsAndCondition.isEmpty) {
      Utils.centerToastMessage("Add Terms And Conditions");
    } else {
      try {
        isLoading.value = true;
        await settingsRepository.addTermsAndConditions(termsAndCondition).whenComplete(() {
          isLoading.value = false;

          Utils.toastMessage("Terms And Conditions Added");
          Get.back();
        });
      } catch (e) {
        isLoading.value = false;
        Utils.centerToastMessage(e.toString());
      }
    }
  }

  Future<void> addContactUs({
    required String email,
    int? phone,
    int? whatsApp,
    required String website,
  }) async {
    if (email.isEmpty || phone == null || whatsApp == null || website.isEmpty) {
      Utils.centerToastMessage("All Fields are required");
    } else {
      try {
        isLoading.value = true;

        ContactUsModel contactUsModel = ContactUsModel(
          email: email,
          phoneNumber: phone,
          whatsApp: whatsApp,
          website: website,
        );
        await settingsRepository.addContactUs(contactUsModel);
        isLoading.value = false;
        Utils.toastMessage("Contact us added");
        Get.back();
      } catch (e) {
        isLoading.value = false;
        Utils.centerToastMessage(e.toString());
      }
    }
  }
}
