import '../mpt_base_controller.dart';

/// Endpoint helper for downloading monthly prayer timetable in PDF format
class MptJadualSolatEndpoint {
  const MptJadualSolatEndpoint._();

  static Uri download(String zone, {int? year, int? month}) {
    final queryParams = <String, dynamic>{};
    if (year != null) queryParams['year'] = year;
    if (month != null) queryParams['month'] = month;
    return MptBaseController.buildUri(
      '/jadual_solat/${zone.toUpperCase()}',
      queryParams,
    );
  }
}
