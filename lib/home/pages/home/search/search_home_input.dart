import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/ui/app_input.dart';
import 'cubit/search_cubit.dart';

class SearchHomeInput extends StatefulWidget {
  const SearchHomeInput({super.key});

  @override
  State<SearchHomeInput> createState() => _SearchHomeInputState();
}

class _SearchHomeInputState extends State<SearchHomeInput> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppInput(
      controller: controller,
      hintText: 'ابحث عن ماتريد؟',
      prefixIcon: 'search.svg',
      isSearch: true,
      bottomSpacing: 24.h,
      onChanged: (value) {
        context.read<SearchCubit>().onSearchChanged(keyword: value);
      },
    );
  }
}