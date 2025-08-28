// TODO: Add documentation where i get the numbers

import '../models/mpt_prayer.dart';

extension PrayerTimeExtension on MptPrayer {
  DateTime get imsak {
    return fajr.subtract(const Duration(minutes: 10));
  }

  DateTime get dhuha {
    return syuruk.add(const Duration(minutes: 28));
  }
}
