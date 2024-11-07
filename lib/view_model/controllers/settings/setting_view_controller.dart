import 'package:carnava_admin_panel/repository/settings/settings_repository.dart';
import 'package:carnava_admin_panel/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SettingViewController extends GetxController {
  final SettingsRepository settingsRepository = SettingsRepository();
  final termsAndConditionTextController = TextEditingController().obs;
  RxBool isLoading = false.obs;

  Future<void> addTermsAndConditions(String termsAndCondition) async {
    if (termsAndCondition.isEmpty) {
      Utils.centerToastMessage("Add Terms And Conditions");
    } else {
      try {
        isLoading.value = true;
        settingsRepository.addTermsAndConditions(termsAndCondition).whenComplete(() {
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
}
