import 'package:flutter/material.dart';
import 'package:healthcare_flutter/const/theme/colors.dart';

Widget buildProgressBar(String label, double progress, int value, String unit) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label ($value$unit)',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold , fontFamily: 'irs'),
        ),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: boxColors,
          color: Colors.orange,
          minHeight: 6,
        ),
      ],
    ),
  );
}
