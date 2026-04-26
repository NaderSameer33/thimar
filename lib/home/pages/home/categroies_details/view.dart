import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/ui/product_skeleton_view.dart';
import 'package:thimar/home/cart/cubit/add_cart_cubit.dart';
import '../../../../core/ui/app_back.dart';
import '../../../../core/ui/app_image.dart';
import '../../../../core/ui/app_input.dart';
import '../../../../core/ui/app_loading.dart';
import '../categroies/models/categories.dart';
import 'cubit/categories_details_state.dart';
import 'cubit/categries_details_cubit.dart';
import '../view.dart';

class CategoriesDetailsView extends StatelessWidget {
  const CategoriesDetailsView({super.key, required this.model});
  final CategoriesModel model;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CategriesDetailsCubit()
                ..getCategoriesDetails(categoryId: model.id),
        ),
        BlocProvider(create: (context) => AddCartCubit()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppBack(),
                  Spacer(),
                  Text(
                    model.name,
                    style: TextStyle(
                      color: Color(0xff4C8613),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 20.h),
              _CategorySearchInput(categoryId: model.id),
              SizedBox(height: 20.h),
              Expanded(child: CategoresDetailsBody()),
            ],
          ),
        ),
      ),
    );
  }
}

/// A stateful search field that debounces through [CategriesDetailsCubit].
class _CategorySearchInput extends StatefulWidget {
  const _CategorySearchInput({required this.categoryId});
  final int categoryId;

  @override
  State<_CategorySearchInput> createState() => _CategorySearchInputState();
}

class _CategorySearchInputState extends State<_CategorySearchInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppInput(
      controller: _controller,
      hintText: 'ابحث عن ماتريد؟',
      isSearch: true,
      prefixIcon: 'search.svg',
      isCategories: true,
      onChanged: (value) {
        context.read<CategriesDetailsCubit>().onSearchChanged(
              categoryId: widget.categoryId,
              keyword: value,
            );
      },
    );
  }
}

class CategoresDetailsBody extends StatelessWidget {
  const CategoresDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategriesDetailsCubit, CategoriesDetailsState>(
      builder: (context, state) {
        if (state is CategoriesDetailsLoadingState) {
          return Expanded(child: ProductSkeletonView());
        }

        if (state is CategoriesDetailsFailureState) {
          return Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(color: Colors.red, fontSize: 13.sp),
              textAlign: TextAlign.center,
            ),
          );
        }

        if (state is CategoriesDetailsSuccessState) {
          return state.list.isEmpty
              ? Column(
                  children: [
                    AppImage(image: 'not_found.json'),
                    SizedBox(height: 10.h),
                    Text(
                      'لا يوجد بيانات حاليا',
                      style: TextStyle(
                        color: Color(0xff61B80C),
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp,
                      ),
                    ),
                  ],
                )
              : ProductView(
                  isScrolle: true,
                  list: state.list,
                );
        }

        return SizedBox();
      },
    );
  }
}

