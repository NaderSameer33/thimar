import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/logic/helper_methods.dart';
import '../../../../core/ui/app_add_remove_item.dart';
import '../../../../core/ui/app_back.dart';
import '../../../../core/ui/app_image.dart';
import '../../../../core/ui/app_loading.dart';
import '../../../cart/cubit/add_cart_cubit.dart';
import '../../../cart/cubit/add_cart_state.dart';
import 'cubit/favourite_cubit.dart';
import 'cubit/favourite_state.dart';
import 'cubit/rate_cubit.dart';
import 'cubit/rate_state.dart';
import 'cubit/simailar_state.dart';
import 'cubit/simialr_cubit.dart';
import 'models/rate_model.dart';
import '../products/model/product_model.dart';
import '../view.dart';
part 'components/header.dart';
part 'components/item.dart';
part 'components/descrption.dart';
part 'components/rate.dart';
part 'components/similar.dart';
part 'components/cart_bottom_nav_bar.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.model});
  final ProductModel model;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              RateCubit()..getProductRate(productId: widget.model.id),
        ),
        BlocProvider(
          create: (context) =>
              SimialrCubit()
                ..getSimialrProduct(productId: widget.model.categoryId),
        ),
        BlocProvider(
          create: (context) => FavouriteCubit(),
        ),
        BlocProvider(
          create: (context) => AddCartCubit(),
        ),
      ],
      child: Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: _ProductDetailsHeader(
                model: widget.model,
              ),
            ),
            SliverToBoxAdapter(
              child: _ProductDetailsItme(
                model: widget.model,
                productCoount: (count) {
                  setState(() {
                    this.count = count;
                  });
                },
              ),
            ),
            SliverToBoxAdapter(
              child: _ProductDetailsDescrption(
                model: widget.model,
              ),
            ),
            SliverToBoxAdapter(
              child: _ProductDetailsRate(),
            ),
            SliverToBoxAdapter(
              child: _SimilarProduct(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.h,
              ),
            ),
          ],
        ),
        bottomNavigationBar: CartBottomNavBar(
          productModel: widget.model,
          count: count,
        ),
      ),
    );
  }
}
