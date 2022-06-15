abstract class IAuthLocalDataSource {
  Future<bool> saveToken(String token);

  String? getToken();

  Future<bool> deleteToken();
}
