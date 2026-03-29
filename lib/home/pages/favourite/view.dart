import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/ui/app_image.dart';
import 'package:thimar/core/ui/product_skeleton_view.dart';
import 'package:thimar/home/cart/cubit/add_cart_cubit.dart';
import 'cubit/favourite_product_cubit.dart';
import 'cubit/favourite_product_state.dart';
import '../home/view.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FavouriteProductCubit()..getFavourteProduct(),
        ),

        BlocProvider(create: (context) => AddCartCubit()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                textAlign: TextAlign.center,
                'المفضلة',
                style: TextStyle(
                  color: Color(0xff4C8613),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              BlocBuilder<FavouriteProductCubit, FavouriteProductState>(
                builder: (context, state) {
                  if (state is FavouriteProductLoadingState) {
                    return Expanded(child: ProductSkeletonView());
                  } else if (state is FavouriteProductSuccessState) {
                    return state.favouriteProduct.isEmpty
                        ? AppImage(image: 'not_found.json')
                        : Expanded(
                            child: ProductView(
                              list: state.favouriteProduct,
                              isScrolle: true,
                            ),
                          );
                  } else if (state is FavouriteProductFailureState) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
