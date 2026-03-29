part of '../view.dart';

class _ProductDetailsRate extends StatelessWidget {
  const _ProductDetailsRate();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'التقييمات',
          style: TextStyle(
            color: Color(0xff4C8613),
            fontWeight: FontWeight.bold,
            fontSize: 17.sp,
          ),
        ),
        BlocBuilder<RateCubit, RateState>(
          builder: (context, state) {
            if (state is RateLoadingState) {
              return AppLoading();
            } else if (state is RateSuccessState) {
              return state.rates.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          AppImage(
                            image: 'rating.json',
                            height: 200.h,
                            width: 200.w,
                          ),
                          Text(
                            'لا يوجد تقيمات حتي الان ',
                            style: TextStyle(
                              color: Color(0xff4C8613),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 100,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 16.r),
                        itemCount: state.rates.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => RateItem(
                          rateModel: state.rates[index],
                        ),
                      ),
                    );
            } else if (state is RateFailureState) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return SizedBox();
          },
        ),
      ],
    );
  }
}

class RateItem extends StatelessWidget {
  const RateItem({
    super.key,
    required this.rateModel,
  });
  final RateModel rateModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24.r),
      height: 87,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    rateModel.clientName,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  AppImage(image: 'star.png'),
                ],
              ),
              Text(
                rateModel.comment,
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: AppImage(
              image: rateModel.clientImage,
              height: 55.h,
              width: 55.w,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
