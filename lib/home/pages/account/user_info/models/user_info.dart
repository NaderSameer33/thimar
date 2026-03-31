class UserInfoData {
  late final UserInfoModel userInfoModel;

  UserInfoData.fromJson(Map<String, dynamic> json) {
    userInfoModel = UserInfoModel.fromJson(json['data']);
  }
}

class UserInfoModel {
  late final int id;
  late final String image, name, phone, city;

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['fullname'] ?? '';
    image = json['image'];
    city = json['city'] ?? '';
    phone = json['phone'] ?? '';
  }
}
