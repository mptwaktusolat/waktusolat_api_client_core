import '../models/mpt_prayer.dart';

extension PrayerTimeExtension on MptPrayer {
  DateTime get imsak {
    return fajr.subtract(const Duration(minutes: 10));
  }

  /// Gets the Dhuha prayer time.
  ///
  /// According to the Selangor State Falak Committee Decision No.2 of 2021,
  /// after considering various factors and using calculation methods established
  /// by JAKIM, the Dhuha prayer time begins 25 minutes after sunrise.
  ///
  /// Reference: https://www.muftiselangor.gov.my/2023/09/18/taudhih-al-falak-ketetapan-awal-waktu-dhuha/
  ///
  /// Returns the [DateTime] when Dhuha prayer time starts.
  DateTime get dhuha {
    return syuruk.add(const Duration(minutes: 25));
  }
}
