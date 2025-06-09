import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthcare_flutter/features/public_features/styles_widget/textstyle_style_widget.dart';
import 'package:healthcare_flutter/features/search_screen/widget/popular_searches.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _recentSearches = [];

  @override
  void initState() {
    super.initState();
    _loadRecentSearches();
  }

  Future<void> _loadRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _recentSearches = prefs.getStringList('recent_searches') ?? [];
    });
  }

  Future<void> _addSearchTerm(String term) async {
    if (term.trim().isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _recentSearches.remove(term); // جلوگیری از تکرار
      _recentSearches.insert(0, term);
      if (_recentSearches.length > 10) {
        _recentSearches = _recentSearches.sublist(0, 10);
      }
    });
    await prefs.setStringList('recent_searches', _recentSearches);
  }

  Future<void> _clearRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('recent_searches');
    setState(() {
      _recentSearches = [];
    });
  }

  void _onSubmit(String value) async {
    await _addSearchTerm(value);
    _searchController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: TextField(
                  controller: _searchController,
                  onSubmitted: _onSubmit, // اینجا اضافه شد
                  decoration: InputDecoration(
                    hintText: 'جستجو کنید...',
                    hintStyle: textStyle(fontSize: 14.sp, color: Colors.grey),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 24.sp,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => _searchController.clear(),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 14.h,
                      horizontal: 16.w,
                    ),
                  ),
                  textInputAction: TextInputAction.search,
                ),
              ),
              SizedBox(height: 24.h),
              // Recent Searches Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'جستجوهای اخیر',
                    style: textStyle(fontSize: 16.sp, color: Colors.black87),
                  ),
                  if (_recentSearches.isNotEmpty)
                    TextButton(
                      onPressed: _clearRecentSearches,
                      child: Text('حذف همه', style: textStyle(fontSize: 14.sp, color: Colors.blue)),
                    ),
                ],
              ),
              SizedBox(height: 12.h),
              // Recent Searches Chips
              if (_recentSearches.isEmpty)
                Text('هنوز جستجویی انجام نشده',
                    style: textStyle(fontSize: 14.sp, color: Colors.grey))
              else
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: _recentSearches
                      .map((term) => ActionChip(
                    label: Text(term,
                        style: textStyle(fontSize: 12.sp, color: Colors.white)),
                    onPressed: () {
                      _onSubmit(term);
                      _searchController.text = term;
                    },
                    backgroundColor: Colors.blue[800],
                  ))
                      .toList(),
                ),
              SizedBox(height: 24.h),
              // Popular Searches Title
              Text(
                'جستجوهای پرطرفدار',
                style: textStyle(fontSize: 16.sp, color: Colors.black87),
              ),
              SizedBox(height: 12.h),
              // Popular Searches List
              PopularSearches(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
