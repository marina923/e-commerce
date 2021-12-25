class LoginModel {
  late String tokeType;
  late int expiresIn;
  late String accessToken;
  late String refreshToken;
  LoginModel.fromJson(Map<String, dynamic> json) {
    tokeType = json['token_type'];
    expiresIn = json['expires_in'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }
}
