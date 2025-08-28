import 'package:test/test.dart';
import 'package:waktusolat_api_client_core/src/endpoints/mpt_jadual_solat_endpoint.dart';
import 'package:waktusolat_api_client_core/src/mpt_base_controller.dart';

void main() {
  setUp(() {
    // Reset base URL before each test
    MptBaseController.setBaseUrl('https://api.waktusolat.app');
  });

  test('mpt jadual solat endpoint with zone only', () {
    final endpoint = MptJadualSolatEndpoint('SGR01');
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/jadual_solat/SGR01',
    );
  });

  test('mpt jadual solat endpoint with zone and year', () {
    final endpoint = MptJadualSolatEndpoint('SGR01', year: 2025);
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/jadual_solat/SGR01?year=2025',
    );
  });

  test('mpt jadual solat endpoint with zone and month only', () {
    final endpoint = MptJadualSolatEndpoint('SGR01', month: 6);
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/jadual_solat/SGR01?month=6',
    );
  });

  test('mpt jadual solat endpoint with zone, year and month', () {
    final endpoint = MptJadualSolatEndpoint('SGR01', year: 2025, month: 6);
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/jadual_solat/SGR01?year=2025&month=6',
    );
  });

  test('mpt jadual solat endpoint with custom base url', () {
    MptBaseController.setBaseUrl('https://api.example.com');

    final endpoint = MptJadualSolatEndpoint('SGR01', year: 2025, month: 6);
    expect(
      endpoint.getFullUrl(),
      'https://api.example.com/jadual_solat/SGR01?year=2025&month=6',
    );
  });

  test('zone is converted to uppercase', () {
    final endpoint = MptJadualSolatEndpoint('sgr01');
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/jadual_solat/SGR01',
    );
  });
}
