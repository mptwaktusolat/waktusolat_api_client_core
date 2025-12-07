import 'package:test/test.dart';
import 'package:waktusolat_api_client_core/src/endpoints/mpt_solat_v2_endpoint.dart';
import 'package:waktusolat_api_client_core/src/mpt_base_controller.dart';

void main() {
  setUp(() {
    MptBaseController.setBaseUrl('https://api.waktusolat.app');
  });

  group('by zone', () {
    test('zone only', () {
      final endpoint = MptSolatV2Endpoint.byZone('SGR01');
      expect(endpoint, Uri.parse('https://api.waktusolat.app/v2/solat/SGR01'));
    });

    test('zone, year and month', () {
      final endpoint = MptSolatV2Endpoint.byZone('sgr01', year: 2023, month: 3);
      expect(
        endpoint,
        Uri.parse(
          'https://api.waktusolat.app/v2/solat/SGR01?year=2023&month=3',
        ),
      );
    });
  });

  group('by gps', () {
    test('coordinates only', () {
      final endpoint = MptSolatV2Endpoint.byGps(
        latitude: 3.068498,
        longitude: 101.630263,
      );
      expect(
        endpoint,
        Uri.parse('https://api.waktusolat.app/v2/solat/3.068498/101.630263'),
      );
    });

    test('coordinates, year and month', () {
      final endpoint = MptSolatV2Endpoint.byGps(
        latitude: -3.068498,
        longitude: -101.630263,
        year: 2025,
        month: 6,
      );
      expect(
        endpoint,
        Uri.parse(
          'https://api.waktusolat.app/v2/solat/-3.068498/-101.630263?year=2025&month=6',
        ),
      );
    });
  });

  test('custom base url propagates to all variants', () {
    MptBaseController.setBaseUrl('https://api.example.com/');

    expect(
      MptSolatV2Endpoint.byZone('SGR01', year: 2023),
      Uri.parse('https://api.example.com/v2/solat/SGR01?year=2023'),
    );
    expect(
      MptSolatV2Endpoint.byGps(
        latitude: 3.068498,
        longitude: 101.630263,
        month: 6,
      ),
      Uri.parse('https://api.example.com/v2/solat/3.068498/101.630263?month=6'),
    );
  });
}
