import '../base_endpoint.dart';
import '../mpt_base_controller.dart';

/// Endpoint for getting zone by GPS coordinates
class MptZonesByGpsEndpoint extends BaseEndpoint {
  final double lat;
  final double long;

  MptZonesByGpsEndpoint(this.lat, this.long);

  @override
  String getFullUrl() {
    return '${MptBaseController.baseUrl}/zones/$lat/$long';
  }
}
