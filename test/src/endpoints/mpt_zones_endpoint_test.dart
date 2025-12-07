import 'package:test/test.dart';
import 'package:waktusolat_api_client_core/src/endpoints/mpt_zones_endpoint.dart';
import 'package:waktusolat_api_client_core/src/mpt_base_controller.dart';

void main() {
  setUp(() {
    // Reset base URL before each test
    MptBaseController.setBaseUrl('https://api.waktusolat.app');
  });

  test('list all zones', () {
    final endpoint = MptZonesEndpoint.listAll();
    expect(endpoint, Uri.parse('https://api.waktusolat.app/zones'));
  });

  test('zones by state', () {
    final endpoint = MptZonesEndpoint.listAll(stateInitial: 'prk');
    expect(endpoint, Uri.parse('https://api.waktusolat.app/zones/prk'));
  });

  test('zones by gps', () {
    final endpoint = MptZonesEndpoint.byGps(
      latitude: 3.068498,
      longitude: 101.630263,
    );
    expect(
      endpoint,
      Uri.parse('https://api.waktusolat.app/zones/3.068498/101.630263'),
    );
  });

  test('custom base url is applied for all variants', () {
    MptBaseController.setBaseUrl('https://api.example.com');

    expect(
      MptZonesEndpoint.listAll(),
      Uri.parse('https://api.example.com/zones'),
    );
    expect(
      MptZonesEndpoint.listAll(stateInitial: 'prk'),
      Uri.parse('https://api.example.com/zones/prk'),
    );
    expect(
      MptZonesEndpoint.byGps(latitude: 3.068498, longitude: 101.630263),
      Uri.parse('https://api.example.com/zones/3.068498/101.630263'),
    );
  });
}
