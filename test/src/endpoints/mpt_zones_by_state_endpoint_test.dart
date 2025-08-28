import 'package:test/test.dart';
import 'package:waktusolat_api_client_core/src/endpoints/mpt_zones_by_state_endpoint.dart';
import 'package:waktusolat_api_client_core/src/mpt_base_controller.dart';

void main() {
  setUp(() {
    // Reset base URL before each test
    MptBaseController.setBaseUrl('https://api.waktusolat.app');
  });

  test('mpt zones by state endpoint', () {
    final endpoint = MptZonesByStateEndpoint('prk');
    expect(endpoint.getFullUrl(), 'https://api.waktusolat.app/zones/prk');
  });

  test('mpt zones by state endpoint with different states', () {
    final prkEndpoint = MptZonesByStateEndpoint('prk');
    final sbhEndpoint = MptZonesByStateEndpoint('sbh');
    final jhrEndpoint = MptZonesByStateEndpoint('jhr');

    expect(prkEndpoint.getFullUrl(), 'https://api.waktusolat.app/zones/prk');
    expect(sbhEndpoint.getFullUrl(), 'https://api.waktusolat.app/zones/sbh');
    expect(jhrEndpoint.getFullUrl(), 'https://api.waktusolat.app/zones/jhr');
  });

  test('mpt zones by state endpoint with custom base url', () {
    MptBaseController.setBaseUrl('https://api.example.com');

    final endpoint = MptZonesByStateEndpoint('prk');
    expect(endpoint.getFullUrl(), 'https://api.example.com/zones/prk');
  });
}
