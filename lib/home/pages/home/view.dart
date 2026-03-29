import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/ui/product_skeleton_view.dart';
import 'package:thimar/core/ui/slider_skeletonizer_item.dart';
import 'package:thimar/home/cart/cubit/add_cart_cubit.dart';
import 'package:thimar/home/cart/cubit/add_cart_state.dart';
import 'package:thimar/home/cart/view.dart';
import 'package:thimar/home/pages/home/search/model/search_model.dart';
import 'package:thimar/home/pages/home/search/search_home_input.dart';
import '../../../core/logic/helper_methods.dart';
import '../../../core/ui/app_image.dart';
import '../../../core/ui/app_input.dart';
import '../../../core/ui/app_loading.dart';
import 'categroies/cubit/categories_cubit.dart';
import 'categroies/cubit/categories_state.dart';
import 'categroies_details/view.dart';
import 'products/cubit/product_cubit.dart';
import 'products/cubit/product_state.dart';
import 'product_details/view.dart';
import 'products/model/product_model.dart';
import 'slider/cubit/slider_cubit.dart';
import 'slider/cubit/slider_state.dart';
part 'components/header.dart';
part 'slider/view.dart';
part 'categroies/view.dart';
part 'products/view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SliderCubit()..getSlider()),
        BlocProvider(create: (context) => CategoriesCubit()..getCategories()),
        BlocProvider(create: (context) => ProductCubit()..getProuct()),
        BlocProvider(create: (context) => AddCartCubit()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      _Heder(),
                      SizedBox(
                        height: 20.h,
                      ),
                      SearchHomeInput(),

                      _SliderItem(),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        'الأقسام',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      _Categories(),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: _ProductsView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
