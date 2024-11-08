import 'package:carnava_admin_panel/res/colors/app_colors.dart';
import 'package:carnava_admin_panel/res/text_styles/app_text_styles.dart';
import 'package:carnava_admin_panel/view/navbar/settings/about_us/widget/terms_and_condition_text_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/components/buttons/primary_button.dart';
import '../../../../res/components/loading_indicator_widget.dart';
import '../../../../view_model/controllers/settings/setting_view_controller.dart';

class AboutUsView extends StatelessWidget {
  AboutUsView({super.key});
  final SettingViewController settingViewController = Get.put(SettingViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        centerTitle: true,
        title: Text("About Us", style: AppTextStyles.h1Bold),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: AboutUsTextInputWidget(controller: settingViewController.aboutUsTextController.value),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15),
        child: Obx(
          () {
            return settingViewController.isLoading.value
                ? const LoadingIndicatorWidget()
                : PrimaryButton(
                    title: "Save",
                    onPressed: () {
                      settingViewController.addAboutUs(settingViewController.aboutUsTextController.value.text).whenComplete(
                        () {
                          settingViewController.aboutUsTextController.value.clear();
                        },
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
