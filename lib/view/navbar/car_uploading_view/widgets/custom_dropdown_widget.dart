import 'package:carnava_admin_panel/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String title;
  final String selectedValue;
  final List<String> options;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.title,
    required this.selectedValue,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaryGrey.withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue,
                isExpanded: true,
                items: options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
