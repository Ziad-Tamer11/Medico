typedef GetTokenCallback = String? Function();
typedef SaveTokenCallback = Future<void> Function(String accessToken);
typedef ClearTokenCallback = Future<void> Function();

class TokenCallbacks {
  final GetTokenCallback getAccessToken;
  final GetTokenCallback getRefreshToken;
  final SaveTokenCallback saveAccessToken;
  final ClearTokenCallback clearTokens;

  const TokenCallbacks({
    required this.getAccessToken,
    required this.getRefreshToken,
    required this.saveAccessToken,
    required this.clearTokens,
  });
}
