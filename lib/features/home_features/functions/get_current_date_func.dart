import 'package:shamsi_date/shamsi_date.dart';

String getCurrentDate() {
  final now = DateTime.now();
  final jalaali = now.toJalali();
  return '${jalaali.year}/${jalaali.month.toString().padLeft(
      2, '0')}/${jalaali.day.toString().padLeft(2, '0')}';
}
