import 'package:chatapp/data/prefs/SharedPreferenceHelper.dart';

import 'local/jsonStoreHelper.dart';
import 'network/ApiHelper.dart';

abstract class DataManagerHelper
    implements ApiHelper, SharedPreferenceHelper, jsonStoreHelper {}
