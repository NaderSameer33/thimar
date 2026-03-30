import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/core/ui/app_add_remove_item.dart';
import 'package:thimar/core/ui/app_back.dart';
import 'package:thimar/core/ui/app_button.dart';
import 'package:thimar/core/ui/app_image.dart';
import 'package:thimar/core/ui/cart_price_skeltonizer.dart';
import 'package:thimar/core/ui/cart_skeltonizer_view.dart';
import 'package:thimar/home/cart/cubit/cart_product_cubit.dart';
import 'package:thimar/home/cart/cubit/cart_product_state.dart';
import 'package:thimar/home/cart/cubit/coupon_cubit.dart';
import 'package:thimar/home/cart/cubit/coupon_state.dart';
import 'package:thimar/home/cart/cubit/remove_cart_cubit.dart';
import 'package:thimar/home/cart/cubit/remove_cart_state.dart';
import 'package:thimar/home/cart/model/cart_model.dart';
part 'components/cart_item.dart';
part 'components/header.dart';
part 'components/copon_item.dart';
part 'components/order_info.dart';

class CartView extends StatefulWidget {
  const CartView({
    super.key,
    required this.cartCount,
  });
  final ValueChanged<int> cartCount;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartProductCubit()..getCartProduct(),
        ),
        BlocProvider(create: (context) => RemoveCartCubit()),
        BlocProvider(create: (context) => CouponCubit()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Column(
              children: [
                _Header(),
                SizedBox(
                  height: 24.h,
                ),
                BlocBuilder<CartProductCubit, CartProductState>(
                  builder: (context, state) {
                    if (state is CartProductSuccessState) {
                      widget.cartCount(state.cartData.list.length);
                      return state.cartData.list.isEmpty
                          ? AppImage(image: 'not_found.json')
                          : Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * .5,
                                  child: ListView.builder(
                                    itemCount: state.cartData.list.length,
                                    itemBuilder: (context, index) {
                                      return _CartItem(
                                        state.cartData.list[index],
                                        state.cartData,
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                _CoponItem(),
                                SizedBox(
                                  height: 11.h,
                                ),
                                Text(
                                  r'جميع الأسعار تشمل قيمة الضريبة المضافة 15%',
                                  style: TextStyle(
                                    color: Color(0xff4C8613),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 11.h),
                                  padding: EdgeInsets.all(13.r),
                                  height: 111.h,
                                  decoration: BoxDecoration(
                                    color: Color(0xffF3F8EE),
                                    borderRadius: BorderRadius.circular(13.r),
                                  ),
                                  child: Column(
                                    children: [
                                      _OrderInfo(
                                        title: 'إجمالي المنتجات',
                                        value:
                                            '${state.cartData.totalPriceBeforeDiscount} ر.س',
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      _OrderInfo(
                                        title: 'الخصم',
                                        value:
                                            '${state.cartData.totalDiscount} ر.س',
                                      ),
                                      Divider(
                                        height: 13,
                                      ),
                                      _OrderInfo(
                                        title: 'المجموع بعد الضريبه',
                                        value:
                                            '${state.cartData.totalPriceWithVat} ر.س',
                                        isTotal: true,
                                      ),
                                    ],
                                  ),
                                ),
                                AppButton(
                                  onTap: () {},
                                  title: 'الانتقال لإتمام الطلب',
                                ),
                              ],
                            );
                    } else if (state is CartProductLoadingState) {
                      return Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: CartSkeltonizerView(),
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                            CartPriceSkeltonizer(),
                          ],
                        ),
                      );
                    }
                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
