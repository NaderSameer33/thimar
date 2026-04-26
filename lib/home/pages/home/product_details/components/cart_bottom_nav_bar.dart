part of '../view.dart';

class CartBottomNavBar extends StatelessWidget {
  const CartBottomNavBar({
    super.key,
    required this.productModel,
    required this.count,
  });
  final ProductModel productModel;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.r),
      height: 60.h,
      decoration: BoxDecoration(
        color: Color(
          0xff4C8613,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocConsumer<AddCartCubit, AddCartState>(
                listener: (context, state) {
                  if (state is AddCartSuccessState) {
                    showMsg(state.succesMessage);
                  } else if (state is AddCartFailureState) {
                    showMsg(state.errorMessage, isError: true);
                  }
                },
                builder: (context, state) {
                  return Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: .2),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: IconButton(
                      onPressed: () {
                        context.read<AddCartCubit>().addCartProduct(
                          productId: productModel.id,
                          amount: count,
                        );
                      },
                      icon: state is AddCartLoadingState
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : AppImage(image: 'cart.svg'),
                    ),
                  );
                },
              ),
              Text(
                'إضافة إلي السلة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, -0.5),
                  end: Offset.zero,
                ).animate(animation),
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
            child: Text(
              '${(productModel.price * count).toStringAsFixed(2)} ر.س',
              key: ValueKey<int>(count),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
