import 'package:carnava_admin_panel/models/user_model.dart';
import 'package:get/get.dart';

import '../repository/members_repository.dart';

class MemberViewController extends GetxController {
  final MembersRepository _userRepository = MembersRepository();
  RxBool isLoading = true.obs;
  Rx<Stream<List<UserModel>>> userStream = Rx<Stream<List<UserModel>>>(const Stream.empty());

  @override
  void onInit() {
    super.onInit();
    userStream.value = _userRepository.getAllMembers();

    userStream.value.listen((_) {
      isLoading.value = false;
    }, onError: (_) {
      isLoading.value = false;
    });
  }
}
