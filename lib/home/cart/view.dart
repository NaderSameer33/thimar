import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/logic/helper_methods.dart';
import 'package:thimar/core/ui/app_add_remove_item.dart';
import 'package:thimar/core/ui/app_back.dart';
import 'package:thimar/core/ui/app_button.dart';
import 'package:thimar/core/ui/app_image.dart';
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
                BlocListener<RemoveCartCubit, RemoveCartState>(
                  listener: (context, state) {
                    if (state is CartRemoveSuccesState) {
                      showMsg(state.succesMessage);
                      context.read<CartProductCubit>().getCartProduct();
                    } else if (state is CartRemoveFailureState) {
                      showMsg(state.errorMessage, isError: true);
                    }
                  },
                  child: BlocBuilder<CartProductCubit, CartProductState>(
                    builder: (context, state) {
                      if (state is CartProductSuccessState) {
                        widget.cartCount(state.list.length);
                        return state.list.isEmpty
                            ? AppImage(image: 'not_found.json')
                            : SizedBox(
                                height: MediaQuery.of(context).size.height * .5,
                                child: ListView.builder(
                                  itemCount: state.list.length,
                                  itemBuilder: (context, index) {
                                    return _CartItem(state.list[index]);
                                  },
                                ),
                              );
                      } else if (state is CartProductLoadingState) {
                        return Expanded(
                          child: CartSkeltonizerView(),
                        );
                      }
                      return SizedBox();
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
                        value: '180 ر.س',
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      _OrderInfo(
                        title: 'الخصم',
                        value: '-180 ر.س',
                      ),
                      Divider(
                        height: 13,
                      ),
                      _OrderInfo(
                        title: 'إجمالي المنتجات',
                        value: '180 ر.س',
                        isTotal: true,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: AppButton(
                    onTap: () {},
                    title: 'الانتقال لإتمام الطلب',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
