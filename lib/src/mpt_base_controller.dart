class MptBaseController {
  static String _baseUrl = 'https://api.waktusolat.app';

  /// Gets the current base URL
  static String get baseUrl => _baseUrl;

  /// Sets the base URL for all MPT endpoints
  static void setBaseUrl(String url) {
    // Remove trailing slash if present
    _baseUrl = url.endsWith('/') ? url.substring(0, url.length - 1) : url;
  }
}
