import 'package:chatapp/data/DataManagerHelper.dart';
import 'package:chatapp/data/prefs/SharedpreferenceService.dart';
import 'package:chatapp/di/locator.dart';

import 'local/jsonStoreService.dart';

class DataManager implements DataManagerHelper {
  SharedPreferenceService _sharedPreferenceService =
      locator<SharedPreferenceService>();
  jsonStoreService _jsonStoreService = locator<jsonStoreService>();

  @override
  Future<List<String>?> getProfileImageList() {
    return _sharedPreferenceService.getProfileImageList();
  }

  @override
  Future<bool> saveProfileIageList(List<String> _profileImageList) {
    return _sharedPreferenceService.saveProfileIageList(_profileImageList);
  }
}
