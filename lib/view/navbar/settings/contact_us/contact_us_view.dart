import 'package:carnava_admin_panel/res/colors/app_colors.dart';
import 'package:carnava_admin_panel/res/components/buttons/primary_button.dart';
import 'package:carnava_admin_panel/res/components/loading_indicator_widget.dart';
import 'package:carnava_admin_panel/res/text_styles/app_text_styles.dart';
import 'package:carnava_admin_panel/view/navbar/settings/contact_us/widgets/input_widget_for_contact_view.dart';
import 'package:carnava_admin_panel/view_model/controllers/settings/setting_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsView extends StatelessWidget {
  ContactUsView({super.key});
  final SettingViewController controller = Get.put(SettingViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryWhite,
        title: Text("Contact Us", style: AppTextStyles.h1Bold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              InputWidgetForContactView(
                inputType: TextInputType.emailAddress,
                title: "E-mail",
                hintText: "admin@carnava.com",
                controller: controller.emailTextController.value,
              ),
              const SizedBox(height: 20),
              InputWidgetForContactView(
                inputType: TextInputType.number,
                title: "Phone",
                hintText: "+92-1231231",
                controller: controller.phoneTextController.value,
              ),
              const SizedBox(height: 20),
              InputWidgetForContactView(
                inputType: TextInputType.number,
                title: "WhatsApp",
                hintText: "+92-1231231",
                controller: controller.whatsAppTextController.value,
              ),
              const SizedBox(height: 20),
              InputWidgetForContactView(
                title: "Website",
                hintText: "https//carnava.com",
                controller: controller.websiteTextController.value,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Obx(
          () {
            return controller.isLoading.value
                ? const LoadingIndicatorWidget()
                : PrimaryButton(
                    title: "Save",
                    onPressed: () {
                      controller
                          .addContactUs(
                        email: controller.emailTextController.value.text,
                        phone: int.tryParse(controller.phoneTextController.value.text),
                        whatsApp: int.tryParse(controller.whatsAppTextController.value.text),
                        website: controller.websiteTextController.value.text,
                      )
                          .whenComplete(
                        () {
                          controller.clearTextInput();
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
