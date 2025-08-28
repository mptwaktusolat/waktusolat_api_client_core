import '../base_endpoint.dart';
import '../mpt_base_controller.dart';

/// Endpoint for downloading monthly prayer timetable in PDF format
class MptJadualSolatEndpoint extends BaseEndpoint {
  final String zone;
  final int? year;
  final int? month;

  MptJadualSolatEndpoint(this.zone, {this.year, this.month});

  @override
  String getFullUrl() {
    final StringBuffer url = StringBuffer(
      '${MptBaseController.baseUrl}/jadual_solat/${zone.toUpperCase()}',
    );

    final List<String> queryParams = [];

    if (year != null) {
      queryParams.add('year=$year');
    }

    if (month != null) {
      queryParams.add('month=$month');
    }

    if (queryParams.isNotEmpty) {
      url.write('?${queryParams.join('&')}');
    }

    return url.toString();
  }
}
