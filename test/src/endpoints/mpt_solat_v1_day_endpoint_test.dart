import 'package:test/test.dart';
import 'package:waktusolat_api_client_core/src/endpoints/mpt_solat_v1_day_endpoint.dart';
import 'package:waktusolat_api_client_core/src/mpt_base_controller.dart';

void main() {
  setUp(() {
    // Reset base URL before each test
    MptBaseController.setBaseUrl('https://api.waktusolat.app');
  });

  test('mpt solat v1 day endpoint with zone and day only', () {
    final endpoint = MptSolatV1DayEndpoint('SGR01', 1);
    expect(endpoint.getFullUrl(), 'https://api.waktusolat.app/solat/SGR01/1');
  });

  test('mpt solat v1 day endpoint with zone, day and year', () {
    final endpoint = MptSolatV1DayEndpoint('SGR01', 1, year: 2024);
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/solat/SGR01/1?year=2024',
    );
  });

  test('mpt solat v1 day endpoint with zone, day and month', () {
    final endpoint = MptSolatV1DayEndpoint('SGR01', 1, month: 4);
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/solat/SGR01/1?month=4',
    );
  });

  test('mpt solat v1 day endpoint with all parameters', () {
    final endpoint = MptSolatV1DayEndpoint('SGR01', 1, year: 2024, month: 4);
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/solat/SGR01/1?year=2024&month=4',
    );
  });

  test('mpt solat v1 day endpoint with custom base url', () {
    MptBaseController.setBaseUrl('https://api.example.com');

    final endpoint = MptSolatV1DayEndpoint('SGR01', 15, year: 2024, month: 4);
    expect(
      endpoint.getFullUrl(),
      'https://api.example.com/solat/SGR01/15?year=2024&month=4',
    );
  });

  test('zone is converted to uppercase', () {
    final endpoint = MptSolatV1DayEndpoint('sgr01', 1);
    expect(endpoint.getFullUrl(), 'https://api.waktusolat.app/solat/SGR01/1');
  });

  test('handles different day values', () {
    final endpoint1 = MptSolatV1DayEndpoint('SGR01', 1);
    final endpoint31 = MptSolatV1DayEndpoint('SGR01', 31);

    expect(endpoint1.getFullUrl(), 'https://api.waktusolat.app/solat/SGR01/1');
    expect(
      endpoint31.getFullUrl(),
      'https://api.waktusolat.app/solat/SGR01/31',
    );
  });
}
