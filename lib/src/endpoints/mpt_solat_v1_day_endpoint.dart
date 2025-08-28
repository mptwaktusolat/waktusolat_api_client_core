import '../base_endpoint.dart';
import '../mpt_base_controller.dart';

/// Endpoint for SOLAT V1 daily prayer times
class MptSolatV1DayEndpoint extends BaseEndpoint {
  final String zone;
  final int day;
  final int? year;
  final int? month;

  MptSolatV1DayEndpoint(this.zone, this.day, {this.year, this.month});

  @override
  String getFullUrl() {
    final StringBuffer url = StringBuffer(
      '${MptBaseController.baseUrl}/solat/${zone.toUpperCase()}/$day',
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
