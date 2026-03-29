import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/ui/app_input.dart';

class SearchHomeInput extends StatefulWidget {
  const SearchHomeInput({super.key});

  @override
  State<SearchHomeInput> createState() => _SearchHomeInputState();
}

class _SearchHomeInputState extends State<SearchHomeInput> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppInput(
      controller: controller,
      hintText: 'ابحث عن ماتريد؟',
      prefixIcon: 'search.svg',
      isSearch: true,
      bottomSpacing: 24.h,
    );
  }
}