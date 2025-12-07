import '../mpt_base_controller.dart';

/// Zones endpoint helpers returning ready-to-use URIs
class MptZonesEndpoint {
  const MptZonesEndpoint._();

  /// Returns the list of all zones, or zones for a given state initial (eg: prk, kl) if provided
  static Uri listAll({String? stateInitial}) {
    if (stateInitial != null && stateInitial.trim().isNotEmpty) {
      return MptBaseController.buildUri('/zones/${stateInitial.toLowerCase()}');
    }
    return MptBaseController.buildUri('/zones');
  }

  /// Detects zone based on GPS coordinates
  static Uri byGps({required double latitude, required double longitude}) {
    return MptBaseController.buildUri('/zones/$latitude/$longitude');
  }
}
