abstract class SharedPreferenceHelper {
  Future<bool> saveProfileIageList(List<String> _profileImageList);

  Future<List<String>?> getProfileImageList();
}
