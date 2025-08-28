import '../base_endpoint.dart';
import '../mpt_base_controller.dart';

/// Endpoint for SOLAT V2 prayer times with GPS coordinates
class MptSolatV2GpsEndpoint extends BaseEndpoint {
  final double lat;
  final double long;
  final int? year;
  final int? month;

  MptSolatV2GpsEndpoint(this.lat, this.long, {this.year, this.month});

  @override
  String getFullUrl() {
    final StringBuffer url = StringBuffer(
      '${MptBaseController.baseUrl}/v2/solat/$lat/$long',
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
