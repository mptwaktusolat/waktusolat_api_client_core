import '../base_endpoint.dart';
import '../mpt_base_controller.dart';

class MptSolatV2Endpoint extends BaseEndpoint {
  final String zone;
  final int? year;
  final int? month;

  MptSolatV2Endpoint(this.zone, {this.year, this.month});

  @override
  String getFullUrl() {
    final StringBuffer url = StringBuffer(
      '${MptBaseController.baseUrl}/v2/solat/${zone.toUpperCase()}',
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
