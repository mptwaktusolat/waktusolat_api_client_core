import '../base_endpoint.dart';
import '../mpt_base_controller.dart';

/// Endpoint for getting all zones information
class MptZonesEndpoint extends BaseEndpoint {
  @override
  String getFullUrl() {
    return '${MptBaseController.baseUrl}/zones';
  }
}
