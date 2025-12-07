import 'package:waktusolat_api_client_core/waktusolat_api_client_core.dart';

void main() {
  print('=== Waktu Solat API Client Core Examples ===\n');

  // JADUAL SOLAT - PDF Download endpoints
  print('1. JADUAL SOLAT (PDF Download):');
  final jadualEndpoint1 = MptJadualSolatEndpoint.download('SGR01');
  print('   Current month: $jadualEndpoint1');

  final jadualEndpoint2 = MptJadualSolatEndpoint.download(
    'SGR01',
    year: 2025,
    month: 12,
  );
  print('   Specific month: $jadualEndpoint2\n');

  // SOLAT V1 endpoints
  print('2. SOLAT V1 (JAKIM Compatible):');
  final solatV1Month = MptSolatV1Endpoint.monthly(
    'SGR01',
    year: 2024,
    month: 4,
  );
  print('   Monthly: $solatV1Month');

  final solatV1Day = MptSolatV1Endpoint.daily(
    'SGR01',
    15,
    year: 2024,
    month: 4,
  );
  print('   Daily: $solatV1Day\n');

  // SOLAT V2 endpoints
  print('3. SOLAT V2 (Updated Format):');
  final solatV2Zone = MptSolatV2Endpoint.byZone('SGR01', year: 2025, month: 8);
  print('   By Zone: $solatV2Zone');

  final solatV2Gps = MptSolatV2Endpoint.byGps(
    latitude: 3.068498,
    longitude: 101.630263,
    year: 2025,
    month: 8,
  );
  print('   By GPS: $solatV2Gps\n');

  // ZONES endpoints
  print('4. ZONES (Location Information):');
  final allZones = MptZonesEndpoint.listAll();
  print('   All zones: $allZones');

  final zonesByState = MptZonesEndpoint.listAll(stateInitial: 'prk');
  print('   By state: $zonesByState');

  final zonesByGps = MptZonesEndpoint.byGps(
    latitude: 3.068498,
    longitude: 101.630263,
  );
  print('   By GPS: $zonesByGps\n');

  // Demonstrate custom base URL
  print('5. Custom Base URL:');
  print('   Original base URL: ${MptBaseController.baseUrl}');

  MptBaseController.setBaseUrl('https://api.example.com');
  print('   Updated base URL: ${MptBaseController.baseUrl}');

  final customEndpoint = MptSolatV2Endpoint.byZone(
    'JHR01',
    year: 2024,
    month: 12,
  );
  print('   Custom endpoint: $customEndpoint');

  // Reset to default
  MptBaseController.setBaseUrl('https://api.waktusolat.app');
  print('   Reset to default: ${MptBaseController.baseUrl}');
}
