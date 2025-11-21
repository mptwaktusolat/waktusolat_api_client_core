import 'package:test/test.dart';
import 'package:waktusolat_api_client_core/waktusolat_api_client_core.dart';

void main() {
  final MptPrayer examplePrayerData = MptPrayer(
    fajr: DateTime(2025, 1, 1, 5, 47), // 5.47 AM
    syuruk: DateTime(2025, 1, 1, 7, 17), // 7.17 AM
    dhuhr: DateTime(2025, 1, 1, 13, 20),
    asr: DateTime(2025, 1, 1, 16, 42),
    maghrib: DateTime(2025, 1, 1, 18, 57),
    isha: DateTime(2025, 1, 1, 20, 11),
    day: 1,
    hijri: HijriDate(1446, 7, 1),
  );
  group('prayer time extension tests', () {
    test('test dhuha calculation', () {
      // Act
      final syurukTime = examplePrayerData.syuruk;
      final dhuhaTime = examplePrayerData.dhuha;

      // Assert
      expect(dhuhaTime, DateTime(2025, 1, 1, 7, 42)); // 7.42 AM
      expect(dhuhaTime.difference(syurukTime).inMinutes, 25);
    });

    test('test imsak calculation', () {
      // Act
      final imsakTime = examplePrayerData.imsak;
      final fajrTime = examplePrayerData.fajr;

      // Assert
      expect(imsakTime, DateTime(2025, 1, 1, 5, 37)); // 5.37 AM
      expect(imsakTime.difference(fajrTime).inMinutes, -10);
    });
  });
}
