part of '../view.dart';

class _CartItem extends StatelessWidget {
  const _CartItem(
    this.cartModel,
    this.cartData,
  );
  final CartModel cartModel;
  final CartData cartData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 8.5,
            spreadRadius: 0,
            color: Colors.black.withValues(alpha: 0.0196),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),

            child: AppImage(
              image: cartModel.image,
              height: 78.h,
              width: 92.w,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartModel.title,
                style: TextStyle(
                  color: Color(0xff4C8613),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
              Text(
                '${cartModel.price} ر.س',
                style: TextStyle(
                  color: Color(0xff4C8613),
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                ),
              ),
              AppAddRemoveItem(
                productId: cartModel.id,
              ),
            ],
          ),
          Spacer(),
          CartDeleteButton(
            cartData: cartData,
            productId: cartModel.id,
          ),
        ],
      ),
    );
  }
}

class CartDeleteButton extends StatelessWidget {
  const CartDeleteButton({
    super.key,
    required this.productId,
    required this.cartData,
  });
  final int productId;
  final CartData cartData;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RemoveCartCubit, RemoveCartState>(
      listener: (context, state) {
        if (state is CartRemoveSuccesState && state.proudctId == productId) {
          showMsg(state.succesMessage);
          context.read<CartProductCubit>().deleteCartProduct(
            id: productId,
            cartData: cartData,
          );
        } else if (state is CartRemoveFailureState) {
          showMsg(state.errorMessage, isError: true);
        }
      },
      child: Container(
        height: 27.h,
        width: 27.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          color: Colors.red.withValues(alpha: .1),
        ),
        child: IconButton(
          onPressed: () async {
            context.read<RemoveCartCubit>().removeCartProduct(
              productId: productId,
            );
          },
          icon: AppImage(
            image: 'trash.svg',
            color: Color(0xffFF0000),
          ),
        ),
      ),
    );
  }
}
