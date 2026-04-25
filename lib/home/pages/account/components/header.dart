part of '../view.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 217.h,
      decoration: BoxDecoration(
        color: Color(0xff4C8613),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40.r),
          bottomRight: Radius.circular(40.r),
        ),
      ),
      child: BlocBuilder<UserInfoCubit, UserInfoState>(
        builder: (context, state) {
          if (state is UserInfoLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (state is UserInfoSuccesState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  'حسابي',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: AppImage(
                    image: state.userInfoModel.image,
                    height: 71.h,
                    width: 76.w,
                  ),
                ),
                Text(
                  state.userInfoModel.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  state.userInfoModel.phone,
                  style: TextStyle(
                    color: Color(0xffA2D273),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
