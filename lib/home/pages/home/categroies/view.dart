part of '../view.dart';

class _Categories extends StatelessWidget {
  const _Categories();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is SliderLoadingState) {
          return AppLoading(); 
        } else if (state is CategoriesSuccessState) {
          return SizedBox(
            height: 110.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                final model = state.list[index];

                return Padding(
                  padding: EdgeInsets.only(right: 18.r, left: 2.r),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () => goTo(
                          CategoriesDetailsView(model: model),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 76.h,
                          width: 76.w,
                          decoration: BoxDecoration(
                            color: state.list[index].color,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: AppImage(
                            image: model.image,
                            height: 40.h,
                            width: 40.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        model.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 19.sp,
                          color: Color(0xff3E3E3E),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
