import 'package:test/test.dart';
import 'package:waktusolat_api_client_core/src/endpoints/mpt_solat_v1_month_endpoint.dart';
import 'package:waktusolat_api_client_core/src/mpt_base_controller.dart';

void main() {
  setUp(() {
    // Reset base URL before each test
    MptBaseController.setBaseUrl('https://api.waktusolat.app');
  });

  test('mpt solat v1 month endpoint with zone only', () {
    final endpoint = MptSolatV1MonthEndpoint('SGR01');
    expect(endpoint.getFullUrl(), 'https://api.waktusolat.app/solat/SGR01');
  });

  test('mpt solat v1 month endpoint with zone and year', () {
    final endpoint = MptSolatV1MonthEndpoint('SGR01', year: 2024);
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/solat/SGR01?year=2024',
    );
  });

  test('mpt solat v1 month endpoint with zone and month only', () {
    final endpoint = MptSolatV1MonthEndpoint('SGR01', month: 4);
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/solat/SGR01?month=4',
    );
  });

  test('mpt solat v1 month endpoint with zone, year and month', () {
    final endpoint = MptSolatV1MonthEndpoint('SGR01', year: 2024, month: 4);
    expect(
      endpoint.getFullUrl(),
      'https://api.waktusolat.app/solat/SGR01?year=2024&month=4',
    );
  });

  test('mpt solat v1 month endpoint with custom base url', () {
    MptBaseController.setBaseUrl('https://api.example.com');

    final endpoint = MptSolatV1MonthEndpoint('SGR01', year: 2024, month: 4);
    expect(
      endpoint.getFullUrl(),
      'https://api.example.com/solat/SGR01?year=2024&month=4',
    );
  });
}
