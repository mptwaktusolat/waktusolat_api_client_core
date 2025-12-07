import '../mpt_base_controller.dart';

/// SOLAT V1 endpoint helpers covering daily and monthly periods
class MptSolatV1Endpoint {
  const MptSolatV1Endpoint._();

  /// Returns monthly prayer times for the given zone
  static Uri monthly(String zone, {int? year, int? month}) {
    final queryParams = <String, dynamic>{};
    if (year != null) queryParams['year'] = year;
    if (month != null) queryParams['month'] = month;
    return MptBaseController.buildUri(
      '/solat/${zone.toUpperCase()}',
      queryParams,
    );
  }

  /// Returns daily prayer times for the given zone and day of month
  static Uri daily(String zone, int day, {int? year, int? month}) {
    assert(day >= 1 && day <= 31, 'day must be between 1 and 31');
    final queryParams = <String, dynamic>{};
    if (year != null) queryParams['year'] = year;
    if (month != null) queryParams['month'] = month;
    return MptBaseController.buildUri(
      '/solat/${zone.toUpperCase()}/$day',
      queryParams,
    );
  }
}
