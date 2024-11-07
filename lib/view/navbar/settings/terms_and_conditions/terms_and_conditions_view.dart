import 'package:carnava_admin_panel/view/navbar/settings/terms_and_conditions/widgets/terms_and_condition_text_input_widget.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Conditions"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TermsAndConditionTextInputWidget(
              controller: TextEditingController(),
            ),
          ],
        ),
      ),
    );
  }
}
