import 'package:carnava_admin_panel/res/colors/app_colors.dart';
import 'package:carnava_admin_panel/res/text_styles/app_text_styles.dart';
import 'package:carnava_admin_panel/view/navbar/settings/contact_us/widgets/input_widget_for_contact_view.dart';
import 'package:flutter/material.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

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
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              InputWidgetForContactView(
                inputType: TextInputType.number,
                title: "Phone",
                hintText: "admin@carnava.com",
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              InputWidgetForContactView(
                inputType: TextInputType.number,
                title: "WhatsApp",
                hintText: "admin@carnava.com",
                controller: TextEditingController(),
              ),
              const SizedBox(height: 20),
              InputWidgetForContactView(
                title: "Website",
                hintText: "admin@carnava.com",
                controller: TextEditingController(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
