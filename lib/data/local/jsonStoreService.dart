import 'package:chatapp/di/locator.dart';
import 'package:chatapp/utils/SharedpreferenceUtils.dart';
import 'package:json_store/json_store.dart';

import 'jsonStoreHelper.dart';

class jsonStoreService implements jsonStoreHelper {
  SharedpreferenceUtils _sharedpreferenceUtils = SharedpreferenceUtils();
  JsonStore _jsonStore = locator<JsonStore>();

// @override
// Future<FullProfileBiodataModel?> getfullProfileBioData() async {
//   Map<String, dynamic>? json =
//       await _jsonStore.getItem(_sharedpreferenceUtils.fullProfileBiodata) ??
//           null;
//   if (json == null) return null;
//   return FullProfileBiodataModel.fromJson(json);
// }
//
// @override
// Future<bool> savefullProfileBioData(FullProfileBiodataModel model) async {
//   try {
//     await _jsonStore.setItem(
//         _sharedpreferenceUtils.fullProfileBiodata, model.toJson());
//     return true;
//   } catch (e) {
//     return false;
//   }
// }

}
