# Waktu Solat API Client Core

A Dart package for accessing the Malaysia Waktu Solat API. This package provides easy-to-use endpoint classes for retrieving prayer times, zones information, and downloading PDF timetables.

## Features

- **Complete API Coverage**: Supports all endpoints from the Waktu Solat API
- **Type Safe**: Strongly typed endpoint classes for all API endpoints
- **Flexible Base URL**: Configure custom base URLs for testing or alternative servers
- **Query Parameter Support**: Proper handling of optional year and month parameters
- **GPS Support**: Get prayer times and zones using GPS coordinates
- **Zone Information**: Access comprehensive zone and location data
- **PDF Downloads**: Download monthly prayer timetables in PDF format

## Supported Endpoints

### JADUAL SOLAT (PDF Downloads)

- `MptJadualSolatEndpoint` - Download monthly prayer timetables in PDF format

### SOLAT V1 (JAKIM Compatible)

- `MptSolatV1MonthEndpoint` - Monthly prayer times (JAKIM structure)
- `MptSolatV1DayEndpoint` - Daily prayer times (JAKIM structure)

### SOLAT V2 (Updated Format)

- `MptSolatV2Endpoint` - Monthly prayer times by zone
- `MptSolatV2GpsEndpoint` - Monthly prayer times by GPS coordinates

### ZONES (Location Information)

- `MptZonesEndpoint` - All zones information
- `MptZonesByStateEndpoint` - Zones by state
- `MptZonesByGpsEndpoint` - Zone detection by GPS coordinates

## Getting started

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  waktusolat_api_client_core: ^1.0.0
```

Then run:

```bash
dart pub get
```

## Usage

### Basic Examples

```dart
import 'package:waktusolat_api_client_core/waktusolat_api_client_core.dart';

void main() {
  // Get current month prayer times for SGR01 zone
  var endpoint = MptSolatV2Endpoint('SGR01');
  print(endpoint.getFullUrl());
  // Output: https://api.waktusolat.app/v2/solat/SGR01

  // Get prayer times for specific month and year
  var specificEndpoint = MptSolatV2Endpoint('SGR01', year: 2025, month: 8);
  print(specificEndpoint.getFullUrl());
  // Output: https://api.waktusolat.app/v2/solat/SGR01?year=2025&month=8

  // Get prayer times using GPS coordinates
  var gpsEndpoint = MptSolatV2GpsEndpoint(3.068498, 101.630263);
  print(gpsEndpoint.getFullUrl());
  // Output: https://api.waktusolat.app/v2/solat/3.068498/101.630263
}
```

### All Available Endpoints

```dart
// JADUAL SOLAT - PDF Downloads
var pdfEndpoint = MptJadualSolatEndpoint('SGR01', year: 2025, month: 12);

// SOLAT V1 - JAKIM Compatible Format
var v1MonthEndpoint = MptSolatV1MonthEndpoint('SGR01', year: 2024, month: 4);
var v1DayEndpoint = MptSolatV1DayEndpoint('SGR01', 15, year: 2024, month: 4);

// SOLAT V2 - Updated Format
var v2ZoneEndpoint = MptSolatV2Endpoint('SGR01', year: 2025, month: 8);
var v2GpsEndpoint = MptSolatV2GpsEndpoint(3.068498, 101.630263, year: 2025, month: 8);

// ZONES - Location Information
var allZonesEndpoint = MptZonesEndpoint();
var stateZonesEndpoint = MptZonesByStateEndpoint('prk'); // Perak
var gpsZoneEndpoint = MptZonesByGpsEndpoint(3.068498, 101.630263);
```

### Custom Base URL

```dart
// Change the base URL for all endpoints
MptBaseController.setBaseUrl('https://api.example.com');

// All endpoints will now use the custom URL
var endpoint = MptSolatV2Endpoint('SGR01');
print(endpoint.getFullUrl());
// Output: https://api.example.com/v2/solat/SGR01

// Reset to default
MptBaseController.setBaseUrl('https://api.waktusolat.app');
```

## API Reference

For complete API documentation, see the [Waktu Solat API Documentation](https://api.waktusolat.app/docs).

### Zone Codes

Common Malaysian prayer time zones:

- `SGR01` - Selangor, Kuala Lumpur, Putrajaya
- `JHR01` - Johor (most areas)
- `PRK01` - Perak (most areas)
- `PHG01` - Pahang (most areas)

For a complete list of zones, use the `MptZonesEndpoint` or visit [https://peta.waktusolat.app/](https://peta.waktusolat.app/).

## Additional information

This package provides URL generation for the Waktu Solat API endpoints. For making HTTP requests, you'll need to use your preferred HTTP client (like `http` or `dio`).

**Contributions:** Issues and pull requests are welcome on the project repository.

**License:** This package is licensed under the MIT License.
