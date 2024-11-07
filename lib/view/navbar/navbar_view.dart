import 'package:carnava_admin_panel/res/routes/routes_name.dart';
import 'package:carnava_admin_panel/view/navbar/booking/booking_view.dart';
import 'package:carnava_admin_panel/view/navbar/home/home/home_view.dart';
import 'package:carnava_admin_panel/view/navbar/members/members_view.dart';
import 'package:carnava_admin_panel/view/navbar/settings/settings_view.dart';
import 'package:carnava_admin_panel/view/navbar/widgets/custom_tab_widget_navbar_view.dart';
import 'package:carnava_admin_panel/view_model/controllers/auth/auth_view_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final AuthViewController authViewController = Get.put(AuthViewController());

  @override
  void initState() {
    super.initState();
    authViewController.fetchUserInformation(FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: currentIndex == 0
          ? FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                Get.toNamed(RoutesName.carUploadingView);
              },
              child: const Icon(Icons.add, color: AppColors.primaryWhite),
            )
          : const SizedBox(),
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
                title: "Home",
              ),
              CustomTabWidgetNavBarView(
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                icon: Icons.calendar_month_sharp,
                color: currentIndex == 1 ? AppColors.primaryColor : AppColors.primaryBlack,
                title: "Booking",
              ),
              CustomTabWidgetNavBarView(
                onPressed: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                icon: Icons.group,
                color: currentIndex == 2 ? AppColors.primaryColor : AppColors.primaryBlack,
                title: "Members",
              ),
              CustomTabWidgetNavBarView(
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                icon: Icons.settings,
                color: currentIndex == 3 ? AppColors.primaryColor : AppColors.primaryBlack,
                title: "Settings",
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomeView(),
          const BookingView(),
          MembersView(),
          SettingsView(),
        ],
      ),
    );
  }
}
