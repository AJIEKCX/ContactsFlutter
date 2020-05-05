import 'package:contacts_flutter/domain/repository/sync_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultSyncRepository extends SyncRepository {
  static const String _contacts = 'contacts';

  final SharedPreferences _preferences;

  DefaultSyncRepository(this._preferences);

  @override
  Future<void> setContactsSync(int time) {
    return _preferences.setInt(_contacts, time);
  }

  @override
  int getContactsSync() {
    return _preferences.getInt(_contacts) ?? 0;
  }
}