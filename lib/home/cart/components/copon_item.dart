part of '../view.dart';

class _CoponItem extends StatefulWidget {
  const _CoponItem();

  @override
  State<_CoponItem> createState() => _CoponItemState();
}

class _CoponItemState extends State<_CoponItem> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CouponCubit, CouponState>(
      listener: (context, state) {
        if (state is CouponSuccessState) {
          showMsg(state.succesMessage);
        } else if (state is CouponFailureState) {
          showMsg(state.errorMessage, isError: true);
        }
      },
      builder: (context, state) {
        return Container(
          height: 55.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 8.5,
                spreadRadius: 0,
                color: Colors.black.withValues(alpha: 0.0196),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'عندك كوبون ؟ ادخل رقم الكوبون',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.text.isNotEmpty) {
                      context.read<CouponCubit>().applyCartCoupon(
                        couponCode: controller.text,
                      );
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 39.h,
                    width: 79.w,
                    decoration: BoxDecoration(
                      color: Color(0xff4C8613),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: state is CouponLoadingState
                        ? Center(
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Text(
                            'تطبيق',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
