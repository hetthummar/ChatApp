/// _phoneNumber : "het"
/// _phoneAuthId : "abc"

class PhoneLoginModel {
  String _phoneNumber = "";
  String _phoneAuthId = "";

  String get phoneNumber => _phoneNumber;

  String get phoneAuthId => _phoneAuthId;

  PhoneLoginModel({required String phoneNumber, required String phoneAuthId}) {
    _phoneNumber = phoneNumber;
    _phoneAuthId = phoneAuthId;
  }

  PhoneLoginModel.fromJson(dynamic json) {
    _phoneNumber = json["phoneNumber"];
    _phoneAuthId = json["phoneAuthId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["phoneNumber"] = _phoneNumber;
    map["phoneAuthId"] = _phoneAuthId;
    return map;
  }
}
