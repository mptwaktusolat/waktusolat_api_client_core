import 'package:test/test.dart';
import 'package:waktusolat_api_client_core/src/endpoints/mpt_zones_by_gps_endpoint.dart';
import 'package:waktusolat_api_client_core/src/mpt_base_controller.dart';

void main() {
  setUp(() {
    // Reset base URL before each test
    MptBaseController.setBaseUrl('https://api.waktusolat.app');
  });

  test('mpt zones by gps endpoint with positive coordinates', () {
    final endpoint = MptZonesByGpsEndpoint(3.068498, 101.630263);
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/zones/3.068498/101.630263',
    );
  });

  test('mpt zones by gps endpoint with custom base url', () {
    MptBaseController.setBaseUrl('https://api.example.com');

    final endpoint = MptZonesByGpsEndpoint(3.068498, 101.630263);
    expect(
      endpoint.getFullUrl(),
      'https://api.example.com/zones/3.068498/101.630263',
    );
  });
}
