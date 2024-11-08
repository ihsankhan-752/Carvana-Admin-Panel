import 'package:carnava_admin_panel/res/colors/app_colors.dart';
import 'package:carnava_admin_panel/res/text_styles/app_text_styles.dart';
import 'package:carnava_admin_panel/view/navbar/settings/about_us/widget/terms_and_condition_text_input_widget.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

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
        child: AboutUsTextInputWidget(controller: TextEditingController()),
      ),
    );
  }
}
