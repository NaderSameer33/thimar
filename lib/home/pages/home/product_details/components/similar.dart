part of '../view.dart';

class _SimilarProduct extends StatelessWidget {
  const _SimilarProduct();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'منتجات مشابهة',
          style: TextStyle(
            color: Color(0xff4C8613),
            fontWeight: FontWeight.bold,
            fontSize: 17.sp,
          ),
        ),
        SizedBox(
          height: 14.h,
        ),
        BlocBuilder<SimialrCubit, SimailarState>(
          builder: (context, state) {
            if (state is SimailarLoadingState) {
              return AppLoading();
            } else if (state is SimailarSuccessState) {
              return SizedBox(
                height: 250.h,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.r),
                    width: 200.w,
                    child: ProductItem(
                      model: state.products[index],
                      isSimilar: true,
                    ),
                  ),
                ),
              );
            } else if (state is SimilarFailureState) {
              return Center(
                child: Text('حدث حطا ما'),
              );
            }
            return SizedBox();
          },
        ),
      ],
    );
  }
}
