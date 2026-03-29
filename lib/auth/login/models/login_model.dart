class LoginData {
  late final LoginModel loginModel;
  LoginData.fromJson(Map<String, dynamic> json) {
    loginModel = LoginModel.fromJson(json['data']);
  }
}

class LoginModel {
  late final String image, phoneNumber, token, name;

  LoginModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    phoneNumber = json['phone'] ?? '';
    token = json['token'] ?? '';
    name = json['fullname'] ?? '';
  }
}
