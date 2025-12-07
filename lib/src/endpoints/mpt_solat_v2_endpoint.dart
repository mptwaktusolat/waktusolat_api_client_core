import '../mpt_base_controller.dart';

/// SOLAT V2 endpoint helpers supporting zone and GPS lookups
class MptSolatV2Endpoint {
  const MptSolatV2Endpoint._();

  /// Returns prayer times for a given zone
  static Uri byZone(String zone, {int? year, int? month}) {
    final queryParams = <String, dynamic>{};
    if (year != null) queryParams['year'] = year;
    if (month != null) queryParams['month'] = month;
    return MptBaseController.buildUri(
      '/v2/solat/${zone.toUpperCase()}',
      queryParams,
    );
  }

  /// Returns prayer times by automatically detecting zone based on GPS
  static Uri byGps({
    required double latitude,
    required double longitude,
    int? year,
    int? month,
  }) {
    final queryParams = <String, dynamic>{};
    if (year != null) queryParams['year'] = year;
    if (month != null) queryParams['month'] = month;
    return MptBaseController.buildUri(
      '/v2/solat/$latitude/$longitude',
      queryParams,
    );
  }
}
