class MptBaseController {
  static String _baseUrl = 'https://api.waktusolat.app';

  /// Gets the current base URL
  static String get baseUrl => _baseUrl;

  /// Sets the base URL for all MPT endpoints
  static void setBaseUrl(String url) {
    // Remove trailing slash if present
    _baseUrl = url.endsWith('/') ? url.substring(0, url.length - 1) : url;
  }

  /// Builds a URI with the base URL, path, and optional query parameters
  static Uri buildUri(String path, [Map<String, dynamic>? queryParameters]) {
    // Ensure path starts with a forward slash
    final normalizedPath = path.startsWith('/') ? path : '/$path';
    final baseUri = Uri.parse('$_baseUrl$normalizedPath');
    if (queryParameters == null || queryParameters.isEmpty) {
      return baseUri;
    }
    final queryParams = queryParameters.map(
      (key, value) => MapEntry(key, value.toString()),
    );
    return baseUri.replace(queryParameters: queryParams);
  }
}
