import 'package:carnava_admin_panel/data/services/settings/firestore_settings_services.dart';
import 'package:carnava_admin_panel/models/contact_us_model.dart';

class SettingsRepository {
  final FireStoreSettingsServices settingsServices = FireStoreSettingsServices();

  Future<void> addTermsAndConditions(String termsAndConditions) async {
    await settingsServices.addTermsAndConditions(termsAndConditions);
  }

  Future<void> addContactUs(ContactUsModel model) async {
    await settingsServices.addContactUs(model);
  }

  Future<void> addAboutUs(String aboutUs) async {
    await settingsServices.addAboutUs(aboutUs);
  }
}
