import 'package:test/test.dart';
import 'package:waktusolat_api_client_core/src/endpoints/mpt_zones_endpoint.dart';
import 'package:waktusolat_api_client_core/src/mpt_base_controller.dart';

void main() {
  setUp(() {
    // Reset base URL before each test
    MptBaseController.setBaseUrl('https://api.waktusolat.app');
  });

  test('mpt zones endpoint returns correct url', () {
    final endpoint = MptZonesEndpoint();
    expect(endpoint.getFullUrl(), 'https://api.waktusolat.app/zones');
  });

  test('mpt zones endpoint with custom base url', () {
    MptBaseController.setBaseUrl('https://api.example.com');

    final endpoint = MptZonesEndpoint();
    expect(endpoint.getFullUrl(), 'https://api.example.com/zones');
  });
}
