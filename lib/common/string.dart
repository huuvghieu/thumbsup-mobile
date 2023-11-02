class AppString {
  static const String appName = "Thumbsup";
  static final RegExp emailValidationRegExp =
      RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  static const String kEmailNullError = 'Vui lòng nhập email của bạn!';
  static const String kInvalidEmailError = 'Email không hợp lệ!';
  static const String kPassNullError = 'Nhập mật khẩu của bạn!';
  static const String kShortPassError = 'Mật khẩu quá ngắn!';
  static const String kMatchPassError = 'Mật khẩu không trùng với nhau!';
  static const String baseURL =
      'https://thumbsup-api.azurewebsites.net/api/v1/';
  static int? customerId;
  static String avatar = 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/User-avatar.svg/800px-User-avatar.svg.png';
}
