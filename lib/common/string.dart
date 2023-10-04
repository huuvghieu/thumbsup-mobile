class AppString {
  static const String appName = "Thumbsup";
  static final RegExp emailValidationRegExp =
      RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  static const String kEmailNullError = 'Vui lòng nhập email của bạn!';
  static const String kInvalidEmailError = 'Email không hợp lệ!';
  static const String kPassNullError = 'Nhập mật khẩu của bạn!';
  static const String kShortPassError = 'Mật khẩu quá ngắn!';
  static const String kMatchPassError = 'Mật khẩu không trùng với nhau!';
}
