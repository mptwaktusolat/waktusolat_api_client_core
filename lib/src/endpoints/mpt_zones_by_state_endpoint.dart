import '../base_endpoint.dart';
import '../mpt_base_controller.dart';

/// Endpoint for getting zones by state
class MptZonesByStateEndpoint extends BaseEndpoint {
  final String state;

  MptZonesByStateEndpoint(this.state);

  @override
  String getFullUrl() {
    return '${MptBaseController.baseUrl}/zones/${state.toLowerCase()}';
  }
}
