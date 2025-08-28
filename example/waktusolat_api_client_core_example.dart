import 'package:waktusolat_api_client_core/waktusolat_api_client_core.dart';

void main() {
  print('=== Waktu Solat API Client Core Examples ===\n');

  // JADUAL SOLAT - PDF Download endpoints
  print('1. JADUAL SOLAT (PDF Download):');
  var jadualEndpoint1 = MptJadualSolatEndpoint('SGR01');
  print('   Current month: ${jadualEndpoint1.getFullUrl()}');

  var jadualEndpoint2 = MptJadualSolatEndpoint('SGR01', year: 2025, month: 12);
  print('   Specific month: ${jadualEndpoint2.getFullUrl()}\n');

  // SOLAT V1 endpoints
  print('2. SOLAT V1 (JAKIM Compatible):');
  var solatV1Month = MptSolatV1MonthEndpoint('SGR01', year: 2024, month: 4);
  print('   Monthly: ${solatV1Month.getFullUrl()}');

  var solatV1Day = MptSolatV1DayEndpoint('SGR01', 15, year: 2024, month: 4);
  print('   Daily: ${solatV1Day.getFullUrl()}\n');

  // SOLAT V2 endpoints
  print('3. SOLAT V2 (Updated Format):');
  var solatV2Zone = MptSolatV2Endpoint('SGR01', year: 2025, month: 8);
  print('   By Zone: ${solatV2Zone.getFullUrl()}');

  var solatV2Gps = MptSolatV2GpsEndpoint(
    3.068498,
    101.630263,
    year: 2025,
    month: 8,
  );
  print('   By GPS: ${solatV2Gps.getFullUrl()}\n');

  // ZONES endpoints
  print('4. ZONES (Location Information):');
  var allZones = MptZonesEndpoint();
  print('   All zones: ${allZones.getFullUrl()}');

  var zonesByState = MptZonesByStateEndpoint('prk');
  print('   By state: ${zonesByState.getFullUrl()}');

  var zonesByGps = MptZonesByGpsEndpoint(3.068498, 101.630263);
  print('   By GPS: ${zonesByGps.getFullUrl()}\n');

  // Demonstrate custom base URL
  print('5. Custom Base URL:');
  print('   Original base URL: ${MptBaseController.baseUrl}');

  MptBaseController.setBaseUrl('https://api.example.com');
  print('   Updated base URL: ${MptBaseController.baseUrl}');

  var customEndpoint = MptSolatV2Endpoint('JHR01', year: 2024, month: 12);
  print('   Custom endpoint: ${customEndpoint.getFullUrl()}');

  // Reset to default
  MptBaseController.setBaseUrl('https://api.waktusolat.app');
  print('   Reset to default: ${MptBaseController.baseUrl}');
}
