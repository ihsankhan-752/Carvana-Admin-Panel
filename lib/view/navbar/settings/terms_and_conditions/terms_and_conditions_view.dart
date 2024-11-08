import 'package:carnava_admin_panel/res/colors/app_colors.dart';
import 'package:carnava_admin_panel/res/components/buttons/primary_button.dart';
import 'package:carnava_admin_panel/res/components/loading_indicator_widget.dart';
import 'package:carnava_admin_panel/res/text_styles/app_text_styles.dart';
import 'package:carnava_admin_panel/view/navbar/settings/terms_and_conditions/widgets/terms_and_condition_text_input_widget.dart';
import 'package:carnava_admin_panel/view_model/controllers/settings/setting_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditionsView extends StatelessWidget {
  TermsAndConditionsView({super.key});

  final SettingViewController settingViewController = Get.put(SettingViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text("Terms & Conditions", style: AppTextStyles.h1Bold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            TermsAndConditionTextInputWidget(
              controller: settingViewController.termsAndConditionTextController.value,
            ),
          ],
        ),
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
                      settingViewController
                          .addTermsAndConditions(settingViewController.termsAndConditionTextController.value.text)
                          .whenComplete(() {
                        settingViewController.termsAndConditionTextController.value.clear();
                      });
                    },
                  );
          },
        ),
      ),
    );
  }
}
