import 'package:test/test.dart';
import 'package:waktusolat_api_client_core/src/endpoints/mpt_solat_v1_endpoint.dart';
import 'package:waktusolat_api_client_core/src/mpt_base_controller.dart';

void main() {
  setUp(() {
    MptBaseController.setBaseUrl('https://api.waktusolat.app');
  });

  group('monthly', () {
    test('zone only', () {
      final endpoint = MptSolatV1Endpoint.monthly('SGR01');
      expect(endpoint.toString(), 'https://api.waktusolat.app/solat/SGR01');
    });

    test('zone and year', () {
      final endpoint = MptSolatV1Endpoint.monthly('SGR01', year: 2024);
      expect(
        endpoint.toString(),
        'https://api.waktusolat.app/solat/SGR01?year=2024',
      );
    });

    test('zone, year and month', () {
      final endpoint = MptSolatV1Endpoint.monthly(
        'SGR01',
        year: 2024,
        month: 4,
      );
      expect(
        endpoint.toString(),
        'https://api.waktusolat.app/solat/SGR01?year=2024&month=4',
      );
    });
  });

  group('daily', () {
    test('zone and day', () {
      final endpoint = MptSolatV1Endpoint.daily('SGR01', 1);
      expect(endpoint.toString(), 'https://api.waktusolat.app/solat/SGR01/1');
    });

    test('zone, day, year and month', () {
      final endpoint = MptSolatV1Endpoint.daily(
        'sgr01',
        15,
        year: 2024,
        month: 4,
      );
      expect(
        endpoint,
        Uri.parse(
          'https://api.waktusolat.app/solat/SGR01/15?year=2024&month=4',
        ),
      );
    });
  });

  test('custom base url applies to all variants', () {
    MptBaseController.setBaseUrl('https://api.example.com/');

    expect(
      MptSolatV1Endpoint.monthly('SGR01', year: 2024, month: 4).toString(),
      'https://api.example.com/solat/SGR01?year=2024&month=4',
    );
    expect(
      MptSolatV1Endpoint.daily('SGR01', 10, year: 2024).toString(),
      'https://api.example.com/solat/SGR01/10?year=2024',
    );
  });
}
