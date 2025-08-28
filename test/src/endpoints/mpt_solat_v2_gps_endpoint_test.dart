import 'package:test/test.dart';
import 'package:waktusolat_api_client_core/src/endpoints/mpt_solat_v2_gps_endpoint.dart';
import 'package:waktusolat_api_client_core/src/mpt_base_controller.dart';

void main() {
  setUp(() {
    // Reset base URL before each test
    MptBaseController.setBaseUrl('https://api.waktusolat.app');
  });

  test('mpt solat v2 gps endpoint with coordinates only', () {
    final endpoint = MptSolatV2GpsEndpoint(3.068498, 101.630263);
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/v2/solat/3.068498/101.630263',
    );
  });

  test('mpt solat v2 gps endpoint with coordinates and year', () {
    final endpoint = MptSolatV2GpsEndpoint(3.068498, 101.630263, year: 2025);
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/v2/solat/3.068498/101.630263?year=2025',
    );
  });

  test('mpt solat v2 gps endpoint with coordinates and month', () {
    final endpoint = MptSolatV2GpsEndpoint(3.068498, 101.630263, month: 6);
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/v2/solat/3.068498/101.630263?month=6',
    );
  });

  test('mpt solat v2 gps endpoint with all parameters', () {
    final endpoint = MptSolatV2GpsEndpoint(
      3.068498,
      101.630263,
      year: 2025,
      month: 6,
    );
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/v2/solat/3.068498/101.630263?year=2025&month=6',
    );
  });

  test('mpt solat v2 gps endpoint with custom base url', () {
    MptBaseController.setBaseUrl('https://api.example.com');

    final endpoint = MptSolatV2GpsEndpoint(
      3.068498,
      101.630263,
      year: 2025,
      month: 6,
    );
    expect(
      endpoint.getFullUrl(),
      'https://api.example.com/v2/solat/3.068498/101.630263?year=2025&month=6',
    );
  });

  test('handles negative coordinates', () {
    final endpoint = MptSolatV2GpsEndpoint(-3.068498, -101.630263);
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/v2/solat/-3.068498/-101.630263',
    );
  });

  test('handles decimal coordinates', () {
    final endpoint = MptSolatV2GpsEndpoint(3.123456789, 101.987654321);
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/v2/solat/3.123456789/101.987654321',
    );
  });
}
