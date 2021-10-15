import 'package:chatapp/data/prefs/SharedPreferenceHelper.dart';
import 'package:chatapp/utils/SharedpreferenceUtils.dart';

class SharedPreferenceService implements SharedPreferenceHelper {
  SharedpreferenceUtils _sharedpreferenceUtils = SharedpreferenceUtils();

  @override
  Future<List<String>?> getProfileImageList() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // try {
    //   return prefs.getStringList(_sharedpreferenceUtils.profileImageListId) ?? [];
    // } catch (e) {
    //   return null;
    // }
  }

  @override
  Future<bool> saveProfileIageList(List<String> _profileImageList) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    //
    // try {
    //   await prefs.setStringList(
    //       _sharedpreferenceUtils.profileImageListId, _profileImageList);
    //   return true;
    // } catch (e) {
    //   return false;
    // }
    return true;
  }
}
