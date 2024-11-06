import 'package:carnava_admin_panel/data/services/members/firestore_members_services.dart';
import 'package:carnava_admin_panel/models/user_model.dart';

class MembersRepository {
  FireStoreMembersServices membersServices = FireStoreMembersServices();

  Stream<List<UserModel>> getAllMembers() {
    return membersServices.getAllUsers();
  }
}
