import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare_flutter/features/public_features/styles_widget/textstyle_style_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Widget> historyChips = [
    FilterChip(
      label: Text(
        'مربی جدید',
        style: textStyle(fontSize: 10.sp, color: Colors.white),
      ),
      onSelected: (selected) {},
      selected: false,
    ),
    FilterChip(
      label: Text(
        'خرید اشتراک',
        style: textStyle(fontSize: 10.sp, color: Colors.white),
      ),
      onSelected: (selected) {},
      selected: false,
    ),
    FilterChip(
      label: Text(
        'برنامه غذایی',
        style: textStyle(fontSize: 10.sp, color: Colors.white),
      ),
      onSelected: (selected) {},
      selected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [Wrap(children: historyChips)]),
    );
  }
}
