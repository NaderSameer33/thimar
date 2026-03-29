part of '../view.dart';

class _SliderItem extends StatefulWidget {
  const _SliderItem();

  @override
  State<_SliderItem> createState() => _SliderItemState();
}

class _SliderItemState extends State<_SliderItem> {
  @override
  void initState() {
    super.initState();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubit, SliderState>(
      builder: (context, state) {
        if (state is SliderLoadingState) {
          return SliderSketonizerItem();
        } else if (state is SliderSuccessState) {
          return Column(
            children: [
              CarouselSlider(
                items: state.list
                    .map(
                      (item) => ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: AppImage(
                          image: item.image,
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                    .toList(),

                options: CarouselOptions(
                  onPageChanged: (index, _) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  viewportFraction: 1,
                  aspectRatio: 375 / 164,
                  autoPlay: true,
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    state.list.length,
                    (index) {
                      return AnimatedContainer(
                        duration: Duration(seconds: 2),
                        margin: EdgeInsets.only(right: 3.r),
                        height: 7.h,
                        width: 7.w,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? Color(0xff4C8613)
                              : Colors.blueGrey[50],
                          shape: BoxShape.circle,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
