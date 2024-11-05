import 'package:carnava_admin_panel/view/navbar/members/widgets/member_card_widget.dart';
import 'package:carnava_admin_panel/view_model/member_view_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/user_model.dart';

class MembersView extends StatelessWidget {
  MembersView({super.key});
  final memberController = Get.put(MemberViewController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
              child: CupertinoSearchTextField(),
            ),
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
