class EndPoint {
  static const String baseUrl = 'http://127.0.0.1:5000/api';

  static String get register => '/auth/register';

  static String get login => '/auth/login';

  static String get addStore => '/stores';

  static String get loadStore => '/stores';
}
