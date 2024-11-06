import 'package:carnava_admin_panel/res/colors/app_colors.dart';
import 'package:carnava_admin_panel/res/text_styles/app_text_styles.dart';
import 'package:carnava_admin_panel/view/navbar/members/widgets/member_card_widget.dart';
import 'package:carnava_admin_panel/view_model/member_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/user_model.dart';

class MembersView extends StatefulWidget {
  const MembersView({super.key});

  @override
  State<MembersView> createState() => _MembersViewState();
}

class _MembersViewState extends State<MembersView> {
  final memberController = Get.put(MemberViewController());

  final List<String> _tabsText = ['Active', 'Pending', 'Cancel'];
  String _currentTabText = "Active";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Container(
              height: 50,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _tabsText.map((e) {
                  return GestureDetector(
                    onTap: () {
                      _currentTabText = e;
                      setState(() {});
                    },
                    child: Container(
                      height: 45,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: Get.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _currentTabText == e ? AppColors.primaryColor : AppColors.primaryGrey.withOpacity(0.1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            e,
                            style: AppTextStyles.h1Bold
                                .copyWith(color: _currentTabText == e ? AppColors.primaryWhite : AppColors.primaryBlack),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const Divider(),
            Expanded(
              child: Obx(() {
                return StreamBuilder<List<UserModel>>(
                  stream: memberController.userStream.value,
                  builder: (context, snapshot) {
                    if (memberController.isLoading.value && snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text("No users found"));
                    }

                    final userList = snapshot.data!;
                    return ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        final user = userList[index];
                        return MemberCardWidget(user: user);
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
