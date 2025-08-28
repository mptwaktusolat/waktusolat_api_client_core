import 'package:test/test.dart';
import 'package:waktusolat_api_client_core/src/endpoints/mpt_solat_v2_endpoint.dart';
import 'package:waktusolat_api_client_core/src/mpt_base_controller.dart';

void main() {
  setUp(() {
    // Reset base URL before each test
    MptBaseController.setBaseUrl('https://api.waktusolat.app');
  });

  test('mpt solat v2 endpoint with zone only', () {
    final endpoint = MptSolatV2Endpoint('SGR01');
    expect(endpoint.getFullUrl(), 'https://api.waktusolat.app/v2/solat/SGR01');
  });

  test('mpt solat v2 endpoint with zone and year', () {
    final endpoint = MptSolatV2Endpoint('SGR01', year: 2023);
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/v2/solat/SGR01?year=2023',
    );
  });

  test('mpt solat v2 endpoint with zone and month only', () {
    final endpoint = MptSolatV2Endpoint('SGR01', month: 3);
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/v2/solat/SGR01?month=3',
    );
  });

  test('mpt solat v2 endpoint with zone, year and month', () {
    final endpoint = MptSolatV2Endpoint('SGR01', year: 2023, month: 3);
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/v2/solat/SGR01?year=2023&month=3',
    );
  });

  test('mpt solat v2 endpoint with custom base url', () {
    // Set custom base URL
    MptBaseController.setBaseUrl('https://api.example.com');

    final endpoint = MptSolatV2Endpoint('SGR01', year: 2023, month: 3);
    expect(
      endpoint.getFullUrl(),
      'https://api.example.com/v2/solat/SGR01?year=2023&month=3',
    );
  });

  test('base controller handles trailing slash', () {
    // Set base URL with trailing slash
    MptBaseController.setBaseUrl('https://api.example.com/');

    final endpoint = MptSolatV2Endpoint('SGR01', year: 2023, month: 3);
    expect(
      endpoint.getFullUrl(),
      'https://api.example.com/v2/solat/SGR01?year=2023&month=3',
    );
  });
}
