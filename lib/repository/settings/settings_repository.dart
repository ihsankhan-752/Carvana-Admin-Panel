import 'package:carnava_admin_panel/data/services/settings/firestore_settings_services.dart';

class SettingsRepository {
  final FireStoreSettingsServices settingsServices = FireStoreSettingsServices();

  Future<void> addTermsAndConditions(String termsAndConditions) async {
    await settingsServices.addTermsAndConditions(termsAndConditions);
  }
}
