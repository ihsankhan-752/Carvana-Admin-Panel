import 'package:carnava_admin_panel/view/navbar/widgets/custom_tab_widget_navbar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/colors/app_colors.dart';

class NavbarView extends StatefulWidget {
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: Get.height * 0.07,
        color: AppColors.primaryWhite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTabWidgetNavBarView(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                icon: Icons.home_outlined,
                color: currentIndex == 0 ? AppColors.primaryColor : AppColors.primaryBlack,
              ),
              CustomTabWidgetNavBarView(
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                icon: Icons.bookmark_border,
                color: currentIndex == 1 ? AppColors.primaryColor : AppColors.primaryBlack,
              ),
              CustomTabWidgetNavBarView(
                onPressed: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                icon: Icons.notifications_active_outlined,
                color: currentIndex == 2 ? AppColors.primaryColor : AppColors.primaryBlack,
              ),
              CustomTabWidgetNavBarView(
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                icon: Icons.person,
                color: currentIndex == 3 ? AppColors.primaryColor : AppColors.primaryBlack,
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [],
      ),
    );
  }
}
