abstract class AuthLocalDataSource {
  Future<bool> saveToken(String token);

  String? getToken();

  Future<bool> deleteToken();
}
